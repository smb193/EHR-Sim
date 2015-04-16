<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPatient.aspx.cs" Inherits="Honors_Project.Teach.EditPatient" MasterPageFile="~/Master/Site.Master" Title="Edit/View Patient" %>

<asp:Content ID="ContendID1" runat="server" ContentPlaceHolderID="Main">
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
        OnFinishButtonClick="Update_Patient"
        OnCancelButtonClick="Cancel_Update"
        DisplayCancelButton="true">
        <WizardSteps>
            <asp:WizardStep
                ID="Step1"
                runat="server" Title="Anthro">
                <asp:FormView ID="fv1" runat="server" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding: 3px">
                            <tr>
                                <td>First Name:</td>
                                <td>
                                    <asp:TextBox ID="fname" runat="server" Text='<%#Eval("FName") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td>
                                    <asp:TextBox ID="lname" runat="server" Text='<%#Eval("LName") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Age:</td>
                                <td>
                                    <asp:TextBox ID="Age" runat="server" Text='<%#Eval("Age") %>'/></td>
                            </tr>
                            <tr>
                                <td>Sex:</td>
                                <td>
                                    <asp:RadioButtonList ID="genderBTN" runat="server" RepeatDirection="Horizontal" >
                                        <asp:ListItem Value="M">M</asp:ListItem>
                                        <asp:ListItem Value="F">F</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>Height (in):</td>
                                <td>
                                    <asp:TextBox ID="Heightin" runat="server" Text='<%#Eval("HeightIn") %>'/></td>
                            </tr>
                            <tr>
                                <td>Weight (lb):</td>
                                <td>
                                    <asp:TextBox ID="Weightlb" runat="server" Text='<%#Eval("WeightLb") %>'/></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step2"
                runat="server" Title="Background">
                <asp:FormView ID="fv2" runat="server" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding: 3px">
                            <tr>
                                <td>Background:</td>
                                <td>
                                    <asp:TextBox ID="bg" runat="server" Wrap="true"
                                        TextMode="MultiLine" MaxLength="500" Rows="7" Columns="75" Text='<%#Eval("Background") %>'/></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step3"
                runat="server" Title="BMP">
                <asp:FormView ID="fv3" runat="server" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding: 3px">
                            <tr>
                                <td>Glucose: </td>
                                <td>
                                    <asp:TextBox ID="glucose" runat="server" Text='<%#Eval("Glucose") %>'/></td>
                            </tr>
                            <tr>
                                <td>CO2:</td>
                                <td>
                                    <asp:TextBox ID="co2" runat="server" Text='<%#Eval("CO2") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Sodium:</td>
                                <td>
                                    <asp:TextBox ID="sodium" runat="server" Text='<%#Eval("Sodium") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Potassium:</td>
                                <td>
                                    <asp:TextBox ID="Potassium" runat="server" Text='<%#Eval("Potassium") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Chloride:</td>
                                <td>
                                    <asp:TextBox ID="Chloride" runat="server" Text='<%#Eval("Chloride") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>BUN:</td>
                                <td>
                                    <asp:TextBox ID="bun" runat="server" Text='<%#Eval("BUN") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Creatinine:</td>
                                <td>
                                    <asp:TextBox ID="Creatinine" runat="server" Text='<%#Eval("Creatinine") %>'/>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step4"
                runat="server" Title="CMP">
                <asp:FormView ID="fv4" runat="server" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding: 3px">
                            <tr>
                                <td>Calcium: </td>
                                <td>
                                    <asp:TextBox ID="Calcium" runat="server" Text='<%#Eval("Calcium") %>'/></td>
                            </tr>
                            <tr>
                                <td>Albumin:</td>
                                <td>
                                    <asp:TextBox ID="albumin" runat="server" Text='<%#Eval("Albumin") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Protein:</td>
                                <td>
                                    <asp:TextBox ID="protein" runat="server" Text='<%#Eval("Protein") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>ALP:</td>
                                <td>
                                    <asp:TextBox ID="alp" runat="server" Text='<%#Eval("ALP") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>ALT:</td>
                                <td>
                                    <asp:TextBox ID="alt" runat="server" Text='<%#Eval("ALT") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>AST:</td>
                                <td>
                                    <asp:TextBox ID="ast" runat="server" Text='<%#Eval("AST") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Bilirubin:</td>
                                <td>
                                    <asp:TextBox ID="bilirubin" runat="server" Text='<%#Eval("Bilirubin") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Total Cholesterol:</td>
                                <td>
                                    <asp:TextBox ID="totalchol" runat="server" Text='<%#Eval("Total Chol") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>HDL:</td>
                                <td>
                                    <asp:TextBox ID="hdl" runat="server" Text='<%#Eval("HDL") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>LDL:</td>
                                <td>
                                    <asp:TextBox ID="ldl" runat="server" Text='<%#Eval("LDL") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>TG:</td>
                                <td>
                                    <asp:TextBox ID="tg" runat="server" Text='<%#Eval("TG") %>'/>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step5"
                runat="server" Title="CBC">
                <asp:FormView ID="fv5" runat="server" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding: 3px">
                            <tr>
                                <td>RBC: </td>
                                <td>
                                    <asp:TextBox ID="rbc" runat="server" Text='<%#Eval("RBC") %>'/></td>
                            </tr>
                            <tr>
                                <td>Hgb:</td>
                                <td>
                                    <asp:TextBox ID="hgb" runat="server" Text='<%#Eval("Hgb") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>Hct:</td>
                                <td>
                                    <asp:TextBox ID="hct" runat="server" Text='<%#Eval("Hct") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>MCV:</td>
                                <td>
                                    <asp:TextBox ID="mcv" runat="server" Text='<%#Eval("MCV") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>MCH:</td>
                                <td>
                                    <asp:TextBox ID="mch" runat="server" Text='<%#Eval("MCH") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>MCHC:</td>
                                <td>
                                    <asp:TextBox ID="mchc" runat="server" Text='<%#Eval("MCHC") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td>WBC:</td>
                                <td>
                                    <asp:TextBox ID="WBC" runat="server" Text='<%#Eval("WBC") %>'/>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    <asp:SqlDataSource ID="PatientSrc" ConnectionString="<%$ ConnectionStrings:constr %>" runat="server"
        SelectCommand="SELECT * FROM Patients p INNER JOIN Blood bl ON p.ID=bl.ID
                       INNER JOIN BMP b ON p.ID=b.ID
                       INNER JOIN CBMP cb ON p.ID=cb.ID AND p.ID=@ID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
