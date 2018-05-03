<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="RentDisk.aspx.cs" Inherits="diskInventory.RentDisk" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        // postBack handler for AJAX AutoComplete Extender - onClientItemSelected 
        function titleSelected(sender, e) {
            __doPostBack("rd", sender._element.value);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- form user info -->
    <div class="card card-outline-secondary">
        <div class="card-header text-center">
            <h3 class="mb-0">Disk Information</h3>
        </div>
        <div class="card-body">
            <form class="form" role="form" runat="server" autocomplete="off">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <%-- title --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Title</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtTitle" runat="server"
                            CssClass="form-control" placeholder="Title"></asp:TextBox>
                        <cc1:AutoCompleteExtender ServiceMethod="SearchDiskTitle"
                            MinimumPrefixLength="1"
                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="txtTitle" OnClientItemSelected="titleSelected"
                            ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                        </cc1:AutoCompleteExtender>
                    </div>
                </div>
                <%-- genre --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Genre</label>
                    <div class="col-lg-9">
                        <asp:Label ID="txtGenre" runat="server"
                            CssClass="form-control"></asp:Label>
                    </div>
                </div>
                <%-- length --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Length</label>
                    <div class="col-lg-9">
                        <asp:Label ID="txtLength" runat="server"
                            CssClass="form-control"></asp:Label>
                    </div>
                </div>
                <%-- ID --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">ID</label>
                    <div class="col-lg-9">
                        <asp:Label ID="txtId" runat="server"
                            CssClass="form-control"></asp:Label>
                    </div>
                </div>
                <%-- checkout and return date are excluded because a new disk wont have any activity --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label"></label>
                    <div class="col-lg-9">
                        <asp:Button ID="btnClear" runat="server" Text="Clear"
                            CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnClear_Click" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Add Disk"
                            CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                    <asp:Label CssClass="text-danger" runat="server" ID="txtErrorMessage"></asp:Label>
                </div>
                <!-- Bootstrap Modal Dialog -->
                <div class="modal fade" id="goodModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">
                                            <asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label></h4>
                                    </div>
                                    <div class="modal-body">
                                        <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="btnAddAnother" runat="server" Text="Rent Another"
                                            CssClass="btn btn-secondary" OnClick="btnAddAnother_Click" />
                                        <asp:Button ID="btnReturn" runat="server" Text="Back to Rental Menu"
                                            CssClass="btn btn-primary" OnClick="btnReturn_Click" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                
                <!-- Bootstrap Modal Dialog -->
                <div class="modal fade" id="badModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h4>
                                    </div>
                                    <div class="modal-body">
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="Button1" runat="server" Text="Return"
                                            CssClass="btn btn-secondary" OnClick="btnReturn_Click" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- /form user info -->
</asp:Content>
