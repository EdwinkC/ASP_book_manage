<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="registered.aspx.cs" Inherits="_201694021015_软工16_1_赵鹏飞.registered" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center"> 注册</p>
     <table border="0" align="center" >
         <tr>
             <td> 姓&nbsp;名：&nbsp;</td>
             <td><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox></td> 
             <td><asp:RequiredFieldValidator id="require1" ControlToValidate="TextBox1" ErrorMessage="必须输入用户名"  runat="server"/>
             </td>
         </tr>
         <tr>
             <td>账户名：&nbsp;</td>
             <td><asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox></td>
             <td><asp:RequiredFieldValidator id="require2" ControlToValidate="TextBox2" ErrorMessage="必须输入账户名" runat="server" /></td>
         </tr>
         <tr>
             <td>密&nbsp;码：&nbsp;</td>
             <td> <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox></td>
             <td> 
                    <asp:RequiredFieldValidator id="require3" ControlToValidate="Password" ErrorMessage="必须输入密码"  runat="server"/>
	                </td>
         </tr>
         <tr>
             <td>确认密码：</td>
             <td>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
             </td>
             <td>
	                <asp:CompareValidator id="Compare1" ControlToValidate="TextBox3" ControlToCompare="Password" ErrorMessage="两次输入必须一致" runat="server" />
            </td>
        </tr>
         <tr><td> 用户类型：</td><td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Utype" DataValueField="Utype">
                       
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [Utype] FROM [user]"></asp:SqlDataSource>
            </td>
         </tr>
          <tr><td>&nbsp;</td><td>&nbsp;<asp:Label ID="Lable1" runat="server" Text=""></asp:Label></td><td>&nbsp;</td></tr> 
         <tr><td></td>
              <td>
                    <asp:Button ID="Button1" runat="server" Text="注册" OnClick="Button1_Click" />
              </td>
              <td>
                    <asp:Button ID="Button2" runat="server" Text="重置" OnClick="Button2_Click" />
              </td>
         </tr> 
         <tr>
             <td> &nbsp;</td>
             <td> &nbsp;</td>
             <td> &nbsp;</td>
         </tr>
     </table>

</asp:Content>
