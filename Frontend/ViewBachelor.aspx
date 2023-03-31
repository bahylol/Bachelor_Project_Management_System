<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBachelor.aspx.cs" Inherits="MileStone3.ViewBachelor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title>Bachelor Projects</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />
            <asp:Button ID="Button1" CssClass="myButton" runat="server" Text="View Your Projects" OnClick="ViewYourProjects" />
            <asp:Button ID="Button2" CssClass="myButton" runat="server" Text="View Industrial Projects" OnClick="ViewIndustrial" />
            <asp:Button ID="Button3" CssClass="myButton" runat="server" Text="View Academic Projects" OnClick="ViewAcademic" />
            <asp:Button ID="Button4" CssClass="myButton" runat="server" Text="View All Projects" OnClick="ViewAll" />
            <asp:Button ID="Button15" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Logout" Text="Logout" />


        </div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </form>
</body>
    <script src="main.js"></script>
</html>
