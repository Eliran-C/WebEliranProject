using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebEliranProject.Html
{
    public partial class LoginPage : System.Web.UI.Page
    {
        public string msg;
        public int s;

        string fileName = General.FileName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)//הסבר נוסף יבוא
            {

                string fname = Request.Form["fname"].ToString();//לשנות
                string pass = Request.Form["password"].ToString();//לצורך זיהוי 

                if (fname != null && pass != null)
                {
                    string loginsql = "SELECT * FROM UsersTable WHERE UserName = '" + fname + "' AND Password = '" + pass + "'";
                    if (Helper.IsExist(fileName, loginsql))
                    {
                        DataTable table = Helper.ExecuteDataTable(fileName, loginsql);
                        int length = table.Rows.Count;
                        if (length == 0)
                        {
                            msg = "Failed";
                            Response.Redirect("Html/LoginPage.aspx");
                        }
                        else
                        {
                            // msg = "welcome " + fname;
                            Session["userName"] = table.Rows[0]["UserName"].ToString();//לדייק מול הבסיס נתונים 
                            Session["admin"] = table.Rows[0]["isAdmin"].ToString();
                            Session["email"] = table.Rows[0]["Email"].ToString();
                            Session["password"] = table.Rows[0]["Password"].ToString();
                            if (Session["admin"].ToString() == "1")
                            {
                                msg = "welcome administrator " + Session["userName"].ToString();
                            }
                            else
                            {
                                msg = "welcome " + Session["userName"].ToString();
                            }
                            Response.Redirect("HomePageMaster.aspx");
                            //  Response.Redirect("UpdateUser.aspx");
                        }
                    }
                    else
                    {
                        msg = "Failed";
                    }
                }
            }

        }
    }
}