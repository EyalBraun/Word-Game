using DbDemo_MSSite; // חובה בשביל ה-Helper
using System;
using System.Collections.Generic;
using System.Data; // חובה בשביל DataTable
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class login : System.Web.UI.Page
    {
        string DataBase_Name = "Database1.mdf";
        string Table_Name = "RegisterdUsers";

        protected void Page_Load(object sender, EventArgs e)
        {
            // בודקים אם המשתמש לחץ על כפתור השליחה
            if (Request.HttpMethod == "POST")
            {
                string userName = Request.Form["user_name"];
                string password = Request.Form["password"];

                // שאילתה שבודקת גם שם משתמש וגם סיסמה
                string sqlQuery = $"SELECT * FROM {Table_Name} WHERE UserName = '{userName}' AND PasswordHash = '{password}'";

                DataTable dt = Helper.ExecuteDataTable(DataBase_Name, sqlQuery);

               
                if (dt.Rows.Count > 0)
                {
                   
                    Session["username"] = dt.Rows[0]["UserName"].ToString();
                    Session["City"] = dt.Rows[0]["City"].ToString();

                    
                   

                  
                    if (userName == "Admin")
                    {
                        Session["isAdmin"] = true;
                    }
                    else
                    {
                        Session["isAdmin"] = false;
                    }

                  
                    string script = "alert('Welcome " + userName + "'); window.location.href='homepage.aspx';";

                    // Register the script to run when the page loads
                    ClientScript.RegisterStartupScript(this.GetType(), "UserGreeting", script, true);
                }
                else
                {

                 
                    string script = "alert('Invalid username or password. Please try again.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "LoginError", script, true);
                }
            }
        }
    }
}