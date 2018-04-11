<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCharacterHPModal.ascx.cs" Inherits="DungeonsDragons.Controls.Character.Modals.EditCharacterHPModal" %>

<link rel="stylesheet" type="text/css" id="customCss" runat="server" visible="false" href="~/Styles/Custom.css" />
<link rel="stylesheet" type="text/css" id="bootstrapCss" runat="server" visible="false" href="~/bootstrap/css/bootstrap.min.css" />

<div id="divModalEditHP" runat="server" class="DDmodal-container" style="display: none;">
    <div class="DDmodal">
        <div class="DDmodal-header">
            <h3>Edit HP</h3>
        </div>
        <div class="DDmodal-body">
            <asp:Panel ID="pnl" runat="server" DefaultButton="btnSaveHP">
                <table class="table table-striped" width="100%">


                    <tr>
                        <td>Max HP:
                        </td>
                        <td>
                            <asp:TextBox ID="txtMaxHP" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateMaxHP" ControlToValidate="txtMaxHP" Type="Integer" MinimumValue="1"
                                MaximumValue="255" runat="server" ErrorMessage="Please enter a number between 3-255" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Temp HP:
                        </td>
                        <td>
                            <asp:TextBox ID="txtTempHP" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateTempHP" ControlToValidate="txtTempHP" Type="Integer" MinimumValue="1"
                                MaximumValue="255" runat="server" ErrorMessage="Please enter a number between 3-255" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>

                </table>
            </asp:Panel>
        </div>
        <div class="DDmodal-footer">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-primary" />
            <asp:Button ID="btnSaveHP" runat="server" Text="Save" OnClick="btnSaveHP_Click"
                CssClass="btn btn-primary" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfCharacterID" runat="server" />
        </div>
    </div>
</div>
