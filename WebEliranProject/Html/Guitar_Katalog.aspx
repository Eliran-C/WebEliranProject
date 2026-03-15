<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Guitar_Katalog.aspx.cs" Inherits="WebEliranProject.Html.Guitar_Katalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="server">
    Guitar World - קטלוג גיטרות
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>
<html lang="he" dir="rtl">
<head>
    <meta charset="utf-8">
    <style>
        main {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        section {
            margin-bottom: 40px;
        }

        .guitar-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .guitar-item {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
        }

            .guitar-item:hover {
                transform: scale(1.05);
            }

            .guitar-item img {
                max-width: 100%;
                height: auto;
                border-radius: 5px;
            }

        .details-button {
            display: inline-block;
            background-color: #0077cc;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

            .details-button:hover {
                background-color: #005fa3;
            }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            background-color: #003366;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            border-radius: 10px;
            width: 70%;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            text-align: center;
            direction: rtl;
        }

        .close {
            color: #aaa;
            float: left;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover, .close:focus {
                color: #fff;
                text-decoration: none;
                cursor: pointer;
            }

        .modal img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .modal h3 {
            color: #ffcc00;
        }

        .modal p, .modal li {
            text-align: right;
        }

        .modal ul {
            list-style-type: none;
            padding: 0;
        }

        blockquote {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }

        .buy-button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

            .buy-button:hover {
                background-color: #45a049;
            }

        footer {
            background-color: rgba(0, 0, 0, 0.3);
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-top: 40px;
        }
    </style>
</head>
<body>

    <main>
        <section>
            <h2>גיטרות חשמליות</h2>
            <div class="guitar-grid">
                <div class="guitar-item">
                    <img src="../pics/FenderStratocasterAmericanProII.jpeg" alt="Fender Stratocaster American Pro II">
                    <h3>Fender Stratocaster</h3>
                    <p>הסטרטוקסטר האגדית עם צליל נקי וחד.</p>
                    <a href="#" class="details-button" onclick="showDetails('fender-strat-pro2', '<%=username %>')">פרטים נוספים</a>
                </div>

                <div class="guitar-item">
                    <img src= "../pics/Gibson_Les_Paul_Standard_'60s.jpeg" alt="Gibson Les Paul Standard '60s">
                    <h3>Gibson Les Paul</h3>
                    <p>טון עשיר ועבה, מושלם לרוק ובלוז.</p>
                    <a href="#" class="details-button" onclick="showDetails('gibson-lp-60s', '<%=username %>')">פרטים נוספים</a>
                </div>
            </div>
        </section>

        <section>
            <h2>גיטרות אקוסטיות</h2>
            <div class="guitar-grid">

                <div class="guitar-item">
                    <img src="../pics/TaylorGSMini.jpeg" alt="Taylor GS Mini">
                    <h3>Taylor GS Mini</h3>
                    <p>גיטרה קומפקטית עם צליל גדול.</p>
                    <a href="#" class="details-button" onclick="showDetails('taylor-gs-mini')">פרטים נוספים</a>
                </div>
            </div>
        </section>

        <section>
            <h2>גיטרות בס וקלאסיות</h2>
            <div class="guitar-grid">

                <div class="guitar-item">
                    <img src="../pics/CordobaC5.jpeg" alt="Cordoba C5">
                    <h3>Cordoba C5</h3>
                    <p>גיטרה קלאסית עם צליל חם ומלא.</p>
                    <a href="#" class="details-button" onclick="showDetails('cordoba-c5')">פרטים נוספים</a>
                </div>
            </div>
        </section>
    </main>

    <!-- חלונות מודאליים לכל גיטרה -->
    <!-- Fender Stratocaster -->
    <div id="modal-fender-strat-pro2" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideModal('fender-strat-pro2')">&times;</span>
            <img src="../pics/FenderStratocasterAmericanProII.jpeg" alt="Fender Stratocaster American Pro II">
            <h3>Fender Stratocaster American Pro II</h3>
            <p><strong>דגם:</strong> American Professional II</p>
            <p><strong>חברה מייצרת:</strong> Fender Musical Instruments Corporation</p>
            <p><strong>מחיר:</strong> ₪6,999</p>
            <p>הסטרטוקסטר האמריקאית דור II היא שדרוג מרשים של הקלאסיקה. עם פיקאפי V-Mod II, גשר טרמולו משופר ופרופיל צוואר "Deep C", היא מספקת טונים נקיים וחדים עם תחושת נגינה משופרת.</p>
            <h4>מפרט טכני</h4>
            <ul>
                <li><strong>הגברה:</strong> יש</li>
                <li><strong>צבעים:</strong> אולטרה כחול, אדום סוניק, שחור</li>
                <li><strong>משקל:</strong> 3.5 ק"ג</li>
                <li><strong>כולל:</strong> נרתיק קשיח, רצועה, כבל</li>
            </ul>
            <h4>דירוג וביקורות</h4>
            <p><strong>דירוג ממוצע:</strong> ★★★★★ (4.9/5 מתוך 328 ביקורות)</p>
            <blockquote>
                <p>"הסטרט הטובה ביותר שפנדר ייצרה אי פעם. הטונים נקיים ומפורטים, והנגינה חלקה כמו חמאה."</p>
                <footer>— גיא רוק, מגזין גיטרה ישראל</footer>
            </blockquote>
            <a href="#" class="buy-button" onclick="addToCart('fender-strat-pro2'); return false;">הוסף לעגלת קניות</a>
        </div>
    </div>

    <!-- Gibson Les Paul, Taylor GS Mini, Fender Precision Bass, Cordoba C5 -->
    <!-- Gibson Les Paul -->
    <div id="modal-gibson-lp-60s" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideModal('gibson-lp-60s')">&times;</span>
            <img src="../pics/Gibson_Les_Paul_Standard_'60s.jpeg" alt="Gibson Les Paul Standard '60s">
            <h3>Gibson Les Paul Standard '60s</h3>
            <p><strong>דגם:</strong> Les Paul Standard '60s</p>
            <p><strong>חברה מייצרת:</strong> Gibson Brands</p>
            <p><strong>מחיר:</strong> ₪7,499</p>
            <p>צליל נקי ביותר ועיצוב חדשני במיוחד. </p>
            <h4>מפרט טכני</h4>
            <ul>
                <li><strong>הגברה:</strong> יש</li>
                <li><strong>צבעים:</strong> קלאסי, חום שחור מדורג, שחור</li>
                <li><strong>משקל:</strong> 3.5 ק"ג</li>
                <li><strong>כולל:</strong> נרתיק קשיח, רצועה, כבל</li>
            </ul>
            <h4>דירוג וביקורות</h4>
            <p><strong>דירוג ממוצע:</strong> ★★★★★ (4.8/5 מתוך 438 ביקורות)</p>
            <blockquote>
                <p>"גיטרה מעולה ובין הטובות שגיבסון יצרו."</p>
                <footer>— סינגולדה, מגזין גיטרה ישראל</footer>
            </blockquote>
            <a href="#" class="buy-button" onclick="addToCart('gibson-lp-60s'); return false;">הוסף לעגלת קניות</a>
        </div>
    </div>


    <div id="modal-taylor-gs-mini" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideModal('taylor-gs-mini')">&times;</span>
            <img src="../pics/TaylorGSMini.jpeg" alt="Taylor GS Mini">
            <h3>Taylor GS Mini</h3>
            <p><strong>דגם:</strong> Taylor GS Mini</p>
            <p><strong>חברה מייצרת:</strong> Taylor</p>
            <p><strong>מחיר:</strong> ₪3728</p>
            <p>גיטרה מצוינת מבית טיילור, בעלת צליל מדהים וגוף מעולה.</p>
            <h4>מפרט טכני</h4>
            <ul>
                <li><strong>הגברה:</strong> אין</li>
                <li><strong>צבעים:</strong> חום עץ,  חום חלק, בז</li>
                <li><strong>משקל:</strong> 2.5 ק"ג</li>
                <li><strong>כולל:</strong> נרתיק קשיח, רצועה</li>
            </ul>
            <h4>דירוג וביקורות</h4>
            <p><strong>דירוג ממוצע:</strong> ★★★★★ (4.6/5 מתוך 812 ביקורות)</p>
            <blockquote>
                <p>"צליל נקי, מראה מצוין, אין ספק שזאת הגיטרה האקוסטית בין הטובות של טיילור."</p>
                <footer>— רועי עידן, מגזין גיטרה ישראל</footer>
            </blockquote>
            <a href="#" class="buy-button" onclick="addToCart('taylor-gs-mini'); return false;">הוסף לעגלת קניות</a>
        </div>
    </div>


    <div id="modal-cordoba-c5" class="modal">
        <div class="modal-content">
            <span class="close" onclick="hideModal('cordoba-c5')">&times;</span>
            <img src="../pics/CordobaC5.jpeg" alt="Cordoba C5">
            <h3>Cordoba C5</h3>
            <p><strong>דגם:</strong> Cordoba C5</p>
            <p><strong>חברה מייצרת:</strong> Cordoba</p>
            <p><strong>מחיר:</strong> ₪2078</p>
            <p>אחד הדגמים המקוריים מסדרות Iberia, ה C5 של Cordoba היא גיטרה קלאסית בגודל מלא. מיטב היצירה של מלאכת היד הספרדית, ה C5 מתפארת ב Cedar top קנדי ועץ Mahogany מאחור ובצדדים. הסליידים וה Fingerboard עשויים מ- Rosewood.</p>
            <h4>מפרט טכני</h4>
            <ul>
                <li><strong>הגברה:</strong> אין</li>
                <li><strong>צבעים:</strong> חום עץ,  חום חלק, בז</li>
                <li><strong>משקל:</strong> 2.7 ק"ג</li>
                <li><strong>כולל:</strong> נרתיק קשיח, רצועה</li>
            </ul>
            <h4>דירוג וביקורות</h4>
            <p><strong>דירוג ממוצע:</strong> ★★★★★ (4.7/5 מתוך 727 ביקורות)</p>
            <blockquote>
                <p>"גיטרה קלאסית ספרדית איכותית מסדרת IBERIA של Cordoba."</p>
                <footer>— אריאל רוטמן, מגזין גיטרה ישראל</footer>
            </blockquote>
            <a href="#" class="buy-button" onclick="addToCart('cordoba-c5'); return false;">הוסף לעגלת קניות</a>
        </div>
    </div>


    <script>
        function showDetails(guitarId, userName = "") {
            if (userName == "visitor") {
                alert("need to do login to see this pages")
                return;
            }
            var modal = document.getElementById("modal-" + guitarId);
            modal.style.display = "block";
        }

        function hideModal(guitarId) {
            var modal = document.getElementById("modal-" + guitarId);
            modal.style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target.className == "modal") {
                event.target.style.display = "none";
            }
        }
    </script>
</body>
</html>
</asp:Content>
