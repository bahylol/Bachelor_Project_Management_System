<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="MileStone3.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title>Student Home Page</title>
</head>
<body>
        <form id="form1" runat="server">
            <div class="nav">
        <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />
        <asp:Button ID="Button1" CssClass="myButton" runat="server" OnClick="perefrenceForm" Text="Make Pereference" />
        <asp:Button ID="Button2" CssClass="myButton" runat="server" OnClick="ThesisForm" Text="Submit Thesis"/>
        <asp:Button ID="Button3" CssClass="myButton" runat="server" OnClick="ThesisviewForm" Text="View Thesis"/>
        <asp:Button ID="Button4" CssClass="myButton" runat="server" OnClick="progressform" Text="View Progress Reports" />
        <asp:Button ID="Button5" CssClass="myButton" runat="server" OnClick="ViewMyDefense" Text="View Defense" />
        <asp:Button ID="Button6" CssClass="myButton" runat="server" OnClick="ViewMyBachelorProjectGrade" Text="View Bachelor Project Grade" />
        <asp:Button ID="Button7" CssClass="myButton" runat="server" OnClick="view_meetings" Text="View Meetings" />
                <div class="dropdown">
                    <button class="dropbtn" style="margin-top: 0.3rem; margin-right:0.5rem;">More</button>
                        <div class="dropdown-content">
                            <asp:Button ID="Button13" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Home" Text="View Profile" />
                            <asp:Button ID="Button14" CssClass="myButton" style="text-align:left;" runat="server" OnClick="ViewBachelor" Text="View Bachelor Projects" />
                            <asp:Button ID="Button15" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Logout" Text="Logout" />
                        </div>
                </div>
            </div>
           
            <asp:GridView ID="GridView1" CssClass="center" Visible="false" runat="server">
            </asp:GridView>


            <asp:Panel ID= "submitThesis" CssClass="center" Visible="false"  runat = "server">
             <asp:Label ID="Label2" runat="server" Text="Title"></asp:Label>
                    <br/>
            <asp:TextBox ID="TextBox1" CssClass="inputT" runat="server" Wrap="True"></asp:TextBox>
                    <br/>
             <asp:Label ID="Label3" runat="server" Text="PDF File"></asp:Label>
                    <br/>
            <asp:TextBox ID="TextBox2" CssClass="inputT" runat="server"></asp:TextBox>
                    <br/>
             <asp:Button ID="Button8" CssClass="smallButton" OnClick="submitMyThesis" runat="server" Text="Submit" />
               </asp:Panel>


             <asp:Panel ID= "makeperefrence" CssClass="center" Visible="false"  runat = "server">
            <asp:Label ID="Label4" runat="server" Text="Bachelor Code"></asp:Label>
                 <br/>
            <asp:TextBox ID="TextBox3" CssClass="inputT" runat="server"></asp:TextBox>
                 <br/>
            <asp:Label ID="Label5" runat="server" Text="Pereference Number"></asp:Label>
                 <br/>
            <asp:TextBox ID="TextBox4" CssClass="inputT" runat="server"></asp:TextBox>
                 <br/>
             <asp:Button ID="Button9" CssClass="smallButton" OnClick="MakePreferencesLocalProject" runat="server" Text="Submit" />
               </asp:Panel>

            <asp:Panel ID= "viewThesis" CssClass="center" Visible="false"  runat = "server">
            <asp:Label ID="Label6" runat="server" Text="Title"></asp:Label>
                <br/>
            <asp:TextBox ID="TextBox5" CssClass="inputT" runat="server"></asp:TextBox>
                <br/>
             <asp:Button ID="Button10" CssClass="smallButton" OnClick="ViewMyThesis" runat="server" Text="View" />
               </asp:Panel>
           
            <asp:Panel ID= "Defense" CssClass="center" Visible="false"  runat = "server">
            <asp:Label ID="Label7" runat="server" Text="Defense Content"></asp:Label>
                <br/>
            <asp:TextBox ID="TextBox6" CssClass="inputT" runat="server"></asp:TextBox>
                <br/>
             <asp:Button ID="Button11" CssClass="smallButton" runat="server" OnClick="UpdateDefense" Text="Update Defense" />
               </asp:Panel>

            <asp:Panel ID= "Bachelor" CssClass="center" Visible="false"  runat = "server">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
               </asp:Panel>

            <asp:Panel ID= "progress" CssClass="center" Visible="false"  runat = "server">
               <asp:Label ID="Label8" runat="server" Text="Date"></asp:Label>
                <br/>
               <asp:TextBox ID="TextBox7" CssClass="inputT" runat="server" TextMode="DateTime"></asp:TextBox>
                <br/>
                <asp:Button ID="Button12" CssClass="smallButton" runat="server" OnClick="ViewMyProgressReports" Text="View" />
               </asp:Panel>
            

            <asp:Label ID="Label9" CssClass="center" runat="server" Text=""></asp:Label>
        </form>
     

</body>

    <script src="main.js"></script>
</html>
