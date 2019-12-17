<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Brands.aspx.cs" Inherits="Brands" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="AddToCartButton_Click1" >
       <ItemTemplate>
         <div id="brandBox">
              <div style="margin:0px 50px;">
               <!-- Set the image by using the conditional operator. If no image path is in the 
                    database, then use standard image, else use the image path from the database 
               --> 
               <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("image").ToString() == "" ? "~/images/brands/noImage.png" : Eval("image") %>' AlternateText="Image" CssClass="imgBrand" Height="200px" Width="200px" />
            </div>
            <div id="brandText">
               <span style="color: #000000;">

                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemId") %>' Visible="false"></asp:Label>
                   Name: <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                   <br />
                   Type: <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                   <br />
                   Price: <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("Price") %>'></asp:Label>$
                   <br />
                   Description: <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                   </span>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server">
                     <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
                <%--<select id="Select1" >
                    <option>1</option>
                    <option>2</option>
                     <option>3</option>
                    <option>4</option>
                     <option>5</option>
                    <option>6</option>
                     <option>7</option>
                    <option>8</option>
                     <option>9</option>
                    <option>10</option>

                </select> <%--currently present just for the esthetic value--%>
                <br />
                <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart" CommandName="select" />
                </div>
            
            </div>
           </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="clear:both;text-align: center;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [ItemId], [Name], [Type], [Price],[Description], [Author], [Stock], [image]  FROM [Item] ORDER BY [name]" >
     </asp:SqlDataSource>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

