<%@ Page Title="" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="project-1-forms.aspx.cs" Inherits="Eyal_Braun_Projects._2._0.aspx_pages.project_1_forms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Designs/Forms.css" />

   <script>
       // Global variable to store the password so the confirm_password function can access it
       var pass;

       function email_checker() {
           var email = document.getElementById('email').value;
           var msg = document.getElementById('gmail_status');

           // Validates length, checks for '@' presence (not at the start or end), checks suffix, and ensures no spaces
           var isValid = email.length > 4 && email.length < 50 && (email.indexOf("@") > 0 && email.indexOf("@") != email.length - 1) && email.endsWith(".com") && !email.includes(" ");

           if (email) {
               msg.innerHTML = isValid ? "email is valid" : "email is invalid";
               msg.style.color = isValid ? "#2ecc71" : "red";
           } else {
               msg.innerHTML = "";
           }
           return isValid;
       }

       function password_checker() {
           var password = document.getElementById('password').value;
           pass = password; // Update the global variable
           var msg = document.getElementById('password_status');

           // Flags for character type validation
           var is_lower_alpha = false;
           var is_upper_alpha = false;
           var is_digit = false;

           // Iterate through the string checking ASCII character boundaries
           for (let i = 0; i < password.length; i++) {
               if ('a' <= password[i] && password[i] <= 'z') { is_lower_alpha = true; break; }
           }
           for (let i = 0; i < password.length; i++) {
               if ('A' <= password[i] && password[i] <= 'Z') { is_upper_alpha = true; break; }
           }
           for (let i = 0; i < password.length; i++) {
               if ('0' <= password[i] && password[i] <= '9') { is_digit = true; break; }
           }

           // Password must contain all three character types and be between 8-50 chars
           var isValid = is_lower_alpha && is_upper_alpha && is_digit && password.length >= 8 && password.length <= 50;

           if (password) {
               msg.innerHTML = isValid ? "password is valid" : "password is invalid";
           } else {
               msg.innerHTML = "";
           }
           msg.style.color = isValid ? "#2ecc71" : "red";
           return isValid;
       }

       function username_v() {
           var user_name = document.getElementById('user_name').value;
           var msg = document.getElementById('user_name_output');
           var digit_i = -1;

           // Find the index of the last numeric digit in the username (if any)
           for (var i = 0; i < user_name.length; i++) {
               if ('0' <= user_name[i] && user_name[i] <= '9') digit_i = i;
           }

           // Validates that if there is a digit, it's not the first character, and checks string bounds
           var isValid = (digit_i > 0 || digit_i == -1) && user_name.length > 0 && user_name.length < 50;
           msg.innerHTML = isValid ? "the username is valid " : "the username is invalid";
           msg.style.color = isValid ? "green " : "red";
           return isValid;
       }

       function review_v() {
           var review = document.getElementById('review').value;
           var msg = document.getElementById('review_status');

           // Ensures the review has substantial length but doesn't overflow the DB column
           var isValid = review.length > 8 && review.length < 300;
           if (review) {
               msg.innerHTML = isValid ? "the review is valid" : "the review is invalid";
               msg.style.color = isValid ? "green" : "red";
           } else msg.innerHTML = "";
           return isValid;
       }

       function age_v() {
           var input = document.getElementById('age').value;
           var age = parseInt(input);
           var msg = document.getElementById('age_status');

           // Validates user is an adult and within a reasonable age limit
           var isValid = age >= 18 && age <= 99;
           if (input) {
               msg.innerHTML = isValid ? "the age is valid" : "the age is invalid";
               msg.style.color = isValid ? "green" : "red";
           } else msg.innerHTML = "";
           return isValid;
       }

       function confirm_password() {
           var confirm = document.getElementById('confirm_pass').value;
           var msg = document.getElementById('confirm_status');

           // Checks if the confirmation matches the global 'pass' variable
           var isValid = (confirm == pass && confirm !== "");
           if (confirm) {
               if (isValid) {
                   msg.innerHTML = "the passwords match";
                   msg.style.color = "green";
               } else {
                   msg.innerHTML = "the passwords do not match";
                   msg.style.color = "red";
               }
           } else {
               msg.innerHTML = "";
           }
           return isValid;
       }

       // Master validation function triggered on form submission
       function validate_all() {
           // Execute all checks and store their boolean results
           var res1 = email_checker();
           var res2 = password_checker();
           var res3 = username_v();
           var res4 = review_v();
           var res5 = age_v();
           var res6 = confirm_password();

           // Only true if every single validation function returns true
           var all_passed = res1 && res2 && res3 && res4 && res5 && res6;

           // Inject the final boolean into the hidden input so the C# backend can read it
           document.getElementsByName("passed")[0].value = all_passed;

           // Return true to allow the browser to dispatch the POST request to the server
           return true;
       }
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="signup-container">
        <button class="home-btn">
            <a href="homepage.aspx">← Back to Home Page</a>
        </button>

        <h1>Sign Up</h1>
        <form runat="server" method="post" onsubmit="return validate_all();">
    <label>User Name:</label>
    <input type="text" id="user_name" name ="user_name" placeholder="YourUserName" oninput="username_v()" />
    <p id="user_name_output" style="color:black"></p>

    <label>Email:</label>
    <input type="text" id="email" name ="email" placeholder="youremail@gmail.com" oninput="email_checker()" />
    <p id="gmail_status"></p>

    <label>Password:</label>
    <input type="password" id="password" name= "password" oninput="password_checker()" placeholder="Aa12345678" />
    <p id="password_status" style="color:black"></p>

    <label>Confirm Password:</label>
    <input type="password" id="confirm_pass" name ="confirm_pass" oninput="confirm_password()" placeholder="Aa12345678" />
    <p id="confirm_status" style="color:black"></p>

    <label>Review:</label>
    <input type="text" id="review" name ="review" placeholder="I think that the website is..." oninput="review_v()" />
    <p id="review_status" style="color:black"></p>

    <label>Age:</label>
    <input type="text" id="age" name ="age" placeholder="21" oninput="age_v()" />
    <p id="age_status" style="color:black"></p>

    <label>Phone Number:</label>
    <input type="text" name ="phone" id="phone" placeholder="0501234567" />
    <p id="phone_status" style="color:black"></p>

    <label>City:</label>
    <input type="text" id="city" name ="city"  placeholder="Your city" />
    
    <input type ="hidden" name ="passed" />
    <input type="submit" />
     <p style="margin-top: 10px; font-size: 0.9em;">
     Already have an account? <a href="login.aspx" style="color:#3498db; text-decoration:none;">Log in</a>
    </p>
</form>

    </div>
</asp:Content>