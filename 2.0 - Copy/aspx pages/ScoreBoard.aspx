<%@ Page Title="Score Board" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="ScoreBoard.aspx.cs"
    Inherits="Eyal_Braun_Projects._2._0.aspx_pages.ScoreBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel ="stylesheet" href ="../Designs/scoreboard.css" />
    

    <script>
        function mouseIn() {
            const rows = document.getElementById('scoreTable').getElementsByTagName('tr');
            for (let i = 1; i < rows.length; i++) {
                rows[i].classList.add('hovered');
            }
        }

        function mouseOut() {
            const rows = document.getElementById('scoreTable').getElementsByTagName('tr');
            for (let i = 1; i < rows.length; i++) {
                rows[i].classList.remove('hovered');
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Scoreboard</h1>

    <p class="description">
        This scoreboard displays basic player performance across multiple game sessions.
        It focuses on participation and total wins to keep things simple and clear.
    </p>

    <ul class="stats">
        <li><strong>Games Played</strong> – total matches the player has played</li>
        <li><strong>Wins</strong> – number of victories achieved</li>
    </ul>

    <p class="description">
        Hovering over the table highlights all players, making it easier to scan
        and compare results at a glance.
    </p>

    <table id="scoreTable">
        <tr>
            <th>Player</th>
            <th>Games Played</th>
            <th>Wins</th>
        </tr>

        <tr onmouseover="mouseIn()" onmouseout="mouseOut()">
            <td>Eyal</td>
            <td>42</td>
            <td>35</td>
        </tr>

        <tr onmouseover="mouseIn()" onmouseout="mouseOut()">
            <td>Noa</td>
            <td>30</td>
            <td>21</td>
        </tr>

        <tr onmouseover="mouseIn()" onmouseout="mouseOut()">
            <td>Daniel</td>
            <td>18</td>
            <td>12</td>
        </tr>

        <tr onmouseover="mouseIn()" onmouseout="mouseOut()">
            <td>Maya</td>
            <td>50</td>
            <td>40</td>
        </tr>

        <tr onmouseover="mouseIn()" onmouseout="mouseOut()">
            <td>Oren</td>
            <td>35</td>
            <td>25</td>
        </tr>

        <tr onmouseover="mouseIn()" onmouseout="mouseOut()">
            <td>Lior</td>
            <td>28</td>
            <td>19</td>
        </tr>
    </table>

</asp:Content>
