<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPatient.aspx.cs" Inherits="Honors_Project.Teach.AddPatient" MasterPageFile="~/Master/Site.Master" Title="Add Patient" %>

<asp:Content runat="server" ContentPlaceHolderID="Main">
    <asp:Wizard ID="Wizard1" runat="server"
        CancelDestinationPageUrl="~/Patients.aspx"
        CancelButtonText="Return to Home"
        FinishCompleteButtonText="Submit"
        FinishDestinationPageUrl="~/Patients.aspx"
        SideBarStyle-VerticalAlign="Top"
        SideBarButtonStyle-CssClass="level1"
        SideBarButtonStyle-BorderColor="Black"
        SideBarButtonStyle-BorderStyle="Solid"
        SideBarButtonStyle-BorderWidth="1px"
        SideBarStyle-HorizontalAlign="Right"
        SideBarButtonStyle-Width="120px"
        SideBarButtonStyle-Height="25px"
        SideBarButtonStyle-Font-Underline="false"
        SideBarButtonStyle-Font-Size="18px" ActiveStepIndex="0"
        OnFinishButtonClick="CreatePatient"
        OnCancelButtonClick="CancelAdd"
        DisplayCancelButton="true">
        <WizardSteps>
            <asp:WizardStep
                ID="Step1"
                runat="server" Title="Anthro">
                <table style="padding: 3px">
                    <tr>
                        <td>First Name:</td>
                        <td>
                            <asp:TextBox ID="fname" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td>
                            <asp:TextBox ID="lname" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Age:</td>
                        <td>
                            <asp:TextBox ID="Age" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Sex:</td>
                        <td>
                            <asp:RadioButtonList ID="genderBTN" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="M">M</asp:ListItem>
                                <asp:ListItem Value="F">F</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>Height (in):</td>
                        <td>
                            <asp:TextBox ID="Heightin" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Weight (lb):</td>
                        <td>
                            <asp:TextBox ID="Weightlb" runat="server" /></td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step2"
                runat="server" Title="Background">
                <table style="padding: 3px">
                    <tr>
                        <td>Background:</td>
                        <td>
                            <asp:TextBox ID="bg" runat="server" Wrap="true"
                                TextMode="MultiLine" MaxLength="500" Rows="7" Columns="75" /></td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step3"
                runat="server" Title="BMP">
                <table style="padding: 3px">
                    <tr>
                        <td>Glucose: </td>
                        <td>
                            <asp:TextBox ID="glucose" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>CO2:</td>
                        <td>
                            <asp:TextBox ID="co2" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Sodium:</td>
                        <td>
                            <asp:TextBox ID="sodium" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Potassium:</td>
                        <td>
                            <asp:TextBox ID="Potassium" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Chloride:</td>
                        <td>
                            <asp:TextBox ID="Chloride" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>BUN:</td>
                        <td>
                            <asp:TextBox ID="bun" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Creatinine:</td>
                        <td>
                            <asp:TextBox ID="Creatinine" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step4"
                runat="server" Title="CMP">
                <table style="padding: 3px">
                    <tr>
                        <td>Calcium: </td>
                        <td>
                            <asp:TextBox ID="Calcium" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Albumin:</td>
                        <td>
                            <asp:TextBox ID="albumin" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Protein:</td>
                        <td>
                            <asp:TextBox ID="protein" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>ALP:</td>
                        <td>
                            <asp:TextBox ID="alp" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>ALT:</td>
                        <td>
                            <asp:TextBox ID="alt" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>AST:</td>
                        <td>
                            <asp:TextBox ID="ast" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Bilirubin:</td>
                        <td>
                            <asp:TextBox ID="bilirubin" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Total Cholesterol:</td>
                        <td>
                            <asp:TextBox ID="totalchol" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>HDL:</td>
                        <td>
                            <asp:TextBox ID="hdl" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>LDL:</td>
                        <td>
                            <asp:TextBox ID="ldl" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>TG:</td>
                        <td>
                            <asp:TextBox ID="tg" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step5"
                runat="server" Title="CBC">
                <table style="padding: 3px">
                    <tr>
                        <td>RBC: </td>
                        <td>
                            <asp:TextBox ID="rbc" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Hgb:</td>
                        <td>
                            <asp:TextBox ID="hgb" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Hct:</td>
                        <td>
                            <asp:TextBox ID="hct" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>MCV:</td>
                        <td>
                            <asp:TextBox ID="mcv" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>MCH:</td>
                        <td>
                            <asp:TextBox ID="mch" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>MCHC:</td>
                        <td>
                            <asp:TextBox ID="mchc" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>WBC:</td>
                        <td>
                            <asp:TextBox ID="WBC" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>
