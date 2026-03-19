<%@ Page Title="" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Eyal_Braun_Projects._2._0.aspx_pages.project_1_homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link rel="stylesheet" href="../Designs/homepagE.css" />
    
<script>
    // DARK MODE
    function dark_display() {
        document.getElementById("Container").classList.remove("whitebackground");
        document.getElementById("Container").classList.add("blackbackground");
        document.getElementById("image").src = "../pictures/WordleBlackDisplay.png";
    }

    // LIGHT MODE
    function light_display() {
        document.getElementById("Container").classList.remove("blackbackground");
        document.getElementById("Container").classList.add("whitebackground");
        document.getElementById("image").src = "../pictures/WordleWhiteDisplay.png";
    }
</script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="Container" class="whitebackground">

    <h1 class="title">WORD GAME</h1>
    

    <table id="Table">
    <tr>
        <td><a href="#">The game!</a></td>
        <td>This is the game itself</td>
    </tr>

    <tr>
        <td><a href="ScoreBoard.aspx">Scoreboard</a></td>
        <td>This is where you see people’s streaks</td>
    </tr>

    <tr>
        <td><a href="WordsArchive.aspx">Words Archive</a></td>
        <td>Browse the full archive of words</td>
    </tr>

    <tr>
        <td><a href="project-1-forms.aspx">Sign up now</a></td>
        <td>Save your streak and show it to others</td>
    </tr>

    <tr>
        <td><a href="login.aspx">Login</a></td>
        <td>Access your account to manage progress</td>
    </tr>

    <tr>
        <td><a href="TUTORIAL.aspx">Tutorial</a></td>
        <td>Learn how to play the game!</td>
    </tr>
     <tr>
         <td><a href ="about.aspx">About</a></td>
         <td>about page !</td>
     </tr>
</table>

    <img src="../pictures/WordleWhiteDisplay.png" id="image">

    <button onclick="dark_display()">Dark Display</button>
    <button onclick="light_display()">Light Display</button>

</div>

</asp:Content>
