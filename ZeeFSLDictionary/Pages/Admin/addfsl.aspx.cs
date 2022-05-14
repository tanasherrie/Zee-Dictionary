using System;
using System.Collections.Generic;
using System.Linq;
using System.Web; 
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace ZeeFSLDictionary.Pages.Admin
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        private MySqlConnection DBConnection()
        {
            string connect = "datasource=127.0.0.1; username=root; password=; database=zee_db";

            MySqlConnection db = new MySqlConnection(connect);

            try
            {
                db.Open();
                System.Diagnostics.Debug.WriteLine("DB Connected");
            }
            catch (Exception error)
            {
                System.Diagnostics.Debug.WriteLine(error.Message);
            }

            return db;
        }

        /*private void display()
        {
            MySqlConnection con = DBConnection();

            MySqlDataAdapter da = new MySqlDataAdapter("SELECT * FROM ", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList.DataSource = ds;
            DataList.DataBind();
        }*/

        protected void Page_Load(object sender, EventArgs e)
        {
            //DBConnection();
        }

        protected void addSign_Click(object sender, EventArgs e)
        {
            //get filename
            string path;
            if (fslFile.HasFile)
                fslFile.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "/assets/gif/" + fslFile.FileName);
                path = fslFile.FileName;

            DateTime d = DateTime.Now;

            MySqlConnection con = DBConnection();
   
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO fsl (sign_gif,name,description,date_updated) values (@gif,@name, @description,@date)";
            cmd.Parameters.AddWithValue("@gif", path);
            cmd.Parameters.AddWithValue("@name", name.Text);
            cmd.Parameters.AddWithValue("@description", description.Text);
            cmd.Parameters.AddWithValue("@date", d); 

            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('FSL Sign Added!')", true);
            }
            else
            {
                Console.WriteLine("Error saving to db");
            }
        }

        
    }
}