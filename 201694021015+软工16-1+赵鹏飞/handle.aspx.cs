using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace _201694021015_软工16_1_赵鹏飞
{
    public partial class handleRe : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)

        {
            //刷新用户状态栏
            if (Session["id"] != null)
            {
                using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb")))
                {
                    conn.Open();
                    using (OleDbCommand cmd = new OleDbCommand())
                    {
                        cmd.CommandText = "SELECT Uno, Uname, Utype, Nborrow, Total, Pay, Credit FROM [user] WHERE Uno='" + Session["id"] + "'";
                        cmd.Connection = conn;
                        OleDbDataReader reader = cmd.ExecuteReader();
                        //登录获取用户信息并存Session
                        if (reader.Read())
                        {
                            Session["name"] = reader["Uname"].ToString();
                            Session["borrow"] = reader["Nborrow"].ToString();
                            Session["total"] = reader["Total"].ToString();
                            Session["pay"] = reader["Pay"].ToString();
                            Session["credit"] = reader["Credit"].ToString();
                        }
                    }
                }
                    
            }

            if ((string)Session["address"] == "borrow")
            {
                Response.Redirect("borrow.aspx");
            }
            else if((string)Session["address"] == "return")
            {

                Response.Redirect("return.aspx");
            }
        }


    }
}