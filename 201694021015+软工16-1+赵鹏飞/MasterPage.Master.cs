using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _201694021015_软工16_1_赵鹏飞
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                currentUser.Text = "--未登录--";
                logOut.Visible = false;//不可视
            }
            else
            {
                currentUser.Text = "-*-当前用户：&nbsp;&nbsp;姓名：" + (string)Session["name"] + "&nbsp;&nbsp;类型：" + (string)Session["type"]+
                    "&nbsp;&nbsp;正在借阅：" + (string)Session["borrow"] + "&nbsp;总借阅：" + (string)Session["total"] +
                    "&nbsp;&nbsp;罚金：" + (string)Session["pay"] + "&nbsp;&nbsp;信誉值：(100)" + (string)Session["credit"] + "-*-&nbsp;&nbsp;";
                logOut.Visible = true;
            }
        }

        protected void logOut_Click(object sender, EventArgs e)
        {
            if(Session["id"]!=null)
            {
                Session.Abandon();//注销并重定向至login.aspx
                Response.Redirect("login.aspx");

            }
        }
    }
}