using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace ZeeFSLDictionary.Pages
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        private MySqlConnection DBConnection()
        {
            string connect = "datasource=127.0.0.1; username=root; password=; database=zee_db";

            MySqlConnection db = new MySqlConnection(connect);

            try
            {
                db.Open();
                System.Diagnostics.Debug.WriteLine("DB Connected");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('DB Connected!')", true);
            }
            catch (Exception error)
            {
                System.Diagnostics.Debug.WriteLine(error.Message);
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('error.Message')", true);
            }

            return db;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection con = DBConnection();
            string query = "SELECT sign_gif from fsl where id='1'";
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.Connection = con;
            MySqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    byte[] sign_gif = (byte[])dr["sign_gif"];
                    string gif_file = Convert.ToBase64String(sign_gif, 0, sign_gif.Length);
                    word_gif.ImageUrl = "data: gif_file/gif;base64," + gif_file;
                    word_gif.Visible = true;
                }
            }

        }
    }
}