<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProviderMaster.master" AutoEventWireup="true" CodeFile="FeedBacks.aspx.cs" Inherits="FeedBacks" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .Star {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }

    .WaitingStar {
        background-image: url(images/WaitingStar.gihttp://localhost:56276/FeedBacks.aspxf);
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
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                 <b> :: Your average rating is ::</b>
                 <asp:Rating ID="Rating1" ReadOnly="true"  runat="server" AutoPostBack="true"
                        StarCssClass="Star"  WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                        FilledStarCssClass="FilledStar"></asp:Rating>
                  <hr />
                  <br />                  
                  <asp:Label ID="lblCount" runat="server" Text=""></asp:Label>
                                      <asp:Label ID="lblresult" runat="server" Text=""></asp:Label>
                 
                  <asp:Label Visible="false" ID="Label1" runat="server" Text="Label"></asp:Label>
              <asp:DataList ID="DataList1" runat="server" BackColor="White" Width="100%"  BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Horizontal">
                  <AlternatingItemStyle BackColor="#F7F7F7" />
                  <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                  <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                  <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                  <ItemTemplate>
                      <table class="w-100">
                          <tr>
                           <td> Feedback:
                           <asp:Label ID="lblFeedback" runat="server" Text='<%#Eval("review")%>'></asp:Label></td>
                          </tr>
                          <tr>
                              <td class="text-right"><span><i>By&nbsp;</span><asp:Label ID="lblName" runat="server" Text='<%#Eval("CustomerName")%>'></i></asp:Label></td>
                          </tr>
                      </table>
<br />
                  </ItemTemplate>
                  <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />

              </asp:DataList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [CustomerName], [review] FROM [tblrating] WHERE ([StoreName] = @StoreName)">
                        <SelectParameters>
                            <asp:SessionParameter Name="StoreName" SessionField="ProviderEmail" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                  </div>
              </section>
          </div>
    </form>
</asp:Content>

