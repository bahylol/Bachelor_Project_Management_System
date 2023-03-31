<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coordinator.aspx.cs" Inherits="MileStone3.Coordinator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="Coordinator" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /><asp:Button ID="ViewUsers"  CssClass="myButton" runat="server" Text="View Users" Height="32px" Width="108px" OnClick="ViewUsersButton" />
            <asp:Button ID="AssignTA"  CssClass="myButton" runat="server" Text="Assign Teaching Assistant" Height="32px" Width="223px" OnClick="AssignTA_Click" />
            <asp:Button ID="AssignEE"  CssClass="myButton" runat="server" Text="Assign External Examiner" Height="32px" Width="221px" OnClick="AssignEE_Click" />
            <asp:Button ID="ViewRec"  CssClass="myButton" runat="server" Text="Reccomendations" Height="32px" Width="153px" OnClick="ViewRec_Click" />
            <asp:Button ID="ScheduleD"  CssClass="myButton" runat="server" Text="Schedule Defense" Height="32px" Width="161px" OnClick="ScheduleD_Click" />
            <button class="dropbtn" style="margin-top: 0.3rem; margin-right:0.5rem;">More</button>
                        <div class="dropdown">
                    <button class="dropbtn" style="margin-top: 0.3rem; margin-right:0.5rem;">More</button>
                        <div class="dropdown-content">
                            <asp:Button ID="Button13" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Home" Text="View Profile" />
                            <asp:Button ID="Button14" CssClass="myButton" style="text-align:left;" runat="server" OnClick="ViewBachelor" Text="View Bachelor Projects" />
                            <asp:Button ID="Button15" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Logout" Text="Logout" />
                        </div>
                </div>
        </div>
        <asp:Button ID="assignstudent" CssClass="myButton" runat="server" Text="Assign All Students to Their Bachelor Projects" OnClick="assignstudent_Click" Height="32px" Width="420px" style="text-align: center" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="S_ID,code" DataSourceID="StudentProjectdetails" Visible="False" >
            <Columns>
                <asp:BoundField DataField="S_ID" HeaderText="Student Id" ReadOnly="True" SortExpression="S_ID" />
                <asp:BoundField DataField="code" HeaderText="Project Code" ReadOnly="True" SortExpression="code" />
                <asp:BoundField DataField="project_name" HeaderText="Project Name" SortExpression="project_name" />
                <asp:BoundField DataField="project_description" HeaderText="Project Description" SortExpression="project_description" />
                <asp:BoundField DataField="resources" HeaderText="Resources" SortExpression="resources" />
                <asp:BoundField DataField="major_code" HeaderText="Major Code" SortExpression="major_code" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="StudentProjectdetails" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="AssignAllStudentsToLocalProject" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>

    <script src="main.js"></script>
</html>
