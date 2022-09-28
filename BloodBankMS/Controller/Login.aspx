<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BloodBankMS.Controller.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="../View/Login.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Blood Bank Management System</h1>
            <h2>Login</h2>
        </div>
        <p>
            &nbsp;</p>
        <div class ="formArea">
        <p>
            Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUname" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            &nbsp;Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPswd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPswd" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            &nbsp;<asp:Button ID="loginBtn" runat="server" OnClick="loginBtn_Click" Text="Login" BackColor="#FF6699" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" ForeColor="White" Font-Bold="True" />
        </p>
        <p>
            <asp:Button ID="adminBtn" runat="server" CausesValidation="False" OnClick="adminBtn_Click" Text="Login As Admin" BackColor="#666666" BorderColor="White" BorderStyle="Solid" BorderWidth="4px" ForeColor="White" />
        </p>
            </div>
    </form>
</body>
</html>
