<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradeThesis.aspx.cs" Inherits="MileStone3.GradeThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="gradethesis" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />  </div>
        <br />
&nbsp;<asp:Label ID="sid" runat="server" Text="Student Id"></asp:Label>
&nbsp;<asp:DropDownList ID="sids" runat="server" DataSourceID="Students" DataTextField="S_ID" DataValueField="S_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Students" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT [S_ID] FROM [Student]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="S" runat="server"></asp:SqlDataSource>
        <br />
        <asp:Label ID="thesis_title" runat="server" Text="Thesis Title"></asp:Label>
        <asp:TextBox ID="title" CssClass="inputT" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="thesis_grade" runat="server" Text="Grade"></asp:Label>
            <asp:TextBox ID="grade" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="submit" CssClass="myButton" runat="server" Text="Submit" OnClick="submit_Click" />
    </form>
</body>

    <script src="main.js"></script>
</html>
