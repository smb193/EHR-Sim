<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="response.aspx.cs" Inherits="Honors_Project.Teach.response" MasterPageFile="~/Master/Site.Master"%>

<asp:Content ContentPlaceHolderID="Main" runat="server">
    <asp:FormView runat="server" DataSourceID="responseSrc">
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        Height (cm):
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("HeightCm") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Weight(kg):
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("WeightKg") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        IBW:
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("IBW") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        %IBW:
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("PIBW") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Calories (HBE):
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("HBE") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Calories (MSJ):
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("MSJ") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Calories (Kcal/kg):
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("Kcal") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Protein:
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("Protein") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Fluids (H-S):
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("FlHS") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Fluids (Age):
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("FlAge") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Fluids (Energy):
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%#Eval("FlEnergy") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        PES:
                    </td>
                    <td>
                        <asp:TextBox runat="server" Wrap="true" TextMode="MultiLine" MaxLength="500" Rows="7" Columns="75" Text='<%#Eval("PES") %>' ReadOnly="true"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Intervention:
                    </td>
                    <td>
                        <asp:TextBox runat="server" Wrap="true" TextMode="MultiLine" MaxLength="500" Rows="7" Columns="75" Text='<%#Eval("Interv") %>' ReadOnly="true"/>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="responseSrc" ConnectionString="<%$ ConnectionStrings:constr %>"
        SelectCommand="SELECT * FROM Response WHERE ID=@ID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>