<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="ConfirmBorrower.aspx.cs" Inherits="diskInventory.ConfirmBorrower" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="card card-outline-secondary align-content-center text-center">
        <div class="card-header text-center">
            <h3 class="mb-0">Confirm User</h3>
        </div>
        <div class="card-body">
            <form runat="server">
                First Name: <%=borrower.FirstName %> <br />
                Last Name: <%=borrower.LastName %><br />
                Email: <%=borrower.Email %><br />
                Phone: <%=borrower.Phone %><br />
            </form>
        </div>
    </div>
</asp:Content>
