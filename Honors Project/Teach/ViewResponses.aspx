<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewResponses.aspx.cs" Inherits="Honors_Project.Teach.ViewResponses" MasterPageFile="~/Master/Site.Master" Title="View Respones"%>

<asp:Content ContentPlaceHolderID="Main" runat="server">
    <asp:SqlDataSource ID="responseSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT Users.Username, Response.ID FROM ClassList JOIN PatientClass ON PatientClass.ClassID=ClassList.ClassID AND PatientClass.ID=@ID JOIN Users ON Users.ID=ClassList.StudentID LEFT JOIN Response ON Users.ID=Response.StudentID AND Response.PatientClassID=@ID">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="ID"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="gv1" runat="server" DataSourceID="responseSrc" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="Username"/>
            <asp:TemplateField HeaderText="Response">
                <ItemTemplate>
                    <asp:HyperLink NavigateUrl='<%# getNavUrl(Eval("ID").ToString()) %>' Visible='<%# Eval("ID").ToString() == String.Empty ? false : true %>' runat="server" Text="View"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>