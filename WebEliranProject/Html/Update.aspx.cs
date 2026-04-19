using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEliranProject.Html
{
    public partial class Update : System.Web.UI.Page
    {
        public string message;
        public int s;

        string fileName = General.FileName;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (this.IsPostBack)
            {
                if (Session["userName"].ToString() == "visitor")
                {
                    message = "visitors can't update users";
                }


                string mail = Session["email"].ToString();
                string password = Request.Form["password"].ToString();
                string catagory = Request.Form["catagories"].ToString();
                string newVal = Request.Form["newCat"].ToString();
                s = this.UpdateUser(mail, password, catagory, newVal);
                if (s > 0)
                {
                    message = "Update Success";
                    Helper.SendEmail(Session["email"].ToString(), "Your account was updated successfully. the category: " + catagory + " has been update to " + newVal + ".");
                }
                else
                {
                    message = "Update Failed";
                }
            }
        }

        public int UpdateUser(string mail, string password, string catagory, string newVal)
        {
            int suc = -1;

            //string mail = Request.Form["mail"].ToString();
            //string password = Request.Form["password"].ToString();
            if (!(CheckMail(mail) && CheckPass(password)))
                return suc;

            bool valid = false;

            if (catagory == "UserName")
                valid = false;
            else if (catagory == "Password")
                valid = CheckPass(newVal);
            else if (catagory == "Email")
                valid = CheckMail(newVal);
            else if (catagory == "BornYear")
                valid = CheckBornYear(newVal);
            else if (catagory == "Gender")
                valid = CheckGender(newVal);
            else if (catagory == "isAdmin")
                valid = false;

            if(valid)
            {
                string sql = "UPDATE UsersTable SET " + catagory + "= '"+newVal+ "' WHERE Email= '" + mail + "' AND Password = '" + password + "'";
                if(Helper.DoQuery(fileName, sql))
                    suc = 1;
                if (catagory == "Email")
                {
                    Session["Email"] = newVal;
                }
            }

            return suc;
        }

        public static bool MakeAdminAPI(string mail, string password)
        {
            string category = "isAdmin";
            string newVal = "1";
            string sql = "UPDATE UsersTable SET " + category + "= '" + newVal + "' WHERE Email= '" + mail + "' AND Password = '" + password + "'";
            if (Helper.DoQuery(General.FileName, sql))
                return true;
            return false;
        }

        //check function's
        private bool CheckPass(string pass)
        {
            //check null
            if (pass == null) return false;

            //check length
            if (pass.Length < 5 || pass.Length > 10) return false;

            //check alpha
            return IsValidString(pass);
        }

        private bool CheckMail(string mail)
        {
            //check null
            if (mail == null) return false;

            //check length
            if (mail.Length < 2 || mail.Length > 50) return false;

            //check if contains @
            if (!mail.Contains('@')) return false;

            return true;
        }

        private bool CheckBornYear(string bornYear)
        {
            //check null
            if (bornYear == null) return false;

            //if there is any letter
            if (!bornYear.Any(char.IsDigit)) return false;

            //if the year is the curr one or in the future
            int born = int.Parse(bornYear);
            if (DateTime.Now.Year <= born) return false;

            return true;
        }

        private bool CheckGender(string gender)
        {
            if (gender == "male" || gender == "female" || gender == null) return true;

            return false;
        }

        private bool CheckIsAdmin(string newVal)
        {
            if (newVal == null || (newVal != "0" && newVal != "1"))
                return false;
            return true;
        }


        //help functions
        private bool IsValidString(string input)
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
        private bool IsSpecialCharacter(char c)
        {
            char[] specialChars = { '@', '#', '$', '%', '&', '*', '!', '_', '-', '+', '=', '.', ',' };
            return Array.Exists(specialChars, element => element == c);
        }
    }
}