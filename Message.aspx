<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="DDApplication.Message" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div>
            <table align="center" style="padding: 3px; background-color: #FFFFFF;" class="auto-style1" border="1">
                <tr>
                    <td colspan="2" align="center" class="auto-style2" style="background-color: #0066FF; color: #FFFFFF">
                        <h2>How Can We Help You !!</h2> 

                    </td>
                </tr>

                 <tr>
                    <td colspan="2" align="center" class="auto-style2">
                        <asp:Image ID="Image1" runat="server" Height="192px" ImageUrl="~/Images/asfgga.jpg" Width="530px" />

                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>Name</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" BackColor="White" Height="33px" Width="255px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>Email</b>
                    </td>
                    <td>
                        
                        <asp:TextBox ID="TextBox2" runat="server" BackColor="White" Height="33px" Width="255px"></asp:TextBox>  
                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>Phone Number</b>
                    </td>
                    <td>
                        
                        <asp:TextBox ID="TextBox3" runat="server" BackColor="White" Height="33px" Width="255px"></asp:TextBox>  
                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>Message</b>
                    </td>
                    <td>
                        
                        <asp:TextBox ID="TextBox4" runat="server" BackColor="White" Height="33px" Width="255px" TextMode="MultiLine"></asp:TextBox>  
                    </td>
                </tr>

                <tr>
                    <td align="center" colspan="2" >
                        <asp:Button ID="Button1" runat="server" Text="Submit" Height="44px" Width="116px" BackColor="#0066FF" BorderStyle="Double" ForeColor="White" OnClick="Button1_Click" />
                        <br />  
                    </td>   
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

</asp:Content>
