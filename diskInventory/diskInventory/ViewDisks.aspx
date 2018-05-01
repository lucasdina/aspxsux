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
                <asp:GridView runat="server" ID="GVDisks" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="disk_id" AllowPaging="True" PageSize="20" CssClass="Grid">
                    <Columns>
                        <asp:BoundField DataField="disk_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="disk_id" />
                        <asp:BoundField DataField="disk_title" HeaderText="Title" SortExpression="disk_title" />
                        <asp:BoundField DataField="disk_length" HeaderText="Length" SortExpression="disk_length" />
                        <asp:BoundField DataField="disk_genre" HeaderText="Genre" SortExpression="disk_genre" />
                        <asp:BoundField DataField="borrowed_date" HeaderText="Borrowed" SortExpression="borrowed_date" />
                        <asp:BoundField DataField="returned_date" HeaderText="Returned" SortExpression="returned_date" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" DeleteCommand="DELETE FROM [DiskHasBorrower] WHERE [disk_id] = @disk_id; DELETE FROM [Disk] WHERE [disk_id] = @disk_id" InsertCommand="INSERT INTO [Disk] ([disk_title], [disk_length], [disk_genre], [borrowed_date], [returned_date]) VALUES (@disk_title, @disk_length, @disk_genre, @borrowed_date, @returned_date)" SelectCommand="SELECT * FROM [Disk] ORDER BY disk_id DESC" UpdateCommand="UPDATE [Disk] SET [disk_title] = @disk_title, [disk_length] = @disk_length, [disk_genre] = @disk_genre, [borrowed_date] = @borrowed_date, [returned_date] = @returned_date WHERE [disk_id] = @disk_id">
                    <DeleteParameters>
                        <asp:Parameter Name="disk_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="disk_title" Type="String" />
                        <asp:Parameter Name="disk_length" Type="Int32" />
                        <asp:Parameter Name="disk_genre" Type="String" />
                        <asp:Parameter DbType="Date" Name="borrowed_date" />
                        <asp:Parameter DbType="Date" Name="returned_date" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="disk_title" Type="String" />
                        <asp:Parameter Name="disk_length" Type="Int32" />
                        <asp:Parameter Name="disk_genre" Type="String" />
                        <asp:Parameter DbType="Date" Name="borrowed_date" />
                        <asp:Parameter DbType="Date" Name="returned_date" />
                        <asp:Parameter Name="disk_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
         <!-- form user info -->
    <div class="card card-outline-secondary" style="margin-top: 20px">
        <div class="card-header text-center">
            <h3 class="mb-0">Add Disk</h3>
        </div>
        <div class="card-body">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <%-- title --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Title</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtTitle" runat="server"
                            CssClass="form-control" placeholder="Title"></asp:TextBox>
                    </div>
                </div>
                <%-- length in ms --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Length (in ms)</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtLength" runat="server"
                            CssClass="form-control" placeholder="12345"></asp:TextBox>

                    </div>
                </div>
                <%-- genre --%>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label form-control-label">Genre</label>
                    <div class="col-lg-9">
                        <asp:TextBox ID="txtGenre" runat="server"
                            CssClass="form-control" placeholder="Genre"></asp:TextBox>
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
