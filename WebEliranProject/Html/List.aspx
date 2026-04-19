<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebEliranProject.Html.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Guitar World - רשימת משתמשים
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="myform">
        <%=msg%>
        <h1>עדכון משתמש</h1>
        
        <div>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="אימייל לזיהוי" required></asp:TextBox>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="סיסמת המשתמש" required></asp:TextBox>
        </div>

        <h2>שדה לשינוי</h2>
        <asp:DropDownList ID="ddlCategories" runat="server" required>
            <asp:ListItem Value="">--בחר שדה--</asp:ListItem>
            <asp:ListItem Value="Password">סיסמה</asp:ListItem>
            <asp:ListItem Value="Email">מייל</asp:ListItem>
            <asp:ListItem Value="BornYear">שנת לידה</asp:ListItem>
            <asp:ListItem Value="Gender">מין</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="txtNewVal" runat="server" placeholder="הערך החדש" required></asp:TextBox>
        
        <asp:Button ID="btnUpdate" runat="server" Text="עדכן" OnClick="btnUpdate_Click" />
    </div>


            <script type="text/javascript">
                function deleteUser(email, password) {
                    if (!confirm("are you sure that you want to delete this user?")) return;

                    //api url
                    const url = `https://localhost:44326/api/ValuesController1/DelUser?mail=${email}&password=${password}`;

                    // send req
                    fetch(url, {
                        method: 'GET'
                    })
                    .then(response => {
                        if (response.ok) {
                            alert("the user delete successfully");
                            location.reload();
                        } else {
                            alert("Error with delete user.");
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert("Connection Error.");
                    });
                }

                function makeAdmin(email, password) {
                    if (!confirm("are you sure that you want to make this user admin?")) return;
                    //api url
                    const url = `https://localhost:44326/api/ValuesController1/MakeAdmin?mail=${email}&password=${password}`;
                    // send req
                    fetch(url, {
                        method: 'GET'
                    })
                    .then(response => {
                        if (response.ok) {
                            alert("the user is now admin");
                            location.reload();
                        } else {
                            alert("Error with making user admin.");
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert("Connection Error.");
                    });
                }
            </script>





</asp:Content>--%>


<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebEliranProject.Html.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Guitar World - רשימת משתמשים
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>
    <html>
        <head>
            </head>
        <body>
            <%=msg%>
            <form action="List.aspx" runat="server" method="post" class="myform">
                <h1>משתמש לשינוי</h1>
                <input type="text" id="mail" name="mail" placeholder="mail" required/>
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
                <asp:Button ID="btnUpdate" runat="server" Text="עדכן" OnClick="btnUpdate_Click" />
                <%--<input type="submit" id="submit" name="submit" value="עדכן" />--%>
            </form>





    <script type="text/javascript">
    function deleteUser(email, password) {
        if (!confirm("are you sure that you want to delete this user?")) return;

        //api url
        const url = `https://localhost:44326/api/ValuesController1/DelUser?mail=${email}&password=${password}`;

        // send req
        fetch(url, {
            method: 'GET'
        })
            .then(response => {
                if (response.ok) {
                    alert("the user delete successfully");
                    location.reload();
                } else {
                    alert("Error with delete user.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Connection Error.");
            });
    }

    function makeAdmin(email, password) {
        if (!confirm("are you sure that you want to make this user admin?")) return;
        //api url
        const url = `https://localhost:44326/api/ValuesController1/MakeAdmin?mail=${email}&password=${password}`;
        // send req
        fetch(url, {
            method: 'GET'
        })
            .then(response => {
                if (response.ok) {
                    alert("the user is now admin");
                    location.reload();
                } else {
                    alert("Error with making user admin.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Connection Error.");
            });
    }

    function reload() {
        location.reload();
    }

    </script>
        </body>
    </html>

</asp:Content>



