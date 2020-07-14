<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="RatingDemo.aspx.cs" Inherits="RatingDemo" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div class="content-wrapper">
            <section class="content">
                <div class="container-fluid">
                  <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:Rating ID="Rating1" runat="server" AutoPostBack="true"
                        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                        FilledStarCssClass="FilledStar">
                    </asp:Rating>
                    <br />
                    <asp:Label ID="lbresult" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:TextBox runat="server" ID="txtreview" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <asp:Button runat="server" Text="Submit Review" ID="btnsubmit" OnClick="btnsubmit_Click1" />

                </div>
            </section>
        </div>
    </form>

</asp:Content>

