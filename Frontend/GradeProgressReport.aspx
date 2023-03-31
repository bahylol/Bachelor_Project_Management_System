<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradeProgressReport.aspx.cs" Inherits="MileStone3.GradeProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /> </div>
        <asp:Label ID="Label1" runat="server" Text="Student ID"></asp:Label>
        <asp:TextBox ID="PRgradeSidIN" CssClass="inputT" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="date:"></asp:Label>
            <asp:TextBox ID="PRgradeDateIN" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label3" runat="server" Text="Progress Report Grade"></asp:Label>
        <asp:TextBox ID="PRgradeIN" CssClass="inputT" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Button1" CssClass="myButton" runat="server" Text="Post Progress Report Grade" OnClick="Button1_Click" />
        </p>
    </form>
</body>

    <script src="main.js"></script>
</html>
