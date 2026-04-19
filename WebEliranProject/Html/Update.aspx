<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="WebEliranProject.Html.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
        Guitar World - עדכון רשומים
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

    <form action="Update.aspx" runat="server" method="post" class="myform">
        <h1>משתמש לשינוי</h1>

        <input type="text" id="password" name="password" placeholder="סיסמה" required minlength="5" maxlength="10"/>
       
        <h2>שדה לשינוי</h2>
        <select id="catagories" name="catagories" required>
            <option value="">--בחר שדה--</option>
            <option value="Password">סיסמה</option>
            <option value="Email">מייל</option>
            <option value="BornYear">שנת לידה</option>
            <option value="Gender">מין</option>
           <!-- <option value="isAdmin">להוריד/להפוך למנהל</option> -->
        </select>

        <input type="text" id="newCat" name="newCat" placeholder="הערך החדש" required/>
        <input type="submit" id="submit" name="submit" value="עדכן" />
    </form>

    <%=message %>

</html>

</asp:Content>
