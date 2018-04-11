<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginModal.ascx.cs" Inherits="DungeonsDragons.Controls.User.Modals.LoginModal" %>

<link rel="stylesheet" type="text/css" id="customCss" runat="server" visible="false" href="~/Styles/Custom.css" />
<link rel="stylesheet" type="text/css" id="bootstrapCss" runat="server" visible="false" href="~/bootstrap/css/bootstrap.min.css" />

<div id="divModalLogin" runat="server" class="DDmodal-container" style="display: none;">
    <div class="DDmodal">
        <div class="DDmodal-header">
            <h3>Login </h3>
        </div>
        <div class="DDmodal-body">
            <asp:Panel ID="pnl" runat="server" DefaultButton="btnSaveLogin">
                <table class="table table-striped" width="100%">
                    
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
                            <asp:TextBox ID="txtPassword" TextMode ="Password" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                </table>
            </asp:Panel>
        </div>
        <div class="DDmodal-footer">
            <asp:Button ID="btnCancelLogin" runat="server" Text="Cancel" CssClass="btn-primary" />
            <asp:Button ID="btnSaveLogin" runat="server" Text="Save" OnClick="btnSaveLogin_Click"
                CssClass="btn btn-primary" />
            <asp:HiddenField ID="hfUserID" runat="server" />
        </div>
    </div>
</div>