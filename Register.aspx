<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DDApplication.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" style="padding: 3px; background-color: #FFFFFF;" class="auto-style1" border="1">
                <tr>
                    <td colspan="2" align="center" class="auto-style2" style="background-color: #0066FF; color: #FFFFFF">
                        <h2>User Registration</h2> 

                    </td>
                </tr>

                 <tr>
                    <td colspan="2" align="center" class="auto-style2">
                        <asp:Image ID="Image1" runat="server" Height="234px" ImageUrl="~/Images/UserReg.jpg" />

                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>First Name</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" BackColor="White" Height="33px" Width="255px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First name is empty" 
                            ForeColor="Red" ControlToValidate="TextBox1" BorderColor="White">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only Charactors Required" ControlToValidate="TextBox1" ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>Last Name</b>
                    </td>
                    <td>
                        
                        <asp:TextBox ID="TextBox2" runat="server" BackColor="White" Height="33px" Width="255px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last name is empty" 
                            ForeColor="Red" ControlToValidate="TextBox2" BorderColor="White">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Only Charactors Required" ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>Email Address</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" BackColor="White" Height="33px" Width="255px" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Address is empty" 
                            ForeColor="Red" ControlToValidate="TextBox3" BorderColor="White">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                    <b>Phone Number</b>
                     </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" BackColor="White" Height="33px" Width="255px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone Number is empty" 
                            ForeColor="Red" ControlToValidate="TextBox4" BorderColor="White">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Phone Number" ControlToValidate="TextBox4" ForeColor="Red" ValidationExpression="[0-9]{10}">*</asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>Password</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" BackColor="White" Height="33px" Width="255px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password is empty" 
                            ForeColor="Red" ControlToValidate="TextBox5" BorderColor="White">*</asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                <td align="center" style="width:50%">
                    <b>Confirm Password</b>
                </td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" BackColor="White" Height="33px" Width="255px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Confirmation is empty" 
                            ForeColor="Red" ControlToValidate="TextBox6" BorderColor="White">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password is not Match" ControlToCompare="TextBox5" ControlToValidate="TextBox6" ForeColor="Red">*</asp:CompareValidator>

                    </td>
                    </tr>

                <tr>
                    <td align="center" colspan="2" >
                        <asp:Button ID="Button1" runat="server" Text="Register" Height="44px" Width="116px" BackColor="#0066FF" BorderStyle="Double" ForeColor="White" OnClick="Button1_Click" />
                    </td>   
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
