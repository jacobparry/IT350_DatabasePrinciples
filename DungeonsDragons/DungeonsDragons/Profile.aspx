<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DungeonsDragons.Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profilePage">
        <asp:HiddenField ID="hfUserID" runat="server" />
        <asp:HiddenField ID="hfLoggedIn" runat="server" />

        <div class="whitebox" id="divProfilePage" runat="server" visible="False">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Welcome, <%:Session["UserName"]%>, to your profile page!</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-left">
                        <h2>Personal Information:</h2>
                        <asp:Label ID="lblName" runat="server" Font-Bold="true" ForeColor="white"></asp:Label>
                        <br />
                        <asp:Label ID="lblEmail" runat="server" Font-Bold="true" ForeColor="white"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="characters">
                        <h2>Characters:</h2>
                        <asp:DropDownList ID="ddlCharacters" CssClass="btn btn-sm" runat="server" AutoPostBack="true" DataTextField="CharacterName" DataValueField="ID" OnSelectedIndexChanged="ddlCharacterList_SelectedIndexChanged"></asp:DropDownList>
                        <asp:Button ID ="addBeast" onClick ="addBeast_Click" runat="server" Text="I just saw a creep!" Visible ="false"></asp:Button>
                        <div id ="fantasticBeasts" runat ="server" visible ="false">
                            <asp:DropDownList ID="ddlBeasts" CssClass="btn btn-sm" runat="server" DataTextField="Name" AutoPostBack="true" DataValueField="ID" OnSelectedIndexChanged="ddlBeasts_SelectedIndexChanged"></asp:DropDownList>
                            <asp:Button ID ="submitBeast" onClick ="submitBeasts_click" runat="server" Visible ="false" Text="This is what I think I saw..."> </asp:Button>
                            <asp:Label ID="alreadySeen" runat="server" Visible ="false" ForeColor ="DarkRed" Font-Underline ="true" Font-Bold ="true" Text="...... You have already seen this creature! "></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="beastiary" id="beasts" runat="server" visible="False">
                        <h2>Beastiary:</h2>
                        <table>
                            <asp:Repeater ID="rptBeastiary" runat="server">

                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# Eval("DD_Creep.Name") %>
                                        </td>
                                    </tr>

                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>
                            <asp:Label ID="lblLoggedIn" runat="server"></asp:Label></h1>
                        <h3></h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
