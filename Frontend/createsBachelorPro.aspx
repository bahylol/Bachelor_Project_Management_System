<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createsBachelorPro.aspx.cs" Inherits="MileStone3.createsBachelorPro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /></div>
            &nbsp;

       
        <p>
            <asp:Label ID="project_name" runat="server" Text="Project name"></asp:Label>
            <asp:TextBox ID="project_nameIN" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Project_description" runat="server" Text="Project Description"></asp:Label>
            <asp:TextBox ID="Project_descriptionIN" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="project_code" runat="server" Text="project code"></asp:Label>
            <asp:TextBox ID="project_codeIN" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="major_code" runat="server" Text="Major Code"></asp:Label>
            <asp:TextBox ID="major_codeIN" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="Create_bachelor_project" CssClass="myButton" runat="server" Text="Create" OnClick="Create_bachelor_project_Click" />
    </form>
</body>

    <script src="main.js"></script>
</html>
