using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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


                string mail = Request.Form["mail"].ToString();
                string password = Request.Form["password"].ToString();
                s = this.UpdateUser(mail, password);
                if (s > 0)
                {
                    message = "Update Success";
                }
                else
                {
                    message = "Update Failed";
                }
            }
        }

        public int UpdateUser(string mail, string password)
        {
            int suc = -1;

            //string mail = Request.Form["mail"].ToString();
            //string password = Request.Form["password"].ToString();
            if (!(CheckMail(mail) && CheckPass(password)))
                return suc;

            bool valid = false;
            string catagory = Request.Form["catagories"].ToString();
            string newVal = Request.Form["newCat"].ToString();

            if (catagory == "UserName")
                valid = CheckFname(newVal);
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
            }

            return suc;
        }


        //check function's
        private bool CheckFname(string fname)
        {
            //check null
            if (fname == null) return false;

            //check length
            if (fname.Length < 2 || fname.Length > 15) return false;

            //check alpha
            foreach (char c in fname)
            {
                if (IsSpecialCharacter(c)) return false;
            }

            return true;
        }

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