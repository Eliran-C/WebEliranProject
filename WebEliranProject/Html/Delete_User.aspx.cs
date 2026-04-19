using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebEliranProject.Html
{
    public partial class Delete_User : System.Web.UI.Page
    {
        public string message;
        public int s;

        string fileName = General.FileName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.IsPostBack)
            {
                string mail = Request.Form["mail"].ToString();
                string password = Request.Form["password"].ToString();
                s = Delete_User.DelUser(mail, password);
                if (s > 0)
                {
                    message = "Delete Success";
                }
                else
                {
                    message = "Delete Failed";
                }
            }
        }

        public static int DelUser(string mail, string password)
        {
            int suc = -1;

            if(CheckMail(mail) && CheckPass(password))
            {
                string sql = "DELETE FROM UsersTable WHERE Email= '" + mail + "' AND Password = '" + password + "'";
                Helper.DoQuery(General.FileName, sql);
                suc = 1;
            }

            return suc;
        }

        public static bool CheckPass(string pass)
        {
            //check null
            if (pass == null) return false;

            //check length
            if (pass.Length < 5 || pass.Length > 10) return false;

            //check alpha
            return IsValidString(pass);
        }

        public static bool CheckMail(string mail)
        {
            //check null
            if (mail == null) return false;

            //check length
            if (mail.Length < 2 || mail.Length > 50) return false;

            //check if contains @
            if (!mail.Contains('@')) return false;

            return true;
        }

        public static bool IsValidString(string input)
        {
            foreach (char c in input)
            {
                if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || IsSpecialCharacter(c)))
                {
                    return false;
                }
            }
            return true;
        }

        public static bool IsSpecialCharacter(char c)
        {
            char[] specialChars = { '@', '#', '$', '%', '&', '*', '!', '_', '-', '+', '=', '.', ',' };
            return Array.Exists(specialChars, element => element == c);
        }
    }
}