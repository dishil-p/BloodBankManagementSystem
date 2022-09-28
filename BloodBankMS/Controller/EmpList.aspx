<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpList.aspx.cs" Inherits="BloodBankMS.Controller.EmpList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employees List</title>
    <link rel="stylesheet" type="text/css" href="../View/Emp.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Blood Bank Management System</h1>
            <h2>Employees List</h2>
            <p>&nbsp;</p>
            <div style="text-align:center;">
            <p >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmpId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Center" Width="475px" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="EmpId" HeaderText="EmpId" InsertVisible="False" ReadOnly="True" SortExpression="EmpId" />
                        <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName" />
                        <asp:BoundField DataField="EmpPass" HeaderText="EmpPass" SortExpression="EmpPass" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBMSConnectionString %>" SelectCommand="SELECT * FROM [EmpTbl]"></asp:SqlDataSource>
            </p>
            </div>
            <p>&nbsp;</p>
            <div style="display: flex;">
                <div class="text">
                    <p>
                        Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtName" runat="server" BackColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    </p>
                    <p>
                        Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPswd" runat="server" BackColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPswd" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                </div>
                <div class="selected">
                    <p style="font-weight: bold; text-decoration: underline;text-align:center">Selected Details</p>
                    <p>
                        Emp Name&nbsp;&nbsp;&nbsp;:&nbsp;
                <asp:Label ID="nameLbl" runat="server" Text="None"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Password&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                <asp:Label ID="pswdLbl" runat="server" Text="None"></asp:Label>
                    </p>
                </div>
            </div>
            <div class="buttons">
            <p>
                <asp:Button ID="saveBtn" style="border-radius: 10px;" runat="server" OnClick="saveBtn_Click" Text="Save" BackColor="#666666" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" Font-Names="Times New Roman" ForeColor="White" Height="30px" Width="100px" Font-Bold="True" Font-Size="18px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="editBtn" style="border-radius: 10px;" runat="server" OnClick="editBtn_Click" Text="Edit" BackColor="#666666" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Times New Roman" ForeColor="White" Height="30px" Width="100px" Font-Size="18px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="deleteBtn" style="border-radius: 10px;" runat="server" CausesValidation="False" OnClick="deleteBtn_Click" Text="Delete" BackColor="#666666" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Times New Roman" ForeColor="White" Height="30px" Width="100px" Font-Size="18px" />
            </p>
            </div>
            <asp:Label ID="resultLbl" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="logOutBtn" style="text-align:center;border-radius:5px; margin-left:44.5%;" runat="server" CausesValidation="False" OnClick="logOutBtn_Click" Text="Log Out" BackColor="Silver" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Times New Roman" Font-Size="18px" ForeColor="Black" Height="30px" Width="150px" />
            <br />
        </div>
        <footer>
            <p style="text-align: center; margin-bottom:0px; background-color: #FF6699; line-height: 25px; font-size: 21px; font-weight: bolder; font-style: italic; text-transform: capitalize; color: #FFFFFF; position: fixed; bottom: 0; width: 100%;">&copy;Dishil Purswani</p>
        </footer>
    </form>
</body>
</html>
