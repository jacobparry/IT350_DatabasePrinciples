<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CharacterSheet.aspx.cs" Inherits="DungeonsDragons.CharacterSheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="charactersheet">

        <asp:HiddenField ID="hfUserID" runat="server" />
        <asp:HiddenField ID="hfLoggedIn" runat="server" />

        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-2">
                    <asp:Button ID="btnAddCharacter" runat="server" Text="Create Character" OnClick="btnAddCharacter_Click" CssClass="btn btn-success btn-sm" />
                </div>
                <div class="col-lg-4">

                    <asp:Label ID="lblSelectCharacter" runat="server" Text="Select Character" CssClass="text-primary" Font-Size="Large"></asp:Label>
                    <asp:DropDownList ID="ddlCharacterList" runat="server" CssClass="btn btn-sm" AutoPostBack="true" DataTextField="CharacterName" DataValueField="ID" OnSelectedIndexChanged="ddlCharacterList_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>

    <div id="divCharacterSheet" runat="server" visible="false">
        <div class="whitebox container-fluid">
            <div class="container-fluid">
                <div class="row">


                    <div class="col-lg-2 text-center text-nowrap">
                        <h3><b>Character Name</b></h3>
                        <asp:HiddenField ID="hfCharacterID" runat="server" />
                        <asp:Label ID="lblCharacterName" runat="server"></asp:Label>
                        <asp:LinkButton ID="lbEditCharacter" runat="server" OnClick="lbEditCharacter_Click" Text="Edit" CssClass="text-primary"></asp:LinkButton>
                    </div>
                    <div class="col-lg-2">
                    </div>
                    <div class="col-lg-8 text-center">
                        <h3><b>Character Details</b></h3>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-3">
                                    <h6><u>Class & Level</u></h6>
                                    <asp:Label ID="lblClass" runat="server"></asp:Label>
                                    <asp:Label ID="lblLevel" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <h6><u>Background</u></h6>
                                    <asp:Label ID="lblBackground" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <h6><u>Player Name</u></h6>
                                    <asp:Label ID="lblPlayerName" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <h6><u>Faction</u></h6>
                                    <asp:Label ID="lblFaction" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <h6><u>Race</u></h6>
                                    <asp:Label ID="lblRace" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <h6><u>Alignment</u></h6>
                                    <asp:Label ID="lblAlignment" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <h6><u>Experience Points</u></h6>
                                    <asp:Label ID="lblXP" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <br />
                    <br />
                </div>
            </div>
            <div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3">

                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <h3><b>Character Stats</b></h3>
                                        <asp:LinkButton ID="lbEditStats" runat="server" OnClick="lbEditStats_Click" Text="Edit" CssClass="text-primary"></asp:LinkButton>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-lg-4 text-center">
                                        <h5><b>Stats</b></h5>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Strength</u></h6>
                                                    <asp:Label ID="lblStrength" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Dexterity</u></h6>
                                                    <asp:Label ID="lblDexterity" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Constitution</u></h6>
                                                    <asp:Label ID="lblConstitution" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Intelligence</u></h6>
                                                    <asp:Label ID="lblIntelligence" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Wisdom</u></h6>
                                                    <asp:Label ID="lblWisdom" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Charisma</u></h6>
                                                    <asp:Label ID="lblCharisma" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 text-center text-nowrap">
                                        <h5><b>Modifiers</b></h5>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Str Mod</u></h6>
                                                    <asp:Label ID="lblModStr" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Dex Mod</u></h6>
                                                    <asp:Label ID="lblModDex" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Const Mod</u></h6>
                                                    <asp:Label ID="lblModConst" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Int Mod</u></h6>
                                                    <asp:Label ID="lblModInt" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Wis Mod</u></h6>
                                                    <asp:Label ID="lblModWis" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Char Mod</u></h6>
                                                    <asp:Label ID="lblModChar" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 text-center">
                                        <h5 class="text-nowrap"><b>Saving Throws</b></h5>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Strength</u></h6>
                                                    <asp:Label ID="lblSTstr" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Dexterity</u></h6>
                                                    <asp:Label ID="lblSTdex" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Constitution</u></h6>
                                                    <asp:Label ID="lblSTconst" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Intelligence</u></h6>
                                                    <asp:Label ID="lblSTint" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Wisdom</u></h6>
                                                    <asp:Label ID="lblSTwis" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h6><u>Charisma</u></h6>
                                                    <asp:Label ID="lblSTchar" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">

                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <h3><b>Hit Points</b></h3>
                                        <asp:LinkButton ID="lbEditHP" runat="server" OnClick="lbEditHP_Click" Text="Edit" CssClass="text-primary"></asp:LinkButton>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-312 text-center">
                                        <h6><u>Max Hit Points</u></h6>
                                        <asp:Label ID="lblMaxHP" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <h6><u>Tempory Hit Points</u></h6>
                                        <asp:Label ID="lblTempHP" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <h3><b>Inventory</b></h3>
                                        <asp:LinkButton ID="lbEditInventory" runat="server" OnClick="lbEditInventory_Click" Text="Edit" CssClass="text-primary"></asp:LinkButton>
                                    </div>

                                </div>
                                <div class="row">
                                    <table class="table  text-center">
                                        <tr>
                                            <th>Item</th>
                                            <th>Quantity</th>
                                        </tr>
                                        <asp:Repeater ID="rptCharacterItems" runat="server">
                                            <ItemTemplate>
                                                <tr>

                                                    <td>
                                                        <%# Eval("DD_Item.Name") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("Quantity") %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <h3><b>Spells</b></h3>
                                        <asp:LinkButton ID="addSpellButton" runat="server" OnClick="addSpellButton_Click" Text="Edit" CssClass="text-primary"></asp:LinkButton>
                                    </div>
                                    <table class="table  text-center">
                                        <tr>
                                            <th>Spell</th>
                                            <th>Level</th>
                                        </tr>
                                        <asp:Repeater ID="rptSpells" runat="server">
                                            <ItemTemplate>
                                                <tr>

                                                    <td>
                                                        <%# Eval("DD_Spell.Name") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("DD_Spell.RequiredLevel") %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>





                <div class="container-fluid">
                    <div class="row">
                        <br />
                        <br />
                    </div>
                </div>


                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 text-center text-nowrap">
                            <h3><b>Skills</b></h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-1 text-center text-nowrap">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6><u>Acrobatics</u></h6>
                                        <asp:Label ID="lblSkillAcrobatics" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                        <h6><u>Animal Handling</u></h6>
                                        <asp:Label ID="lblSkillAnimalHandling" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6><u>Arcana</u></h6>
                                        <asp:Label ID="lblSkillArcana" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6><u>Athletics</u></h6>
                                        <asp:Label ID="lblSkillAthletics" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6><u>Deception</u></h6>
                                        <asp:Label ID="lblSkillDeception" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6><u>History</u></h6>
                                        <asp:Label ID="lblSkillHistory" runat="server"></asp:Label>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-1 text-center text-nowrap">
                            <div class="container-fluid">
                                <div class="row">

                                    <div class="col-md-12 text-center text-nowrap">
                                        <div>
                                            <h6><u>Insight</u></h6>
                                            <asp:Label ID="lblSkillInsight" runat="server"></asp:Label>

                                        </div>
                                        <div>
                                            <h6><u>Intimidation</u></h6>
                                            <asp:Label ID="lblSkillIntimidation" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <h6><u>Investigation</u></h6>
                                            <asp:Label ID="lblSkillInvestigation" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <h6><u>Medicine</u></h6>
                                            <asp:Label ID="lblSkillMedicine" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <h6><u>Nature</u></h6>
                                            <asp:Label ID="lblSkillNature" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <h6><u>Perception</u></h6>
                                            <asp:Label ID="lblSkillPerception" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-1 text-center text-nowrap">
                            <div class="container-fluid">
                                <div class="row">

                                    <div class="col-md-12 text-center text-nowrap">
                                        <div>
                                            <h6><u>Performance</u></h6>
                                            <asp:Label ID="lblSkillPerformance" runat="server"></asp:Label>

                                        </div>
                                        <div>
                                            <h6><u>Persuasion</u></h6>
                                            <asp:Label ID="lblSkillPersuasion" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <h6><u>Religion</u></h6>
                                            <asp:Label ID="lblSkillReligion" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <h6><u>Sleight of Hand</u></h6>
                                            <asp:Label ID="lblSkillSleightofHand" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <h6><u>Stealth</u></h6>
                                            <asp:Label ID="lblSkillStealth" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <h6><u>Survival</u></h6>
                                            <asp:Label ID="lblSkillSurvival" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <ucCharacter:CharacterModal ID="ucCharacterModal" runat="server"></ucCharacter:CharacterModal>
    <ucCharacter:EditStatsModal ID="ucEditStatsModal" runat="server"></ucCharacter:EditStatsModal>
    <ucCharacter:AddItemModal ID="ucAddItemModal" runat="server"></ucCharacter:AddItemModal>
    <ucCharacter:AddSpellModal ID="ucAddSpellModal" runat="server"></ucCharacter:AddSpellModal>
    <ucCharacter:EditHPModal ID="ucEditHPModal" runat="server"></ucCharacter:EditHPModal>
</asp:Content>
