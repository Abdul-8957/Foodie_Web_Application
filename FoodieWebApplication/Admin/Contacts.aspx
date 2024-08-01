<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="FoodieWebApplication.Admin.Contacts" %>
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

                                        <div class="col-12 mobile-inputs">
                                            <h4 class="sub-title">Contact Lists</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">

                                                    <asp:Repeater ID="rContact" runat="server" OnItemCommand="rContact_ItemCommand" >
                                                        <HeaderTemplate>
                                                            <table class=" table table-hover data-table-export nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">SrNo</th>
                                                                        <th>Name</th>
                                                                        <th>Email</th>
                                                                        <th>Subject</th>
                                                                        <th>Message</th>
                                                                        <th>Date</th>
                                                                        <th class="datatable-nosort">Delete</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%# Eval("SrNo") %> </td>
                                                                <td class="table-plus"><%# Eval("Name") %> </td>
                                                                <td class="table-plus"><%# Eval("Email") %> </td>
                                                                <td class="table-plus"><%# Eval("Subject") %> </td>
                                                                <td class="table-plus"><%# Eval("Message") %> </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lblDate" Text='<%# Eval("Date") %>'></asp:Label> 
                                                                </td>
                                                                <td>
                                                                    <asp:LinkButton ID="lbDelete" runat="server" Text="Delete" CssClass=" badge badge-danger" CommandArgument='<%# Eval("ContactId") %>' CommandName="delete" OnClientClick="return confirm('Do You want to delete this User?');"> <i class=" ti-trash"></i></asp:LinkButton>

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
