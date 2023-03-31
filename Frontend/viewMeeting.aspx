<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewMeeting.aspx.cs" Inherits="MileStone3.viewMeeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="veiwmeeting" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /></div>
        <asp:GridView ID="Meetings" runat="server" AutoGenerateColumns="False" DataSourceID="Meetingdetails" DataKeyNames="Meeting_ID">
            <Columns>
                <asp:BoundField DataField="Meeting_ID" HeaderText="Meeting Id" InsertVisible="False" ReadOnly="True" SortExpression="Meeting_ID" />
                <asp:BoundField DataField="Meeting_Point" HeaderText="Meeting Point" SortExpression="Meeting_Point" />
                <asp:BoundField DataField="Meeting_date" HeaderText="Date" SortExpression="Meeting_date" />
                <asp:BoundField DataField="Start_Time" HeaderText="Start Time" SortExpression="Start_Time" />
                <asp:BoundField DataField="End_Time" HeaderText="End Time" SortExpression="End_Time" />
                <asp:BoundField DataField="duration" HeaderText="Duration" ReadOnly="True" SortExpression="duration" />
                <asp:BoundField DataField="Lecturer_ID" HeaderText="Lecturer Id" SortExpression="Lecturer_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Meetingdetails" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="ViewMeetingLecturer" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="Lecturer_id" Type="Int32" />
                <asp:Parameter DefaultValue="13" Name="meeting_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;<asp:Label ID="mid" runat="server" Text="Meeting id"></asp:Label>
        <asp:TextBox ID="meetid" CssClass="inputT" runat="server"></asp:TextBox>
    &nbsp;
        <asp:Button ID="submit" CssClass="myButton" runat="server" Text="Submit" OnClick="submit_Click" />
    </form>
</body>

    <script src="main.js"></script>
</html>
