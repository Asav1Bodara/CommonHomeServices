<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProviderMaster.master" AutoEventWireup="true" CodeFile="ServiceProviderResponse.aspx.cs" Inherits="ServiceProviderResponse" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 213px;
        }
         .button {
            text-decoration: none;
            display: inline-block;
            padding: 8px 16px;
        }
       .button:hover
       {
            background-color: black;
            color: white;
       }
        .next 
        {
            background-color: darkslateblue;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
                  <asp:DataList ID="DataList1" RepeatColumns="1" CellPadding="3" runat="server" Height="100%" Width="100%" BackColor="White" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" CssClass="auto-style4" DataKeyField="ReqId" DataSourceID="SqlDataSource1">
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <ItemTemplate>
                          <asp:Label ID="lblReqId" runat="server" Visible="false" Text='<%# Eval("ReqId") %>' />
                             <table class="w-100">
                                 <tr>
                                     <th class="auto-style1">Customer Name:</th>
                                     <td><asp:Label ID="CustNameLabel" runat="server" Text='<%# Eval("CustName") %>' /></td>
                                 </tr>
                                 <tr>
                                     <th class="auto-style1">Customer Phone:</th>
                                     <td><asp:Label ID="CustPhoneLabel" runat="server" Text='<%# Eval("CustPhone") %>' /></td>
                                 </tr>
                                 <tr>
                                     <th class="auto-style1">Customer Email:</th>
                                     <td><asp:Label ID="CustEmailLabel" runat="server" Text='<%# Eval("CustEmail") %>' /></td>
                                 </tr>
                                 <tr>
                                     <th class="auto-style1">Customer Address:</th>
                                     <td><asp:Label ID="CustAddressLabel" runat="server" Text='<%# Eval("CustAddress") %>' /></td>
                                 </tr>
                                 <tr>
                                     <th class="auto-style1">Customer Query:</th>
                                     <td class="text-justify"> <asp:Label ID="lblRequest" runat="server" Text='<%# Eval("RequestDetails") %>' /></td>
                                 </tr>                       
                             </table>
                             </ItemTemplate>
                        <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [CustName], [CustPhone], [CustEmail], [CustAddress], [RequestDetails], [ReqId] FROM [tblCustomerRequest] WHERE ([ReqId] = @ReqId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ReqId" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                   <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="Horizontal">
                        <Columns>
                            <asp:TemplateField HeaderStyle-Font-Names="Comic Sans MS" HeaderText="Chat Details" >                                
                                <ItemTemplate>
                                  <table>
                                    <tr>
                                      <td>
                                         <asp:Label ID="lblGridMsg" runat="server" Text='<%# Bind("ChatMsg") %>'></asp:Label>

                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="text-right">
                                         <i> <b>By <asp:Label ID="lblGridSender" runat="server" Text='<%# Bind("Sender") %>'></asp:Label>
                                          </b></i></td>
                                    </tr>
                                  </table>
                                  </ItemTemplate>
                           </asp:TemplateField>
                                </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [Sender], [ChatMsg] FROM [tblChat] WHERE ([ReqId] = @ReqId) ORDER BY [ChatId]">
                         <SelectParameters>
                             <asp:QueryStringParameter Name="ReqId" QueryStringField="id" Type="Int32" />
                         </SelectParameters>
                    </asp:SqlDataSource>
                     <table>
                       <tr>                      
                         <td>
                       <b> <asp:Label ID="Label3" Visible="false" runat="server" Text="Your Previous Quote was: $"></asp:Label>
                          </b>  <asp:Label ID="Label2" Visible="false"  runat="server" Text="Label"></asp:Label>

                         </td>
                       </tr>
                        <tr>
                          <th>Enter the message text:</th>
                            <td>
                                <asp:TextBox ID="txtContent" runat="server" Columns="78" Rows="6" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Button class="next button" ID="sendEMail" runat="server" Text="Send" OnClick="sendEMail_Click" />
                            </td>
                        </tr>
                        <tr>
                         <td>
                         <asp:Button class="next button" ID="btnEndchat1" runat="server" Text="Send Quote or End Chat" OnClick="btnEndchat1_Click"/>
                         </td>
                       </tr>
                     
                    </table>

              <asp:Panel ID="Panel1" Visible="false" runat="server">
                <table>
                  <tr>
                         <th>Enter the quote rate:</th>
                         <td>
                        <asp:Label ID="lblQuoteId" Visible="false" runat="server" Text=""></asp:Label>
                           <asp:TextBox ID="txtQuote" runat="server"></asp:TextBox>
                        <asp:Button class="next button" ID="btnSendWithQuote" runat="server" Text="Send Quote to Customer" OnClick="btnSendWithQuote_Click"/>
                         </td>
                       </tr>
                  <tr>
                    <th> Or you want to end without sending quote? </th>
                   <td ><ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" ConfirmText="Are you sure?" TargetControlID="btnAbort" runat="server"></ajaxToolkit:ConfirmButtonExtender>

                     <asp:Button class="next button" ID="btnAbort" runat="server" Text="Abort and Cancel the chat" OnClick="btnAbort_Click"/></td>
                  </tr>
                </table>
              </asp:Panel>
                    <asp:Panel ID="Panel2" Visible="false" runat="server">
                      <table>
                        <tr>
                          <th>Confirm Appointment Date:</th>
                        <td> 
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         <asp:TextBox ID="txtApp" Placeholder="Enter Date"  runat="server"></asp:TextBox>
                          <ajaxToolkit:CalendarExtender TargetControlID="txtApp" Format="dd-MMM-yyyy" ID="CalendarExtender1" runat="server" />
                        </td>
                          </tr>
                        <tr>
                          <th>
                            Enter the time:
                          </th>
                        <td>
                         <asp:TextBox ID="txtApptime" runat="server"></asp:TextBox>
                        </td>
                      </tr>
                        <tr>
                          <td>
                            <asp:Button ID="btnSendAppt" runat="server" Text="Send Appointment Details" OnClick="btnSendAppt_Click" />
                          </td>
                        </tr>
                      </table>
                    </asp:Panel>
                  </div>
              </section>
          </div>
    </form>
</asp:Content>

