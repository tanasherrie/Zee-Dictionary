using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Web.Services;

namespace ZeeFSLDictionary.Pages
{
    public partial class grammar_hearing : Page
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
        protected void Page_Load(object sender, EventArgs e)
        {
            //MySqlConnection con = DBConnection();
        }

        public List<string> KMPSearch(List<string> DatabaseEntries, string uInput)
        {
            List<string> retVal = new List<string>();
            int entryCount = DatabaseEntries.Count;
            int i, j, k;
            int inpLength = uInput.Length;
            int[] lps;
            
            for(i=0; i<entryCount; i++){
                string dbEntry = DatabaseEntries[i];
                int dbLength = dbEntry.Length;
                //lps -> Longest Proper Suffix
                lps = new int[inpLength];
                j = 0;

                //method for prepocessing and calculating the LPS array
                computeLPSarray(uInput, inpLength, lps);
                k = 0; //index for the db input

                while(j < dbLength)
                {
                    if(dbEntry[j] == uInput[k])
                    {
                        j++;
                        k++;
                    }
                    if(j == k)
                    {
                        Console.WriteLine("Found pattern at index -" + (j - k));
                        retVal.Add(dbEntry);
                        k = lps[k - 1]; 
                    }

                    //mismatch after k matches scenario
                    else if(j<dbLength && uInput[k] != dbEntry[j])
                    {
                        // Do not match lps[0..lps[j-1]] characters, 
                        // they will match anyway
                        if (k != 0)
                        {
                            k = lps[k - 1];
                        }
                        else
                        {
                            j++;
                            Console.WriteLine("pattern not found");
                        }
                    }
                }
            }

            return retVal;
        }

        public void computeLPSarray(string uInput, int inpLength, int[] lps)
        {
            int lpsLength = 0;
            int i = 1;
            lps[0] = 0;

            //loop calculates lps[i] for i=1 to m-1
            while (i < inpLength)
            {
                if (uInput[i] == uInput[inpLength])
                {
                    inpLength++;
                    lps[i] = inpLength;
                    i++;
                }
                else // (pat[i] != pat[len]) 
                {
                    if (lpsLength != 0)
                    {
                        lpsLength = lps[lpsLength - 1];
                    }
                    else
                    {
                        lps[i] = lpsLength;
                        i++;
                    }
                }
            }
        }

        public void doAutoComplete(object sender, EventArgs e)
        {
            //this is where the algorithm is also implemented
            MySqlConnection con = DBConnection();
            //try
            //{
            //    con.Open();
            //    System.Diagnostics.Debug.WriteLine("DB Connected");
            List<string> retvalDisplay;
            List<string> DatabaseEntries = new List<string>();
            string uInput = word_search.Text;
            //string uInput = userInput;

            string sql = "select * from entries";
            MySqlCommand comm = new MySqlCommand(sql, con);
            MySqlDataReader msdr = null;
            msdr = comm.ExecuteReader();

            while (msdr.Read())
            {
                DatabaseEntries.Add(msdr["word"].ToString());
            }
            msdr.Close();

            retvalDisplay = KMPSearch(DatabaseEntries, uInput);
            //}
            //catch (Exception error)
            //{
            //    System.Diagnostics.Debug.WriteLine(error.Message);
            //}

            //return retvalDisplay;
        }

        public void SearchBtn_Clicked(object sender, EventArgs e)
        {
            MySqlConnection con = DBConnection();


        }
    }
}