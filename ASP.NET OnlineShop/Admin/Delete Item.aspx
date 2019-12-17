<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete Item.aspx.cs" Inherits="Admin_Delete_Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="616px">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Item] WHERE [ItemId] = @original_ItemId AND [Name] = @original_Name AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [Item] ([ItemId], [Name], [Type], [Description]) VALUES (@ItemId, @Name, @Type, @Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ItemId], [Name], [Type], [Description] FROM [Item]" UpdateCommand="UPDATE [Item] SET [Name] = @Name, [Type] = @Type, [Description] = @Description WHERE [ItemId] = @original_ItemId AND [Name] = @original_Name AND [Type] = @original_Type AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_ItemId" Type="Int32" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_Type" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ItemId" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Type" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Type" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="original_ItemId" Type="Int32" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_Type" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

