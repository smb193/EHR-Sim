<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewClass.aspx.cs" Inherits="Honors_Project.ViewClass" MasterPageFile="~/Master/Site.Master" Title="View Class Patients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <asp:GridView ID="gvPatients" runat="server" AutoGenerateColumns="false" DataSourceID="PatientSrc" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="FName" HeaderText="First" />
            <asp:BoundField DataField="LName" HeaderText="Last" />
            <asp:TemplateField HeaderText="View Chart" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:HyperLink ID="response" runat="server" NavigateUrl='<%# SetNavigateUrl(Eval("ID")) %>' Text="[x]" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="PatientSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT PatientClass.ID, FName, LName FROM Patients INNER JOIN PatientClass ON Patients.ID=PatientClass.PatientID AND PatientClass.ClassID=@ClassID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ClassID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>