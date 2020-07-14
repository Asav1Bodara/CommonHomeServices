<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="SendQuery.aspx.cs" Inherits="Plumber_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style2 {
            font-size: large;
            width: 100%
        }

        .auto-style3 {
            width: 238px;
        }

        .auto-style4 {
            height: 267px;
        }

        .auto-style5 {
            font-size: larger;
            width: 100%;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server" class="auto-style4">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                    <asp:DataList ID="DataList1" RepeatColumns="1" CellPadding="3" runat="server" BackColor="White" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Height="100%" Width="60%" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" CssClass="auto-style4">
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <ItemTemplate>
                            <table class="auto-style2">
                                <tr>
                                    <th class="auto-style3">Store Name:</th>
                                    <td>
                                        <asp:Label ID="lblStoreName" runat="server" Text='<%#Eval("SPStoreName")%>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <th class="auto-style3">Owner Name:</th>
                                    <td>
                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("SPName")%>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <th class="auto-style3">Phone Number:</th>
                                    <td>
                                        <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("SPPhone")%>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <th class="auto-style3">Store Address:</th>
                                    <td><asp:Label ID="lblAddress" runat="server" Text='<%#Eval("SPAddress")%>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <th class="auto-style3">Email ID:</th>
                                    <td>
                                        <asp:Label ID="lblEMail" runat="server" Text='<%#Eval("SPEmail")%>'> </asp:Label>
                                    </td>
                                </tr>   
                              
                            </table>

                          <table class="auto-style5">
                                <tr>
                                    <th>Send Details of your problem from here</th>
                                </tr>
                                <tr>
                                    <td><b>To:</b>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("SPEmail")%>'></asp:Label>
                                        <br />
                                        <b>Enter your Problem here:</b></td>
                                </tr>
                            </table>

                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtContent" runat="server" Columns="78" Rows="8" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button class="next button" ID="sendEMail" runat="server" Text="Send" OnClick="sendEMail_Click1" />
                            </td>
                        </tr>
                    </table>

                    <asp:Label ID="lblsent" runat="server" Text=""></asp:Label>
                    <br />
                </div>
            </section>

        </div>
    </form>
</asp:Content>

