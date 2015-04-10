<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="Honors_Project.Teach.Classes" MasterPageFile="~/Master/Site.Master" Title="Manage Classes" %>

<asp:Content ID="ContentID1" ContentPlaceHolderID="Main" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ClassSrc" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:TemplateField HeaderText="Course #">
                <ItemTemplate>
                    <asp:Label ID="Course" runat="server">
                        <%# Eval("Course") + ":" + Eval("Section") %>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year">
                <ItemTemplate>
                    <asp:Label ID="Year" runat="server">
                        <%# Eval("Semester").ToString() + Eval("Year").ToString() %>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="View" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:HyperLink ID="ViewClass" runat="server" NavigateUrl='<%# SetNavigateUrl(Eval("ID")) %>' Text="x" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete" Text="x"
                        OnClientClick="return confirm('Are you sure you want to delete this course?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="addButton" runat="server" Text="Add New Course" OnClick="Add_Click" />
    <asp:SqlDataSource ID="ClassSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT * FROM Classes Where Instructor = @Instructor"
        DeleteCommand="DELETE FROM Classes WHERE ID = @ID">
        <SelectParameters>
            <asp:SessionParameter Name="Instructor" SessionField="ID" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
