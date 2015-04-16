<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Honors_Project.index" MasterPageFile="~/Master/Site.Master" Title="Home"%>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:SqlDataSource ID="ClassSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT * FROM Classes
        INNER JOIN ClassList ON Classes.ID=ClassList.ClassID AND ClassList.isApproved='Y' AND ClassList.StudentID=@StudentID">
        <SelectParameters>
            <asp:SessionParameter Name="StudentID" SessionField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ClassSrc" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="You are not in any classes.">
        <Columns>
            <asp:BoundField HeaderText="Course Name" DataField="Name" />
            <asp:TemplateField HeaderText="Course #" >
                <ItemTemplate>
                    <asp:Label ID="courseNumber" runat="server" Text='<%# Eval("Course") + ":" + Eval("Section") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year">
                <ItemTemplate>
                    <asp:Label ID="year" runat="server" Text='<%# Eval("Semester").ToString() + Eval("Year").ToString() %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="View Homework" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:HyperLink ID="ViewClass" runat="server" NavigateUrl='<%# SetNavigateUrl(Eval("ID")) %>' Text="[x]" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:HyperLink NavigateUrl="~/apply.aspx" runat="server" ID="applylink" Text="Click here to apply for a new class" />
</asp:Content>
