<%@ Page Title="Delete User" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="deleteData.aspx.cs" Inherits="Eyal_Braun_Projects._2._0.aspx_pages.deleteData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Designs/DeleteStyles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-wrapper">
        <div class="delete-box">
            <h2>Delete User Record</h2>
            <p class="subtitle">Please enter the username of the account you wish to remove from the <strong>RegisterdUsers</strong> table.</p>
            
            <form runat="server" method="post">
                <div class="input-group">
                    <label>Username (Key):</label>
                    <input type="text" name="key" placeholder="e.g. EyalBraun123" required />
                </div>
                
                <input type="submit" value="Confirm Deletion" class="btn-delete" />
            </form>
            
            <div class="footer-links">
                <a href="updateData.aspx">Go to Update Page</a>
            </div>
        </div>
    </div>
</asp:Content>