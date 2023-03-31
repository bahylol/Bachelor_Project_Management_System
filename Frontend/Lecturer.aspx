<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lecturer.aspx.cs" Inherits="MileStone3.LecturerHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:ImageButton ID="ImageButton1" src="GIULOGO.jpeg" alt="GIU_LOGO" style="width: 15rem;" runat="server" OnClick="ImageButton1_Click" />     
             <asp:Button ID="Button1" CssClass="myButton" style="text-align:left;" runat="server" OnClick="LecturerCreateLocalProject" Text="LecturerCreateLocalProject" /> 
             <asp:Button ID="Button2" CssClass="myButton" style="text-align:left;" runat="server" OnClick="SpecifyThesisDeadline" Text="SpecifyThesisDeadline" />
             <asp:Button ID="Button3" CssClass="myButton" style="text-align:left;" runat="server" OnClick="CreateMeeting" Text="CreateMeeting" />
             <asp:Button ID="Button4" CssClass="myButton" style="text-align:left;" runat="server" OnClick="LecturerAddToDo" Text="LecturerAddToDo" />
             <asp:Button ID="Button5" CssClass="myButton" style="text-align:left;" runat="server" OnClick="ViewMeetingLecturer" Text="ViewMeetingLecturer" />
             <asp:Button ID="Button6" CssClass="myButton" style="text-align:left;" runat="server" OnClick="ViewEE" Text="ViewEE" />
             <asp:Button ID="Button7" CssClass="myButton" style="text-align:left;" runat="server" OnClick="RecommendEE" Text="RecommendEE" />
             <asp:Button ID="Button8" CssClass="myButton" style="text-align:left;" runat="server" OnClick="SuperviseIndustrial" Text="SuperviseIndustrial" />
             <asp:Button ID="Button9" CssClass="myButton" style="text-align:left;" runat="server" OnClick="LecGradeThesis" Text="LecGradeThesis" />
             <asp:Button ID="Button10" CssClass="myButton" style="text-align:left;" runat="server" OnClick="LecGradedefense" Text="LecGradedefense" />
             <asp:Button ID="Button11" CssClass="myButton" style="text-align:left;" runat="server" OnClick="LecCreatePR" Text="LecCreatePR" />
             <asp:Button ID="Button12" CssClass="myButton" style="text-align:left;" runat="server" OnClick="LecGradePR" Text="LecGradePR" />            
            <asp:Button ID="Button13" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Home" Text="Home" />
             <asp:Button ID="Button14" CssClass="myButton" style="text-align:left;" runat="server" OnClick="ViewBachelor" Text="View Bachelor Projects" />
             <asp:Button ID="Button15" CssClass="myButton" style="text-align:left;" runat="server" OnClick="Logout" Text="Logout" />
        </div>
    </form>
</body>
</html>
