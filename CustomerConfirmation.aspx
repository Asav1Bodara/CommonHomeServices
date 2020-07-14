<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="CustomerConfirmation.aspx.cs" Inherits="CustomerConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                  <center><h3>Provider has confirmed following service provided to you.</h3>
                  <h4> :: Please confirm the details :: </h4></center>
                    <asp:DataList width="100%" ID="DataList1" OnItemCommand="DataList1_ItemCommand" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            ProviderStore:
                            <asp:Label ID="ProviderStoreLabel" runat="server" Text='<%# Eval("ProviderStore") %>' />
                            <br />
                            CustomerName:
                            <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                            <br />
                            ProviderPhone:
                            <asp:Label ID="ProviderPhoneLabel" runat="server" Text='<%# Eval("ProviderPhone") %>' />
                            <br />
                            CustomerAddress:
                            <asp:Label ID="CustomerAddressLabel" runat="server" Text='<%# Eval("CustomerAddress") %>' />
                            <br />
                            QuoteAmount:
                            <asp:Label ID="QuoteAmountLabel" runat="server" Text='<%# Eval("QuoteAmount") %>' />
                            <br />
                            CustomerQuery:
                            <asp:Label ID="CustomerQueryLabel" runat="server" Text='<%# Eval("CustomerQuery") %>' />
                            <br />
                          <asp:Button ID="btnFinalize" runat="server" CommandName="Finalize" CommandArgument='<%#Eval("Id")%>'  Text="Finalize" />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [Id],[ProviderStore], [CustomerName], [ProviderPhone], [CustomerAddress], [QuoteAmount], [CustomerQuery] FROM [tblComplete] WHERE ([CustomerPhone] = @CustPhone)">
                        <SelectParameters>
                            <asp:SessionParameter Name="CustPhone" SessionField="CustPhone" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                  </div>
              </section>
          </div>
    </form>
</asp:Content>

