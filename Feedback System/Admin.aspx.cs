using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FeedbackSystem
{
    public partial class Admin : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["FeedbackDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if Admin is logged in
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Feedback ORDER BY Id DESC", con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvFeedback.DataSource = dt;
                gvFeedback.DataBind();
            }
        }

        protected void gvFeedback_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvFeedback.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Feedback WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadData();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}