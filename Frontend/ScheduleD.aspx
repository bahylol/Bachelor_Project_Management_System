<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduleD.aspx.cs" Inherits="MileStone3.ScheduleD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="ScheduleDefense" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />        </div>
        <asp:Label ID="Label2" runat="server" Text="Student Id"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="StudentId" DataTextField="S_ID" DataValueField="S_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="StudentId" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT [S_ID], [first_name], [last_name], [semester], [Project_ID], [supervising_doc], [TA_assigned] FROM [Student]"></asp:SqlDataSource>
        <asp:Calendar ID="Calendar1" runat="server" ></asp:Calendar>
        <asp:GridView ID="Defense" runat="server" AutoGenerateColumns="False" DataKeyNames="defense_location,S_ID" DataSourceID="DefenseScheduled">
            <Columns>
                <asp:BoundField DataField="content" HeaderText="Defense Content" SortExpression="content" />
                <asp:BoundField DataField="defense_location" HeaderText="Location" ReadOnly="True" SortExpression="defense_location" />
                <asp:BoundField DataField="def_time" HeaderText="Time" SortExpression="def_time" />
                <asp:BoundField DataField="def_date" HeaderText="Date" SortExpression="def_date" />
                <asp:BoundField DataField="S_ID" HeaderText="Student Id" ReadOnly="True" SortExpression="S_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DefenseScheduled" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT [content], [defense_location], [def_time], [def_date], [S_ID] FROM [Defense]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="date" runat="server" Text="Date"></asp:Label>
        <asp:TextBox ID="d" CssClass="inputT" runat="server" OnTextChanged="d_TextChanged" TextMode="DateTime"></asp:TextBox>
        &nbsp;
        <asp:Label ID="time" runat="server" Text="Time"></asp:Label>
        <asp:TextBox ID="t" CssClass="inputT" runat="server" TextMode="Time" ></asp:TextBox>
        &nbsp;
        <asp:Label ID="loc" runat="server" Text="Location"></asp:Label>
        <asp:TextBox ID="location" CssClass="inputT" runat="server" ></asp:TextBox>
        &nbsp;
        <asp:Button ID="Go" CssClass="myButton" runat="server" Text="Go" OnClick="Go_Click" />
    
    </form>
</body>

    <script src="main.js"></script>
</html>
