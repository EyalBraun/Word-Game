using System;
using System.Data;
using System.Web.UI;
using DbDemo_MSSite; // Adjust this if your Helper namespace is different

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class deleteData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only execute logic if the form was submitted (PostBack)
            if (IsPostBack)
            {
                string table_name = "RegisterdUsers";
                string Database = "Database1.mdf";

                // 1. Capture the key from the Request.Form
                string key = Request.Form["key"];

                // 2. Validation: Ensure the key is not empty
                if (!string.IsNullOrEmpty(key))
                {
                    // 3. Check if the record exists in the table
                    string checkSql = "SELECT * FROM " + table_name + " WHERE UserName = '" + key + "'";
                    DataTable dt = Helper.ExecuteDataTable(Database, checkSql);

                    // If Count is 0 or less, the record does not exist
                    if (dt == null || dt.Rows.Count <= 0)
                    {
                        // Show "Not Found" message as per requirements
                        string errorMsg = "alert('Error: No record found with the username \"" + key + "\". Nothing was deleted.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "NotFound", errorMsg, true);
                    }
                    else
                    {
                        // 4. Record exists - proceed to delete
                        string deleteSql = "DELETE FROM " + table_name + " WHERE UserName = '" + key + "'";
                        Helper.DoQuery(Database, deleteSql);

                        // Show "Success" message as per requirements
                        string successMsg = "alert('Success! The record for \"" + key + "\" has been permanently deleted.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "DeleteSuccess", successMsg, true);
                    }
                }
                else
                {
                    // Basic fallback for empty input
                    string emptyMsg = "alert('Please enter a username to proceed.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "EmptyInput", emptyMsg, true);
                }
            }
        }
    }
}