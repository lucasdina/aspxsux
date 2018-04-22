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
            <asp:GridView runat="server" ID="GVArtists" DataSourceID="ObjectDataSource1"></asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllArtists" TypeName="ArtistsDB"></asp:ObjectDataSource>
        </div>
    </div>
    </form>
</asp:Content>
