<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create progress report.aspx.cs" Inherits="MileStone3.Create_progress_report" %>

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
        <asp:Label ID="Label1" runat="server" Text="Student ID:"></asp:Label>
        <asp:TextBox ID="ProgressReportIdIN" CssClass="inputT" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Date of submission:"></asp:Label>
            <asp:TextBox ID="PRDateIN" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label3" runat="server" Text="Progress report content:"></asp:Label>
        <p>
            <asp:TextBox ID="PRcontentIN" CssClass="inputT" runat="server" Height="75px" Width="445px"></asp:TextBox>
        </p>
        <asp:Button ID="Button1" CssClass="myButton" runat="server" Text="Create progress report" OnClick="Button1_Click" />
    </form>
</body>

    <script src="main.js"></script>
</html>
