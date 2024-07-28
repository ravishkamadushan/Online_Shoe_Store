<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct02.aspx.cs" Inherits="DDApplication.AddProduct02" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="navbar" style="border-width:3px; border-color:#333333; height:auto">

            <table style="width:1200px; height:390px; background-color:aliceblue" align="center">
                <tr>
                    <td align="center" width="50%" colspan="2">
                        <h1>Adding Product</h1><hr />
            </td>
                </tr>

                <tr>
                    <td align="center" width="50%">
                        <h3>Category</h3>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" 
                            DataTextField="CategoryName" DataValueField="CategoryName"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Ctaegory Is Mandetory" ControlToValidate="DropDownList1" 
                            Display="Dynamic" ForeColor="Red" InitialValue="Select">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="50%">
                        <h3>Product Name</h3>
                    </td>
                    <td width="50%">
                        <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="Product Name Is Mandatory" ControlToValidate="TxtName" 
                            Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="50%">
                        <h3>Product Desc</h3>
                    </td>
                    <td width="50&">
                        <asp:TextBox ID="TxtDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="Product Desc is Mandatory" ControlToValidate="TxtDesc" 
                            Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="50%">
                        <h3>Image</h3>
                    </td>
                    <td width="50%">
                        <asp:FileUpload ID="imageUpload" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="Image is Mandatory" ControlToValidate="ImageUpload" 
                            Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="50%">
                        <h3>
                            Product Price($):
                        </h3>
                    </td>
                    <td width="50%">
                        <asp:TextBox ID="TxtPrice" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ErrorMessage="Price is Mnadatory" ControlToValidate="TxtPrice" Display="Dynamic" 
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="50%">
                        <h3>Product Quantity</h3>
                    </td>
                    <td width="50%">
                        <asp:TextBox ID="TxtQuantity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ErrorMessage="Quantity is Mandatory" ControlToValidate="TxtQuantity" 
                            Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="Quantity is Invalid" ControlToValidate="TxtQuantity" 
                            Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="50%" colspan="2" class="auto-style1">
                        <asp:Button ID="btnSubmit" runat="server" Text="Add" Font-Bold="True" Height="36px" Width="88px" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                            HeaderText="Fix the following Error" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RavishkaConnectionString %>" 
                SelectCommand="SELECT * FROM [PRCategory]"></asp:SqlDataSource>
        </div>

</asp:Content>
