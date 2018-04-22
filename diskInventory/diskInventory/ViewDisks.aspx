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
            <asp:GridView runat="server" ID="GVDisks" DataSourceID="ObjectDataSource1"></asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDisks" TypeName="DisksDB"></asp:ObjectDataSource>
        </div>
    </div>
    </form>
</asp:Content>
