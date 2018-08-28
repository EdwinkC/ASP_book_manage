using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace _201694021015_软工16_1_赵鹏飞
{
    public partial class _return : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {

                Response.Redirect("login.aspx");
            }
            Session["address"] = "return";
    
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string book_id = TextBox1.Text;
            string user_id = (string)Session["id"];
            
            using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb")))
            {
                conn.Open();
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    OleDbTransaction trans = conn.BeginTransaction();
                    cmd.Connection = conn;
                    cmd.Transaction = trans;
                    string sql = "delete from [BR] where [Bno] = '"+book_id+"' and [Uno] = '"+user_id+"'";
                    string sql1 = "UPDATE [book] SET [Bstate] = '1'WHERE [Bno] = '" + book_id + "'";
                    string sql2 = "update [user] set [Nborrow] = [Nborrow]-1 where [Uno] = '"+user_id+"'";
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
                    finally
                    {
                        PayAndCreditHandle(user_id, book_id);
                        Response.Redirect("handle.aspx");
                    }
                }
            }
        }

        //罚金处理
        void PayAndCreditHandle(string user_id, string book_id)
        {
            float pay = 0;
            DateTime today = DateTime.Now.Date;
            using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb")))
            {
                conn.Open();
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    string sql = "SELECT [ReturnDate] FROM [BR] WHERE Uno='" + user_id + "'";
                    cmd.CommandText = sql;
                    cmd.Connection = conn;
                    OleDbDataReader reader = cmd.ExecuteReader();
                    while (true)
                    {
                        if (reader.Read())
                        {
                            DateTime temp_date = ((DateTime)reader["ReturnDate"]).Date;
                            if (!(today.Equals(temp_date)))
                            {
                                float temp_pay = (int)((today - temp_date).TotalDays) * 0.1f;
                                if (temp_pay >= 0) pay += temp_pay;
                            }

                        }
                        else
                        {
                            break;
                        }
                    }
                }
            }
            using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb")))
            {
                conn.Open();
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    string sql = "UPDATE [user] SET [Pay] = " + pay + " WHERE Uno='" + user_id + "'";
                    cmd.CommandText = sql;
                    cmd.Connection = conn;
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception e)
                    {
                        Response.Write(e);
                    }
                }
            }

        }
       
    }
}