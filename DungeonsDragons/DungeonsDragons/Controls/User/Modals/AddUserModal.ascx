<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddUserModal.ascx.cs" Inherits="DungeonsDragons.Controls.User.Modals.AddUserModal" %>

<link rel="stylesheet" type="text/css" id="customCss" runat="server" visible="false" href="~/Styles/Custom.css" />
<link rel="stylesheet" type="text/css" id="bootstrapCss" runat="server" visible="false" href="~/bootstrap/css/bootstrap.min.css" />

<div id="divModalAddUser" runat="server" class="DDmodal-container" style="display: none;">
    <div class="DDmodal">
        <div class="DDmodal-header">
            <h3>Add User</h3>
        </div>
        <div class="DDmodal-body">
            <asp:Panel ID="pnl" runat="server" DefaultButton="btnSaveAddUser">
                <table class="table table-striped" width="100%">
                    <tr>
                        <td>First Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Username:
                        </td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Password:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Email:
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="DDmodal-footer">
            <asp:Button ID="btnCancelAddUser" runat="server" Text="Cancel" CssClass="btn-primary" />
            <asp:Button ID="btnSaveAddUser" runat="server" Text="Save" OnClick="btnSaveAddUser_Click"
                CssClass="pure-button pure-button-primary" />
            <asp:HiddenField ID="hfUserID" runat="server" />
        </div>
    </div>
</div>
