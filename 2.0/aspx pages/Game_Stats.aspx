<%@ Page Title="" Language="C#" 
    MasterPageFile="~/2.0/aspx pages/MasterPage.Master" 
    AutoEventWireup="true" 
    CodeBehind="Game_Stats.aspx.cs" 
    Inherits="Eyal_Braun_Projects._2._0.aspx_pages.Game_Stats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel ="stylesheet" href ="../Designs/GameStats.css" />
       
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<form method="post">

    Filter Column:
    <select name="filterField">
        <option value="">--None--</option>
        <option value="user_id">user_id</option>
        <option value="word">word</option>
        <option value="attempts">attempts</option>
        <option value="won">won</option>
        <option value="play_date">play_date</option>
    </select>

    Filter Value:
    <input type="text" name="filterValue" />

    <br /><br />

    <input type="submit" value="Show Table" />

</form>

<br />

SQL Query:
<pre><%= SqlQuery %></pre>

<div id="tableWrapper">
    <%= CurrentTableHtml %>
</div>

</asp:Content>