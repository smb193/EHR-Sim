<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="response.aspx.cs" Inherits="Honors_Project.response" MasterPageFile="~/Master/Site.Master" Title="Chart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <asp:Wizard ID="Wizard1" runat="server"
        CancelDestinationPageUrl="~/index.aspx"
        CancelButtonText="Return to Home"
        FinishCompleteButtonText="Submit"
        FinishDestinationPageUrl="~/index.aspx"
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
        OnFinishButtonClick="Wizard_FinishButtonClick">
        <WizardSteps>
            <asp:WizardStep
                ID="Step1"
                runat="server" Title="Anthro">
                <asp:FormView runat="server" ID="fv1" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding:3px">
                            <tr>
                                <td>Name:</td>
                                <td>
                                    <asp:Label ID="lname" runat="server" Text='<%#Eval("LName") %>' />,
                                    <asp:Label ID="fname" runat="server" Text='<%#Eval("FName") %>' /></td>
                            </tr>
                            <tr>
                                <td>Age:</td>
                                <td>
                                    <asp:Label ID="Age" runat="server" Text='<%#Eval("Age") %>' /></td>
                            </tr>
                            <tr>
                                <td>Sex:</td>
                                <td>
                                    <asp:Label ID="sex" runat="server" Text='<%#Eval("Sex") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Height (in):</td>
                                <td>
                                    <asp:Label ID="Heightin" runat="server" Text='<%#Eval("HeightIn") %>' /></td>
                            </tr>
                            <tr>
                                <td>Height (cm): </td>
                                <td>
                                    <asp:TextBox ID="HeightCm" runat="server" Columns="8" /></td>
                            </tr>
                            <tr>
                                <td>Weight (lb):</td>
                                <td>
                                    <asp:Label ID="Weightlb" runat="server" Text='<%#Eval("WeightLb") %>' /></td>
                            </tr>
                            <tr>
                                <td>Weight (kg):</td>
                                <td>
                                    <asp:TextBox ID="WeightKg" runat="server" Columns="8" /></td>
                            </tr>
                            <tr>
                                <td>IBW:</td>
                                <td>
                                    <asp:TextBox ID="ibw" runat="server" Columns="8" /></td>
                            </tr>
                            <tr>
                                <td>%IBW:</td>
                                <td>
                                    <asp:TextBox ID="pibw" runat="server" Columns="8" /></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step2"
                runat="server" Title="Background">
                <asp:FormView runat="server" ID="fv2" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding:3px">
                            <tr><td>Background:</td><td><asp:TextBox ID="bg" runat="server" Wrap="true" TextMode="MultiLine" MaxLength="500" Rows="7" Columns="75" Text='<%#Eval("Background") %>' ReadOnly="true"/></td></tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step3"
                runat="server" Title="BMP">
                <asp:FormView runat="server" ID="fv3" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding:3px">
                            <tr>
                                <td>Glucose: </td>
                                <td>
                                    <asp:Label ID="glucose" runat="server" Text='<%#Eval("Glucose") %>' /></td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>CO2:</td>
                                <td>
                                    <asp:Label ID="co2" runat="server" Text='<%#Eval("CO2") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Sodium:</td>
                                <td>
                                    <asp:Label ID="sodium" runat="server" Text='<%#Eval("Sodium") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Potassium:</td>
                                <td>
                                    <asp:Label ID="Potassium" runat="server" Text='<%#Eval("Potassium") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Chloride:</td>
                                <td>
                                    <asp:Label ID="Chloride" runat="server" Text='<%#Eval("Chloride") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>BUN:</td>
                                <td>
                                    <asp:Label ID="bun" runat="server" Text='<%#Eval("BUN") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Creatinine:</td>
                                <td>
                                    <asp:Label ID="Creatinine" runat="server" Text='<%#Eval("Creatinine") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step4"
                runat="server" Title="CMP">
                <asp:FormView runat="server" ID="fv4" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding:3px">
                            <tr>
                                <td>Calcium: </td>
                                <td>
                                    <asp:Label ID="Calcium" runat="server" Text='<%#Eval("Calcium") %>' /></td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Albumin:</td>
                                <td>
                                    <asp:Label ID="albumin" runat="server" Text='<%#Eval("Albumin") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Protein:</td>
                                <td>
                                    <asp:Label ID="protein" runat="server" Text='<%#Eval("Protein") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>ALP:</td>
                                <td>
                                    <asp:Label ID="alp" runat="server" Text='<%#Eval("ALP") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>ALT:</td>
                                <td>
                                    <asp:Label ID="alt" runat="server" Text='<%#Eval("ALT") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>AST:</td>
                                <td>
                                    <asp:Label ID="ast" runat="server" Text='<%#Eval("AST") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Bilirubin:</td>
                                <td>
                                    <asp:Label ID="bilirubin" runat="server" Text='<%#Eval("Bilirubin") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Total Cholesterol:</td>
                                <td>
                                    <asp:Label ID="totalchol" runat="server" Text='<%#Eval("Total Chol") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>HDL:</td>
                                <td>
                                    <asp:Label ID="hdl" runat="server" Text='<%#Eval("HDL") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>LDL:</td>
                                <td>
                                    <asp:Label ID="ldl" runat="server" Text='<%#Eval("LDL") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>TG:</td>
                                <td>
                                    <asp:Label ID="tg" runat="server" Text='<%#Eval("TG") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step5"
                runat="server" Title="CBC">
                <asp:FormView runat="server" ID="fv5" DataSourceID="PatientSrc">
                    <ItemTemplate>
                        <table style="padding:3px">
                            <tr>
                                <td>RBC: </td>
                                <td>
                                    <asp:Label ID="rbc" runat="server" Text='<%#Eval("RBC") %>' /></td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Hgb:</td>
                                <td>
                                    <asp:Label ID="hgb" runat="server" Text='<%#Eval("Hgb") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Hct:</td>
                                <td>
                                    <asp:Label ID="hct" runat="server" Text='<%#Eval("Hct") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>MCV:</td>
                                <td>
                                    <asp:Label ID="mcv" runat="server" Text='<%#Eval("MCV") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>MCH:</td>
                                <td>
                                    <asp:Label ID="mch" runat="server" Text='<%#Eval("MCH") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>MCHC:</td>
                                <td>
                                    <asp:Label ID="mchc" runat="server" Text='<%#Eval("MCHC") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>WBC:</td>
                                <td>
                                    <asp:Label ID="WBC" runat="server" Text='<%#Eval("WBC") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem>--</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step6"
                runat="server" Title="Needs">
                <table style="padding:3px">
                    <tr><td>Calories (HBE):</td><td><asp:TextBox ID="hbe" runat="server"/></td></tr>
                    <tr><td>Calories (MSJ):</td><td><asp:TextBox ID="msj" runat="server"/></td></tr>
                    <tr><td>Calories (Kcal/kg):</td><td><asp:TextBox ID="kcal" runat="server"/></td></tr>
                    <tr><td>Protein:</td><td><asp:TextBox ID="proteinTxt" runat="server"/></td></tr>
                    <tr><td>Fluid (H-S):</td><td><asp:TextBox ID="hs" runat="server"/></td></tr>
                    <tr><td>Fluid (Age):</td><td><asp:TextBox ID="flage" runat="server"/></td></tr>
                    <tr><td>Fluid (Energy):</td><td><asp:TextBox ID="energy" runat="server"/></td></tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep
                ID="Step7"
                runat="server" Title="PES">
                <table style="padding: 3px">
                    <tr>
                        <td>PES Statement:</td>
                        <td>
                            <asp:TextBox ID="pes" runat="server" Wrap="true" TextMode="MultiLine" MaxLength="500" Rows="7" Columns="75" /></td>
                    </tr>
                    <tr>
                        <td>Intervention:</td>
                        <td>
                            <asp:TextBox ID="interv" runat="server" Wrap="true" TextMode="MultiLine" MaxLength="500" Rows="7" Columns="75" /></td>
                    </tr>
                </table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    <asp:SqlDataSource ID="PatientSrc" ConnectionString="<%$ ConnectionStrings:constr %>" runat="server"
        SelectCommand="SELECT * FROM Patients p INNER JOIN Blood bl ON p.ID=bl.ID
                       INNER JOIN BMP b ON p.ID=b.ID
                       INNER JOIN CBMP cb ON p.ID=cb.ID
                       INNER JOIN PatientClass pc ON p.ID=pc.PatientID AND pc.ID=@ID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
