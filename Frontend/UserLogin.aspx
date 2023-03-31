<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="MileStone3.UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 516px;
        }
        .auto-style1 {
            height: 29px;
        }
        .auto-style2 {}
    </style>
</head>
<body style="height: 462px">
    <form id="UserLogin" runat="server">
        <div style="width: 1299px; height: 58px;">
            <h1 style="background-color: #999999; height: 61px;">&nbsp;
                <asp:Image ID="GIULogo" runat="server" Height="60px" src ="GIULOGO.jpeg" Width="259px" />
            <asp:Button ID="Register" CssClass="myButton" runat="server" BackColor="#999999" BorderColor="#999999" BorderStyle="None" Height="43px" OnClick="Register_Click" style="font-family: 'Times New Roman', Times, serif" Text="Register" Width="144px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" BackColor="Silver" Height="28px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="159px" CssClass="auto-style2">
                </asp:DropDownList>
            </h1>
        </div>
        <p style="color: #000000; font-family: 'Times New Roman', Times, serif; bottom: auto; left: auto; right: auto; top: auto; text-align: center; background-color: #FFFFFF; height: 25px;" title="Welcome!">
            Welcome!</p>
        <asp:Label ID="Username" runat="server" BackColor="White" Height="21px" Text="Email:" Width="93px"></asp:Label>
        <asp:TextBox ID="Username_Entry" CssClass="inputT" runat="server" BorderColor="#990000" BorderStyle="Outset" OnTextChanged="TextBox1_TextChanged" Height="17px" Width="164px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<p>
            <asp:Label ID="Password" runat="server" BackColor="White" Height="30px" Text="Password:" Width="93px"></asp:Label>
            <asp:TextBox ID="Password_Entry" CssClass="inputT" runat="server" BorderColor="#990000" BorderStyle="Outset" OnTextChanged="TextBox1_TextChanged" Width="163px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p class="auto-style1">
        <asp:Button ID="Login_Button" CssClass="myButton" runat="server" BackColor="#33CC33" BorderColor="#A80000" BorderStyle="Inset" ForeColor="Black" Height="31px" OnClick="Login" Text="Login" Width="84px" />
        <asp:Label ID="Register_Prompt" runat="server" Text="   New to the university?  Click Register above!"></asp:Label>
        </p>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>

    <script src="main.js"></script>
</html>
