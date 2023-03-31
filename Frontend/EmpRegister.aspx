<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpRegister.aspx.cs" Inherits="MileStone3.EmpRegister" %>

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
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /> <br />
        </div>
        <h2 class="auto-style2">Employee Register Portal</h2>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Compnay ID: "></asp:Label>
            <asp:TextBox ID="TextBox1" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Email: "></asp:Label>
            <asp:TextBox ID="TextBox2" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Name: "></asp:Label>
            <asp:TextBox ID="TextBox3" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Phone number: "></asp:Label>
            <asp:TextBox ID="TextBox4" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Field: "></asp:Label>
            <asp:TextBox ID="TextBox5" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" CssClass="myButton" runat="server" OnClick="Button1_Click" Text="Register Employee" />
        </p>
    </form>
</body>

    <script src="main.js"></script>
</html>
