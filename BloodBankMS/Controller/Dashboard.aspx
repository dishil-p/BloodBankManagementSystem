<%@ Page Title="" Language="C#" MasterPageFile="~/Controller/BBMS.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BloodBankMS.Controller.Dashboard" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 60%;
            height: 224px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align:center; margin-top:0px; margin-left:0%; text-decoration:underline;">Dashboard</h2>
    <p style="text-align:center; margin-top:0px; margin-left:0%; ">Details of Registered Members&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blood Transfers Details</p>

    <div style ="display:flex; width:975px;">
    <table class="auto-style1" style="margin-left:10%;font-family: 'Times New Roman', Times, serif; font-size: 18px; text-align:center; width:300px; border:2px solid black;">
        <tr>
            <td>Title</td>
            <td>Count</td>
        </tr>
        <tr>
            <td>Users</td>
            <td>
                <asp:Label ID="userLbl" runat="server" Text="Count of Users"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Donors</td>
            <td>
                <asp:Label ID="donorLbl" runat="server" Text="No of Donors"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Patients</td>
            <td>
                <asp:Label ID="patientLbl" runat="server" Text="No of Patients"></asp:Label>
            </td>
        </tr>
    </table>
    <p style="margin-left:8%;margin-top: 0px;margin-right:0px;">
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="498px">
            <series>
                <asp:Series Name="Series1" XValueMember="BGroup" YValueMembers="Expr1">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBMSConnectionString %>" SelectCommand="SELECT COUNT(*) AS Expr1, BGroup FROM TransferTbl GROUP BY BGroup"></asp:SqlDataSource>
    </p>
    </div>
    <p>&nbsp;</p>
</asp:Content>
