using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace _201694021015_软工16_1_赵鹏飞
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["id"] != null)
            {
                TextBox1.Text = (string)Session["id"];//注册完自动填写id
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = TextBox1.Text;
            string pwd = password.Text;
            string type = DropDownList1.SelectedItem.Value;
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb"));
            conn.Open();                             //打开数据库
            OleDbCommand cmd = new OleDbCommand();
            string sql = "select count(*) from [user] where Uno = '" + id + "' and Upwd = '" + pwd +"' and Utype= '" + type + "'";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            int count = (int)cmd.ExecuteScalar();
            if (count == 1)
            {
                sql = "SELECT Uno, Uname, Utype, Nborrow, Total, Pay, Credit FROM [user] WHERE Uno='"+id+"'";
                cmd.CommandText = sql;
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

                Label1.Text = "登录成功！";
                Session["id"] = id;
                Session["type"] = type;
                //Response.Write(Session["name"]);
           
                if ((string)Session["type"] == "管理员")
                {
    
                    Response.Redirect("control.aspx");
                }
                else
                {

                    Response.Redirect("index.aspx");
                }
               
            }
            else
            {
                
                Label1.Text = "登录失败！请重新登录";
            }
            cmd.Clone();
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Response.Redirect("registered.aspx");
        }
    }
}