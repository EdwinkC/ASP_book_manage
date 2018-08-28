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
    public partial class control : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["type"] != "管理员")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Insert_Click(object sender, EventArgs e)
        {
            string id = Bid.Text;
            string name = Bname.Text;
            string autor = Bautor.Text;
            string type = DropDownList1.SelectedValue;
            string content = Bcontent.Text;
            if (id != "" && name != "" && autor != "" && type != "" && content != "")
            {
                using (OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("App_Data/db.mdb")))
                {
                    conn.Open();
                    using (OleDbCommand cmd = new OleDbCommand())
                    {
                        string sql = "INSERT INTO [book] (Bno, Bname, Bautor, Btype, Bcontent, Bstate) VALUES('" + id +
                            "', '" + name + "', '" + autor + "', '" + type + "', '" + content + "','1')";
                        cmd.CommandText = sql;
                        cmd.Connection = conn;
                        bool dd = true;//标识
                        try
                        {
                            cmd.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            dd = false;
                            Response.Write(ex);
                        }
                        if (dd)
                        {
                            //成功
                            Response.Redirect("control.aspx");//f5

                        }
                        else
                        {
                            //pass
                        }
                    }
                }
            }
            else
            {
                //有空数据
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)//数据行
            {
                string Str = e.Row.Cells[5].Text; //第5列内容
                if (Str.Length > 15) //第5列内容大于15个
                {
                    e.Row.Cells[5].Text = Str.Substring(0, 15) + "..."; //截取15个显示，其他用“...”号代替
                    e.Row.Cells[5].ToolTip = Str;//鼠标放上去显示全部信息
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_management.aspx");
        }
    }
}