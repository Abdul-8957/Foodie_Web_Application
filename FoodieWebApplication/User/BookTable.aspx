<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="BookTable.aspx.cs" Inherits="FoodieWebApplication.User.BookTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- book section -->
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                </div>
                <h2>Book A Table</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvName" ErrorMessage="Name is required" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Your Name"></asp:TextBox>

                        </div>
                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvMobile" ErrorMessage="Mobile No. is required" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revMobile" ErrorMessage="Mobile No. must be  10 digits." ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                            <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control" placeholder="Phone Number" TextMode="Number" ToolTip="Mobile Number"></asp:TextBox>

                        </div>
                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ErrorMessage="Email is required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revEmail" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Your Email" TextMode="Email"></asp:TextBox>

                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvPerson" runat="server" ErrorMessage="Person's is required" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="ddlPerson" InitialValue="0"></asp:RequiredFieldValidator>

                            <asp:DropDownList ID="ddlPerson" runat="server" CssClass="form-control nice-select wide">
                                <asp:ListItem Value="0" disabled="" Selected="true">How many persons?</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>

                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ErrorMessage="Date is required" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                        </div>
                        <div class="btn_box">
                            <asp:Button runat="server" ID="btnBookTable" Text="Book Now" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnBookTable_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="map_container ">
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end book section -->

</asp:Content>
