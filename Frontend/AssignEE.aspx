<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignEE.aspx.cs" Inherits="MileStone3.AssignEE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />  
        </div>
        <asp:GridView ID="Recommends" runat="server" AutoGenerateColumns="False" DataKeyNames="AProject_id,examiner_id" DataSourceID="Recommendations">
            <Columns>
                <asp:BoundField DataField="doc_id" HeaderText="Lecturer Id" SortExpression="doc_id" />
                <asp:BoundField DataField="AProject_id" HeaderText="Academic Project Id" ReadOnly="True" SortExpression="AProject_id" />
                <asp:BoundField DataField="examiner_id" HeaderText="Recommended External Examiner Id" ReadOnly="True" SortExpression="examiner_id" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:GridView ID="AcademicProjects" runat="server" AutoGenerateColumns="False" DataKeyNames="code" DataSourceID="AcademicProjectDetails">
            <Columns>
                <asp:BoundField DataField="code" HeaderText="Project Code" ReadOnly="True" SortExpression="code" />
                <asp:BoundField DataField="project_name" HeaderText="Project Name" SortExpression="project_name" />
                <asp:BoundField DataField="project_description" HeaderText="Project Description" SortExpression="project_description" />
                <asp:BoundField DataField="resources" HeaderText="Resources" SortExpression="resources" />
                <asp:BoundField DataField="major_code" HeaderText="Major Code" SortExpression="major_code" />
                <asp:BoundField DataField="EE_id" HeaderText="External Examiner Id" SortExpression="EE_id" />
                <asp:BoundField DataField="lecturer_id" HeaderText="Lecturer Id" SortExpression="lecturer_id" />
                <asp:BoundField DataField="TA_id" HeaderText="Teaching Assistant Id" SortExpression="TA_id" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="AcademicProjectDetails" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT * FROM [ProjectDetailsAcademic]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Recommendations" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Recommends]"></asp:SqlDataSource>
        <br />
        &nbsp;<asp:Label ID="codeLabel" runat="server" Text="Project Code"></asp:Label>
        <asp:TextBox ID="ProjectCode" CssClass="inputT" runat="server" ></asp:TextBox>
        &nbsp;
        <asp:Label ID="EE" runat="server" Text="External Examiner Id"></asp:Label>
        <asp:TextBox ID="eeid" CssClass="inputT" runat="server" ></asp:TextBox>
        &nbsp;
        <asp:Button ID="Go" CssClass="myButton" runat="server" Text="Go" OnClick="Go_Click" />
    </form>
</body>

    <script src="main.js"></script>
</html>
