<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToDo.aspx.cs" Inherits="MileStone3.AddToDo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="AddToDo" runat="server">
        <div>
             <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />
             <br />
        </div>
        <asp:Label ID="mid" runat="server" Text="Meeting Id"></asp:Label>
        <asp:DropDownList ID="meetingChoice" runat="server" DataSourceID="Meetings" DataTextField="Meeting_ID" DataValueField="Meeting_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Meetings" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT [Meeting_ID] FROM [Meeting]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="todo" runat="server" Text="ToDo Content"></asp:Label>
        <asp:TextBox ID="AddedToDo" CssClass="inputT" runat="server" TextMode="MultiLine"></asp:TextBox>
        <p>
            <asp:Button ID="submit" CssClass="myButton" runat="server" Text="Submit" OnClick="submit_Click" />
        </p>
        <p>
            &nbsp;</p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="meeting_id,todolist" DataSourceID="TodoList">
            <Columns>
                <asp:BoundField DataField="meeting_id" HeaderText="Meeting Id" ReadOnly="True" SortExpression="meeting_id" />
                <asp:BoundField DataField="todolist" HeaderText="ToDo List" ReadOnly="True" SortExpression="todolist" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="TodoList" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT * FROM [MeetingToDoList]"></asp:SqlDataSource>
    </form>
</body>

    <script src="main.js"></script>
</html>
