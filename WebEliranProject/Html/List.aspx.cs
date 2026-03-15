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
                msg = "Only admins can get in";
            }
            else
            {
                DataTable table = Helper.ExecuteDataTable(fileName, sqlCommand);
                int length = table.Rows.Count;


                msg = "<table border='2'  class='tables'> <tr>";
                msg += "<td> firstname</td>";
                msg += "<td> mail</td>";
                msg += "<td> password </td>";
                msg += "<td> del user </td>";//***
                                             //  msg += "<td> update user </td>";
                msg += "</tr>";
                // Response.Write("</tr>");
                for (int i = 0; i < length; i++)
                {
                    msg += "<tr>";
                    msg += "<td>" + table.Rows[i]["UserName"].ToString() + "</td> ";
                    msg += "<td>" + table.Rows[i]["Email"].ToString() + "</td> ";
                    msg += "<td>" + table.Rows[i]["Password"].ToString() + "</td> ";
                    msg += "<td> <a href = 'DelMngr.aspx?pass=" + table.Rows[i]["Password"] + "'>del</a></td> ";//***
                                                                                                                //    msg += "<td> <a href = 'DelMngr.aspx?pass=" + table.Rows[i]["password"] + "'>del</a></td> ";//***
                    msg += "</tr>";
                }
                msg += "</table>";


            }
        }


    }
}



