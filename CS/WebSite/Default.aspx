<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v21.2, Version=21.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dxpgw" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v21.2, Version=21.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dxwpg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" DataSourceID="SqlDataSource1" ClientIDMode="AutoID"
            IsMaterialDesign="False" OptionsData-DataProcessingEngine="Optimized">
            <Fields>
                <dxwpg:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0" Width="50">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="CompanyName" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0" UseNativeFormat="False">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="ProductAmount" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldOrderYear" Area="ColumnArea" AreaIndex="0" >
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="OrderDate" GroupInterval="DateYear" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldProductName" AreaIndex="0" RowValueLineCount="3">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="ProductName" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField ID="fieldOrderQuarter" Area="ColumnArea" AreaIndex="1" 
                    Caption="Quarter" UnboundFieldName="fieldOrderQuarter">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="OrderDate" GroupInterval="DateQuarter" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
            </Fields>
            <OptionsData DataProcessingEngine="Optimized" />
        </dxwpg:ASPxPivotGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT [CompanyName], [ProductAmount], [OrderDate], [ProductName] FROM [CustomerReports]"></asp:SqlDataSource>
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
