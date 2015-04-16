<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewClass.aspx.cs" Inherits="Honors_Project.Teach.ViewClass" MasterPageFile="~/Master/Site.Master" Title="View Class"%>
<asp:Content ID="ContentID1" ContentPlaceHolderID="Main" runat="server">
    <asp:SqlDataSource ID="StudentSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT * FROM Users INNER JOIN ClassList ON ClassList.StudentID = Users.ID AND ClassList.ClassID = @ClassID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ClassID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="PatientSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT * FROM Patients INNER JOIN PatientClass ON Patients.ID = PatientClass.PatientID AND PatientClass.ClassID = @ClassID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ClassID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView DataSourceID="PatientSrc" runat="server" ID="gvPatients" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="FName" HeaderText="First" />
            <asp:BoundField DataField="LName" HeaderText="Last" />
            <asp:BoundField DataField="WeightLb" HeaderText="Weight" DataFormatString="{0} lbs" />
            <asp:BoundField DataField="HeightIn" HeaderText="Height" DataFormatString="{0} in" />
            <asp:HyperLinkField DataNavigateUrlFields="ID1" DataNavigateUrlFormatString="~/Teach/ViewResponses.aspx?id={0}" Text="View Responses"/>
        </Columns>
    </asp:GridView>
    <br />
    <asp:GridView DataSourceID="StudentSrc" runat="server" ID="gvStudents" AutoGenerateColumns="False" >
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="Username"/>
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" OnClick="ApproveStudent" Text="Approve" Visible='<%# Eval("isApproved").ToString() == "N" ? true : false %>' CommandArgument='<%# Eval("ID1") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>