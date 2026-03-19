using DbDemo_MSSite;
using System;
using System.Data;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class UsersTable : System.Web.UI.Page
    {
        public string CurrentTableHtml = "";
        public string SqlQuery = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTable();
        }

        private void LoadTable()
        {
            // Read values from the form
            string field = Request.Form["filterField"];
            string value = Request.Form["filterValue"];

            SqlQuery = "SELECT * FROM Users_Table";

            if (!string.IsNullOrEmpty(field) && !string.IsNullOrEmpty(value))
            {
                SqlQuery = "SELECT * FROM Users_Table WHERE " + field + " = '" + value + "'";
            }

            // Get the DataTable using your helper
            DataTable dt = Helper.ExecuteDataTable("Database1.mdf", SqlQuery);

            // Build HTML
            string html = "<table>";
            html += "<tr><th>Id</th><th>First_Name</th><th>Last_Name</th><th>Age</th><th>City</th><th>Gender</th><th>Birthday</th></tr>";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                html += "<tr>";
                html += "<td>" + dt.Rows[i]["Id"] + "</td>";
                html += "<td>" + dt.Rows[i]["First_Name"] + "</td>";
                html += "<td>" + dt.Rows[i]["Last_Name"] + "</td>";
                html += "<td>" + dt.Rows[i]["Age"] + "</td>";
                html += "<td>" + dt.Rows[i]["City"] + "</td>";
                html += "<td>" + dt.Rows[i]["Gender"] + "</td>";
                html += "<td>" + dt.Rows[i]["Birthday"] + "</td>";
                html += "</tr>";
            }

            html += "</table>";

            CurrentTableHtml = html;
        }
    }
}