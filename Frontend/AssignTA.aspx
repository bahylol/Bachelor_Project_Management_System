<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignTA.aspx.cs" Inherits="MileStone3.AssignTA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="AssginTA" runat="server">
        <div>
           <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />
            
        </div>
        <asp:GridView ID="ProjectDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="code" DataSourceID="AcademicProjects" Height="16px" Width="987px"  >
            <Columns>
                <asp:BoundField DataField="code" HeaderText="Project Code" ReadOnly="True" SortExpression="code" />
                <asp:BoundField DataField="project_name" HeaderText="Project Name" SortExpression="project_name" />
                <asp:BoundField DataField="project_description" HeaderText="Description" SortExpression="project_description" />
                <asp:BoundField DataField="resources" HeaderText="Resources" SortExpression="resources" />
                <asp:BoundField DataField="major_code" HeaderText="Major Code" SortExpression="major_code" />
                <asp:BoundField DataField="EE_id" HeaderText="Assigned External Examiner Id" SortExpression="EE_id" />
                <asp:BoundField DataField="lecturer_id" HeaderText= "Lecturer id" SortExpression="lecturer_id" />
                <asp:BoundField DataField="TA_id" HeaderText="Assigned Teaching Assistant Id" SortExpression="TA_id" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="TAs">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="TAs" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT [id] FROM [Teaching_Assistant]"></asp:SqlDataSource>
        <asp:Label ID="codeLabel" runat="server" Text="Project Code"></asp:Label>
        <asp:TextBox ID="ProjectCode" CssClass="inputT" runat="server" ></asp:TextBox>
        <asp:SqlDataSource ID="AcademicProjects" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT * FROM [ProjectDetailsAcademic]"></asp:SqlDataSource>
        <asp:Label ID="id" runat="server" Text="Teaching Assistant Id"></asp:Label>
        <asp:TextBox ID="TAid" CssClass="inputT" runat="server" ></asp:TextBox>
        <asp:Button ID="Go" CssClass="myButton" runat="server" Text="Go" OnClick="Go_Click" />
    </form>
</body>

    <script src="main.js"></script>
</html>
