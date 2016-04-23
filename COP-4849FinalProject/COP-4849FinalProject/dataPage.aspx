<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dataPage.aspx.cs" Inherits="COP_4849FinalProject.dataPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/custom.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 style="text-align:center">Homstrad150 ANOVA Analysis</h1>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;Table 4 displays scores of all GOIDs for each metric for the Homstrad 150 dataset. The dataset contains 34 unique GOIDs and contains 147 proteins. The table displays only 18 of the 34 GOIDs. These GOIDs represent all that are common to at least two proteins. In each of the remaining 15 GOIDs only a single protein exhibited that function. In addition, there were 2350 protein pairs. For the &quot;Sample by Metric&quot; analysis the F-Critical value is 2.5132: the F-Value is 3.4828. These results support the hypothesis (see table 3).</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp; Figure 21 displays a line graph representing the data from Table 4. One noticable tendency is the lack of clustering of certain metrics in both the high and low regions of the graph. This graph does not depict consistant grouping of metrics in differing &quot;high-low&quot; regions in contrast to the graph in figure 20. There is more variability in the scores. This is especially true in the regions between GOIDs 166 and GOID 3723.&nbsp;</p>
        <p>
            <asp:Image ID="figureImage" runat="server" ImageUrl="~/Images/finalProjectFigure21.png" />
        </p>
        

    </div>

        <h2>GridView Tables</h2>
        <asp:GridView ID="meanScoreGridView" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="DataSetName,GOID" Height="133px">
            <Columns>
                <asp:BoundField DataField="DataSetName" HeaderText="DataSetName" ReadOnly="True" SortExpression="DataSetName" />
                <asp:BoundField DataField="GOID" HeaderText="GOID" ReadOnly="True" SortExpression="GOID" />
                <asp:BoundField DataField="CM" HeaderText="CM" SortExpression="CM" />
                <asp:BoundField DataField="ESM" HeaderText="ESM" SortExpression="ESM" />
                <asp:BoundField DataField="MI" HeaderText="MI" SortExpression="MI" />
                <asp:BoundField DataField="SS" HeaderText="SS" SortExpression="SS" />
                <asp:BoundField DataField="RMSD" HeaderText="RMSD" SortExpression="RMSD" />
                <asp:BoundField DataField="rRMSD" HeaderText="rRMSD" SortExpression="rRMSD" />
                <asp:BoundField DataField="SI" HeaderText="SI" SortExpression="SI" />
                <asp:BoundField DataField="TMSCORE" HeaderText="TMSCORE" SortExpression="TMSCORE" />
                <asp:BoundField DataField="wRMSD" HeaderText="wRMSD" SortExpression="wRMSD" />
                <asp:BoundField DataField="SO" HeaderText="SO" SortExpression="SO" />
                <asp:BoundField DataField="SectionNumber" HeaderText="SectionNumber" SortExpression="SectionNumber" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:teamprojConnectionString %>" ProviderName="<%$ ConnectionStrings:teamprojConnectionString.ProviderName %>" SelectCommand="SELECT DataSetName, GOID, CM, ESM, MI, SS, RMSD, rRMSD, SI, TMSCORE, wRMSD, SO, SectionNumber FROM meanrankscoretable"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="ANOVAGridView" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="DataSetName">
            <Columns>
                <asp:BoundField DataField="DataSetName" HeaderText="DataSetName" ReadOnly="True" SortExpression="DataSetName" />
                <asp:BoundField DataField="DF_Metric" HeaderText="DF_Metric" SortExpression="DF_Metric" />
                <asp:BoundField DataField="DF_Error" HeaderText="DF_Error" SortExpression="DF_Error" />
                <asp:BoundField DataField="DF_CTotal" HeaderText="DF_CTotal" SortExpression="DF_CTotal" />
                <asp:BoundField DataField="SS_Metric" HeaderText="SS_Metric" SortExpression="SS_Metric" />
                <asp:BoundField DataField="SS_Error" HeaderText="SS_Error" SortExpression="SS_Error" />
                <asp:BoundField DataField="SS_CTotal" HeaderText="SS_CTotal" SortExpression="SS_CTotal" />
                <asp:BoundField DataField="MS_Metric" HeaderText="MS_Metric" SortExpression="MS_Metric" />
                <asp:BoundField DataField="MS_Error" HeaderText="MS_Error" SortExpression="MS_Error" />
                <asp:BoundField DataField="F_Ratio" HeaderText="F_Ratio" SortExpression="F_Ratio" />
                <asp:BoundField DataField="ProbF" HeaderText="ProbF" SortExpression="ProbF" />
                <asp:BoundField DataField="SectionNumber" HeaderText="SectionNumber" SortExpression="SectionNumber" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:teamprojConnectionString %>" ProviderName="<%$ ConnectionStrings:teamprojConnectionString.ProviderName %>" SelectCommand="SELECT * FROM anovatable"></asp:SqlDataSource>
        <asp:HyperLink ID="dataPageLink" runat="server" NavigateUrl="~/MainPage.aspx">Home</asp:HyperLink>
    </form>
</body>
</html>
