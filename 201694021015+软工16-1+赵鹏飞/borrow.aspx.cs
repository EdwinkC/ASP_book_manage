using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _201694021015_软工16_1_赵鹏飞
{
    public partial class borrow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("login.aspx");
            }
            Session["address"] = "borrow";
            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)//数据行
            {
                string Str = e.Row.Cells[4].Text; //第4列内容
                if (Str.Length > 15) //第5列内容大于15个
                {
                    e.Row.Cells[4].Text = Str.Substring(0, 15) + "..."; //截取15个显示，其他用“...”号代替
                    e.Row.Cells[4].ToolTip = Str;//鼠标放上去显示全部信息
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string book_id = TextBox1.Text;
           
            string user = (string)Session["id"];
            string type = (string)Session["type"];

            if (type == "学生")
            {
                if (CountPersonBook(user) >= 10) return;//已经借阅了十本借阅失败
            }
            else
            {
                if (CountPersonBook(user) >= 20) return;
            }

            if (book_id != "")
            {
                //查询是否存在此书
                using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb")))
                {
                    conn.Open();
                    using (OleDbCommand cmd = new OleDbCommand())
                    {
                        string sql = "SELECT COUNT(*) FROM [book] WHERE Bno='" + book_id + "'";
                        cmd.CommandText = sql;
                        cmd.Connection = conn;
                        int c = (int)cmd.ExecuteScalar();
                        if (c == 1)
                        {
                            //存在该书
                        }
                        else
                        {
                            TextBox1.Text = "此条目不存在！";
                            return;
                        }
                    }
                }


                //借书事务
                using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb")))
                {
                    conn.Open();//打开连接
                    using (OleDbCommand cmd = new OleDbCommand())
                    {
                        DateTime dt = DateTime.Now;
                        string now = dt.ToShortDateString();

                        if (type == "学生")
                        {
                            dt = dt.AddDays(30);
                        }
                        else
                        {
                            dt = dt.AddDays(60);
                        }
                        string return_date = dt.ToShortDateString();
                        string sql = "UPDATE [book] SET [Bstate] = '0'WHERE [Bno] = '" + book_id + "'";
                        string sql1 = "INSERT INTO BR (Bno, Uno, BrrowDate, ReturnDate) VALUES('" + book_id + "', '" + user + "', #" + now + "#, #" + return_date + "#)";
                        string sql2 = "UPDATE [user] SET [Nborrow] = [Nborrow]+1 ,[Total] = [Total]+1 WHERE [Uno] = '" + user + "'";
                        OleDbTransaction trans = conn.BeginTransaction();
                        cmd.Connection = conn;
                        cmd.Transaction = trans;

                        try
                        {

                            cmd.CommandText = sql;
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = sql1;
                            cmd.ExecuteNonQuery();
                            cmd.CommandText = sql2;
                            cmd.ExecuteNonQuery();
                            trans.Commit();


                        }
                        catch (Exception ex)
                        {
                            trans.Rollback();
                            Response.Write(ex);
                        }

                    }

                }
                
            }
           
            Response.Redirect("handle.aspx");//f5
        }

        int CountPersonBook(string id)
        {
            int c = 0;
            using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb")))
            {
                conn.Open();//打开连接
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    string sql = "select count(*) from BR where Uno='"+ id +"'";
                    cmd.CommandText = sql;
                    cmd.Connection = conn;
                    c = (int)cmd.ExecuteScalar();
                }
            }
            return c;
        }
    }
}