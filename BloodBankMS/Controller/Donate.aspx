<%@ Page Title="" Language="C#" MasterPageFile="~/Controller/BBMS.Master" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="BloodBankMS.Controller.Donate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 120px;
        }
        .auto-style3 {
            margin-left: 80px;
        }
        .auto-style4 {
            margin-left: 280px;
        }
        .auto-style5 {
            margin-left: 360px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <h2 style="text-align:center; text-decoration: underline; margin-top:0px; margin-bottom:10px;">Donate Blood</h2>
        <p style="text-align:center; margin-top:0px; margin-bottom:10px;">Filter :
        <asp:DropDownList ID="ddlBGroup" runat="server" DataSourceID="SqlDataSource3" DataTextField="BGroup" DataValueField="BGroup" OnSelectedIndexChanged="GetStockByBGroup" AutoPostBack="True" BackColor="White">
        </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BBMSConnectionString %>" SelectCommand="SELECT [BGroup] FROM [BloodTbl]"></asp:SqlDataSource>
        </p>
        <p style="text-align:center; font-weight: bold; font-size: 20px;" class="auto-style4">Donors List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blood Stock</p>
   <div class="auto-style3" style="display:flex;">    
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="DId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" BackColor="#66FFFF" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="DId" HeaderText="DId" InsertVisible="False" ReadOnly="True" SortExpression="DId" />
                <asp:BoundField DataField="DName" HeaderText="DName" SortExpression="DName" />
                <asp:BoundField DataField="DAge" HeaderText="DAge" SortExpression="DAge" />
                <asp:BoundField DataField="DGender" HeaderText="DGender" SortExpression="DGender" />
                <asp:BoundField DataField="DPhone" HeaderText="DPhone" SortExpression="DPhone" />
                <asp:BoundField DataField="DAddress" HeaderText="DAddress" SortExpression="DAddress" />
                <asp:BoundField DataField="DBGroup" HeaderText="DBGroup" SortExpression="DBGroup" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBMSConnectionString %>" SelectCommand="SELECT * FROM [DonorTbl]"></asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;
    
    <p class="auto-style1">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="BGroup" DataSourceID="SqlDataSource2" BackColor="#66FFFF">
            <Columns>
                <asp:BoundField DataField="BGroup" HeaderText="BGroup" ReadOnly="True" SortExpression="BGroup" />
                <asp:BoundField DataField="BStock" HeaderText="BStock" SortExpression="BStock" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BBMSConnectionString %>" SelectCommand="SELECT * FROM [BloodTbl]"></asp:SqlDataSource>
    </p>
        </div>
    <p class="auto-style1">
        Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtName" runat="server" BackColor="White"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BGroup&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBGroup" runat="server" BackColor="White"></asp:TextBox>
&nbsp;&nbsp;
    </p>
        <p class="auto-style5">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="donateBtn" style="margin-top:20px;" runat="server" OnClick="donateBtn_Click" Text="Donate" BackColor="#999999" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" Font-Names="Times New Roman" Font-Size="16px" Height="30px" Width="150px" />
        <asp:Label ID="testLbl" runat="server"></asp:Label>
    </p>


</asp:Content>
