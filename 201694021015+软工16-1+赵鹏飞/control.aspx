<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="control.aspx.cs" Inherits="_201694021015_软工16_1_赵鹏飞.control" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="转到用户管理" OnClick="Button2_Click" />
            </td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                             
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Bno" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" DeleteText="出库" />
                        <asp:BoundField DataField="Bno" HeaderText="图书ID" ReadOnly="True" SortExpression="Bno" />
                        <asp:BoundField DataField="Bname" HeaderText="书名" SortExpression="Bname" />
                        <asp:BoundField DataField="Bautor" HeaderText="作者" SortExpression="Bautor" />
                        <asp:BoundField DataField="Btype" HeaderText="类型" SortExpression="Btype" />
                        <asp:BoundField DataField="Bcontent" HeaderText="描述" SortExpression="Bcontent" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM [book] WHERE [Bno] = ? " 
                    InsertCommand="INSERT INTO [book] ([Bno], [Bname], [Bautor], [Btype], [Bcontent]) VALUES (?, ?, ?, ?, ?)" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                    SelectCommand="SELECT [Bno], [Bname], [Bautor], [Btype], [Bcontent] FROM [book]" 
                    UpdateCommand="UPDATE [book] SET [Bname] = ?, [Bautor] = ?, [Btype] = ?, [Bcontent] = ? WHERE [Bno] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="Bno" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Bno" Type="String" />
                        <asp:Parameter Name="Bname" Type="String" />
                        <asp:Parameter Name="Bautor" Type="String" />
                        <asp:Parameter Name="Btype" Type="String" />
                        <asp:Parameter Name="Bcontent" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Bname" Type="String" />
                        <asp:Parameter Name="Bautor" Type="String" />
                        <asp:Parameter Name="Btype" Type="String" />
                        <asp:Parameter Name="Bcontent" Type="String" />
                        <asp:Parameter Name="Bno" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                                
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td><hr /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><p>新书入库</p></td>
        </tr>
        <tr>          
            <td>&nbsp;</td>
            <td>ID：<asp:TextBox ID="Bid" runat="server"></asp:TextBox>&nbsp;&nbsp;
                书名：<asp:TextBox ID="Bname" runat="server"></asp:TextBox>&nbsp;&nbsp;
                
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>作者：<asp:TextBox ID="Bautor" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                类型：
             
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Btype" DataValueField="Btype">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [Btype] FROM [book]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>描述：
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="Bcontent" runat="server" TextMode="MultiLine" Height="60px" Width="310px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="入库" OnClick="Insert_Click"  />
            </td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
