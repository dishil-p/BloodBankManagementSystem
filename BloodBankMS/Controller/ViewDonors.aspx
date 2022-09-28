<%@ Page Title="" Language="C#" MasterPageFile="~/Controller/BBMS.Master" AutoEventWireup="true" CodeBehind="ViewDonors.aspx.cs" Inherits="BloodBankMS.Controller.ViewDonors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <h2 style="text-align:center; font-size: 30px; margin-left:50px; margin-top:0px;margin-bottom:10px; text-decoration: underline;" >Donor's List</h2>
    <asp:GridView style="text-align:center; margin-left:50px;" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Font-Names="Times New Roman" Font-Size="20px" Height="105px" HorizontalAlign="Center" Width="858px" CellPadding="0" AllowPaging="True">
        <Columns >
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
    
    <div style="margin-left:10%;">
    <p class="auto-style1">
        Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;<asp:TextBox ID="txtName" runat="server" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPhone" runat="server" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="*RequiredField" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />

    </p>

    <p class="auto-style1">Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="txtAge" runat="server" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAge" ErrorMessage="*Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" BackColor="White"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="*RequiredField" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>

    <p id="tttt" class="auto-style1">Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<asp:DropDownList ID="ddlGender" runat="server" BackColor="White">
            <asp:ListItem>null</asp:ListItem>
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            <asp:ListItem>Trans</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlGender" ErrorMessage="*RequiredField" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;
        
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Blood Group&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlBGroup" runat="server" DataSourceID="SqlDataSource2" DataTextField="BGroup" DataValueField="BGroup" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" BackColor="White">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BBMSConnectionString %>" SelectCommand="SELECT [BGroup] FROM [BloodTbl]"></asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlBGroup" ErrorMessage="*RequiredField" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Selected Donor Id&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp; <asp:Label ID="selectLbl" runat="server" Text="None"></asp:Label>
    <br />
    <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" OnClick="editBtn_Click" Text="Edit" BackColor="#666666" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" Font-Names="Times New Roman" Font-Size="16px" Height="30px" Width="150px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="deleteBtn_Click" Text="Delete" BackColor="#666666" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" Font-Names="times new roman" Font-Size="16px" Height="30px" Width="150px" />
    <br />
    <asp:Label ID="resultLbl" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>

</asp:Content>
