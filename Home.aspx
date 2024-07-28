<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DDApplication.Home1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width:1150px; height:30px;">

        <tr style="background-color:#06203F">

            <td colspan="2" style="text-align:right">
                <asp:Label ID="Label6" runat="server" Style="text-align:left" Font-Bold="True" Font-Italic="True" Font-Names="Arial" 
                    ForeColor="White"></asp:Label>&nbsp
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="White" 
                    NavigateUrl="~/Login.aspx">Click To Login</asp:HyperLink>&nbsp
                <asp:Button ID="Button1" runat="server" Text="Logout" BackColor="White" BorderColor="Red" BorderWidth="3px" 
                    Font-Bold="True" Font-Names="Arial" ForeColor="Black" Height="27px" Width="105px" OnClick="Button1_Click" />&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" BackColor="#06203F" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="White" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Font-Names="Arial"></asp:DropDownList>&nbsp
                <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="174px"></asp:TextBox>&nbsp
                <asp:ImageButton ID="ImageButton2" runat="server" Height="23px" ImageUrl="~/Images/icons8-search-48 (2).png"
                    Width="25px" OnClick="ImageButton2_Click" />
            </td>

        </tr>

    </table>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        Height="293px" Width="310px" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">

    <ItemTemplate>

        <table>

            <tr>
                <td style="text-align:center; background-color:#06203F">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Pname") %>' Font-Bold="True" 
                        Font-Names="Open Sans Extrabold" Font-Overline="False" ForeColor="White"></asp:Label>
                </td>
            </tr>

            <tr>
                <td style="text-align:center">
                    <asp:Image ID="Image1" runat="server" BorderColor="Black" BorderWidth="1px" Height="279px"
                        Width="278px" ImageUrl='<%# Eval("Pimage") %>' />
                    <div class="stock">
                        &nbsp;Stock:
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Pquantity") %>'></asp:Label>
                    </div>
                </td>
            </tr>

            <tr>
                <td style="text-align:center; background-color:#06203F">
                    <asp:Label ID="Label2" runat="server" Text="Price : $" Font-Bold="True" Font-Names="Arial" ForeColor="White" 
                        Style="text-align:center"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pprice") %>' Font-Bold="True" Font-Names="Arial" 
                        ForeColor="White" Style="text-align:center"></asp:Label>
                </td>
            </tr>

            <tr>
                <td align="center">Quantity
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td style="text-align:center">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" 
                        ImageUrl="~/Images/add-to-cart-button.jpg" Width="160px" 
                        CommandArgument='<%# Eval("PId") %>' CommandName="AddToCart"/>
                </td>
            </tr>

        </table>
        <br />
        <br />
        
    </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RavishkaConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:RavishkaConnectionString.ProviderName %>" 
        SelectCommand="SELECT [PId], [Pname], [Pimage], [Pprice], [Pquantity] FROM [Products1]"></asp:SqlDataSource>
    
</asp:Content>
