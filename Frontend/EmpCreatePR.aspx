<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpCreatePR.aspx.cs" Inherits="MileStone3.EmpGradePR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
    <style type="text/css">
        .auto-style1 {}
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /><br />
        </div>
        <h2 class="auto-style2">Employee Create Progress Report</h2>
        <p>
            &nbsp;</p>
        <p>
            Employee ID:
            <asp:TextBox ID="TextBox1" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            Student ID:
            <asp:TextBox ID="TextBox2" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            Date:
            <asp:TextBox ID="TextBox3" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            Content:
            <asp:TextBox ID="TextBox4" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" CssClass="myButton" runat="server" OnClick="Button1_Click" Text="Create Progress Report" />
        </p>
    </form>
</body>

    <script src="main.js"></script>
</html>
