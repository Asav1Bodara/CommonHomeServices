<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="CustomerRating.aspx.cs" Inherits="CustomerRating" %>
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
  <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                ProviderStore:
                                <asp:Label ID="lblStoreName" runat="server" Text='<%# Eval("ProviderStore") %>' />
                                <br />
                                CustomerName:
                                <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("CustomerName") %>' />
                                <br />
                                ProviderPhone:
                                <asp:Label ID="lblProviderPhone" runat="server" Text='<%# Eval("ProviderPhone") %>' />
                                <br />
                                CustomerQuery:
                                <asp:Label ID="lblCustomerQuery" runat="server" Text='<%# Eval("CustomerQuery") %>' />
                                <br />
                                QuoteAmount:
                                <asp:Label ID="lblQuote" runat="server" Text='<%# Eval("QuoteAmount") %>' />
                                <br />
                                <br />
                                <asp:Label visible="false" ID="lblId" runat="server" Text='<%# Eval("Id") %>' />

                            </ItemTemplate>

                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [Id],[ProviderStore], [CustomerName], [ProviderPhone], [CustomerQuery], [QuoteAmount] FROM [tblComplete] WHERE ([Id] = @Id)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                      <asp:Button ID="btnConfirm" runat="server" Text="Confirm Details and Provide Feedback" OnClick="btnConfirm_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Abort" OnClick="btnBack_Click" />
                 
                    </asp:Panel>
                    <asp:Panel ID="Panel2" Visible="false" runat="server">
                      <h3>Give ratings to service provider</h3>
                       <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:Rating ID="Rating1" runat="server" AutoPostBack="true" StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"  FilledStarCssClass="FilledStar"> </asp:Rating>
                    <asp:TextBox runat="server" ID="txtreview" TextMode="MultiLine"></asp:TextBox>
                    <br />
                        <asp:Button ID="btnRating" runat="server" Text="Sumbmit Feedback" OnClick="btnRating_Click" />
                    </asp:Panel>
                  </div>
              </section>
     </div>
    </form>
</asp:Content>

