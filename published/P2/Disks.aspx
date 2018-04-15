<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="Disks.aspx.cs" Inherits="diskInventory.Disks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-outline-secondary align-content-center text-center">
        <div class="card-header text-center">
            <h3 class="mb-0">Under Construction</h3>
        </div>
        <div class="card-body">
            <form runat="server">
                <img class="img-fluid" src="Images/pika.gif" alt="Under Construction" />
                <h4>Sorry, this page is under construction. We are working as hard as we can!</h4>
                <asp:Button CssClass="form-control" ID="Button1" OnClick="btnReturnToDefault_Click" Text="Return Home" runat="server" />
            </form>
        </div>
    </div>
</asp:Content>
