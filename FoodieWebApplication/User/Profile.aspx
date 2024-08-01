﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FoodieWebApplication.User.Profile" %>

<%@ Import Namespace="FoodieWebApplication" %>

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

    <%
        string imageUrl = Session["imageUrl"].ToString();
    %>

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                </div>
                <h2>User Profile</h2>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title mb-4">
                                <div class="d-flex justify-content-start">
                                    <div class="image-container">
                                        <img alt="" src="<%= Utils.GetImageUrl(imageUrl) %>" id="imageProfile" width="150" height="150" class="img-thumbnail" />
                                        <div class="middle pt-2">
                                            <a href="Registration.aspx?id=<% Response.Write(Session["userId"]); %>" class="btn btn-warning">
                                                <i class="fa fa-pencil"></i>Edit Details
                                            </a>
                                        </div>
                                    </div>

                                    <div class="userData ml-3">
                                        <h2 class="d-block " style="font-size: 1.5rem; font-weight: bold;">
                                            <a href="javascript:void(0)"><% Response.Write(Session["name"]); %></a>
                                        </h2>
                                        <h6 class="d-block ">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblUsername" runat="server" ToolTip="Unique Username">
                                                    <% Response.Write(Session["username"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>
                                        <h6 class="d-block ">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblEmail" runat="server" ToolTip="User Email">
                                                    <% Response.Write(Session["email"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>
                                        <h6 class="d-block ">
                                            <a href="javascript:void(0)">
                                                <asp:Label ID="lblDate" runat="server" ToolTip="Account Created On">
                                                    <% Response.Write(Session["date"]); %>
                                                </asp:Label>
                                            </a>
                                        </h6>
                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <ul class=" nav nav-tabs mb-4" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active text-info" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="connectedServices" aria-selected="false"><i class="fa fa-id-badge mr-2"></i>Basic Info</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link  text-info" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="false"><i class="fa fa-clock-o  mr-2"></i>Purchase History</a>
                                        </li>
                                    </ul>

                                    <div class="tab-content ml-1" id="myTabContect">
                                        <%--Basic User Info Start--%>
                                        <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                            <asp:Repeater ID="rUserProfile" runat="server">
                                                <ItemTemplate>
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Full Name</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Name") %>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Username</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("UserName") %>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Mobile No.</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Mobile") %>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Email</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Email") %>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Post Code</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("PostCode") %>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="row">
                                                        <div class="col-sm-3 col-md-2 col-5">
                                                            <label style="font-weight: bold;">Address</label>
                                                        </div>
                                                        <div class="col-md-8 col-6">
                                                            <%# Eval("Address") %>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <%--Basic User Info End--%>
                                        <%--Order History Start--%>
                                        <div class=" tab-pane fade " id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                           <asp:Repeater ID="rPurchaseHistory" runat="server" OnItemDataBound="rPurchaseHistory_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="container">
                                                        <div class="row pt-1 pb-1" style="background-color:lightgray">
                                                            <div class="col-4">
                                                                <span class="badge badge-pill badge-dark text-white">
                                                                    <%# Eval("SrNo") %>
                                                                </span>
                                                                Payment Mode: <%# Eval("PaymentMode").ToString() == "cod" ? "Cash On Delivery" : Eval("PaymentMode").ToString().ToUpper() %>
                                                            </div>
                                                            <div class="col-6">
                                                                <%# string.IsNullOrEmpty( Eval("CardNo").ToString()) ? "" : "Card No: "+Eval("CardNo") %>
                                                            </div>
                                                            <div class="col-2" style="text-align: end;">
                                                                <a href="Invoice.aspx?id=<%# Eval("PaymentId") %>" class="btn btn-info"><i class="fa fa-download mr-2"></i>Invoice</a>
                                                            </div>
                                                        </div>

                                                        <asp:HiddenField ID="hdnPaymentId" runat="server" Value='<%# Eval("PaymentId") %>' />

                                                        <asp:Repeater ID="rOrders" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="table table-responsive-sm table-hover table-bordered data-table-export pt-2">
                                                                    <thead class=" bg-dark text-white">
                                                                        <tr>
                                                                            <th>Product Name</th>
                                                                            <th>Unit Price</th>
                                                                            <th>Qty</th>
                                                                            <th>Total Price</th>
                                                                            <th>Order ID</th>
                                                                            <th>Status</th>
                                                                        </tr>
                                                                    </thead>
                                                                     <tbody>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                               
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblPrice" runat="server" Text='<%# string.IsNullOrEmpty( Eval("Price").ToString()) ? "" :Eval("Price")+" Rupees" %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblTotalPrice" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label>&nbsp; Rupees
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("OrderNo") %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'
                                                                                CssClass='<%# Eval("Status").ToString() == "Delivered" ? "badge badge-success" : "badge badge-warning" %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                               
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                              <%--  <tr>
                                                                    <td colspan="3" class="pl-lg-5 text-center"><b>TOTAL</b></td>
                                                                    <td><% Response.Write(Session["grandTotal"]); %>&nbsp;Rupees</td>
                                                                    <td></td>
                                                                </tr>--%>
                                                                 </tbody>
                                                                </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>

                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <%--Order History End--%>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
