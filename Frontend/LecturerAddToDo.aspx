<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerAddToDo.aspx.cs" Inherits="MileStone3.LecturerAddToDo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />  </div> <asp:Label ID="Label1" runat="server" Text="ADD TO LIST"></asp:Label>
        
        <asp:TextBox ID="taskAddToDo" CssClass="inputT" runat="server" Height="73px" Width="467px" TextMode="MultiLine"></asp:TextBox>
        &nbsp;<asp:Label ID="Label2" runat="server" Text="Meeting Id"></asp:Label>
        <asp:TextBox ID="Mid" CssClass="inputT" runat="server" Height="30px" Width="466px" TextMode="SingleLine"></asp:TextBox>
        <asp:Button ID="Button1" CssClass="myButton" runat="server" Text="Add to your to-do list" OnClick="Button1_Click" />
        
    </form>
</body>

    <script src="main.js"></script>
</html>
