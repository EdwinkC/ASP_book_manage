<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="return.aspx.cs" Inherits="_201694021015_软工16_1_赵鹏飞._return" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td>&nbsp;</td>
            <td><p align ="center">-*-已借图书-*-</p></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Bno,Uno" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Bno" HeaderText="图书ID" ReadOnly="True" SortExpression="Bno" />
                        <asp:BoundField DataField="Uno" HeaderText="用户ID" ReadOnly="True" SortExpression="Uno" />
                        <asp:BoundField DataField="BrrowDate" HeaderText="借书日期" SortExpression="BrrowDate" />
                        <asp:BoundField DataField="ReturnDate" HeaderText="限还日期" SortExpression="ReturnDate" />
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
                    DeleteCommand="DELETE FROM [BR] WHERE [Bno] = ? " 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT * FROM [BR] WHERE [Uno] = @id" 
                    UpdateCommand="UPDATE [BR] SET [BrrowDate] = ?, [ReturnDate] = ? WHERE (([Bno] = ?) OR ([Bno] IS NULL AND ? IS NULL)) AND (([Uno] = ?) OR ([Uno] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [BR] ([Bno], [Uno], [BrrowDate], [ReturnDate]) VALUES (?, ?, ?, ?)" >
                    <DeleteParameters>
                        <asp:Parameter Name="Bno" Type="String" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="id" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Bno" Type="String" />
                        <asp:Parameter Name="Uno" Type="String" />
                        <asp:Parameter Name="BrrowDate" Type="DateTime" />
                        <asp:Parameter Name="ReturnDate" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BrrowDate" Type="DateTime" />
                        <asp:Parameter Name="ReturnDate" Type="DateTime" />
                        <asp:Parameter Name="Bno" Type="String" />
                        <asp:Parameter Name="Uno" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                输入要归还的图书ID:
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="归还" />
            </td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td><hr /></td>
        </tr>
   
    </table>
</asp:Content>
