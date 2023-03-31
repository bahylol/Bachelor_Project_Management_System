<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reccomendations.aspx.cs" Inherits="MileStone3.Reccomendations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="Reccomendations" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /></div>
        <asp:Label ID="Label1" runat="server" Text="Lecturer Id"></asp:Label>
        <asp:DropDownList ID="ChooseRecLec" runat="server" DataSourceID="RecLecturerIds" DataTextField="doc_id" DataValueField="doc_id" Height="66px" OnSelectedIndexChanged="ChooseRecLec_SelectedIndexChanged" Width="184px">
                <asp:ListItem>-Select-</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="RecLecturerIds" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT DISTINCT [doc_id] FROM [Recommends]"></asp:SqlDataSource>
            
            <asp:Button ID="Go" CssClass="myButton" runat="server" Text="Go" OnClick="Go_Click" />
            
        <asp:GridView ID="RecList" runat="server" AutoGenerateColumns="False" Height="166px" Width="1277px">
            <Columns>
                <asp:BoundField DataField="doc_id" HeaderText="Lecturer Id" ReadOnly="True" />
                <asp:BoundField DataField="AProject_id" HeaderText="Project Id" />
                <asp:BoundField DataField="examiner_id" HeaderText="External Examiner Id"  />

            </Columns>
        </asp:GridView>
    </form>
</body>

    <script src="main.js"></script>
</html>
