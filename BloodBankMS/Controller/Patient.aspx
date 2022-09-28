﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Controller/BBMS.Master" AutoEventWireup="true" CodeBehind="Patient.aspx.cs" Inherits="BloodBankMS.Controller.Patient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        margin-left: 40px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contentArea" style="margin-left:100px;">
     <h2 style="text-align:center; text-decoration: underline;">Patient Page</h2>

    <p>&nbsp;</p>
    <p class="auto-style1">
        Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;<asp:TextBox ID="txtName" runat="server" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPhone" runat="server" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPhone" ErrorMessage="*Invalid" ForeColor="Red" MaximumValue="9999999999" MinimumValue="6260000000"></asp:RangeValidator>
        <br />

    </p>

    <p class="auto-style1">Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="txtAge" runat="server" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAge" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtAge" ErrorMessage="*Invalid" ForeColor="Red" MaximumValue="75" MinimumValue="12"></asp:RangeValidator>
        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>

    <p id="tttt" class="auto-style1">Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<asp:DropDownList ID="ddlGender" runat="server" BackColor="White">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            <asp:ListItem>Trans</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlGender" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;
        
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blood Group&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlBGroup" runat="server" DataSourceID="SqlDataSource1" DataTextField="BGroup" DataValueField="BGroup" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" BackColor="White">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBMSConnectionString %>" SelectCommand="SELECT [BGroup] FROM [BloodTbl]"></asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlBGroup" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p class="auto-style2">&nbsp;</p>
    <br />
    <br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


    <asp:Button ID="Registerb" runat="server" Text="Register" onClick ="InsertPatient" BorderColor="#333333" BorderStyle="Solid" BackColor="#999999" BorderWidth="3px" Font-Names="Times New Roman" Font-Size="16px" Height="30px" Width="150px"/>
    <asp:Label ID="RegisterLbl" runat="server"></asp:Label>
    
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
        </div>
</asp:Content>
