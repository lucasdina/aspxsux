<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="ViewBorrowers.aspx.cs" Inherits="diskInventory.ViewBorrowers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <form id="form1" runat="server">
    <div class="card card-outline-secondary align-content-center text-center">
        <div class="card-header text-center">
            <h3 class="mb-0">View Borrowers</h3>
        </div>
        <div class="card-body">
            <%-- list of borrowers (ignore ID) --%>
            <asp:GridView runat="server" ID="GVDisks" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="borrower_id" AllowPaging="True" PageSize="20" CssClass="Grid">
                <Columns>
                    <asp:BoundField DataField="borrower_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="borrower_id" />
                    <asp:BoundField DataField="borrower_first_name" HeaderText="First Name" SortExpression="borrower_first_name" />
                    <asp:BoundField DataField="borrower_last_name" HeaderText="Last Name" SortExpression="borrower_last_name" />
                    <asp:BoundField DataField="borrower_email" HeaderText="Email" SortExpression="borrower_email" />
                    <asp:BoundField DataField="borrower_phone" HeaderText="Phone" SortExpression="borrower_phone" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" DeleteCommand="DELETE FROM [DiskHasBorrower] WHERE [borrower_id] = @borrower_id; DELETE FROM [Borrower] WHERE [borrower_id] = @borrower_id" InsertCommand="INSERT INTO [Borrower] ([borrower_first_name], [borrower_last_name], [borrower_email], [borrower_phone]) VALUES (@borrower_first_name, @borrower_last_name, @borrower_email, @borrower_phone)" SelectCommand="SELECT * FROM [Borrower] ORDER BY borrower_id DESC" UpdateCommand="UPDATE [Borrower] SET [borrower_first_name] = @borrower_first_name, [borrower_last_name] = @borrower_last_name, [borrower_email] = @borrower_email, [borrower_phone] = @borrower_phone WHERE [borrower_id] = @borrower_id">
                <DeleteParameters>
                    <asp:Parameter Name="borrower_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="borrower_first_name" Type="String" />
                    <asp:Parameter Name="borrower_last_name" Type="String" />
                    <asp:Parameter Name="borrower_email" Type="String" />
                    <asp:Parameter Name="borrower_phone" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="borrower_first_name" Type="String" />
                    <asp:Parameter Name="borrower_last_name" Type="String" />
                    <asp:Parameter Name="borrower_email" Type="String" />
                    <asp:Parameter Name="borrower_phone" Type="String" />
                    <asp:Parameter Name="borrower_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
                  <!-- form user info -->
    <div class="card card-outline-secondary" style="margin-top: 20px">
        <div class="card-header text-center">
            <h3 class="mb-0">Add Borrower</h3>
        </div>
        <div class="card-body">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <%-- First Name --%>
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
                <%-- Last Name --%>
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
                <%-- Email --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Email</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="form-control" placeholder="johnDoe@gmail.com"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="text-danger" ID="validateEmail"
                            runat="server" ErrorMessage="Invalid Email"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
                    </div>
                </div>
                <%-- Phone Number --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Phone</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"
                            CssClass="form-control" placeholder="555-555-5555"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="text-danger" ID="RegularExpressionValidator2" runat="server"
                            ErrorMessage="Enter Valid Phone Number" ControlToValidate="txtPhone"
                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"></asp:RegularExpressionValidator>
                        <asp:Label ID="lblPhoneError" runat="server"></asp:Label>
                    </div>
                </div>
                <%-- submit and clear --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label"></label>
                    <div class="col-lg-9">
                        <asp:Button ID="btnClear" runat="server" Text="Clear"
                            CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnClear_Click" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Add Borrower"
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
        </div>
    </div>
    <!-- /form user info -->
    </form>
</asp:Content>
