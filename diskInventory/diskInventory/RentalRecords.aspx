<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="RentalRecords.aspx.cs" Inherits="diskInventory.RentalRecords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="card card-outline-secondary align-content-center text-center">
            <div class="card-header text-center">
                <h3 class="mb-0">View Disks</h3>
            </div>
            <div class="card-body">
                <asp:GridView runat="server" ID="rentals" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="rentals_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="borrower_id" HeaderText="Borrower ID" SortExpression="borrower_id" />
                        <asp:BoundField DataField="disk_id" HeaderText="Disk ID" SortExpression="disk_id" />
                        <asp:BoundField DataField="borrower_first_name" HeaderText="First Name" SortExpression="borrower_first_name" />
                        <asp:BoundField DataField="borrower_last_name" HeaderText="Last Name" SortExpression="borrower_last_name" />
                        <asp:BoundField DataField="disk_title" HeaderText="Title" SortExpression="disk_title" />
                        <asp:BoundField DataField="disk_genre" HeaderText="Genre" SortExpression="disk_genre" />
                        <asp:BoundField DataField="borrowed_date" HeaderText="Borrowed" SortExpression="borrowed_date" />
                        <asp:ButtonField CommandName="returnDisk" Text="Return" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" SelectCommand="SELECT dhb.borrower_id, dhb.disk_id, b.borrower_first_name, b.borrower_last_name, d.disk_title, d.disk_genre, d.borrowed_date FROM DiskHasBorrower dhb
JOIN Borrower b ON b.borrower_id = dhb.borrower_id
JOIN Disk d ON d.disk_id = dhb.disk_id"></asp:SqlDataSource>
            </div>
        </div>
    </form>
</asp:Content>
