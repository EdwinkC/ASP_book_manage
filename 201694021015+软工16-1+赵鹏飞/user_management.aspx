<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="user_management.aspx.cs" Inherits="_201694021015_软工16_1_赵鹏飞.user_management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td>&nbsp;</td>
            <td width="100px">&nbsp;</td>
            <td><p>-*-用户管理-*-</p></td>
        </tr>
        
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="图书管理" OnClick="Button1_Click" />
            </td>
            <td width="100px">&nbsp;</td>
            <td>
               
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Uno" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Uno" HeaderText="用户ID" ReadOnly="True" SortExpression="Uno" />
                        <asp:BoundField DataField="Upwd" HeaderText="密码" SortExpression="Upwd" />
                        <asp:BoundField DataField="Uname" HeaderText="姓名" SortExpression="Uname" />
                        <asp:BoundField DataField="Utype" HeaderText="类型" SortExpression="Utype" />
                        <asp:BoundField DataField="Nborrow" HeaderText="正在借阅" SortExpression="Nborrow" />
                        <asp:BoundField DataField="Total" HeaderText="共借阅" SortExpression="Total" />
                        <asp:BoundField DataField="Pay" HeaderText="罚金" SortExpression="Pay" />
                        <asp:BoundField DataField="Credit" HeaderText="信誉度" SortExpression="Credit" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM [user] WHERE [Uno] = ?" 
                    InsertCommand="INSERT INTO [user] ([Uno], [Upwd], [Uname], [Utype], [Nborrow], [Total], [Pay], [Credit]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT * FROM [user]" 
                    UpdateCommand="UPDATE [user] SET [Upwd] = ?, [Uname] = ?, [Utype] = ?, [Nborrow] = ?, [Total] = ?, [Pay] = ?, [Credit] = ? WHERE [Uno] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="Uno" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Uno" Type="String" />
                        <asp:Parameter Name="Upwd" Type="String" />
                        <asp:Parameter Name="Uname" Type="String" />
                        <asp:Parameter Name="Utype" Type="String" />
                        <asp:Parameter Name="Nborrow" Type="Int16" />
                        <asp:Parameter Name="Total" Type="Int16" />
                        <asp:Parameter Name="Pay" Type="Single" />
                        <asp:Parameter Name="Credit" Type="Int16" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Upwd" Type="String" />
                        <asp:Parameter Name="Uname" Type="String" />
                        <asp:Parameter Name="Utype" Type="String" />
                        <asp:Parameter Name="Nborrow" Type="Int16" />
                        <asp:Parameter Name="Total" Type="Int16" />
                        <asp:Parameter Name="Pay" Type="Single" />
                        <asp:Parameter Name="Credit" Type="Int16" />
                        <asp:Parameter Name="Uno" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
               
            </td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td width="100px">&nbsp;</td>
            <td><hr /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td width="100px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
