using DbDemo_MSSite;
using System;
using System.Data;
using System.Web.UI;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class quiz : System.Web.UI.Page
    {
        string Database = "Database1.mdf";

        protected void Page_Load(object sender, EventArgs e)
        {
            int score = 0;

            // Variables to hold the "Correct" or "Wrong" message for the current user
            string msgQ1 = "";
            string msgQ2 = "";
            string msgQ3 = "";

            // Only process answers if the form was actually submitted
            if (IsPostBack)
            {
                // Grab values directly from the HTTP POST payload
                string q1 = Request.Form["q1"];
                string q2 = Request.Form["q2"];
                string q3 = Request.Form["q3"];

                // --- Process Q1 ---
                if (!string.IsNullOrEmpty(q1))
                {
                    int isCorrect = (q1 == "B") ? 1 : 0; // B = 5 Letters
                    score += isCorrect;
                    msgQ1 = (isCorrect == 1) ? "✅ Correct! " : "❌ Wrong! "; // Set user feedback

                    string updateQ1 = "UPDATE QuizStats SET TotalAnswers = TotalAnswers + 1, CorrectAnswers = CorrectAnswers + " + isCorrect + " WHERE QuestionID = 1";
                    Helper.DoQuery(Database, updateQ1);
                }

                // --- Process Q2 ---
                if (!string.IsNullOrEmpty(q2))
                {
                    int isCorrect = (q2 == "D") ? 1 : 0; // D = Correct letter, correct spot
                    score += isCorrect;
                    msgQ2 = (isCorrect == 1) ? "✅ Correct! " : "❌ Wrong! "; // Set user feedback

                    string updateQ2 = "UPDATE QuizStats SET TotalAnswers = TotalAnswers + 1, CorrectAnswers = CorrectAnswers + " + isCorrect + " WHERE QuestionID = 2";
                    Helper.DoQuery(Database, updateQ2);
                }

                // --- Process Q3 ---
                if (!string.IsNullOrEmpty(q3))
                {
                    int isCorrect = (q3.ToLower().Trim() == "yellow") ? 1 : 0;
                    score += isCorrect;
                    msgQ3 = (isCorrect == 1) ? "✅ Correct! " : "❌ Wrong! "; // Set user feedback

                    string updateQ3 = "UPDATE QuizStats SET TotalAnswers = TotalAnswers + 1, CorrectAnswers = CorrectAnswers + " + isCorrect + " WHERE QuestionID = 3";
                    Helper.DoQuery(Database, updateQ3);
                }

                // Show final score at the bottom
                lblFinalScore.InnerText = "Your Score: " + score + " / 3";
                lblFinalScore.Style.Add("color", (score == 3) ? "mediumseagreen" : "darkorange");
            }

            // 3. Always update the statistics spans on every page load, passing in the user's results
            UpdateStatisticsLabels(msgQ1, msgQ2, msgQ3);
        }

        // Modified to accept the user's specific result messages
        private void UpdateStatisticsLabels(string m1, string m2, string m3)
        {
            string getStatsQuery = "SELECT * FROM QuizStats ORDER BY QuestionID ASC";
            DataTable dt = Helper.ExecuteDataTable(Database, getStatsQuery);

            if (dt != null && dt.Rows.Count >= 3)
            {
                // Combine the user's Correct/Wrong message with the Database overall statistics
                statsQ1.InnerText = m1 + "(Overall Stats -> Attempted: " + dt.Rows[0]["TotalAnswers"] + " | Correct: " + dt.Rows[0]["CorrectAnswers"] + ")";
                statsQ2.InnerText = m2 + "(Overall Stats -> Attempted: " + dt.Rows[1]["TotalAnswers"] + " | Correct: " + dt.Rows[1]["CorrectAnswers"] + ")";
                statsQ3.InnerText = m3 + "(Overall Stats -> Attempted: " + dt.Rows[2]["TotalAnswers"] + " | Correct: " + dt.Rows[2]["CorrectAnswers"] + ")";
            }
        }
    }
}