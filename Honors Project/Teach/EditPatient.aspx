<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPatient.aspx.cs" Inherits="Honors_Project.Teach.EditPatient" MasterPageFile="~/Master/Site.Master" Title="Edit/View Patient"%>

<asp:Content id="ContendID1" runat="server" ContentPlaceHolderID="Main">
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
                Height
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
                Weight
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
                <asp:Button ID="addButton" runat="server" Text="Update Patient" OnClick="Update_Patient"/>
            </td>
            <td>
                <asp:Button ID="cancelButton" runat="server" Text="Cancel" OnClick="Cancel_Update" CausesValidation="false" />
            </td>
        </tr>
    </table>
</asp:Content>