<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProviderMaster.master" AutoEventWireup="true" CodeFile="CompletedRequests.aspx.cs" Inherits="CompletedRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="ProviderStore" HeaderText="ProviderStore" SortExpression="ProviderStore" />
                            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                            <asp:BoundField DataField="CustomerPhone" HeaderText="CustomerPhone" SortExpression="CustomerPhone" />
                            <asp:BoundField DataField="ProviderPhone" HeaderText="ProviderPhone" SortExpression="ProviderPhone" />
                            <asp:BoundField DataField="CustomerAddress" HeaderText="CustomerAddress" SortExpression="CustomerAddress" />
                            <asp:BoundField DataField="CustomerQuery" HeaderText="CustomerQuery" SortExpression="CustomerQuery" />
                            <asp:BoundField DataField="QuoteAmount" HeaderText="QuoteAmount" SortExpression="QuoteAmount" />
                        </Columns>

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [ProviderStore], [CustomerName], [CustomerPhone], [ProviderPhone], [CustomerAddress], [CustomerQuery], [QuoteAmount] FROM [tblComplete] WHERE ([ProviderPhone] = @ProviderPhone)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProviderPhone" SessionField="ProviderPhone" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                  </div>
             </section>
          </div>
     </form>
</asp:Content>

