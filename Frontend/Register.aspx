<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MileStone3.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="main.css">
    <title></title>
    <style type="text/css">
        .auto-style1 {}
        .auto-style2 {
            text-decoration: underline;
            text-align: center;
        }
        .auto-style4 {}
    </style>
</head>
<body>
    <form id="register" runat="server">
        <div>
            <h1>
                <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" /> </h1>
        </div>
        <h2 class="auto-style2">User Register Portal</h2>
        <p>
            <asp:Label ID="UserRole" runat="server" Text="Role: "></asp:Label>
&nbsp;<asp:TextBox ID="UserRole_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="UserName" runat="server" Text="Name: "></asp:Label>
&nbsp;<asp:TextBox ID="UserName_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="UserEmail" runat="server" Text="Email: "></asp:Label>
&nbsp;<asp:TextBox ID="UserEmail_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="FirstName" runat="server" Text="First name: "></asp:Label>
&nbsp;<asp:TextBox ID="FirstName_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="LastName" runat="server" Text="Last name: "></asp:Label>
&nbsp;<asp:TextBox ID="LastName_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="BirthDate" runat="server" Text="Birth date: "></asp:Label>
&nbsp;
            <asp:TextBox ID="BirthDate_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="GPA" runat="server" Text="GPA: "></asp:Label>
&nbsp;
            <asp:TextBox ID="GPA_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Semester" runat="server" Text="Semester: "></asp:Label>
&nbsp;<asp:TextBox ID="Semester_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Address" runat="server" Text="Address: "></asp:Label>
&nbsp;
            <asp:TextBox ID="Address_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="FacultyCode" runat="server" Text="Faculty code:"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="FacultyCode_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="MajorCode" runat="server" Text="Major code: "></asp:Label>
&nbsp;
            <asp:TextBox ID="MajorCode_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="CompanyName" runat="server" Text="Comapny name: "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="CompanyName_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="RepName" runat="server" Text="Representitive name: "></asp:Label>
&nbsp;
            <asp:TextBox ID="RepName_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="RepEmail" runat="server" Text="Representitive email: "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="RepEmail_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Phone" runat="server" Text="Phone number: "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="Phone_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Country" runat="server" Text="Country of residence: "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="Country_Entry" CssClass="inputT" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="RegisterButton" CssClass="myButton" runat="server" OnClick="RegisterAccount" Text="Register" Width="209px" />
        </p>
    </form>
</body>

    <script src="main.js"></script>
</html>
