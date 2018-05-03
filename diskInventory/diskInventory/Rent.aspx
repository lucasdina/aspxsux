<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="Rent.aspx.cs" Inherits="diskInventory.Rent" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        // postBack handler for AJAX AutoComplete Extender - onClientItemSelected 
        function firstNameSelected(sender, e) {
            __doPostBack("fn", sender._element.value);
        }
        function lastNameSelected(sender, e) {
            __doPostBack("ln", sender._element.value);
        }
        function emailSelected(sender, e) {
            __doPostBack("em", sender._element.value);
        }
        function phoneSelected(sender, e) {
            __doPostBack("ph", sender._element.value);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- form user info -->
    <div class="card card-outline-secondary">
        <div class="card-header text-center">
            <h3 class="mb-0">Borrower Information</h3>
        </div>
        <div class="card-body">
            <form class="form" role="form" runat="server" autocomplete="off">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <%-- First Name --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">First name</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtBorrowerFirstName" runat="server" CssClass="form-control" placeholder="John"></asp:TextBox>
                        <cc1:AutoCompleteExtender ServiceMethod="SearchBorrowerFirstName"
                            MinimumPrefixLength="1"
                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="txtBorrowerFirstName" OnClientItemSelected="firstNameSelected"
                            ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                        </cc1:AutoCompleteExtender>
                        <asp:RegularExpressionValidator CssClass="text-danger" ID="RegularExpressionValidator3"
                            runat="server" ErrorMessage="Invalid First Name"
                            ControlToValidate="txtBorrowerFirstName"
                            ValidationExpression="^[a-zA-Z][a-zA-Z\\s]+$" />
                    </div>
                </div>
                <%-- Last Name --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtBorrowerLastName" runat="server"
                            CssClass="form-control" placeholder="Doe"></asp:TextBox>
                        <cc1:AutoCompleteExtender ServiceMethod="SearchBorrowerLastName"
                            MinimumPrefixLength="1"
                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="txtBorrowerLastName" OnClientItemSelected="lastNameSelected"
                            ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false">
                        </cc1:AutoCompleteExtender>
                        <asp:RegularExpressionValidator CssClass="text-danger" ID="RegularExpressionValidator1"
                            runat="server" ErrorMessage="Invalid Last Name"
                            ControlToValidate="txtBorrowerLastName"
                            ValidationExpression="^[a-zA-Z][a-zA-Z\\s]+$" />

                    </div>
                </div>
                <%-- Email --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Email</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtBorrowerEmail" runat="server"
                            CssClass="form-control" placeholder="johnDoe@gmail.com"></asp:TextBox>
                        <cc1:AutoCompleteExtender ServiceMethod="SearchBorrowerEmail"
                            MinimumPrefixLength="1"
                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="txtBorrowerEmail" OnClientItemSelected="emailSelected"
                            ID="AutoCompleteExtender3" runat="server" FirstRowSelected="false">
                        </cc1:AutoCompleteExtender>
                        <asp:RegularExpressionValidator CssClass="text-danger" ID="validateEmail"
                            runat="server" ErrorMessage="Invalid Email"
                            ControlToValidate="txtBorrowerEmail"
                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
                    </div>
                </div>
                <%-- Phone Number --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Phone</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtBorrowerPhone" runat="server" TextMode="Phone"
                            CssClass="form-control" placeholder="555-555-5555"></asp:TextBox>
                        <cc1:AutoCompleteExtender ServiceMethod="SearchBorrowerPhone"
                            MinimumPrefixLength="1"
                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="txtBorrowerPhone" OnClientItemSelected="phoneSelected"
                            ID="AutoCompleteExtender4" runat="server" FirstRowSelected="false">
                        </cc1:AutoCompleteExtender>
                        <asp:RegularExpressionValidator CssClass="text-danger" ID="RegularExpressionValidator2" runat="server"
                            ErrorMessage="Enter Valid Phone Number" ControlToValidate="txtBorrowerPhone"
                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"></asp:RegularExpressionValidator>
                        <asp:Label ID="lblPhoneError" runat="server"></asp:Label>
                    </div>
                </div>
                <%-- next and clear --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label"></label>
                    <div class="col-lg-9">
                        <asp:Button ID="btnClear" runat="server" Text="Clear"
                            CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnClear_Click" />
                        <asp:Button ID="btnNext" runat="server" Text="Next"
                            CssClass="btn btn-primary" OnClick="btnNext_Click" />
                    </div>
                    <asp:Label CssClass="text-danger" runat="server" ID="txtErrorMessage"></asp:Label>
                </div>
            </form>
        </div>
    </div>
    <!-- /form user info -->

</asp:Content>


