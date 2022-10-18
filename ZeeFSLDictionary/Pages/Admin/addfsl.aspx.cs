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
            string filename = Path.GetFileName(fslFile.PostedFile.FileName);
            string contentType = fslFile.PostedFile.ContentType;

            DateTime d = DateTime.Now;

            MySqlConnection con = DBConnection();
  

            using (Stream fs = fslFile.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    
                    using (con)
                    {
                        string query = "INSERT INTO fsl (sign_gif,filename,description,type,date_updated) values (@gif,@name, @description,@type,@date)";
                        using (MySqlCommand cmd = new MySqlCommand(query))
                        {
                            cmd.Connection = con;

                            cmd.Parameters.AddWithValue("@gif", bytes);
                            cmd.Parameters.AddWithValue("@name", filename);
                            cmd.Parameters.AddWithValue("@description", description.Text);
                            cmd.Parameters.AddWithValue("@type", contentType);
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
             }
         }
     }       
 }
