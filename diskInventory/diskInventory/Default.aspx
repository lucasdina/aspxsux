<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="diskInventory.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-outline-secondary align-content-center text-center">
        <div class="card-header text-center">
            <h3 class="mb-0">Chuck's Rentals</h3>
        </div>
        <div class="card-body">
            <form runat="server">
                <h4>Welcome to Chuck's Rentals!</h4>
                <h5>Quick Shortcuts</h5>

                <h6><asp:Button ID="btnAddBorrower" runat="server" Text="Add Borrower"
                    CssClass="btn btn-primary" OnClick="btnAddBorrower_Click" /></h6>

                <h6><asp:Button ID="btnAddArtist" runat="server" Text="Add Artist"
                    CssClass="btn btn-primary" OnClick="btnAddArtist_Click" /></h6>

                <h6><asp:Button ID="btnAddDisk" runat="server" Text="Add Disk"
                    CssClass="btn btn-primary" OnClick="btnAddDisk_Click" /></h6>

                <h6><asp:Button ID="btnViewRecords" runat="server" Text="View Records"
                    CssClass="btn btn-primary" OnClick="btnViewRecords_Click" /></h6>
            </form>
        </div>
    </div>
</asp:Content>
