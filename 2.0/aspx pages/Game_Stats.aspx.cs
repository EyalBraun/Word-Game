using DbDemo_MSSite;
using System;
using System.Data;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class Game_Stats : System.Web.UI.Page
    {
        public string CurrentTableHtml = "";
        public string SqlQuery = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTable();
        }

        private void LoadTable()
        {
            string field = Request.Form["filterField"];
            string value = Request.Form["filterValue"];

            SqlQuery = "SELECT * FROM game_summary";

            if (!string.IsNullOrEmpty(field) && !string.IsNullOrEmpty(value))
            {
                SqlQuery = "SELECT * FROM game_summary WHERE " + field + " = '" + value + "'";
            }

            DataTable dt = Helper.ExecuteDataTable("Database1.mdf", SqlQuery);

            string html = "<table class='styled-table'>";
            html += "<tr><th>game_id</th><th>user_id</th><th>word</th><th>attempts</th><th>won</th><th>play_date</th></tr>";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                html += "<tr>";
                html += "<td>" + dt.Rows[i]["game_id"] + "</td>";
                html += "<td>" + dt.Rows[i]["user_id"] + "</td>";
                html += "<td>" + dt.Rows[i]["word"] + "</td>";
                html += "<td>" + dt.Rows[i]["attempts"] + "</td>";
                html += "<td>" + dt.Rows[i]["won"] + "</td>";
                html += "<td>" + dt.Rows[i]["play_date"] + "</td>";
                html += "</tr>";
            }

            html += "</table>";

            CurrentTableHtml = html;
        }
    }
}