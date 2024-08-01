<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="FoodieWebApplication.User.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .rounded {
            border-radius: 1rem;
        }

        .nav-pills .nav-link {
            color: #555;
        }

            .nav-pills .nav-link.active {
                color: white;
            }

        .bold {
            font-weight: bold;
        }

        .card {
            padding: 40px 50px;
            border-radius: 20px;
            border: none;
            box-shadow: 1px 5px 10px 1px rgba(0,0,0,0.2);
        }
    </style>
    <script>
        window.onload = function () {
            var second = 5;
            setTimeout(function () {
                document.getElementById("<%# lblMsg.ClientID %>").style.display = "none";
            }, second * 1000);
        };
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <script type="text/javascript">
        function DisableBackbutton() {
            window.history.forward()
        }
        DisableBackbutton();
        window.onload = DisableBackbutton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackbutton() }
        window.onload = function () { void (0) }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section" style="background-image: url('../Images/payment-bg.jpg'); width: 100%; height: 100%; background-repeat: no-repeat; background-size: auto; background-attachment: fixed; background-position: left;">

        <div class="container py-5">
            <div class="align-self-end">
                <asp:Label runat="server" ID="lblMsg" Visible="false"></asp:Label>
            </div>
            <!-- For demo purpose -->
            <div class="row mb-4">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-6">Order Payment</h1>
                </div>
            </div>
            <!-- End -->
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="card ">
                        <div class="card-header">
                            <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                                <!-- Credit card form tabs -->
                                <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                                    <li class="nav-item"><a data-toggle="pill" href="#credit-card" class="nav-link active "><i class="fa fa-credit-card mr-2"></i>Credit Card </a></li>
                                    <li class="nav-item"><a data-toggle="pill" href="#paypal" class="nav-link "><i class="fa fa-cash mr-2"></i>Cash On Delivery (COD) </a></li>
                                    <%--<li class="nav-item"> <a data-toggle="pill" href="#net-banking" class="nav-link "> <i class="fas fa-mobile-alt mr-2"></i> Net Banking </a> </li>--%>
                                </ul>
                            </div>
                            <!-- End -->
                            <!-- Credit card form content -->
                            <div class="tab-content">
                                <!-- credit card info-->
                                <div id="credit-card" class="tab-pane fade show active pt-3">
                                    <div role="form">
                                        <div class="form-group">
                                            <label for="txtName">
                                                <h6>Card Owner</h6>
                                            </label>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvName" ErrorMessage="Name is required" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ID="revName" ErrorMessage="Name must be in character only" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="card">*</asp:RegularExpressionValidator>
                                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Card Owner Name"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtCardNo">
                                                <h6>Card number</h6>
                                            </label>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvCardNo" ErrorMessage="Card Number is required" ControlToValidate="txtCardNo" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ID="revCardNo" ErrorMessage="Card Number must be of  16 digits." ControlToValidate="txtCardNo" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{16}$" ValidationGroup="card">*</asp:RegularExpressionValidator>


                                            <div class="input-group">
                                                <asp:TextBox runat="server" ID="txtCardNo" CssClass="form-control" placeholder="Valid card number" TextMode="Number"></asp:TextBox>
                                                <div class="input-group-append">
                                                    <span class="input-group-text text-muted">
                                                        <i class="fa fa-cc-visa mx-1"></i>
                                                        <i class="fa fa-cc-mastercard mx-1"></i>
                                                        <i class="fa fa-cc-amex mx-1"></i>

                                                    </span>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <div class="form-group">
                                                    <label>
                                                        <span class="hidden-xs">
                                                            <h6>Expiration Date</h6>
                                                        </span>
                                                    </label>
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvExpMonth" ErrorMessage="Expiry month is required" ControlToValidate="txtExpMonth" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator runat="server" ID="revExpMonth" ErrorMessage="Expiry month must be of  2 digits." ControlToValidate="txtExpMonth" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{2}$" ValidationGroup="card">*</asp:RegularExpressionValidator>

                                                    <asp:RequiredFieldValidator runat="server" ID="rfvExpYear" ErrorMessage="Expiry year is required" ControlToValidate="txtExpYear" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator runat="server" ID="revExpYear" ErrorMessage="Expiry Year must be of  4 digits." ControlToValidate="txtExpYear" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{4}$" ValidationGroup="card">*</asp:RegularExpressionValidator>


                                                    <div class="input-group">
                                                        <asp:TextBox runat="server" ID="txtExpMonth" CssClass="form-control" placeholder="MM" TextMode="Number"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txtExpYear" CssClass="form-control" placeholder="YYYY" TextMode="Number"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group mb-4">
                                                    <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                        <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                                    </label>
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvCvv" ErrorMessage="CVV No. is required" ControlToValidate="txtCvv" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator runat="server" ID="revCvv" ErrorMessage="CVV No. must be of  3 digits." ControlToValidate="txtCvv" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{3}$" ValidationGroup="card">*</asp:RegularExpressionValidator>

                                                    <asp:TextBox runat="server" ID="txtCvv" CssClass="form-control" placeholder="CVV N0." TextMode="Number"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtAddress">
                                                <h6>Delivery Address</h6>
                                            </label>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvAddress" ErrorMessage="Address is required" ControlToValidate="txtAddress" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                            <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" placeholder="Delivery Address" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                        <div class="card-footer">
                                            <asp:LinkButton ID="lbCardSubmit" runat="server" CssClass="subscribe btn btn-primary btn-block shadow-sm" ValidationGroup="card" OnClick="lbCardSubmit_Click">Confirm Payment</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!-- End -->
                                <!-- Cash On Delivery info -->
                                <div id="paypal" class="tab-pane fade pt-3">
                                    <div class="form-group ">
                                        <label for="txtCODAddress">
                                            <h6>Delivery Address</h6>
                                        </label>
                                        <asp:TextBox runat="server" ID="txtCODAddress" CssClass="form-control" placeholder="Delivery Address" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvCODAddress" ErrorMessage="Address is required" ControlToValidate="txtCODAddress" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="cod" Font-Names="Segoe Script">*</asp:RequiredFieldValidator>
                                    </div>
                                    <p>
                                        <asp:LinkButton ID="lbCODSubmit" runat="server" CssClass="btn btn-info" ValidationGroup="cod" OnClick="lbCODSubmit_Click"><i class="fa fa-cart-arrow-down mr-2"></i>Confirm Order</asp:LinkButton>
                                    </p>
                                    <p class="text-muted">
                                        Note: At the of recieving your order, you need to do full payment.
                                        After completing the payment process, you can ckeck your updated order status. 
                                    </p>
                                </div>
                                <!-- End -->
                                <!-- bank transfer info -->
                                <%--  <div id="net-banking" class="tab-pane fade pt-3">
                                    <div class="form-group ">
                                        <label for="Select Your Bank">
                                            <h6>Select your Bank</h6>
                                        </label>
                                        <select class="form-control" id="ccmonth">
                                            <option value="" selected disabled>--Please select your Bank--</option>
                                            <option>Bank 1</option>
                                            <option>Bank 2</option>
                                            <option>Bank 3</option>
                                            <option>Bank 4</option>
                                            <option>Bank 5</option>
                                            <option>Bank 6</option>
                                            <option>Bank 7</option>
                                            <option>Bank 8</option>
                                            <option>Bank 9</option>
                                            <option>Bank 10</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <p>
                                            <button type="button" class="btn btn-primary "><i class="fas fa-mobile-alt mr-2"></i>Proceed Payment</button>
                                        </p>
                                    </div>
                                    <p class="text-muted">Note: After clicking on the button, you will be directed to a secure gateway for payment. After completing the payment process, you will be redirected back to the website to view details of your order. </p>
                                </div>--%>
                                <!-- End -->

                            </div>
                            <!-- End -->
                        </div>
                        <div class="card-footer">
                            <b class="badge badge-success badge-pill shadow-sm">Order Total: <% Response.Write(Session["grandTotalPrice"]); %> Rupess</b>
                            <div class="pt-1">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="card" HeaderText="Fix the following errors" Font-Names="Segoe Script" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
