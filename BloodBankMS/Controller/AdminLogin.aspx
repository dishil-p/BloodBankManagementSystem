<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="BloodBankMS.Controller.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login Page</title>
    <link rel="stylesheet" type="text/css" href="../View/Admin.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Blood Bank Management System</h1>
            <h2>Admin Login Page</h2>
        </div>
        <p>
            &nbsp;</p>
        <div class="formArea">
        <p>
            Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPswd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPswd" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="testLbl" runat="server"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="loginBtn" runat="server" OnClick="loginBtn_Click" Text="Login" BackColor="#FF6699" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" ForeColor="White" />
        </p>
            <p >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="cancelBtn" runat="server" CausesValidation="False" OnClick="cancelBtn_Click" Text="Cancel" BackColor="#666666" BorderColor="White" BorderStyle="Solid" BorderWidth="4px" ForeColor="White" />
        </p>
        </div>
    </form>
</body>
</html>
