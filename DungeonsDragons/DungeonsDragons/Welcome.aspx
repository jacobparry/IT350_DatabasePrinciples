<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="DungeonsDragons.Welcome" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h1>Welcome to Dungeon Tracker!</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <h1><asp:Label ID="lblLoggedIn" runat="server"></asp:Label></h1>
                <h3>This will be your one-stop Dungeons and Dragons service!</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <asp:Image ID="imgDD" runat="server" ImageUrl="~/Images/Dungeons-and-Dragons-movie.jpg"></asp:Image>
            </div>
        </div>
    </div>


</asp:Content>
