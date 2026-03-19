<%@ Page Title="" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="project-1-forms.aspx.cs" Inherits="Eyal_Braun_Projects._2._0.aspx_pages.project_1_forms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Designs/Forms.css" />


    <script>
        var pass;


        function email_checker() {
            var email = document.getElementById('email').value;
            var msg = document.getElementById('gmail_status');
            if (email) {
               
                msg.innerHTML = email.length > 4 && email.length < 50 && (email.indexOf("@") > 0 && email.indexOf("@") != email.length - 1) && email.endsWith(".com") && !email.includes(" ") ? "email is valid" : "email is invalid";
                msg.style.color = email.length > 4 && email.length < 50 && (email.indexOf("@") > 0 && email.indexOf("@")!=email.length-1) && email.endsWith(".com") && !email.includes(" ") ? "#2ecc71" : "red";
            }
            else {
                msg.innerHTML = "";
            }
             
            
            

            msg.style.color = email.length > 4 && email.length < 50 && digit_l && email.indexOf("@") > 0 && email.endsWith(".com") && !email.includes(" ") ? "#2ecc71" : "red";
        }
        function password_checker() {
            var password = document.getElementById('password').value;
            pass = password;
            var msg = document.getElementById('password_status');
            var is_lower_alpha = false;
            var is_upper_alpha = false;
            var is_digit = false;
            for (let i = 0; i < password.length; i++) {
                if ('a' <= password[i] && password[i]<= 'z') {
                    is_lower_alpha = true;
                    break;
                }
            }
            for (let i = 0; i < password.length; i++) {
                if ('A' <= password[i] && password[i] <= 'Z') {
                    is_upper_alpha = true;
                    break;
                }
            }
            for (let i = 0; i < password.length; i++) {
                if ('0' <= password[i] && password[i] <= '9') {
                    is_digit = true;
                    break;
                }
            }
            if (password) {
                msg.innerHTML = is_lower_alpha && is_upper_alpha && is_digit && password.length >= 8 && password.length <= 50?"password is valid":"password is invalid";
            }
            else {
                msg.innerHTML = "";
            }
            msg.style.color = is_lower_alpha && is_upper_alpha && is_digit && password.length >= 8 && password.length <= 50 ? "#2ecc71" : "red";

            
            
        }
        function username_v() {
            var user_name = document.getElementById('user_name').value;
            var msg = document.getElementById('user_name_output');
            var digit_i = -1;
            for (var i = 0; i < user_name.length; i++) {
                if('0'<=user_name[i]&&user_name[i]<='9')digit_i = i;
                
            }
            



            msg.innerHTML = (digit_i > 0 || digit_i == -1) && user_name.length && user_name.length < 50 ? "the username is valid " : "the username is invalid";
            msg.style.color = (digit_i > 0 || digit_i == -1) && user_name.length && user_name.length < 50 ? "green " : "red";
            

        }
        function review_v() {
            var review = document.getElementById('review').value;
            var msg = document.getElementById('review_status');
            if (review) {
                msg.innerHTML = review.length > 8 && review.length < 300 ? "the review is valid" : "the review is invalid";
                msg.style.color = review.length > 8 && review.length < 300 ? "green" : "red";
            }
            else msg.innerHTML = "";
            //in this input the user suppose to type in his review on the website ,it has to be bigger then 8 because a review cant be that short but, the review needs to be smaller then 300 beacuse is shouldnt be that long.
        }
        function age_v() {
            var input = document.getElementById('age').value;
            var age = parseInt(input);
            var msg = document.getElementById('age_status');
            if (input) {
                msg.innerHTML = age >= 18 && age <= 99 ? "the age is valid" : "the age is invalid";
                msg.style.color = age >= 18 && age <= 99 ? "green" : "red";
            }
            else msg.innerHTML = "";

            //in this input the user suppose to type in his age on the website ,it has to be at least 18 beacuse 18 is the legal age in most countries, and it has to be 99 or smaller beacuse it is the accepted largest age in most websites.
            
        }
        function confirm_password() {
            var confirm = document.getElementById('confirm_pass').value;
            var msg = document.getElementById('confirm_status');
            if (confirm) {
                if (confirm == pass) {
                    msg.innerHTML = "the passwords match";
                    msg.style.color = "green";
                }
                else {
                    msg.innerHTML = "the passwords do not match";
                    msg.style.color = "red";
                }
            }
            else {
                msg.innerHTML = "";
            }
            //in this input the user suppose to confirm his password by typing it again , the code checks if the password in this input equals the password entered before.
        }

        
        





    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="signup-container">

        <button class="home-btn">
            <a href="homepage.aspx">← Back to Home Page</a>
        </button>

        <h1>Sign Up</h1>
       <form>
    <label>User Name:</label>
    <input type="text" id="user_name" placeholder="YourUserName" oninput="username_v()" />
    <p id="user_name_output" style="color:black"></p>

    <label>Email:</label>
    <input type="text" id="email" placeholder="youremail@gmail.com" oninput="email_checker()" />
    <p id="gmail_status"></p>

    <label>Password:</label>
    <input type="password" id="password" oninput="password_checker()" placeholder="Aa12345678" />
    <p id="password_status" style="color:black"></p>

    <label>Confirm Password:</label>
    <input type="password" id="confirm_pass" oninput="confirm_password()" placeholder="Aa12345678" />
    <p id="confirm_status" style="color:black"></p>

    <label>Review:</label>
    <input type="text" id="review" placeholder="I think that the website is..." oninput="review_v()" />
    <p id="review_status" style="color:black"></p>

    <label>Age:</label>
    <input type="text" id="age" placeholder="21" oninput="age_v()" />
    <p id="age_status" style="color:black"></p>

    <label>Phone Number:</label>
    <input type="text" id="phone" placeholder="0501234567" />
    <p id="phone_status" style="color:black"></p>

    <label>City:</label>
    <input type="text" id="city" placeholder="Your city" />
    
    <input type="submit" />
     <p style="margin-top: 10px; font-size: 0.9em;">
     Already have an account? <a href="login.aspx" style="color:#3498db; text-decoration:none;">Log in</a>
    </p>
</form>
      



        



        

    </div>
    

</asp:Content>