<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="DDApplication.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
        <div class="navbar" style="border-width:3px; border-color:#06203F">
            <table align="center" style="width:1200px; height:410px; background-color:aliceblue" border="0" >
                <tr>
                    <td colspan="2" align="center">
                        <h2>Add Category</h2><hr />
                        <br />
                    </td>
                </tr>

                <tr>
                    <td>
                        <b style="font-size:22px; font-weight:bold;">Category</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CausesValidation="True" Height="44px" Width="230px"
                            placeholder="Name of Category" BorderColor="#003366" BorderWidth="2px" Font-Bold="True" 
                            Font-Size="Medium" ForeColor="Black"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Enter Your Category Name" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Add" Height="44px" Width="80px" Font-Size="Medium" OnClick="Button1_Click" Font-Bold="True" /><hr />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><br /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                        BorderColor="#003366" BorderWidth="2px" DataKeyNames="CategoryId" 
                        EmptyDataText="No Records To Display" Font-Bold="True" HeaderStyle-BorderColor="Black" 
                        HeaderStyle-BorderWidth="3px" Font-Size="Large" PageSize="4" Width="257px" CssClass="auto-style1" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="Category">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Font-Bold="True" Text='<%# Eval("CategoryName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                       <HeaderStyle BorderColor="Black" BorderWidth="3px"></HeaderStyle>
                   </asp:GridView>
                    </td>
                    </table>
        </div>
    </center>
</asp:Content>
