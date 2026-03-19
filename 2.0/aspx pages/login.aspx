<%@ Page Title="" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Eyal_Braun_Projects._2._0.aspx_pages.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Designs/Login.css" />
    <script>
        function username_v() {
            var user_name = document.getElementById('user_name').value;
            var msg = document.getElementById('user_name_output');
            var digit_i = -1;

            for (var i = 0; i < user_name.length; i++) {
                if ('0' <= user_name[i] && user_name[i] <= '9') digit_i = i;
            }

            var isValid = (digit_i > 0 || digit_i == -1) && user_name.length > 0 && user_name.length < 50;
            msg.innerHTML = isValid ? "the username is valid" : "the username is invalid";
            msg.style.color = isValid ? "green" : "red";
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="signup-container">
        <h1>Login</h1>

        <form runat="server" method="post">
            <label>Username</label>
            <input type="text" placeholder="Enter username" id="user_name" name="user_name" oninput="username_v()">
            <p id="user_name_output"></p>
             
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password">

            <input type="submit" class="home-btn" value="Login" />
        </form>
    </div>
</asp:Content>