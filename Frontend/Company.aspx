<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="MileStone3.Company" %>

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
    <form id="company" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /><br />
        </div>
        <h2 class="auto-style2">Company View</h2>
        <p>
            <asp:Button ID="Button1" CssClass="myButton" runat="server" OnClick="Button1_Click" Text="Add Employees" />
&nbsp;Click to add employees</p>
        <p>
            <asp:Button ID="Button2" CssClass="myButton" runat="server" OnClick="Button2_Click" Text="Create Projects" />
&nbsp;Click to create projects on the system</p>
        <p>
            <asp:Button ID="Button3" CssClass="myButton" runat="server" OnClick="Button3_Click" Text="Assign Employee" />
&nbsp;Click to assign employees to supervise local industrial projects that belong to you</p>
        <p>
            <asp:Button ID="Button4" CssClass="myButton" runat="server" OnClick="Button4_Click" Text="Grade Thesis" />
&nbsp;Click to grade thesis of a certain student</p>
        <p>
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Grade Defense" />
&nbsp;Click to grade defense of a certain student</p>
        <p>
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Grade Progress Report" />
&nbsp;Click to grade progress report of a certain student</p>
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
