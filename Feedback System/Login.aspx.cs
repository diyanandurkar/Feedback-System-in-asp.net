using System;

namespace FeedbackSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "admin" && txtPassword.Text == "admin123")
            {
                Response.Redirect("Admin.aspx");
            }
            else if (txtUsername.Text == "customer" && txtPassword.Text == "123")
            {
                Response.Redirect("Customer.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Username or Password!";
            }
        }
    }
}