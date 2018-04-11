<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CharacterSkills.ascx.cs" Inherits="DungeonsDragons.Controls.Character.CharacterSkills" %>

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

