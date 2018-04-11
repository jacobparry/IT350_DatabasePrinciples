<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNewCharacterModal.ascx.cs" Inherits="DungeonsDragons.Controls.Character.Modals.AddNewCharacterModal" %>

<link rel="stylesheet" type="text/css" id="customCss" runat="server" visible="false" href="~/Styles/Custom.css" />
<link rel="stylesheet" type="text/css" id="bootstrapCss" runat="server" visible="false" href="~/bootstrap/css/bootstrap.min.css" />

<div id="divModalAddCharacter" runat="server" class="DDmodal-container" style="display: none;">
    <div class="DDmodal">
        <div class="DDmodal-header">
            <h3>Create Character </h3>
        </div>
        <div class="DDmodal-body">
            <asp:Panel ID="pnl" runat="server" DefaultButton="btnSaveCharacter">
                <table class="table table-striped" width="100%">

                    <tr>
                        <td>Character Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtCharacterName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Race:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRace" CssClass="btn btn-sm" runat="server" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Class:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlClass" CssClass="btn btn-sm" runat="server" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>Strength:
                        </td>
                        <td>
                            <asp:TextBox ID="txtStrength" runat="server"></asp:TextBox>
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
                    <tr>
                        <td>Proficiency Bonus:
                        </td>
                        <td>
                            <asp:TextBox ID="txtProficiency" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="ValidateProficiency" ControlToValidate="txtProficiency" Type="Integer" MinimumValue="0"
                                MaximumValue="100" runat="server" ErrorMessage="Please enter a number between 0-100" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Background:
                        </td>
                        <td>
                            <asp:TextBox ID="txtBackground" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Alignment:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAlignment" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Faction:
                        </td>
                        <td>
                            <asp:TextBox ID="txtFaction" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Armor Class:
                        </td>
                        <td>
                            <asp:TextBox ID="txtArmorClass" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtArmorClass" Type="Integer" MinimumValue="0"
                                MaximumValue="100" runat="server" ErrorMessage="Please enter a number between 0-100" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Experience Points:
                        </td>
                        <td>
                            <asp:TextBox ID="txtXP" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator2" ControlToValidate="txtXP" Type="Integer" MinimumValue="0"
                                MaximumValue="300000" runat="server" ErrorMessage="Please enter a number between 0-300000" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Acrobatics:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAcrobatics" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator3" ControlToValidate="txtAcrobatics" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Animal Handling:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAnimalHandling" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator4" ControlToValidate="txtAnimalHandling" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Arcana:
                        </td>
                        <td>
                            <asp:TextBox ID="txtArcana" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator5" ControlToValidate="txtArcana" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Athletics:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAthletics" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator6" ControlToValidate="txtAthletics" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Deception:
                        </td>
                        <td>
                            <asp:TextBox ID="txtDeception" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator7" ControlToValidate="txtDeception" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>History:
                        </td>
                        <td>
                            <asp:TextBox ID="txtHistory" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator8" ControlToValidate="txtHistory" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Insight:
                        </td>
                        <td>
                            <asp:TextBox ID="txtInsight" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator9" ControlToValidate="txtInsight" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Intimidation:
                        </td>
                        <td>
                            <asp:TextBox ID="txtIntimidation" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator10" ControlToValidate="txtIntimidation" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Investigation:
                        </td>
                        <td>
                            <asp:TextBox ID="txtInvestigation" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator11" ControlToValidate="txtInvestigation" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Medicine:
                        </td>
                        <td>
                            <asp:TextBox ID="txtMedicine" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator12" ControlToValidate="txtMedicine" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Nature:
                        </td>
                        <td>
                            <asp:TextBox ID="txtNature" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator13" ControlToValidate="txtNature" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Perception:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPerception" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator14" ControlToValidate="txtPerception" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Performance:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPerformance" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator15" ControlToValidate="txtPerformance" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Persuasion:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPersuasion" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator16" ControlToValidate="txtPersuasion" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Religion:
                        </td>
                        <td>
                            <asp:TextBox ID="txtReligion" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator17" ControlToValidate="txtReligion" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Sleight of Hand:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSleightofHand" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator18" ControlToValidate="txtSleightofHand" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Stealth:
                        </td>
                        <td>
                            <asp:TextBox ID="txtStealth" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator19" ControlToValidate="txtStealth" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Survival:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSurvival" runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator20" ControlToValidate="txtSurvival" Type="Integer" MinimumValue="0"
                                MaximumValue="9999" runat="server" ErrorMessage="Please enter a number between 0-9999" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>



                </table>
            </asp:Panel>
        </div>
        <div class="DDmodal-footer">
            <asp:Button ID="btnCancelCharacter" runat="server" Text="Cancel" CssClass="btn-primary" />
            <asp:Button ID="btnSaveCharacter" runat="server" Text="Save" OnClick="btnSaveCharacter_Click"
                CssClass="btn btn-primary" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfCharacterID" runat="server" />
        </div>
    </div>
</div>
