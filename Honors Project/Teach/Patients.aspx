<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="Honors_Project.Teach.Patients" MasterPageFile="~/Master/Site.Master" Title="Patients" EnableEventValidation ="False" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
            DataSourceID="PatientSrc" DataKeyNames="ID"
            OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Patient ID" />
                <asp:BoundField DataField="FName" HeaderText="First Name" />
                <asp:BoundField DataField="LName" HeaderText="Last Name" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="Sex" HeaderText="Sex" />
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:HyperLink ID="editButton" runat="server" NavigateUrl='<%# SetNavigateUrl(Eval("ID")) %>' Text="Edit/View" />
                        <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete" Text="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this user?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:Button ID="addButton" runat="server" Text="Add New Patient" OnClick="Add_Click" /> 
    <asp:DropDownList ID="classList" runat="server" DataSourceID="ClassSrc" DataTextField="ClassName" DataValueField="ID"></asp:DropDownList>
    <asp:Button ID="patientButton" runat="server" Text="Add Selected Patient to Class" OnClick="patientButton_Click" />
    <asp:SqlDataSource ID="PatientSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT ID, FName, LName, Age, Sex FROM Patients"
        DeleteCommand="DELETE FROM Patients WHERE ID = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ClassSrc" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT ID, (Name + ' ' + Semester + CAST(Year as VARCHAR(10))) as ClassName FROM Classes WHERE Instructor=@ID">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="ID" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
