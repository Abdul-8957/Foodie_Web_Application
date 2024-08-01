<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodieWebApplication.User.Login" %>

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

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                </div>
                <h2>Login</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <img alt="" id="LoginImg" width="500" height="500" src="../Images/login-bg.jpg" class="img-thumbnail" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvUsername" ErrorMessage="Username is required" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" placeholder="Enter User Name" ToolTip="Username"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <%--<asp:RegularExpressionValidator runat="server" ID="revPassword" ErrorMessage="Enter Stromg Password" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$" ></asp:RegularExpressionValidator>--%>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Enter Password" TextMode="Password" ToolTip="Password"></asp:TextBox>
                        </div>
                        <div class="btn-box">
                            <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnLogin_Click"/>
                            <span class="pl-3 text-info">New User?<a class="badge badge-info ml-3" href="Registration.aspx">Register Here..</a></span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
