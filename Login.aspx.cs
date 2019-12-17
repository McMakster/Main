using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        Roles.AddUserToRole(CreateUserWizard1.UserName, "User");
        // Get the UserId of the just-added user
        MembershipUser newUser = Membership.GetUser(CreateUserWizard1.UserName);
        

        Guid newUserId = (Guid)newUser.ProviderUserKey;

        //Get Profile Data Entered by user in CUW control
        String FirstName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("FirstName")).Text;
        String LastName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("LastName")).Text;
        String Address = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Address")).Text;
        String Email = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Email")).Text;
        String Password = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Password")).Text;

       
        // Insert a new record into User_Profile

        // Get your Connection String 

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string insertSql = "INSERT INTO User_Profile(UserId,FirstName,LastName,Email,Address,Password) VALUES(@UserId, @FirstName, @LastName,@Email,@Address,@Password)";



        using (SqlConnection myConnection = new SqlConnection(connectionString))
        {

            myConnection.Open();

            SqlCommand myCommand = new SqlCommand(insertSql, myConnection);

            myCommand.Parameters.AddWithValue("@UserId", newUserId);
            myCommand.Parameters.AddWithValue("@FirstName", FirstName);
            myCommand.Parameters.AddWithValue("@Email", Email);
            myCommand.Parameters.AddWithValue("@Password", Password);
            myCommand.Parameters.AddWithValue("@LastName", LastName);
            myCommand.Parameters.AddWithValue("@Address", Address);



            myCommand.ExecuteNonQuery();

            myConnection.Close();

        }

        }


    }
