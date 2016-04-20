<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dataPage.aspx.cs" Inherits="COP_4849FinalProject.dataPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 style="text-align:center">Homstrad150 ANOVA Analysis</h1>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;Table 4 displays scores of all GOIDs for each metric for the Homstrad 150 dataset. The dataset contains 34 unique GOIDs and contains 147 proteins. The table displays only 18 of the 34 GOIDs. These GOIDs represent all that are common to at least two proteins. In each of the remaining 15 GOIDs only a single protein exhibited that function. In addition, there were 2350 protein pairs. For the &quot;Sample by Metric&quot; analysis the F-Critical value is 2.5132: the F-Value is 3.4828. These results support the hypothesis (see table 3).</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp; Figure 21 displays a line graph representing the data from Table 4. One noticable tendency is the lack of clustering of certain metrics in both the high and low regions of the graph. This graph does not depict consistant grouping of metrics in differing &quot;high-low&quot; regions in contrast to the graph in figure 20. There is more variability in the scores. This is especially true in the regions between GOIDs 166 and GOID 3723.&nbsp;</p>
        <p>
            <asp:Image ID="figureImage" runat="server" ImageUrl="~/Images/finalProjectFigure21.png" Height="1276px" />
        </p>
        

    </div>
        <asp:GridView ID="meanScoreGridView" runat="server">
        </asp:GridView>
        <br />
        <asp:GridView ID="ANOVAGridView" runat="server">
        </asp:GridView>
        <br />
        <asp:HyperLink ID="homePageHyperlink" runat="server" NavigateUrl="~/MainPage.aspx">Home</asp:HyperLink>
    </form>
</body>
</html>
