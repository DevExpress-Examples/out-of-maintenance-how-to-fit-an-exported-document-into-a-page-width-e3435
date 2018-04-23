using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.XtraPrinting;
using System.IO;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        PrintingSystem printingSystem = new PrintingSystem();
        PrintableComponentLink printableComponentLink = new PrintableComponentLink(printingSystem );
        printableComponentLink.PrintingSystem = printingSystem;
        printableComponentLink.PrintingSystemBase = printingSystem;
        printableComponentLink.Component = ASPxPivotGridExporter1;

        printableComponentLink.CreateDocument();
        printingSystem.PageSettings.Landscape = ASPxCheckBox2.Checked;

        printingSystem.Document.AutoFitToPagesWidth = ASPxCheckBox1.Checked ? 1 : 0  ;

        using (MemoryStream stream = new MemoryStream())
        {
            printingSystem.ExportToPdf(stream);
            ExportToResponse(stream, "Pivot", "pdf", "application/pdf", true);
        }
    }

    protected void ExportToResponse(MemoryStream stream, string fileName, string fileFormat, string contentType, bool saveAsFile)
    {
        if (Page == null || Page.Response == null) return;
        if (String.IsNullOrEmpty(fileName)) fileName = "ASPxPivotGrid";
        string disposition = saveAsFile ? "attachment" : "inline";
        Page.Response.Clear();
        Page.Response.Buffer = false;
        Page.Response.AppendHeader("Content-Type", contentType);
        Page.Response.AppendHeader("Content-Transfer-Encoding", "binary");
        Page.Response.AppendHeader("Content-Disposition", string.Format("{0}; filename={1}.{2}", disposition,
            HttpUtility.UrlEncode(fileName).Replace("+", "%20"), fileFormat));
        Page.Response.BinaryWrite(stream.ToArray());
        Page.Response.End();
    }
}
