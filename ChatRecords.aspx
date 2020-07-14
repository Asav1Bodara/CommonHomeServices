<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="ChatRecords.aspx.cs" Inherits="ChatRecords" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style>
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
        .Star {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }

        .WaitingStar {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }

        .FilledStar {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <asp:Label ID="lblTemp" Visible="false" runat="server" Text="Label"></asp:Label>
                  <asp:Label ID="lblQuote" Visible="false" runat="server" Text="Label"></asp:Label>
                  <asp:Panel ID="Panel1" runat="server">
                    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="Horizontal">
                        <Columns>
                            <asp:TemplateField HeaderStyle-Font-Names="Comic Sans MS" HeaderText="Chat Details">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblGridMsg" runat="server" Text='<%# Bind("ChatMsg") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-right"><i><b>By
                                                <asp:Label ID="lblGridSender" runat="server" Text='<%# Bind("Sender") %>'></asp:Label>
                                                </b></i></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <HeaderStyle Font-Names="Comic Sans MS" />
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
                    <br />
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [Sender], [ChatMsg] FROM [tblChat] WHERE ([ReqId] = @ReqId)">
                          <SelectParameters>
                              <asp:QueryStringParameter Name="ReqId" QueryStringField="id" Type="Int32" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                     <table>
                        <tr>
                           <th><asp:Label ID="Label3" runat="server" Text="Send details from here:"></asp:Label></th>
                            <td>
                                <asp:TextBox ID="txtContent" runat="server" Columns="78" Rows="4" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button class="next button" ID="sendEMail" runat="server" Text="Send" OnClick="sendEMail_Click" />
                            </td>
                        </tr>

                       <tr>
                         <td>
                         <asp:Button class="next button" ID="btnEnd" runat="server" Text="End your chat from here" OnClick="btnEnd_Click"  />
                         </td>
                       </tr>
                    </table>
                    </asp:Panel>
                    <asp:Panel ID="Panel3" Visible="false" runat="server">
                      <h4>Do you want to confirm with this quote?</h4>
                        <asp:Button  class="button next" ID="btnYes" runat="server" Text="Yes" OnClick="btnYes_Click" />
                        <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" ConfirmText="Are you sure?" TargetControlID="btnYes" runat="server" />
                      <asp:Button class="button next" ID="btnNo" runat="server" Text="No" OnClick="btnNo_Click" />
                     <asp:ConfirmButtonExtender ID="ConfirmButtonExtender3" ConfirmText="Are you sure?" TargetControlID="btnNo" runat="server" />

                    </asp:Panel>                  
                    <asp:Panel ID="Panel2" Visible="false" runat="server">
                      <asp:Button runat="server" Text="End chat" class="next button" ID="btnsubmit" OnClick="btnsubmit_Click"  />
                        <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" ConfirmText="Are you sure?" TargetControlID="btnsubmit" runat="server" />
                    </asp:Panel>                 
                  </div>
              </section>
          </div>
    </form>
</asp:Content>

