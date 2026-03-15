using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEliranProject.Html
{
    public partial class Guitar_Katalog : System.Web.UI.Page
    {
        public string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            username = Session["userName"].ToString();
        }
    }
}