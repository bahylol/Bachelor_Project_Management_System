<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="MileStone3.ViewUser" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
</head>
<body>
    <form id="ViewUser" runat="server">
        <div>
            <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /></div>
        <asp:Label ID="Label2" runat="server" Text="User Roles"></asp:Label>
        <asp:DropDownList ID="ChooseUserRole" runat="server" DataSourceID="UserRoles" DataTextField="userrole" DataValueField="userrole" Height="33px" Width="230px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="UserRoles" runat="server" ConnectionString="<%$ ConnectionStrings:MileStone3ConnectionString %>" SelectCommand="SELECT DISTINCT [userrole] FROM [UserInfo] ORDER BY [userrole]"></asp:SqlDataSource>
            <asp:Button ID="Go" CssClass="myButton" runat="server" Text="Go" OnClick="Go_Click" />
        <asp:GridView ID="UserData" runat="server" AutoGenerateColumns="False" Height="16px" Width="1299px">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="User id" ReadOnly="True" />
                <asp:BoundField DataField="username" HeaderText="Username" />
                <asp:BoundField DataField="userpassword" HeaderText="Password"  />
                <asp:BoundField DataField="userrole" HeaderText="Role"  />
                <asp:BoundField DataField="phone_number" HeaderText="Phone Number"  />
                <asp:BoundField DataField="email" HeaderText="Email" />
            </Columns>
        </asp:GridView>
    </form>
</body>

    <script src="main.js"></script>
</html>
