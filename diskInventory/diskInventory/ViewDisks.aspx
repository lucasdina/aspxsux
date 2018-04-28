<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="ViewDisks.aspx.cs" Inherits="diskInventory.ViewDisks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="card card-outline-secondary align-content-center text-center">
            <div class="card-header text-center">
                <h3 class="mb-0">View Disks</h3>
            </div>
            <div class="card-body">
                <%-- List of all disks --%>
                <asp:GridView runat="server" ID="GVDisks" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="disk_id" AllowPaging="True" PageSize="20" CssClass="Grid">
                    <Columns>
                        <asp:BoundField DataField="disk_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="disk_id" />
                        <asp:BoundField DataField="disk_title" HeaderText="Title" SortExpression="disk_title" />
                        <asp:BoundField DataField="disk_length" HeaderText="Length" SortExpression="disk_length" />
                        <asp:BoundField DataField="disk_genre" HeaderText="Genre" SortExpression="disk_genre" />
                        <asp:BoundField DataField="borrowed_date" HeaderText="Borrowed" SortExpression="borrowed_date" />
                        <asp:BoundField DataField="returned_date" HeaderText="Returned" SortExpression="returned_date" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" DeleteCommand="DELETE FROM [DiskHasBorrower] WHERE [disk_id] = @disk_id; DELETE FROM [Disk] WHERE [disk_id] = @disk_id" InsertCommand="INSERT INTO [Disk] ([disk_title], [disk_length], [disk_genre], [borrowed_date], [returned_date]) VALUES (@disk_title, @disk_length, @disk_genre, @borrowed_date, @returned_date)" SelectCommand="SELECT * FROM [Disk] ORDER BY disk_id DESC" UpdateCommand="UPDATE [Disk] SET [disk_title] = @disk_title, [disk_length] = @disk_length, [disk_genre] = @disk_genre, [borrowed_date] = @borrowed_date, [returned_date] = @returned_date WHERE [disk_id] = @disk_id">
                    <DeleteParameters>
                        <asp:Parameter Name="disk_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="disk_title" Type="String" />
                        <asp:Parameter Name="disk_length" Type="Int32" />
                        <asp:Parameter Name="disk_genre" Type="String" />
                        <asp:Parameter DbType="Date" Name="borrowed_date" />
                        <asp:Parameter DbType="Date" Name="returned_date" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="disk_title" Type="String" />
                        <asp:Parameter Name="disk_length" Type="Int32" />
                        <asp:Parameter Name="disk_genre" Type="String" />
                        <asp:Parameter DbType="Date" Name="borrowed_date" />
                        <asp:Parameter DbType="Date" Name="returned_date" />
                        <asp:Parameter Name="disk_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</asp:Content>
