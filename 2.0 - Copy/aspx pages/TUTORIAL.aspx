<%@ Page Title="" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="TUTORIAL.aspx.cs" Inherits="Eyal_Braun_Projects._2._0.aspx_pages.TUTORIAL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link rel ="stylesheet" href ="../Designs/tutorial.css" />
<script>
    function over1() {
        const box = document.getElementById("box1");
        box.style.background = "#dcdcdc";
        box.style.transform = "scale(1.02)";
        box.style.borderLeft = "5px solid #6aaa64";
    }
    function out1() {
        const box = document.getElementById("box1");
        box.style.background = "#eee";
        box.style.transform = "scale(1)";
        box.style.borderLeft = "5px solid transparent";
    }

    function over2() {
        const box = document.getElementById("box2");
        box.style.background = "#dcdcdc";
        box.style.transform = "scale(1.02)";
        box.style.borderLeft = "5px solid #6aaa64";
    }
    function out2() {
        const box = document.getElementById("box2");
        box.style.background = "#eee";
        box.style.transform = "scale(1)";
        box.style.borderLeft = "5px solid transparent";
    }

    function over3() {
        const box = document.getElementById("box3");
        box.style.background = "#dcdcdc";
        box.style.transform = "scale(1.02)";
        box.style.borderLeft = "5px solid #6aaa64";
    }
    function out3() {
        const box = document.getElementById("box3");
        box.style.background = "#eee";
        box.style.transform = "scale(1)";
        box.style.borderLeft = "5px solid transparent";
    }
</script>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
    <h1>How to Play Word Game</h1>
    <p>
        Guess the hidden 5-letter word in 6 tries.
        After each guess, the color of the tiles will show how close you are.
    </p>

    <!-- GREEN -->
    <div class="section">
        <div id="box1" class="hover-box" onmouseover="over1()" onmouseout="out1()">
            <strong>Green = Correct Letter & Correct Spot</strong>
            <br>Hovering explains it, just like this.
        </div>
        <img src="../pictures/greentile.png" />
    </div>

    <!-- YELLOW -->
    <div class="section">
        <div id="box2" class="hover-box" onmouseover="over2()" onmouseout="out2()">
            <strong>Yellow = Letter is in the Word, Wrong Spot</strong>
        </div>
        <img src="../pictures/orangetile.png" />
    </div>

    <!-- GRAY -->
    <div class="section">
        <div id="box3" class="hover-box" onmouseover="over3()" onmouseout="out3()">
            <strong>Gray = Letter is NOT in the Word</strong>
        </div>
        <img src="../pictures/graytile.png" />
    </div>

    <!-- FULL EXAMPLE -->
    <div class="section">
        <h2>Full Example Guess</h2>
        <img src="../pictures/fullgameexample.png" alt="Full Word Game Example" />
        <p>
            Based on the colors, you adjust your next guess until you find the correct word.
        </p>
    </div>
</div>

</asp:Content>
