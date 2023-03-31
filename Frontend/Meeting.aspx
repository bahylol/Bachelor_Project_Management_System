<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meeting.aspx.cs" Inherits="MileStone3.Meeting" %>

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
            <asp:Button ID="Button1" CssClass="myButton" runat="server" OnClick="ViewAvailableMeetings" Text="View Available Meetings" />
            <asp:Button ID="Button2" CssClass="myButton" runat="server" OnClick="MeetingsForm" Text="View Booked Meetings" />        
             <asp:Button ID="Button13" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Home" Text="View Profile" />
             <asp:Button ID="Button14" CssClass="myButton" style="text-align:left;" runat="server" OnClick="ViewBachelor" Text="View Bachelor Projects" />
             <asp:Button ID="Button15" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Logout" Text="Logout" />
       
            </div>
        <br/>
 <asp:GridView ID="GridView1" CssClass="centerGrid" runat="server">
        </asp:GridView>

        <asp:Panel ID= "viewbooked" CssClass="center" Visible="false"  runat = "server">
            <asp:Label ID="Label3" runat="server" Text="Meeting ID"></asp:Label>
            <br/>
            <asp:TextBox ID="TextBox1" CssClass="inputT" runat="server"></asp:TextBox>
            <br/>
             <asp:Button ID="Button3" CssClass="smallButton" OnClick="ViewBookedMeetings" runat="server" Text="Button" />
          </asp:Panel>

        <asp:Panel ID= "addtoDoList" CssClass="center" Visible="false"  runat = "server">
            <asp:Label ID="Label1" runat="server" Text="Meeting ID"></asp:Label>
            <br/>
            <asp:TextBox ID="TextBox2" CssClass="inputT" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="Content"></asp:Label>
            <br/>
             <asp:TextBox ID="TextBox3" CssClass="inputT" runat="server"></asp:TextBox>
            <br/>
             <asp:Button ID="Button4" CssClass="smallButton" OnClick="AdToDO" runat="server" Text="Button" />
          </asp:Panel>

         <asp:Panel ID= "Bookmeet" CssClass="center" Visible="false"  runat = "server">
             <asp:Label ID="Label8" runat="server" Text="Meeting ID"></asp:Label>
             <br/>
            <asp:TextBox ID="TextBox4" CssClass="inputT" runat="server"></asp:TextBox>
             <br/>
             <asp:Button ID="Button5" CssClass="smallButton" OnClick="BookMeeting" runat="server" Text="Button" />
          </asp:Panel>

        </form>
</body>
    <script src="main.js"></script>
</html>
