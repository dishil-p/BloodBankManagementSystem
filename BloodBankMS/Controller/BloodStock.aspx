<%@ Page Title="" Language="C#" MasterPageFile="~/Controller/BBMS.Master" AutoEventWireup="true" CodeBehind="BloodStock.aspx.cs" Inherits="BloodBankMS.Controller.BloodStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 480px;
        }
        .auto-style4 {
            margin-left: 280px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 style="text-align:center; text-decoration: underline; margin-top:0px;" class="auto-style4">Blood Stock</h2>
    <p class="auto-style1" style="margin-left:63%;">Filter :
        <asp:DropDownList ID="ddlBGroup" runat="server" DataSourceID="SqlDataSource1" DataTextField="BGroup" DataValueField="BGroup" OnSelectedIndexChanged="GetStockByBGroup" AutoPostBack="True" BackColor="White">
        </asp:DropDownList>
    </p>
    <div style="text-align:center;" class="auto-style4">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:GridView ID="BloodGV" runat="server" AutoGenerateColumns="False" DataKeyNames="BGroup" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Height="238px" HorizontalAlign="Center" Width="453px">
        <Columns>
            <asp:BoundField DataField="BGroup" HeaderText="BGroup" ReadOnly="True" SortExpression="BGroup" />
            <asp:BoundField DataField="BStock" HeaderText="BStock" SortExpression="BStock" />
        </Columns>
    </asp:GridView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBMSConnectionString %>" SelectCommand="SELECT * FROM [BloodTbl]"></asp:SqlDataSource>
    <p>&nbsp;</p>
    <p>&nbsp;</p>

</asp:Content>
