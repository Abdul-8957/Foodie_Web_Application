<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FoodieWebApplication.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        }
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(100)
                        .height(100);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg" Visible="false"></asp:Label>
                </div>
                <asp:Label runat="server" ID="lblHeaderMsg" Text="<h2>User Registration</h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvName" ErrorMessage="Name is required" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revName" ErrorMessage="Name must be in character only" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Enter Full Name" ToolTip="Full Name"></asp:TextBox>

                        </div>

                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvUsername" ErrorMessage="Username is required" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" placeholder="Enter User Name" ToolTip="Username"></asp:TextBox>

                        </div>

                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ErrorMessage="Email is required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revEmail" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Enter Email" TextMode="Email" ToolTip="Email"></asp:TextBox>

                        </div>

                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvMobile" ErrorMessage="Mobile No. is required" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revMobile" ErrorMessage="Mobile No. must be  10 digits." ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                            <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control" placeholder="Enter Mobile Number" TextMode="Number" ToolTip="Mobile Number"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvAddress" ErrorMessage="Address is required" ControlToValidate="txtAddress" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" placeholder="Enter Address" ToolTip="Address"></asp:TextBox>

                        </div>

                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvPostCode" ErrorMessage="Post/Zip Code is required" ControlToValidate="txtPostCode" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="revPostCode" ErrorMessage="Post/Zip Code must be of 6 digits." ControlToValidate="txtPostCode" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{6}$"></asp:RegularExpressionValidator>
                            <asp:TextBox runat="server" ID="txtPostCode" CssClass="form-control" placeholder="Enter Post/Zip Code" TextMode="Number" ToolTip="Post/Zip Code"></asp:TextBox>

                        </div>

                        <div>
                            <asp:FileUpload runat="server" ID="fuUserImage" CssClass="form-control" ToolTip="UserImage" onchange-="ImagePreview(this);"></asp:FileUpload>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <%--<asp:RegularExpressionValidator runat="server" ID="revPassword" ErrorMessage="Enter Stromg Password" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$" ></asp:RegularExpressionValidator>--%>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Enter Password" TextMode="Password" ToolTip="Password"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="row pl-4">
                    <div class="btn-box">
                        <asp:Button runat="server" ID="btnRegister" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnRegister_Click" />
                        <asp:Label runat="server" ID="lblAlreadyUser" CssClass="pl-3 text-black-100" Text="Already Registered? <a href='Login.aspx' class='badge badge-info ml-3'>Login Here..</a>"></asp:Label>
                    </div>
                </div>
                <div class="row p-5">
                    <div class="align-items-center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>

            </div>
        </div>
    </section>

</asp:Content>
