<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Register1.aspx.cs" Inherits="WebEliranProject.Html.Register1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Guitar World - הרשמה
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html> 
        <style>
            main {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            footer {
                background-color: rgba(0, 0, 0, 0.3);
                color: #fff;
                padding: 10px;
                text-align: center;
                margin-top: 40px;
            }
            .myform {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                color: #fff;
            }

            .myform h1 {
                margin-bottom: 20px;
                font-size: 24px;
                color: #fff;
            }

            .myform input[type="text"],
            .myform input[type="number"],
            .myform input[type="password"],
            .myform input[type="email"],
            .myform input[type="submit"],
            .myform select{
                width: 90%;
                padding: 10px;
                margin-bottom: 15px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
            }

            .myform input[type="text"],
            .myform input[type="number"],
            .myform input[type="password"],
            .myform input[type="email"],
            .myform select{
                background-color: #fff;
                color: #333;
            }

            .myform input[type="submit"] {
                background-color: #0066cc;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .myform input[type="submit"]:hover {
                background-color: #003366;
            }
        </style>

        <form action="Register1.aspx" runat="server" method="post" class="myform">
            <h1>טופס הרשמה</h1>

            <input type="text" id="fname" name="fname" placeholder="שם פרטי" required minlength="2" maxlength="15"/>

            <input type="password" id="password" name="password" placeholder="סיסמה" required minlength="5" maxlength="10"/>

            <input type="email" id="mail" name="mail" placeholder="דואר אלקטרוני" required minlength="2" maxlength="50"/>

            <input type="number" id="bornyear" name="bornyear" placeholder="שנת לידה" required/>

            <%--<input type="text" id="gender" name="gender" placeholder="מין" required"/>--%>

            <select id="gender" name="gender" required>
                <option value="">--בחר מגדר--</option>
                <option value="male">זכר (Male)</option>
                <option value="female">נקבה (Female)</option>
            </select>
            <input type="submit" id="submit" name="submit" value="הרשם" />
        </form>

        <%=message %>

    </html>
</asp:Content>
