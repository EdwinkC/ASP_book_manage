<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_201694021015_软工16_1_赵鹏飞.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table border="0" align="center" >
         <tr><td></td>
             <td><asp:Label ID="Label1" runat="server" Text="请登录"></asp:Label></td>
         
         </tr>
         <tr><td> 账号：</td> <td><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox></td></tr>
    
         <tr><td> 密码：</td><td> <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox></td></tr>
     
         <tr><td> 用户类型：</td><td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Utype" DataValueField="Utype">
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [Utype] FROM [user]"></asp:SqlDataSource>
            </td>
         </tr>
         <tr>
            <td></td> <td></td>
         </tr>
         <tr><td></td>
             <td>
                   <asp:Button ID="Button1" runat="server" Text="登  录" OnClick="Button1_Click" />
             </td>
         </tr> 
         <tr>
             <td></td>
             <td>
                 <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="前往注册" />
             </td>
         </tr>
         <tr>
            <td></td> <td>&nbsp;</td>
         </tr>
     </table>
 
</asp:Content>
