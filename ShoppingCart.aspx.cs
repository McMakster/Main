using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;
public partial class ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        MembershipUser newUser = Membership.GetUser();
        Guid newUserId = (Guid)newUser.ProviderUserKey;
        string user = Convert.ToString(newUser);



        if (Session["cart"] != null)
        {

            List<ShoppingCartAssets.items> cart = (List<ShoppingCartAssets.items>)Session["cart"];
            //List<int> cart = (List<int>)Session["cart"];
            foreach (var itemId in cart)
                if (user == itemId.Name)
                {

                    int num = itemId.ItemId;

                    string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(dbstring);
                    string sqlStr = "SELECT itemId FROM [dbo].[Order] WHERE itemId = @ItemID";
                    string sqlStr2 = @"INSERT INTO [dbo].[Order] (ItemId, UserId) VALUES (@ItemId, @UserId)";
                    SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
                    SqlCommand sqlCmd2 = new SqlCommand(sqlStr2, con);
                    sqlCmd.Parameters.AddWithValue("@ItemId", num);
                    con.Open();
                    object result = sqlCmd.ExecuteScalar();
                    if (result == null)
                    {
                        sqlCmd2.Parameters.AddWithValue("@ItemId", num);
                        sqlCmd2.Parameters.AddWithValue("@UserId", newUserId);
                        sqlCmd2.ExecuteNonQuery();

                        con.Close();
                        Order.Visible = true;



                    }
                    else
                    {

                        con.Close();

                    }
                }
                else
                {

                    string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(dbstring);
                    con.Open();
                    string deleteStr = "DELETE FROM [dbo].[Order]";
                    SqlCommand sqlCmddel = new SqlCommand(deleteStr, con);
                    sqlCmddel.ExecuteNonQuery();
                    Session["cart"] = null;
                    con.Close();
                }
            //GridView1.DataSource = cart;
            //GridView1.DataBind();
        }
       // if (GridView3.RowDeleting += 1) { };
        

        
        if (Label1.Visible == true || GridView3.Rows.Count != 0)
        {
            divid.Visible = false;
        }
        else
        {
            divid.Visible = true;
        }
        if (GridView3.Rows.Count >= 1)
        {
            Order.Visible = true;
        }

    }
    protected void Order_Click(object sender, EventArgs e)
    {


        DateTime localDate = DateTime.Now;
        MembershipUser newUser = Membership.GetUser();
        Guid newUserId = (Guid)newUser.ProviderUserKey;
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(dbstring);
        string sqlStr = @"INSERT INTO [dbo].[MainOrder] (UserId, Date) VALUES (@UserId, @Date)";
        string deleteStr = "DELETE FROM [dbo].[Order]";
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
        SqlCommand sqlCmddel = new SqlCommand(deleteStr, con);
        con.Open();

        sqlCmd.Parameters.AddWithValue("@UserId", newUserId);
        sqlCmd.Parameters.AddWithValue("@Date", localDate);
        sqlCmd.ExecuteNonQuery();
        //
        con.Close();

        List<ShoppingCartAssets.items> cart = (List<ShoppingCartAssets.items>)Session["cart"];
        int i = 0;




        //string sqlStrAmount = @"Update [dbo].[OrderLine] set Amount=@Amount where ProductId = @ProductID";
        string sqlStr2 = "INSERT INTO OrderLine (ProductId, OrderId, Amount) VALUES (@ProductId, @OrderId, @Amount)";

        //string sqlStr3 = "SELECT * FROM Item";
        string sqlStr3 = "SELECT * FROM  [dbo].[Order]";
        string sqlStrOrder = "SELECT  MAX(OrderId) from MainOrder";


        SqlCommand sqlCmd3 = new SqlCommand(sqlStr3, con);
        SqlCommand sqlCmd4 = new SqlCommand(sqlStr2, con);
        SqlCommand sqlCmd5 = new SqlCommand(sqlStrOrder, con);






        con.Open();
        int result = Convert.ToInt32(sqlCmd5.ExecuteScalar());
        using (var reader = sqlCmd3.ExecuteReader())
        {

            var list = new List<ShoppingCartAssets.items>();
            while (reader.Read())
            {


                //list.Add(new ShoppingCartAssets.items { ItemId = reader.GetInt32(0), Name = reader.GetString(1), Type = reader.GetString(2), Description = reader.GetString(3), image = reader.GetString(6), price = reader.GetInt32(7) });
                list.Add(new ShoppingCartAssets.items { ItemId = reader.GetInt32(0) });

            }

            var listOfAssets = new List<ShoppingCartAssets.items>();
            foreach (ShoppingCartAssets.items item in list.ToList())
            //foreach (var id in cart.ToList())
            {

                TextBox AmauntTextBox = (TextBox)GridView3.Rows[i++].FindControl("AmauntTextBox");
                int amaunt = Convert.ToInt32(AmauntTextBox.Text);
                if (amaunt == 0)
                {
                    list.Remove(item);
                    continue;
                } int num = item.ItemId;
                //foreach (ShoppingCartAssets.items item in list)
                // {

                if (item.ItemId == num)
                {

                    sqlCmd4.Parameters.Clear();


                    sqlCmd4.Parameters.AddWithValue("@ProductId", num);
                    sqlCmd4.Parameters.AddWithValue("@OrderId", result);
                    sqlCmd4.Parameters.AddWithValue("@Amount", amaunt);
                    sqlCmd4.ExecuteNonQuery();









                    // dont get the error, wtf ?!
                    // get items that matches the id, then show in the view.

                }



                // }


            }
            sqlCmddel.ExecuteNonQuery();
            con.Close();



        }
        // In case The amount will be neccessary gor order table that currently used for visual representation
        /*List<int> cart = (List<int>)Session["cart"];
         int i = 0;
             foreach (var itemId in cart)
             {
                 string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                 SqlConnection con = new SqlConnection(dbstring);
                 string sqlStr = @"Update [dbo].[Order] set Amount=@Amount where itemId = @ItemID";

                 SqlCommand sqlCmd2 = new SqlCommand(sqlStr, con);
                 con.Open();
                
                 sqlCmd2.Parameters.Clear();

                 TextBox AmauntTextBox = (TextBox)GridView3.Rows[i++].FindControl("AmauntTextBox");

                 int amaunt = Convert.ToInt32(AmauntTextBox.Text);
                 sqlCmd2.Parameters.AddWithValue("@ItemId", itemId);
                 sqlCmd2.Parameters.AddWithValue("@Amount", amaunt);
                 sqlCmd2.ExecuteNonQuery();

                     
                 con.Close();
         
         } */
        Session["cart"] = null;
        GridView3.Visible = false;
        //Response.Redirect(Request.RawUrl);
        // Response.Redirect(Page.Request.Path + "?Remove=1");
        // Page.Response.Redirect(Page.Request.Url.ToString(), false);
        Label1.Visible = true;
        Order.Visible = false;


    }

    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView3.Rows[e.RowIndex];

        string idStr = row.Cells[1].Text;
        int id = Convert.ToInt32(idStr);

              List<ShoppingCartAssets.items> cart = (List<ShoppingCartAssets.items>)Session["cart"];
        List<ShoppingCartAssets.items> cart2 = new List<ShoppingCartAssets.items>();

        foreach (var itemId in cart)
        {
            if (itemId.ItemId != id)
            {
                cart2.Add(itemId);
            }
        
        }

        Session["cart"] = cart2;
    }
}