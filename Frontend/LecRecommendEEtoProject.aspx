<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecRecommendEEtoProject.aspx.cs" Inherits="MileStone3.LecRecomendEEtoProject" %>

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

        <asp:Label ID="Label1" runat="server" Text="Recomend external examine to local project"></asp:Label>

        <p>
            <asp:Label ID="Label3" runat="server" Text="Project code:"></asp:Label>
            <asp:TextBox ID="ProjectCodeRecommendIN" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="External examiner ID:"></asp:Label>
            <asp:TextBox ID="EEidRecommendIN" CssClass="inputT" runat="server"></asp:TextBox>
        </p>

        <asp:Button ID="Button1" CssClass="myButton" runat="server" Text="Recommend External Examiner" OnClick="Button1_Click" />

    </form>
</body>

    <script src="main.js"></script>
</html>
