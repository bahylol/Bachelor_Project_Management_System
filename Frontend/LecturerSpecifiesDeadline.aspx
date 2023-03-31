<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerSpecifiesDeadline.aspx.cs" Inherits="MileStone3.LecturerSpecifiesDeadline" %>

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
        <p>
            <asp:Label ID="Label1" runat="server" Text="Enter Deadline
                "></asp:Label>
        </p>
        <asp:TextBox ID="NewDeadline" CssClass="inputT" runat="server"></asp:TextBox>
        <asp:Button ID="PostDeadlne" CssClass="myButton" runat="server" Text="Post" OnClick="PostDeadlne_Click" />
    </form>
</body>

    <script src="main.js"></script>
</html>
