<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v14.2, Version=14.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dxpgw" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v14.2, Version=14.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dxwpg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" DataSourceID="AccessDataSource1">
            <Fields>
                <dxwpg:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0" 
                    FieldName="CompanyName" Width="50">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0" FieldName="ProductAmount" UseNativeFormat="False">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldOrderDate" Area="ColumnArea" AreaIndex="0" FieldName="OrderDate"
                    GroupInterval="DateYear" UnboundFieldName="fieldOrderDate">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldProductName" AreaIndex="0" 
                    FieldName="ProductName" RowValueLineCount="3">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldOrderQuarter" Area="ColumnArea" AreaIndex="1" 
                    Caption="Quarter" FieldName="OrderDate" GroupInterval="DateQuarter">
                </dxwpg:PivotGridField>
            </Fields>
        </dxwpg:ASPxPivotGrid>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [CompanyName], [ProductAmount], [OrderDate], [ProductName] FROM [CustomerReports]">
        </asp:AccessDataSource>
        <dxwpg:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server">
        </dxwpg:ASPxPivotGridExporter>
        <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Text="Fit to page width">
        </dx:ASPxCheckBox>
        <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" Text="Landscape">
        </dx:ASPxCheckBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Export" 
            style="height: 26px" />

    </div>
    </form>
</body>
</html>