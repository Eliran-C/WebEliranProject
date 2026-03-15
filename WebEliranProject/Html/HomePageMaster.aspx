<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="HomePageMaster.aspx.cs" Inherits="WebEliranProject.Html.HomePageMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Guiter World - דף הבית
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
        <head>
            <style>
                main {
                    max-width: 800px;
                    margin: 0 auto;
                    padding: 20px;
                }

                footer {
                    background-color: rgba(0, 0, 0, 0.3);
                    color: #fff;
                    padding: 10px;
                    text-align: center;
                }

                section, article {
                text-align: right;
                }
            </style>
        </head>
    <body>
    <main>
        <section>
            <h2>אודות אתר Guitar World</h2>
            <p>אתר Guitar World הוא המרכז המקוון המוביל לנגני גיטרה מכל הסוגים. באתר תוכלו למצוא מידע עשיר על גיטרות חשמליות, אקוסטיות, בס וקלאסיות, כולל מידע על מותגים שונים, סוגי גיטרות, אביזרים, שיעורים וכלים שונים לנגני גיטרה.</p>
        </section>

        <section>
            <h2>חדשות ועדכונים</h2>
            <article>
                <h3>גיטרה חדשה מ-Fender</h3>
                <p>Fender, אחד ממותגי הגיטרות המובילים בעולם, השיקה גיטרה חדשה בסדרת האמריקאית המצוינת שלה. <a href="#">קרא עוד</a></p>
            </article>
            <article>
                <h3>שיעורי גיטרה מקוונים</h3>
                <p>החל מהחודש הבא, Guitar World יציע שיעורים מקוונים לנגינה בגיטרה בכל הרמות - החל מתחילים וכלה במתקדמים. <a href="#">הירשם כעת</a></p>
            </article>
        </section>
    </main>
</body>
</html>
</asp:Content>

