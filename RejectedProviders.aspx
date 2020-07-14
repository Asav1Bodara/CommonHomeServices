<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="RejectedProviders.aspx.cs" Inherits="RejectedProviders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="content-wrapper">
        <section class="content">
            <div class="container-fluid">
              <center> <br /> 
                <h3>Rejected Applicants</h3>
              <form id="form1" runat="server">
                  
                  <br />   
                  
                    <asp:Panel ID="pnlView" runat="server">
                       Search by Company Name: <asp:TextBox ID="txtSearchCompany" runat="server"></asp:TextBox>
                     Category: <asp:DropDownList ID="ddlSearchCategory" runat="server" DataTextField="SPType" DataValueField="SPType" ></asp:DropDownList>                  
                    <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click" /><br />

                      <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">                            
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                                  <asp:Button ID="btnExportExcel" runat="server" Text="Export as Excel" OnClick="btnExportExcel_Click" ></asp:Button>

                      </asp:Panel>
                </form>
                </center>
            </div>
        </section>
    </div>
</asp:Content>

