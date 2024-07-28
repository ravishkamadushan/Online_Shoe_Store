<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="DDApplication.OrderStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" class="navbar" style="height:auto; background-color:aliceblue">
<div align="right">
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Show All Order List</asp:LinkButton>
&nbsp;
</div>
        <b>Select Date:</b>
        <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Width="122px"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/Images/calendar_3176395.png" OnClick="ImageButton1_Click" />
            <br />
        <asp:Label ID="Label1" runat="server" Text="Year" Font-Bold="True"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        &nbsp;
        <asp:Label ID="Label2" runat="server" Text="Month" Font-Bold="True"></asp:Label>&nbsp
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
        <asp:Button ID="Button1" runat="server" Text="Click" Font-Bold="True" Height="39px" Width="72px" OnClick="Button1_Click" />
        <br /><br />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Order Status">
                    <ItemTemplate>
                        <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="Ostatus" Text="Pending" />
                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Ostatus" Text="Completed" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Update Status" Font-Bold="True" Height="37px" Width="136px" OnClick="Button2_Click" />
        <br /><br />
    </div>
</asp:Content>
