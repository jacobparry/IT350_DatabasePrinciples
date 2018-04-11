<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCharacterStatsModal.ascx.cs" Inherits="DungeonsDragons.Controls.Character.Modals.EditCharacterStatsModal" %>

<link rel="stylesheet" type="text/css" id="customCss" runat="server" visible="false" href="~/Styles/Custom.css" />
<link rel="stylesheet" type="text/css" id="bootstrapCss" runat="server" visible="false" href="~/bootstrap/css/bootstrap.min.css" />

<div id="divModalEditStats" runat="server" class="DDmodal-container" style="display: none;">
    <div class="DDmodal">
        <div class="DDmodal-header">
            <h3>Edit Stats</h3>
        </div>
        <div class="DDmodal-body">
            <asp:Panel ID="pnl" runat="server" DefaultButton="btnSaveCharacterStats">
                <table class="table table-striped" width="100%">


                    <tr>
                        <td>Strength:
                        </td>
                        <td>
                            <asp:TextBox ID="txtStrength" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateStrength" ControlToValidate="txtStrength" Type="Integer" MinimumValue="3"
                                MaximumValue="18" runat="server" ErrorMessage="Please enter a number between 3-18" Display="Dynamic"></asp:RangeValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>Dexterity:
                        </td>
                        <td>
                            <asp:TextBox ID="txtDexterity" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateDexterity" ControlToValidate="txtDexterity" Type="Integer" MinimumValue="3"
                                MaximumValue="18" runat="server" ErrorMessage="Please enter a number between 3-18" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Constitution:
                        </td>
                        <td>
                            <asp:TextBox ID="txtConstitution" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateConstitution" ControlToValidate="txtConstitution" Type="Integer" MinimumValue="3"
                                MaximumValue="18" runat="server" ErrorMessage="Please enter a number between 3-18" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Intelligence:
                        </td>
                        <td>
                            <asp:TextBox ID="txtIntelligence" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateIntelligence" ControlToValidate="txtIntelligence" Type="Integer" MinimumValue="3"
                                MaximumValue="18" runat="server" ErrorMessage="Please enter a number between 3-18" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Wisdom:
                        </td>
                        <td>
                            <asp:TextBox ID="txtWisdom" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateWisdom" ControlToValidate="txtWisdom" Type="Integer" MinimumValue="3"
                                MaximumValue="18" runat="server" ErrorMessage="Please enter a number between 3-18" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Charisma:
                        </td>
                        <td>
                            <asp:TextBox ID="txtCharisma" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateCharisma" ControlToValidate="txtCharisma" Type="Integer" MinimumValue="3"
                                MaximumValue="18" runat="server" ErrorMessage="Please enter a number between 3-18" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="DDmodal-footer">
            <asp:Button ID="btnCancelCharacterStats" runat="server" Text="Cancel" CssClass="btn-primary" />
            <asp:Button ID="btnSaveCharacterStats" runat="server" Text="Save" OnClick="btnSaveCharacterStats_Click"
                CssClass="btn btn-primary" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfCharacterID" runat="server" />
        </div>
    </div>
</div>
