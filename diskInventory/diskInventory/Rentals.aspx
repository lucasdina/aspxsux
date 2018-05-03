<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="Rentals.aspx.cs" Inherits="diskInventory.Rentals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-outline-secondary align-content-center text-center">
        <div class="card-header text-center">
            <h3 class="mb-0">Rentals</h3>
        </div>
        <div class="card-body">
            <form runat="server">

                <%-- new rental nav --%>
                <h6> 
                    <asp:Button ID="btnViewNewRentals" runat="server" Text="Create New Rental"
                        CssClass="btn btn-primary" OnClick="btnViewNewRentals_Click" /></h6>
                <%-- current rentals nav --%>
                <h6>
                    <asp:Button ID="btnViewCurrentRentals" runat="server" Text="Check Existing Rentals"
                        CssClass="btn btn-primary" OnClick="btnViewCurrentRentals_Click" /></h6>
                <%-- artist nav --%>
            </form>
        </div>
    </div>
</asp:Content>
