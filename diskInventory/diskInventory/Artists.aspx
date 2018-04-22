<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="Artists.aspx.cs" Inherits="diskInventory.Artists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- form user info -->
    <div class="card card-outline-secondary">
        <div class="card-header text-center">
            <h3 class="mb-0">Artist Information</h3>
        </div>
        <div class="card-body">
            <form class="form" role="form" runat="server" autocomplete="off">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">First name</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtFirstName" runat="server"
                            CssClass="form-control" placeholder="John"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="text-danger" ID="RegularExpressionValidator3"
                            runat="server" ErrorMessage="Invalid First Name"
                            ControlToValidate="txtFirstName"
                            ValidationExpression="^[a-zA-Z][a-zA-Z\\s]+$" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtLastName" runat="server"
                            CssClass="form-control" placeholder="Doe"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="text-danger" ID="RegularExpressionValidator1"
                            runat="server" ErrorMessage="Invalid Last Name"
                            ControlToValidate="txtLastName"
                            ValidationExpression="^[a-zA-Z][a-zA-Z\\s]+$" />

                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label"></label>
                    <div class="col-lg-9">
                        <asp:Button ID="btnClear" runat="server" Text="Clear"
                            CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnClear_Click" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Add Artist"
                            CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                    <asp:Label CssClass="text-danger" runat="server" ID="txtErrorMessage"></asp:Label>
                </div>
                <!-- Bootstrap Modal Dialog -->
                <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                        <asp:Button ID="btnAddAnother" runat="server" Text="Add Another"
                                            CssClass="btn btn-secondary" OnClick="btnAddAnother_Click" />
                                        <asp:Button ID="btnReturn" runat="server" Text="Back to Main Menu"
                                            CssClass="btn btn-primary" OnClick="btnReturn_Click" />
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
