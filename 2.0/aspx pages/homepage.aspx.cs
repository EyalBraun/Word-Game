using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{
    public partial class project_1_homepage : System.Web.UI.Page
    {
        public bool isAdminHeader = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            isAdminHeader = (bool)Session["isAdmin"];
            

        }
    }
}