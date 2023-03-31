<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpView.aspx.cs" Inherits="MileStone3.EmpView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
    <style type="text/css">
        .auto-style1 {}
        .auto-style3 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />
        </div>
        <h2 class="auto-style3">Employee View</h2>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" CssClass="myButton" runat="server" OnClick="Button1_Click" Text="Grade Thesis" />
&nbsp;Grade Thesis of a certain student</p>
        <p>
            <asp:Button ID="Button2" CssClass="myButton" runat="server" OnClick="Button2_Click" Text="Grade Defense" />
&nbsp;Grade Defense of a certain student</p>
        <p>
            <asp:Button ID="Button3" CssClass="myButton" runat="server" OnClick="Button3_Click" Text="Create Progress Report" />
&nbsp;Create Progress Report</p>
        <p>
            &nbsp;</p>
        <div class="dropdown">
                    <button class="dropbtn" style="margin-top: 0.3rem; margin-right:0.5rem;">More</button>
                        <div class="dropdown-content">
                            <asp:Button ID="Button13" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Home" Text="View Profile" />
                            <asp:Button ID="Button14" CssClass="myButton" style="text-align:left;" runat="server" OnClick="ViewBachelor" Text="View Bachelor Projects" />
                            <asp:Button ID="Button15" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Logout" Text="Logout" />
                        </div>
                </div>
    </form>
</body>

    <script src="main.js"></script>
</html>
