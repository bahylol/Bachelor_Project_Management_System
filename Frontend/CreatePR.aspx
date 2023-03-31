<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePR.aspx.cs" Inherits="MileStone3.CreatePR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="CreatePR" runat="server">
        <div>
           <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /></div>
        <p>
            <asp:Label ID="SID" runat="server" Text="Student ID"></asp:Label>
            <asp:DropDownList ID="StudentChoice" runat="server" DataSourceID="Studentids" DataTextField="S_ID" DataValueField="S_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Studentids" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT [S_ID] FROM [Student]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="Cont" runat="server" Text="Content"></asp:Label>
            <asp:TextBox ID="content" CssClass="inputT" runat="server" TextMode="MultiLine"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <asp:Label ID="DateLabel" runat="server" Text="Date"></asp:Label>
        <asp:TextBox ID="Date" CssClass="inputT" runat="server" TextMode="DateTime"></asp:TextBox>
        <br />
        <br />
        <asp:Calendar ID="Calendar1" runat="server" ></asp:Calendar>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="s_id,report_date" DataSourceID="PR">
            <Columns>
                <asp:BoundField DataField="Updating_UserId" HeaderText="Updating_UserId" SortExpression="Updating_UserId" />
                <asp:BoundField DataField="s_id" HeaderText="s_id" ReadOnly="True" SortExpression="s_id" />
                <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                <asp:BoundField DataField="report_date" HeaderText="report_date" ReadOnly="True" SortExpression="report_date" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="PR" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT [Updating_UserId], [s_id], [content], [report_date] FROM [Progress_report]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Submit" CssClass="myButton" runat="server" Text="Submit" OnClick="Submit_Click" />
    </form>
</body>

    <script src="main.js"></script>
</html>
