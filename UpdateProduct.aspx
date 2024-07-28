<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="DDApplication.UpdateProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div align="center" class="navbar" style="height:auto; background-color:aliceblue">
        Sort By:&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" 
            DataTextField="CategoryName" DataValueField="CategoryName" Height="42px" Width="125px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" BackColor="AliceBlue" Font-Bold="True" ForeColor="Black">
            <asp:ListItem>Select Category</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RavishkaConnectionString %>" 
            SelectCommand="SELECT [CategoryName] FROM [PRCategory]"></asp:SqlDataSource>
        <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EmptyDataText="No Products to Display" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Product Id">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("PId") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Pname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Pname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Pdesc") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pdesc") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Pimage") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Pprice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Pprice") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Pquantity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Pquantity") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Pcategory" DataValueField="Pcategory" SelectedValue='<%# Eval("Pcategory") %>'>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RavishkaConnectionString %>" SelectCommand="SELECT [Pcategory] FROM [Products1]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Pcategory") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:CommandField HeaderText="Operation" ShowEditButton="True">
                <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle ForeColor="#003399" BackColor="White" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>

    </div>

</asp:Content>
