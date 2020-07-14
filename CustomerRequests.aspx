<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProviderMaster.master" AutoEventWireup="true" CodeFile="CustomerRequests.aspx.cs" Inherits="CustomerRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 563px;
        }
        .auto-style6 {
            text-align: right;
            width: 376px;
        }
        .auto-style8 {
            width: 92%;
        }
        .auto-style9 {
            width: 182px;
        }
        .auto-style10 {
            width: 376px;
        }
        .auto-style11 {
            width: 162px;
        }
          .button {
            text-decoration: none;
            display: inline-block;
            padding: 8px 10px;
        }

        td {
            padding: 6px;
        }

        .button:hover {
            background-color: black;
            color: white;
        }

        .next {
            background-color: lightslategrey;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                   <asp:DataList ID="DataList1" Height="100%" Width="100%" runat="server" CssClass="auto-style1"  DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" style="margin-left: 0px" CellPadding="4" ForeColor="#333333">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <ItemTemplate>                       
                      <table class="auto-style8">
                            <tr>
                                <th class="auto-style11">Customer Name: </th>
                                <td class="auto-style10"><%# Eval("CustName") %></td>
                            </tr>
                            <tr>
                                <th class="auto-style11">Query from customer:</th>
                                <td style="background-color:moccasin" class="auto-style10"><%# Eval("RequestDetails") %></td>
                            </tr>                          
                            <tr >
                              <td class="auto-style11"></td>
                            
                                <td class="auto-style6">
                                    <asp:Button class="next button" ID="btnSeeMore" runat="server" CommandArgument='<%# Eval("ReqId") %>' CommandName="gotoDetails" Text="View More Details" />
                                </td>
                            </tr>                        
                        </table>                                     
                    </ItemTemplate>                  
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    
                    </asp:DataList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [ReqId], [CustName], [CustPhone], [CustEmail], [CustAddress], [RequestDetails] FROM [tblCustomerRequest] WHERE ([ProviderPhone] = @ProviderPhone)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProviderPhone" SessionField="ProviderPhone" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>   
                  </div>
              </section>
          </div>
    </form>
</asp:Content>

