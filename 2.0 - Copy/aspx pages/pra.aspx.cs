using DbDemo_MSSite;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eyal_Braun_Projects._2._0.aspx_pages
{

    public partial class pra : System.Web.UI.Page
    {
        protected string msg;
        public string sqlS = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "myDataDB.mdf";
            string tableName = "usersTable";
            sqlS = "SELECT * FROM " + tableName;
            DataTable table = Helper.ExecuteDataTable(fileName, sqlS);

            msg = "the len is : " + table ;
            




        }
    }
}