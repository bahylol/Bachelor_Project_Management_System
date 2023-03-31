<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewNotRecommended.aspx.cs" Inherits="MileStone3.ViewNotRecommended" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="notrec" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="notRecEE">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="notRecEE" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT id FROM External_Examiner EXCEPT SELECT examiner_id FROM Recommends"></asp:SqlDataSource>
    </form>
</body>

    <script src="main.js"></script>
</html>
