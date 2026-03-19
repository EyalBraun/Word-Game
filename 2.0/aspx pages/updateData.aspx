<%@ Page Title="Update Data" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="updateData.aspx.cs" Inherits="Eyal_Braun_Projects._2._0.aspx_pages.updateData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Designs/UpdateData.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="update-container">
        <h2>Update User Record</h2>
        
        <form id="form1" runat="server" method="post">
            
            <span class="filter-label">Step 1: Choose what to change</span>
            <p>Select Field to Update:</p>
            <select name="filterField" required>
                <option value="" disabled selected>-- Select a Field --</option>
                <option value="Email">Email</option>
                <option value="City">City</option>
                <option value="Fname">First Name</option>
                <option value="Lname">Last Name</option>
                <option value="Password">Password</option>
            </select>

            <span class="filter-label">Step 2: Identify the user</span>
            <p>Target Username (Key):</p>
            <input type="text" name="key" placeholder="Enter exact username..." required autocomplete="off" />

            <span class="filter-label">Step 3: Enter the new data</span>
            <p>New Value:</p>
            <input type="text" name="value" placeholder="Enter new value..." required autocomplete="off" />

            <input type="submit" value="Update Record" />
        </form>
    </div>

</asp:Content>