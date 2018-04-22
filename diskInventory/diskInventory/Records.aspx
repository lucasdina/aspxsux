<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="Records.aspx.cs" Inherits="diskInventory.Records" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-outline-secondary align-content-center text-center">
        <div class="card-header text-center">
            <h3 class="mb-0">View Records</h3>
        </div>
        <div class="card-body">
            <form runat="server">

                <h6>
                    <asp:Button ID="btnViewDisks" runat="server" Text="Disks"
                        CssClass="btn btn-primary" OnClick="btnViewDisks_Click" /></h6>

                <h6>
                    <asp:Button ID="btnViewBorrowers" runat="server" Text="Borrowers"
                        CssClass="btn btn-primary" OnClick="btnViewBorrowers_Click" /></h6>

                <h6>
                    <asp:Button ID="btnViewArtists" runat="server" Text="Artists"
                        CssClass="btn btn-primary" OnClick="btnViewArtists_Click" /></h6>
            </form>
        </div>
    </div>
</asp:Content>
