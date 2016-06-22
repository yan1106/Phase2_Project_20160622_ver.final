<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EPTRA_Level_View.aspx.cs" Inherits="EPTRA_Level_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:BoundField DataField="EPTRA_KeyItem" HeaderText="KeyItem" />
                <asp:BoundField DataField="EPTRA_LV_Stage" HeaderText="Stage" />
                <asp:BoundField DataField="EPTRA_LV_SpecChar" HeaderText="Special Characteristics" />                                              
                <asp:BoundField DataField="EPTRA_LV" HeaderText="EPTRA_LV" />
                                                
            </Columns>
           
          
           

            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="60px" Width="600px" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </form>
</body>
</html>
