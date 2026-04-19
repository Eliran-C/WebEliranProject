using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebEliranProject.Html
{
    public partial class Register1 : System.Web.UI.Page
    {
        public string message;
        public int s;

        string fileName = General.FileName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                s = this.Insert();
                if (s > 0)
                {
                    message = "Register success";
                    Session["userName"] = Request.Form["fname"];//לדייק מול הבסיס נתונים 
                    Session["admin"] = 0;
                    Session["email"] = Request.Form["mail"].ToString();
                    Session["password"] = Request.Form["password"].ToString();

                    //send email
                    string mail = Request.Form["mail"].ToString();
                    string mailMessage = "Hello " + Request.Form["fname"] + ",\n\nWelcome to Eliran's guitar world! We're thrilled to have you as a member of our community. If you have any questions or need assistance, feel free to reach out to us.\n\nBest regards,\nEliran's guitar world team";
                    Helper.SendEmail(mail, mailMessage);
                    Response.Redirect("HomePageMaster.aspx");
                }
                else
                {
                    message = "Register failed\n" + message;
                }
            }
        }

        private int Insert()
        {
            int sc = -1;
            string fname, pass, mail, gender;
            string bornYear;
            fname = Request.Form["fname"];
            pass = Request.Form["password"].ToString();
            mail = Request.Form["mail"].ToString();
            gender = Request.Form["gender"].ToString();
            bornYear = Request.Form["bornYear"].ToString();

            if(CheckFname(fname) && CheckPass(pass) && CheckMail(mail)
                && CheckGender(gender) && CheckBornYear(bornYear))
            {
                bool isUserName = Helper.IsExist(fileName, "SELECT * FROM UsersTable WHERE UserName='" + fname + "'");
                bool isEmail = Helper.IsExist(fileName, "SELECT * FROM UsersTable WHERE Email='" + mail + "'");
                if (isUserName && isEmail)
                {
                    message = "This username and email are already in use.";
                    return sc;
                }
                else if (isUserName)
                {
                    message = "This username is already in use.";
                    return sc;
                }
                else if (isEmail)
                {
                    message = "This email is already in use.";
                    return sc;
                }

                string sql = "INSERT INTO UsersTable (UserName,Password,Email,BornYear,Gender) VALUES('" + fname + "','" + pass + "','" + mail + "','" + int.Parse(bornYear) + "','" + gender + "')";
                Helper.DoQuery(fileName, sql);
                sc = 1;
            }

            return sc;

        }



        //check function's
        private bool CheckFname(string fname)
        {
            //check null
            if(fname == null) return false;

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