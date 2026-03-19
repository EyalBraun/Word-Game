using DbDemo_MSSite;
using System;
using System.Collections.Generic;
using System.Data; // Required for DataTable
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class project_1_forms : System.Web.UI.Page
    {
        string DataBase_Name = "Database1.mdf";
        string Table_Name = "RegisterdUsers";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                string passedStr = Request.Form["passed"];

                if (passedStr == "true")
                {
                    string userName = Request.Form["user_name"];
                    string email = Request.Form["email"];
                    string password = Request.Form["password"];
                    string review = Request.Form["review"];
                    string phone = Request.Form["phone"];
                    string city = Request.Form["city"];

                    int age = 0;
                    int.TryParse(Request.Form["age"], out age);

                    // --- STEP 1: CHECK FOR DUPLICATES ---
                    // Query the database to see if a row with this username already exists
                    string checkQuery = $"SELECT * FROM {Table_Name} WHERE UserName = '{userName}'";

                    // Assuming your Helper class returns a DataTable for SELECT queries
                    DataTable dt = Helper.ExecuteDataTable(DataBase_Name, checkQuery);

                    // If the row count is greater than 0, the username is taken
                    if (dt.Rows.Count > 0)
                    {
                        // Inject a JavaScript alert into the browser to notify the user
                        string script = "alert('This username is already taken. Please choose another one.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "DuplicateUserAlert", script, true);
                    }
                    else
                    {
                        // --- STEP 2: SAFE TO INSERT ---
                        string sqlQuery = $"INSERT INTO {Table_Name} (UserName, Email, PasswordHash, Review, Age, Phone, City) " +
                                          $"VALUES ('{userName}', '{email}', '{password}', '{review}', {age}, '{phone}', '{city}')";

                        Helper.DoQuery(DataBase_Name, sqlQuery);

                       
                    }
                }
                else
                {
                    string script = "alert('You have to submit according to the rules of the fields.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "DuplicateUserAlert", script, true);
                }
            }

        }
    }
}