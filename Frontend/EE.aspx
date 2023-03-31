<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EE.aspx.cs" Inherits="MileStone3.EE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="EE" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /> &nbsp;<asp:Button ID="thesis" CssClass="myButton" runat="server" Text="Thesis" OnClick="thesis_Click" />
&nbsp;<asp:Button ID="defense" CssClass="myButton" runat="server" Text="Defense" OnClick="defense_Click" />
        </div>
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
