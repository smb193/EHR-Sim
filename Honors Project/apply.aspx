<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apply.aspx.cs" Inherits="Honors_Project.apply" MasterPageFile="~/Master/Site.Master" Title="Apply for Classes"%>

<asp:Content ContentPlaceHolderID="Main" ID="ContentID1" runat="server">
    <asp:SqlDataSource ID="ClassSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT * FROM Classes LEFT JOIN ClassList ON ClassList.StudentID=@StudentID AND Classes.ID=ClassList.ClassID">
        <SelectParameters>
            <asp:SessionParameter Name="StudentID" SessionField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="gvApply" runat="server" DataSourceID="ClassSrc" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:TemplateField HeaderText="Course #">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Course") + ":" + Eval("Section") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Semester").ToString() + Eval("Year") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Approval Status">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# determineApprovalText(Eval("isApproved").ToString()) %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Apply" Visible='<%# Eval("isApproved").ToString() == string.Empty ? true : false %>' OnClick="ApplyToClass" CommandArgument='<%# Eval("ID") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>