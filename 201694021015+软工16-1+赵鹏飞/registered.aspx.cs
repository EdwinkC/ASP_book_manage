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
    public partial class registered : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                Session.Abandon();
                Response.Redirect("registered.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            string id = TextBox2.Text;
            string pwd = Password.Text;
            string type = DropDownList1.SelectedItem.Value;
            if (id == "" || name == "" || pwd == "" || (pwd != TextBox3.Text))
            {
                return;
            }
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb"));
            conn.Open();                             //打开数据库
            OleDbCommand cmd = new OleDbCommand();
            string sql = "select count(*) from [user] where Uno = '" + id + "'";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            int count = (int)cmd.ExecuteScalar();
            if (count == 0)
            {
                //可插入新用户
                sql = "insert into [user](Uno, Upwd, Uname, Utype, Nborrow, Total, Pay, Credit) values('" + id+"','"+pwd+"','"+name+"','"+type+"',0,0,0,100)";
                cmd.CommandText = sql;
                cmd.Connection = conn;
                bool dd = true;//标识
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch(Exception ex)
                {
                    dd = false;
                    Response.Write(ex);
                }
                finally
                {
                    cmd.Dispose();
                    conn.Close();
                    conn.Dispose();
                }
                if (dd)
                {
                    //成功
                    Session["id"] = id;//会注册完自动登录
                    Response.Redirect("login.aspx");

                }
                else
                { 
                    //pass
                }

            }
            else
            {
                Lable1.Text = "用户已存在，请重新注册！";
            } 
            cmd.Clone();
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            Password.Text = "";
        }
    }
}