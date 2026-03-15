using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEliranProject
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        public string userName;
        protected void Page_Load(object sender, EventArgs e)
        {
            userName = Session["userName"].ToString();
            if (Session["userName"].ToString() == "visitor")
            {
                lblUsername.Style.Add("display", "none");
                home_page.Style.Add("display", "block");
                g_katalog.Style.Add("display", "block");
                login.Style.Add("display", "block");
                register.Style.Add("display", "block");
                user_list.Style.Add("display", "none");
                logout.Style.Add("display", "none");
                update_profile.Style.Add("display", "none");
            }
            else if (Session["admin"].ToString() == "1")
            {
                lblUsername.Style.Add("display", "block");
                home_page.Style.Add("display", "block");
                g_katalog.Style.Add("display", "block");
                login.Style.Add("display", "none");
                register.Style.Add("display", "none");
                user_list.Style.Add("display", "block");
                logout.Style.Add("display", "block");

                update_profile.Style.Add("display", "block");
            }
            else
            {
                lblUsername.Style.Add("display", "block");
                home_page.Style.Add("display", "block");
                g_katalog.Style.Add("display", "block");
                login.Style.Add("display", "none");
                register.Style.Add("display", "none");
                user_list.Style.Add("display", "none");
                logout.Style.Add("display", "block");

                update_profile.Style.Add("display", "block");
            }

        }
    }
}