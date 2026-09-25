using System;
using System.Configuration;
using System.Data.SqlClient;

namespace FeedbackSystem
{
    public partial class Customer : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["FeedbackDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection(cs);

                string query = "insert into Feedback(Name,Email,Rating,Feedback) values(@n,@e,@r,@f)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@n", txtName.Text);
                cmd.Parameters.AddWithValue("@e", txtEmail.Text);
                cmd.Parameters.AddWithValue("@r", txtRating.Text);
                cmd.Parameters.AddWithValue("@f", txtFeedback.Text);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                lblMessage.Text = "Feedback Submitted Successfully";

                txtName.Text = "";
                txtEmail.Text = "";
                txtRating.Text = "";
                txtFeedback.Text = "";
            }
        }
    }
}