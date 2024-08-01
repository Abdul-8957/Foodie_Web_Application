<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="FoodieWebApplication.Admin.Product" %>
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
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgProduct.ClientID%>').prop('src', e.target.result)
                        .width(100)
                        .height(100);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="pcoded-inner-content pt-0">
        <div class=" align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Product</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Product Name</label>
                                                    <div>
                                                        <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product Name is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtProductName"></asp:RequiredFieldValidator>
                                                        <asp:HiddenField runat="server" ID="hfId" Value="0" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Product Description</label>
                                                    <div>
                                                        <asp:TextBox ID="txtProductDescription" runat="server" CssClass="form-control" placeholder="Enter Product Description" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Product Description is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtProductDescription"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                  <div class="form-group">
                                                    <label>Product Price(Rupees)</label>
                                                    <div>
                                                        <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-control" placeholder="Enter Product Price(in rupees)"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Product Price is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtProductPrice"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Price must be decimal" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtProductPrice" ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                 <div class="form-group">
                                                    <label>Product Quantity</label>
                                                    <div>
                                                        <asp:TextBox ID="txtProductQuantity" runat="server" CssClass="form-control" placeholder="Enter Product Quantity"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Product Quantity is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtProductQuantity"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Quantity must be non negative" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtProductQuantity" ValidationExpression="^([1-9]\d*|0)$"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Product Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>
                                                  <div class="form-group">
                                                    <label>Product Category</label>
                                                    <div>
                                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryId" AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs %>" SelectCommand="SELECT [CategoryId], [Name] FROM [Categories]"></asp:SqlDataSource>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Category is required" InitialValue="0" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlCategory"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class=" form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive" CssClass="form-check-input" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
                                                    &nbsp;
                                                         <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="btnClear_Click" CausesValidation="false" />
                                                </div>
                                                <div>
                                                    <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Product Lists</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">

                                                    <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand" OnItemDataBound="rProduct_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class=" table table-hover data-table-export nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Name</th>
                                                                        <th>Image</th>
                                                                        <th>Price(rupees)</th>
                                                                        <th>Qty</th>
                                                                        <th>Category</th>
                                                                        <th>Active</th>
                                                                        <th>Description</th>
                                                                        <th>Date</th>
                                                                        <th class="datatable-nosort">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%# Eval("Name") %> </td>
                                                                <td>
                                                                    <img alt="" width="35" height="35" src="<%# Utils.GetImageUrl( Eval("Image")) %>" />
                                                                </td>
                                                                <td><%# Eval("Price") %></td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lblQuantity" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                </td>
                                                                <td><%# Eval("CategoryName") %></td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lblIsActive" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                                </td>
                                                                <td><%# Eval("Description") %></td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="Label1" Text='<%# Eval("Date") %>'></asp:Label> 
                                                                </td>
                                                                <td>
                                                                    <asp:LinkButton ID="lbEdit" runat="server" Text="Edit" CssClass=" badge badge-primary mr-1" CommandArgument='<%# Eval("ProductId") %>' CommandName="edit" CausesValidation="false"> <i class="ti-pencil"></i></asp:LinkButton>
                                                                    <asp:LinkButton ID="lbDelete" runat="server" Text="Delete" CssClass=" badge badge-danger" CommandArgument='<%# Eval("ProductId") %>' CommandName="delete" OnClientClick="return confirm('Do You want to delete this category?');" CausesValidation="false"> <i class=" ti-trash"></i></asp:LinkButton>

                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                              </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
