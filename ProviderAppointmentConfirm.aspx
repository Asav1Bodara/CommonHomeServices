<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProviderMaster.master" AutoEventWireup="true" CodeFile="ProviderAppointmentConfirm.aspx.cs" Inherits="ProviderAppointmentConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <asp:DataList ID="DataList1" width="100%" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            CustomerName:
                            <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                            <br />
                            CustomerPhone:
                            <asp:Label ID="CustomerPhoneLabel" runat="server" Text='<%# Eval("CustomerPhone") %>' />
                            <br />
                            CustomerQuery:
                            <asp:Label ID="CustomerQueryLabel" runat="server" Text='<%# Eval("CustomerQuery") %>' />
                            <br />
                            CustomerAddress:
                            <asp:Label ID="CustomerAddressLabel" runat="server" Text='<%# Eval("CustomerAddress") %>' />
                            <br />
                            QuoteAmount:
                            <asp:Label ID="QuoteAmountLabel" runat="server" Text='<%# Eval("QuoteAmount") %>' />
                            <br /><br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [ApptId], [CustomerName], [CustomerPhone], [CustomerQuery], [CustomerAddress], [QuoteAmount] FROM [tblAppointment] WHERE ([ApptId] = @ApptId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ApptId" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Details and End Session" OnClick="btnConfirm_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Abort" OnClick="btnBack_Click" />
                  </div>
              </section>
              </div>
     </form>
</asp:Content>

