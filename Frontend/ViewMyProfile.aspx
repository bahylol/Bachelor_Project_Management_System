<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewMyProfile.aspx.cs" Inherits="MileStone3.ViewMyProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title>Meetings Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />     
             <asp:Button ID="Button13" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Home" Text="Home" />
             <asp:Button ID="Button14" CssClass="myButton" style="text-align:left;" runat="server" OnClick="ViewBachelor" Text="View Bachelor Projects" />
             <asp:Button ID="Button15" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Logout" Text="Logout" />

       
            </div>
        <br/>
 <asp:GridView ID="GridView1" CssClass="centerGrid" runat="server">
        </asp:GridView>
        </form>
</body>
    <script src="main.js"></script>
</html>
