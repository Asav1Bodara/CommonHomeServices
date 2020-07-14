<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="SeeRequests.aspx.cs" Inherits="SeeRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
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

        .auto-style1 {
            width: 1007px;
        }

        .auto-style2 {
            width: 238px;
        }

        .auto-style3 {
            width: 92%
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
  <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
               
                <asp:DataList ID="DataList1" Height="100%" Width="100%" runat="server" CssClass="auto-style1" OnItemCommand="DataList1_ItemCommand" DataSourceID="SqlDataSource1" style="margin-left: 0px" CellPadding="4" ForeColor="#333333">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <ItemTemplate>   

                        <table class="auto-style3">                          
                            <tr>
                                <th class="auto-style2">Store Name: </th>
                                <td><%# Eval("ProviderStoreName") %></td>
                            </tr>
                            <tr>
                                <th class="auto-style2">Owner Name:</th>
                                <td><%# Eval("ProviderName") %></td>
                            </tr>
                            <tr>
                                <th class="auto-style2">Provider E-mail:</th>
                                <td><%# Eval("ProviderEmail") %></td>
                            </tr>
                            <tr>
                                <th class="auto-style2">Provider Contact:</th>
                                <td><%# Eval("ProviderPhone") %></td>
                            </tr>
                            <tr>
                                <th class="auto-style2">Your sent query:</th>
                                <td style="background-color:moccasin"><%# Eval("RequestDetails") %></td>
                            </tr>                          
                            <tr >
                              <td></td>
                            
                                <td class="text-right">
                                    <asp:Button class="next button" ID="btnSeeMore" runat="server" CommandName="seeChat" CommandArgument='<%#Eval("ReqId")%>' Text="View More Details" />
                                </td>
                            </tr>                         
                        </table>                                     
                    </ItemTemplate>
                    
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    
                    </asp:DataList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [ReqId], [RequestDetails], [ProviderName], [ProviderEmail], [ProviderStoreName], [ProviderPhone], [ProviderAddress] FROM [tblCustomerRequest] WHERE ([CustPhone] = @CustPhone)">
                        <SelectParameters>
                            <asp:SessionParameter Name="CustPhone" SessionField="CustPhone" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>             
            </div>
    </section>
</div>
    </form>
    </center>
</asp:Content>

