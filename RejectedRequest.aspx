<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProviderMaster.master" AutoEventWireup="true" CodeFile="RejectedRequest.aspx.cs" Inherits="RejectedRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">                 
                    <asp:GridView ID="GridView1" ShowHeader="false" Width="100%" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:TemplateField>                                
                                <ItemTemplate>
                                  <table>
                                    <tr>
                                      <td>
                                      <b> By  <asp:Label ID="Label1" runat="server"
                                        Text='<%# Bind("ESender") %>'></asp:Label></b>
                                    </td>
                                        </tr>
                                    <tr>
                                      <td>
                                      <asp:Label ID="Label2" runat="server"
                                        Text='<%# Eval("EChatMsg") %>'></asp:Label>
                                    </td>
                                        </tr>
                                    <tr>
                                      <td class="text-right">
                                      <i> <asp:Label ID="Label3" runat="server"
                                        Text='<%# Eval("ECustomerEmail") %>'></asp:Label></i>                                    
                                        </td></tr>
                                  </table>
                                  
                                  
                                 
                                </ItemTemplate>
                          </asp:TemplateField>
                            
                             </Columns>

                      
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                      
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [ESender], [EChatMsg], [ECustomerEmail] FROM [tblEndedChats] WHERE ([EProviderEmail] = @EProviderEmail)">
                        <SelectParameters>
                            <asp:SessionParameter Name="EProviderEmail" SessionField="ProviderEmail" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                  </div>
              </section>
          </div>
    </form>
</asp:Content>

