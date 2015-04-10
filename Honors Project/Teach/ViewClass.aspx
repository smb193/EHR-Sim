<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewClass.aspx.cs" Inherits="Honors_Project.Teach.ViewClass" MasterPageFile="~/Master/Site.Master" Title="View Class"%>
<asp:Content ID="ContentID1" ContentPlaceHolderID="Main" runat="server">
    <asp:SqlDataSource ID="StudentSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT * FROM Users INNER JOIN ClassList ON ClassList.StudentID = Users.ID AND ClassList.ClassID = @ClassID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ClassID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView DataSourceID="StudentSrc" runat="server" ID="gvStudents" AutoGenerateColumns="true" />
</asp:Content>