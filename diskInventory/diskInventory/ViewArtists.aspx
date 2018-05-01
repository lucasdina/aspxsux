<%@ Page Title="" Language="C#" MasterPageFile="~/DiskInventory.Master" AutoEventWireup="true" CodeBehind="ViewArtists.aspx.cs" Inherits="diskInventory.ViewArtists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="card card-outline-secondary align-content-center text-center">
            <div class="card-header text-center">
                <h3 class="mb-0">View Artists</h3>
            </div>
            <div class="card-body">
                <%-- list of artists --%>
                <asp:GridView runat="server" ID="GVArtists" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="artist_id" AllowPaging="True" PageSize="20" CssClass="Grid">
                    <Columns>
                        <asp:BoundField DataField="artist_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="artist_id" />
                        <asp:BoundField DataField="artist_first_name" HeaderText="First Name" SortExpression="artist_first_name" />
                        <asp:BoundField DataField="artist_last_name" HeaderText="Last Name" SortExpression="artist_last_name" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" SelectCommand="SELECT * FROM [Artist] ORDER BY artist_id DESC" DeleteCommand="DELETE FROM [GroupHasArtist] WHERE [artist_id] = @artist_id; DELETE FROM [DiskHasArtist] WHERE [artist_id] = @artist_id; DELETE FROM [Artist] WHERE [artist_id] = @artist_id" InsertCommand="INSERT INTO [Artist] ([artist_first_name], [artist_last_name]) VALUES (@artist_first_name, @artist_last_name)" UpdateCommand="UPDATE [Artist] SET [artist_first_name] = @artist_first_name, [artist_last_name] = @artist_last_name WHERE [artist_id] = @artist_id">
                    <DeleteParameters>
                        <asp:Parameter Name="artist_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="artist_first_name" Type="String" />
                        <asp:Parameter Name="artist_last_name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="artist_first_name" Type="String" />
                        <asp:Parameter Name="artist_last_name" Type="String" />
                        <asp:Parameter Name="artist_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <!-- form info -->
        <div class="card card-outline-secondary" style="margin-top: 20px">
            <div class="card-header text-center">
                <h3 class="mb-0">Add Artist</h3>
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
                <%-- Submit and Clear --%>
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
            </div>
        </div>
        <!-- /form info -->
    </form>
</asp:Content>
