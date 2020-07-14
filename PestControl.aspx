<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="PestControl.aspx.cs" Inherits="PestControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Pest COntrol Service Providers</title>
    <style>
        .button {
            text-decoration: none;
            display: inline-block;
            padding: 8px 16px;
        }

            .button:hover {
                background-color: black;
                color: white;
            }

        .next {
            background-color: darkslateblue;
            color: white;
        }

        .round {
            border-radius: 100%;
        }

        td {
            padding: 10px;
        }

        .auto-style3 {
            text-align: left;
            width: 281px;
        }

        .auto-style4 {
            text-align: left;
            width: 266px;
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
        .auto-style5 {
            width: 752px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:DataList ID="DataList1" RepeatColumns="1" CellPadding="4" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" Height="100%" Width="100%" OnItemCommand="DataList1_ItemCommand" DataSourceID="SqlDataSource1">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <ItemStyle BackColor="#E3EAEB" />
                        <ItemTemplate>
                               <table class="w-100">
                                <tr>
                                 <td class="auto-style4"><b>Store Name: &nbsp;&nbsp;</b><asp:Label ID="Label1" runat="server" Text='<%#Eval("SPStoreName")%>'></asp:Label></td>
                                 <td class="auto-style3"><b>Owner Name: &nbsp;&nbsp;</b><asp:Label ID="Label2" runat="server" Text='<%#Eval("SPName")%>'></asp:Label></td>
                                <td class="text-left"><b>Contact Info: &nbsp;&nbsp;</b><asp:Label ID="Label3" runat="server" Text='<%#Eval("SPPhone")%>'></asp:Label></td>
                                  <td class="text-right"><asp:Button ID="sendQuery" class="next button" runat="server" Text="Send Query&nbsp;&raquo;" CommandName="sendQuery" CommandArgument='<%#Eval("SPPhone")%>'/></td>
                            </table>      
                            <table class="w-100">
                                <tr>
                                    <td class="auto-style5"> <b>Address:&nbsp;&nbsp;</b>

                                       <asp:Label ID="Label5"  runat="server" Text='<%#Eval("SPAddress")%>'></asp:Label>            
                                   </td>
                                  <td>
                                     <asp:Rating ID="Rating1" ReadOnly="true"  runat="server" AutoPostBack="true"
                        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                        FilledStarCssClass="FilledStar"></asp:Rating>
                                      <asp:Label ID="lblCount" runat="server" Text=""></asp:Label>
                                  </td>
                                </tr>
                            </table>
                              <asp:Label ID="lblEmail" visible="false" runat="server" Text='<%#Eval("SPEmail")%>'></asp:Label>   
                          
                </ItemTemplate>

                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [SPID],[SPStoreName], [SPName], [SPPhone], [SPAddress], [SPEmail], [SPType] FROM [viewServiceProvider] WHERE ([SPType] = 'Pest Control')">
                   
                    </asp:SqlDataSource>
                </div>
            </section>
        </div>
    </form>
</asp:Content>




