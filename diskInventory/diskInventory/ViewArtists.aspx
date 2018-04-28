<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="ViewArtists.aspx.cs" Inherits="diskInventory.ViewArtists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form id="form1" runat="server">
    <div class="card card-outline-secondary align-content-center text-center">
        <div class="card-header text-center">
            <h3 class="mb-0">View Artists</h3>
        </div>
        <div class="card-body">
            <%-- list of artists --%>
            <asp:GridView runat="server" ID="GVArtists" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="artist_id" AllowPaging="True" PageSize="20">
                <Columns>
                    <asp:BoundField DataField="artist_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="artist_id" />
                    <asp:BoundField DataField="artist_first_name" HeaderText="First Name" SortExpression="artist_first_name" />
                    <asp:BoundField DataField="artist_last_name" HeaderText="Last Name" SortExpression="artist_last_name" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" SelectCommand="SELECT * FROM [Artist] ORDER BY artist_id DESC" DeleteCommand="DELETE FROM [GroupHasArtist] WHERE [artist_id] = @artist_id; DELETE FROM [DiskHasArtist] WHERE [artist_id] = @artist_id; DELETE FROM [Artist] WHERE [artist_id] = @artist_id" InsertCommand="INSERT INTO [Artist] ([artist_first_name], [artist_last_name]) VALUES (@artist_first_name, @artist_last_name)" UpdateCommand="UPDATE [Artist] SET [artist_first_name] = @artist_first_name, [artist_last_name] = @artist_last_name WHERE [artist_id] = @artist_id">
                <DeleteParameters>
                    <asp:Parameter Name="artist_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="artist_first_name" Type="String" />
                    <asp:Parameter Name="artist_last_name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="artist_first_name" Type="String" />
                    <asp:Parameter Name="artist_last_name" Type="String" />
                    <asp:Parameter Name="artist_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    </form>
</asp:Content>
