<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecCreateMeeting.aspx.cs" Inherits="MileStone3.CreateMeeting" %>

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
        <asp:Label ID="Label1" runat="server" Text="Book meeting"></asp:Label>
        <p>
            <asp:Label ID="Label3" runat="server" Text="meeting from:"></asp:Label>
            <asp:TextBox ID="startTimeIN" CssClass="inputT" runat="server" TextMode="Time"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="till:"></asp:Label>
            <asp:TextBox ID="endTimeIN" CssClass="inputT" runat="server" TextMode="Time"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="on"></asp:Label>
            <asp:TextBox ID="dateIN" CssClass="inputT" runat="server" TextMode="Date"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="at"></asp:Label>
            <asp:TextBox ID="meetingPointIN" CssClass="inputT" runat="server" style="margin-bottom: 3px" Height="25px" Width="168px"></asp:TextBox>
        </p>
        
        <asp:Button ID="BookMeeting" CssClass="myButton" runat="server" Text="Book" OnClick="BookMeeting_Click" />
        
    </form>
</body>

    <script src="main.js"></script>
</html>
