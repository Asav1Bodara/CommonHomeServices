<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProviderMaster.master" AutoEventWireup="true" CodeFile="ProviderAppointmentDetails.aspx.cs" Inherits="ProviderAppointmentDetails" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 332px;
        }
        .auto-style12 {
            width: 519px;
        }
        .auto-style13 {
            width: 760px;
        }
        .auto-style14 {
            text-align: center;
            width: 760px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                 <asp:DataList OnItemCommand="DataList1_ItemCommand" width="100%" ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333">
                     <AlternatingItemStyle BackColor="White" />
                     <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                     <ItemStyle BackColor="#E3EAEB" />
                     <ItemTemplate>                                                                     
                         <table class="w-100">
                             <tr>
                                 <td class="auto-style13"><b>Customer Name:</b> <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' /></td>
                             </tr>
                             <tr>
                                 <td class="auto-style13"><b>Customer Phone: </b>
                                     <asp:Label ID="CustomerPhoneLabel" runat="server" Text='<%# Eval("CustomerPhone") %>' />
                                 </td>                             
                             </tr>
                             <tr>
                               <td class="auto-style13"><b>Customer Address:</b>
                                 <asp:Label ID="CustomerAddressLabel" runat="server" Text='<%# Eval("CustomerAddress") %>' /></td>
                             </tr>
                             <tr>
                                 <td class="auto-style13"><b>Customer Query:</b>
                                 <asp:Label ID="CustomerQueryLabel" runat="server" Text='<%# Eval("CustomerQuery") %>' /></td>
                             </tr>
                             <tr>
                                 <td class="auto-style13"><b>Quote Discussed: </b>
                              $<asp:Label ID="QuoteAmountLabel" runat="server" Text='<%# Eval("QuoteAmount") %>' /></td>
                             </tr>
                             <tr>
                                <td class="auto-style13"><b>On Date&nbsp;</b><asp:Label ID="DateLabel" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Date", "{0:dd-MMM-yyyy}") %>' />
                                    &nbsp;<b>At time </b>
                                    <asp:Label ID="TIMELabel" runat="server" Text='<%# Eval("TIME") %>' />
                                </td><td class="auto-style12">&nbsp;</td>
                             </tr>
                           <tr>
                                <td > &nbsp;</td>
                             <td class="auto-style14">

                               <asp:Button ID="btnFinalize" CommandName="Finalize" CommandArgument='<%# Eval("ApptId") %>' runat="server" Text="Finalize Service" />
                              <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" ConfirmText="Are you sure?" TargetControlID="btnFinalize" runat="server"></ajaxToolkit:ConfirmButtonExtender>

                             </td>
                           </tr>
                         </table>                        
                     </ItemTemplate>

                     <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />

                 </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [ApptId],[CustomerName], [CustomerPhone], [CustomerAddress], [CustomerQuery], [Date], [QuoteAmount], [TIME] FROM [tblAppointment] WHERE ([ProviderPhone] = @ProviderPhone)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProviderPhone" SessionField="ProviderPhone" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                  </div>
              </section>
          </div>
    </form>
</asp:Content>

