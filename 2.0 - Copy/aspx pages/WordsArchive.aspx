<%@ Page Title="Words Archive" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="WordsArchive.aspx.cs" Inherits="Eyal_Braun_Projects._2._0.aspx_pages.WordsArchive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel ="stylesheet" href ="../Designs/wordsArchive.css" />
    <script>
        var Words;
        fetch("../words.txt")
            .then(res => res.text())
            .then(text => Words = text.split("\n"));
        var index = 0;
        function WordDisplayer() {
            var word = document.getElementById('word');
            if (index < Words.length) {
                word.innerHTML = Words[index];
                index++;
            }
            else {
                index = 0;
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Words Archive</h1>

    <p class="info">
        Dive into the complete list of words used in the game — perfect for studying, strategizing, or just flexing your Wordle mastery.
        Whether you’re practicing your guesses or curious about the word pool, this archive’s got your back.
    </p>

    <p class="info">
        Hit the button below to reveal each word one at a time. It’s a simple way to review and improve your vocabulary, prep for challenges, or just explore.
        Feel free to come back anytime to refresh your skills or find inspiration for your next Wordle win.
    </p>

    <p class="info" style="font-style: italic; color: #6b7a8f;">
        Pro Tip: Try to spot common letter patterns or repeated prefixes and suffixes as you browse — it’s a neat trick for cracking tougher puzzles!
    </p>

    <p id="word">Click the button to start!</p>
    <button onclick="WordDisplayer()">Show Next Word</button>

</asp:Content>
