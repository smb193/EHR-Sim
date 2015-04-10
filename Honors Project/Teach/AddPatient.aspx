<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPatient.aspx.cs" Inherits="Honors_Project.Teach.AddPatient" MasterPageFile="~/Master/Site.Master" Title="Add Patient" %>

<asp:Content ContentPlaceHolderID="Main" ID="Content1" runat="server">
    <table>
        <tr>
            <td>
                First Name
            </td>
            <td>
                <asp:TextBox ID="fnameTXT" runat="server"/>
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="fnameTXT" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Last Name
            </td>
            <td>
                <asp:TextBox ID="lnameTXT" runat="server"/>
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="lnameTXT" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Age
            </td>
            <td>
                <asp:TextBox ID="ageTXT" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="ageTXT" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Gender
            </td>
            <td>
                <asp:RadioButtonList ID="genderBTN" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="F">F</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="genderBTN" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>
                Height (in)
            </td>
            <td>
                <asp:TextBox ID="heightTXT" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="heightTXT" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>
                Weight (lb)
            </td>
            <td>
                <asp:TextBox ID="weightTXT" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="weightTXT" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="addButton" runat="server" Text="Create Patient" OnClick="CreatePatient" />
            </td>
            <td>
                <asp:Button ID="CancelButton" runat="server" Text="Cancel" OnClick="CancelAdd" CausesValidation="false" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="ConfirmationText" ForeColor="Green" Text="Patient Added Successfully" runat="server" Visible="false" />
            </td>
        </tr>
    </table>
</asp:Content>