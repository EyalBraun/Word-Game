using System;
using System.Web;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        // הגדרת משתנים שיהיו נגישים לדף ה-ASPX
        protected string displayUsername;
        protected string displayCity;
        protected bool isAdminHeader;

        protected void Page_Load(object sender, EventArgs e)
        {
            // בדיקה אם יש נתונים ב-Session, אם לא - נשים ערכי ברירת מחדל
            if (Session["username"] != null)
            {
                displayUsername = Session["username"].ToString();
                displayCity = Session["city"] != null ? Session["city"].ToString() : "Unknown";

                // בדיקת מנהל - המרה בטוחה לבולאני
                isAdminHeader = (bool)Session["isAdmin"];
            }
            else
            {
                // ערכים לאורח (Guest)
                displayUsername = "Guest";
                displayCity = "None";
                isAdminHeader = false;
            }
        }
    }
}