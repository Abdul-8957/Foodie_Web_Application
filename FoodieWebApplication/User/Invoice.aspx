<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="FoodieWebApplication.User.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class=" book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
            </div>
        </div>

        <div class=" container">
            <asp:Repeater ID="rOrderItem" runat="server">
                <HeaderTemplate>
                    <table class="table table-responsive-sm table-bordered table-hover" id="tblInvoice">
                        <thead class="bg-dark text-white">
                            <tr>
                                <td>Sr.No</td>
                                <td>Order NUmber</td>
                                <td>Item Name</td>
                                <td>Unit Price</td>
                                <td>Quantity</td>
                                <td>Total Price</td>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("SrNo") %></td>
                        <td><%# Eval("OrderNo") %></td>
                        <td><%# Eval("Name") %></td>
                        <td><%# string.IsNullOrEmpty( Eval("Price").ToString())?"":Eval("Price")+" Rupees" %></td>
                        <td><%# Eval("Quantity") %></td>
                        <td><%# Eval("TotalPrice") %>  Rupees</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                     <%-- <tr>
                       
                       <td colspan="5" class="pl-lg-5 text-center" ><b> TOTAL</b></td>
                       <td><% Response.Write(Session["grandTotal"]); %>&nbsp;Rupees</td>
                       
                   </tr>--%>
                      </tbody>
                     </table>
                </FooterTemplate>
            </asp:Repeater>
            <div class="text-center">
                <asp:LinkButton ID="lbDownloadInvoice" runat="server" CssClass="btn btn-info" OnClick="lbDownloadInvoice_Click">
                     <i class="fa fa-file-pdf-o mr-2"></i>Download Invoice
                </asp:LinkButton>
            </div>
        </div>

    </section>

</asp:Content>
