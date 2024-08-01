using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;

namespace FoodieWebApplication.User
{
    public partial class BookTable : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter sda;
        DataTable dt;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBookTable_Click(object sender, EventArgs e)
        {
            try
            {
               
                    con = new SqlConnection(Connection.GetConnectionString());
                    cmd = new SqlCommand("BookTableSp", con);
                    cmd.Parameters.AddWithValue("@Action", "INSERT");
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Person", ddlPerson.SelectedValue);
                    cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(txtDate.Text));
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Thanks for booking happy you all!";
                    lblMsg.CssClass = "alert alert-success";
               
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }
        void Clear()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtDate.Text = string.Empty;
            ddlPerson.ClearSelection();
        }
    }
}