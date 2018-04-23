Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.XtraPrinting
Imports System.IO

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim printingSystem As New PrintingSystem()
        Dim printableComponentLink As New PrintableComponentLink(printingSystem)
        printableComponentLink.PrintingSystem = printingSystem
        printableComponentLink.PrintingSystemBase = printingSystem
        printableComponentLink.Component = ASPxPivotGridExporter1

        printableComponentLink.CreateDocument()
        printingSystem.PageSettings.Landscape = ASPxCheckBox2.Checked

        printingSystem.Document.AutoFitToPagesWidth = If(ASPxCheckBox1.Checked, 1, 0)

        Using stream As New MemoryStream()
            printingSystem.ExportToPdf(stream)
            ExportToResponse(stream, "Pivot", "pdf", "application/pdf", True)
        End Using
    End Sub

    Protected Sub ExportToResponse(ByVal stream As MemoryStream, ByVal fileName As String, ByVal fileFormat As String, ByVal contentType As String, ByVal saveAsFile As Boolean)
        If Page Is Nothing OrElse Page.Response Is Nothing Then
            Return
        End If
        If String.IsNullOrEmpty(fileName) Then
            fileName = "ASPxPivotGrid"
        End If
        Dim disposition As String = If(saveAsFile, "attachment", "inline")
        Page.Response.Clear()
        Page.Response.Buffer = False
        Page.Response.AppendHeader("Content-Type", contentType)
        Page.Response.AppendHeader("Content-Transfer-Encoding", "binary")
        Page.Response.AppendHeader("Content-Disposition", String.Format("{0}; filename={1}.{2}", disposition, HttpUtility.UrlEncode(fileName).Replace("+", "%20"), fileFormat))
        Page.Response.BinaryWrite(stream.ToArray())
        Page.Response.End()
    End Sub
End Class
