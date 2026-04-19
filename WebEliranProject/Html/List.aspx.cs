using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEliranProject.Html
{
    public partial class List : System.Web.UI.Page
    {
        public string msg;

        string fileName = General.FileName;
        string sqlCommand = "SELECT * FROM UsersTable";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "0")
            {
                string message = "Only admins can get in";
                string script = $"alert('{message}');";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", script, true);
                Response.Redirect("HomePageMaster.aspx");
            }
            else
            {


                DataTable table = Helper.ExecuteDataTable(fileName, sqlCommand);
                int length = table.Rows.Count;


                msg = "<table border='2'  class='tables'> <tr>";
                msg += "<td> UserName</td>";
                msg += "<td> mail</td>";
                msg += "<td> password </td>";
                msg += "<td> del user </td>";
                msg += "<td> is Admin </td>";//***
                                             //  msg += "<td> update user </td>";
                msg += "</tr>";
                // Response.Write("</tr>");
                for (int i = 0; i < length; i++)
                {
                    string username = table.Rows[i]["UserName"].ToString();
                    string email = table.Rows[i]["Email"].ToString();
                    string pass = table.Rows[i]["Password"].ToString();

                    if (username != Session["userName"].ToString())
                    {
                        msg += "<tr>";
                        msg += "<td>" + username + "</td> ";
                        msg += "<td>" + email + "</td> ";
                        msg += "<td>" + pass + "</td> ";
                        msg += "<td><a href='javascript:void(0)' onclick='deleteUser(\"" + email + "\", \"" + pass + "\")'>del</a></td>";

                        if (table.Rows[i]["isAdmin"].ToString() == "1")
                        {
                            msg += "<td> admin </td>";
                        }
                        else
                        {
                            msg += "<td><a href='javascript:void(0)' onclick='makeAdmin(\"" + email + "\", \"" + pass + "\")'>make admin</a></td>";
                        }


                        msg += "</tr>";
                    }
                }
                msg += "</table>";


            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string userMail = Request.Form["mail"];
            string userPass = Request.Form["password"];
            string categoryToChange = Request.Form["catagories"];
            string newValue = Request.Form["newCat"];
            string message = "succsessfully updated";

            string sqlCom = "UPDATE UsersTable SET " + categoryToChange + "= '" + newValue + "' WHERE Email= '" + userMail + "' AND Password = '" + userPass + "'";
            if (!Helper.DoQuery(fileName, sqlCom))
                message = "failed to update";


            string script = $"alert('{message}');";

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", script, true);


            string script2 = "window.location.href = window.location.href;";
            ClientScript.RegisterStartupScript(this.GetType(), "RefreshPage", script2, true);
        }
    }
}



