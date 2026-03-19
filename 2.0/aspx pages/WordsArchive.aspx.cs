using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using DbDemo_MSSite;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class WordsArchive : System.Web.UI.Page
    {
        // Load the table from the database
        public DataTable table = Helper.ExecuteDataTable("Database1.mdf", "SELECT * FROM word_bank");

        // Method to return a random word from the table
        public string random_word()
        {
            if (table == null || table.Rows.Count == 0)
                return ""; // No words in table

            Random r = new Random();
            int randIndex = r.Next(0, table.Rows.Count); // 0 inclusive, Rows.Count exclusive

            return table.Rows[randIndex]["word"].ToString();
        }

        public string word = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["button"] != null)
            {

                word = random_word();
            }
        }
    }
}