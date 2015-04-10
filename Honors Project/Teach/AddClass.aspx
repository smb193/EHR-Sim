<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="Honors_Project.Teach.AddClass" MasterPageFile="~/Master/Site.Master" Title="Add New Class" %>

<asp:Content ID="ContentID1" ContentPlaceHolderID="Main" runat="server">
    <table>
        <tr>
            <td>
                Course Title
            </td>
            <td>
                <asp:TextBox ID="nameTXT" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="nameTXT" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Course Number
            </td>
            <td>
                <asp:TextBox ID="courseTXT" runat="server" MaxLength="3" Placeholder="Course #"/>: <asp:TextBox ID="sectionTXT" runat="server" MaxLength="3" Placeholder="Section #"/>
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="courseTXT" runat="server" Display="Dynamic"/>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="sectionTXT" runat="server" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td>
                Course Year
            </td>
            <td>
                <asp:RadioButtonList ID="semBtn" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <asp:ListItem Value="Sp" Selected="True">Spring</asp:ListItem>
                    <asp:ListItem Value="Su">Summer</asp:ListItem>
                    <asp:ListItem Value="Fa">Fall </asp:ListItem>
                </asp:RadioButtonList>
                <asp:TextBox ID="yearTXT" runat="server" MaxLength="4" placeholder="Year"/>
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="yearTXT" runat="server" />                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="addButton" runat="server" Text="Create Class" OnClick="Create_Class" />
            </td>
            <td>
                <asp:Button ID="CancelButton" runat="server" Text="Cancel" OnClick="CancelAdd" CausesValidation="false" />
            </td>
        </tr>
    </table>
</asp:Content>