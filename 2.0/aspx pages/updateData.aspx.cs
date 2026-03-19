using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DbDemo_MSSite;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class updateData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set database and table identifiers
            string table_name = "RegisterdUsers";
            string Database = "Database1.mdf";

            // 1. Retrieve data sent from the Front-End Form
            string FieldToUpdate = Request.Form["filterField"];
            string key = Request.Form["key"];
            string value = Request.Form["value"];

            // 2. Ensure all required fields have been filled
            if (!string.IsNullOrEmpty(FieldToUpdate) && !string.IsNullOrEmpty(key) && !string.IsNullOrEmpty(value))
            {
                // 3. Query the database to see if the target user actually exists
                string checkKeyQuery = "SELECT * FROM " + table_name + " WHERE UserName = '" + key + "'";
                DataTable dt = Helper.ExecuteDataTable(Database, checkKeyQuery);

                // Check if the DataTable is empty (Defensive programming: handling null or 0 rows)
                if (dt == null || dt.Rows.Count <= 0)
                {
                    // User does not exist: alert and stop the process
                    string errorScript = "alert('Error: The username \"" + key + "\" was not found.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "UserNotFound", errorScript, true);
                    return;
                }
                else
                {
                    // 4. Compare the new value with the existing value in the database
                    // We use .ToString() to ensure a valid comparison between the form string and DB object
                    if (value == dt.Rows[0][FieldToUpdate].ToString())
                    {
                        // Values are identical: no need to perform an expensive database write
                        string sameValueScript = "alert('Update cancelled: The new value is the same as the current value.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "SameValue", sameValueScript, true);
                        return;
                    }

                    // 5. If values are different, proceed with the UPDATE query
                    // We use brackets [] around the field name to prevent errors with SQL reserved words
                    string updateQuery = "UPDATE " + table_name +
                                         " SET [" + FieldToUpdate + "] = '" + value + "' " +
                                         " WHERE UserName = '" + key + "'";

                    Helper.DoQuery(Database, updateQuery);

                    // 6. Alert the user that the update was successful
                    string successScript = "alert('Success! " + FieldToUpdate + " has been updated for user " + key + ".');";
                    ClientScript.RegisterStartupScript(this.GetType(), "UpdateSuccess", successScript, true);
                }
            }
            else
            {
                // 7. Handle empty inputs (only alert if the user actually clicked the submit button)
                if (IsPostBack)
                {
                    string missingInfoScript = "alert('Validation Error: All fields are required.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "MissingFields", missingInfoScript, true);
                }
            }
        }
    }
}