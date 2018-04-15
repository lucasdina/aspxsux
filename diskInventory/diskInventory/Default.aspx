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
                <h6>To add a borrower, click 'Borrowers' at the top of the page, or just click <a href="Borrowers.aspx">here</a>. The 'Artists' and 'Disks' sections are currently under developement, but feel free to check them out anyway!</h6>
            </form>
        </div>
    </div>
</asp:Content>
