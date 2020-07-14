<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="CustomerCompletion.aspx.cs" Inherits="CustomerCompletion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <asp:GridView ID="GridView1" width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="ProviderStore" HeaderText="ProviderStore" SortExpression="ProviderStore" />
                            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                            <asp:BoundField DataField="ProviderPhone" HeaderText="ProviderPhone" SortExpression="ProviderPhone" />
                            <asp:BoundField DataField="CustomerQuery" HeaderText="CustomerQuery" SortExpression="CustomerQuery" />
                            <asp:BoundField DataField="QuoteAmount" HeaderText="QuoteAmount" SortExpression="QuoteAmount" />
                        </Columns>
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [ProviderStore], [CustomerName], [ProviderPhone], [CustomerQuery], [QuoteAmount] FROM [tblCustomerCompletion] WHERE ([CustomerName] = @CustomerName)">
                        <SelectParameters>
                            <asp:SessionParameter Name="CustomerName" SessionField="CustName" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                  </div>
              </section>
          </div>
      </form>
</asp:Content>

