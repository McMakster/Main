<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="None" Width="1000px" ForeColor="#333333" OnRowDeleting="GridView3_RowDeleting">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
             <asp:TemplateField HeaderText="Amaunt" >
                <ItemTemplate>
                    <asp:TextBox ID="AmauntTextBox" runat="server" Text="1" Width="20px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ItemId" HeaderText="ID" ReadOnly="True" SortExpression="ItemId" />
            <asp:BoundField DataField="Name" HeaderText="Product Name" SortExpression="Name" />
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
           <asp:ImageField DataImageUrlField="Image" HeaderText="Image">
               <ControlStyle CssClass="cartImage" Height="100px" Width="100px" />
               <%--<ItemStyle CssClass="cartImage" Font-Size="Smaller" Height="100px" Width="100px" Wrap="True" />--%>
            </asp:ImageField>    
            
            <asp:CommandField ShowDeleteButton="True" />
           
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <div runat="server" id="divid" style="float: left; padding: 30px">
        <p>The shopping cart is empty. Please purchase something
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Brands.aspx">here</asp:HyperLink>
            to proceed to checkout. </p>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/brands/emptycart.jpg" />

    </div>
   
    <br />
    <asp:Label ID="Label1" runat="server" Text="Thank You for your Purchase." Visible="false"></asp:Label>
    <br />
    <asp:Button ID="Order" runat="server" Text="Submit" OnClick="Order_Click" visible="false" />
    
   


    


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order].ItemId, Item.Name, Item.image, Item.price FROM [Order] INNER JOIN Item ON [Order].ItemId = Item.ItemId" 
        DeleteCommand="Delete From [Order] Where ItemId=@ItemId">
        
    </asp:SqlDataSource>


</asp:Content>

