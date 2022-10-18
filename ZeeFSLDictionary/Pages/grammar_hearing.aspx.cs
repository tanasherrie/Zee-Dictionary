using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.Threading;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Text;
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

        public int KMPSearch(string uInput, List<dbEntries> DatabaseEntries)
        {
            int ret=0; 
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            Thread.Sleep(5000);

            //List<string> retVal = new List<string>();
            //int entryCount = DatabaseEntries.Count;
            int dbCount=0, hasFound=0, j, k;
            int inpLength = uInput.Length;
            Debug.WriteLine("input '"+uInput+"' length is " + inpLength);
            int[] lps;
            lps = new int[inpLength];
            dbEntries todisplay = new dbEntries();


            foreach(var ent in DatabaseEntries)
            {
                dbCount++;
                string dbEntry = ent.itemName;
                int dbLength = dbEntry.Length;
                Debug.WriteLine("db entry '"+dbEntry+"' length is " + dbLength);
                
                j = 0; //index for uinput

                computeLPSarray(uInput, inpLength, lps);
                k = 0; //index for the db input

                //var sb = new StringBuilder();
                //sb.Append(@"
                //<table class='table table-hover table-vcenter'>
                //<tr>
                //<th>name</th>
                //<th>description</th>
                //<th>gif</th>
                //</tr>
                //");

                while (k < dbLength)
                {
                    //if (hasFound == 0)
                    //{
                    //    sb.Append("<tr><td colspan='5'>No record</td></tr>");
                    //}
                    //else
                    //{
                    //    sb.Append($@"
                    //        <tr>
                    //        <td>{ent.itemName}</td>
                    //        <td>{ent.itemDescription}</td>
                    //        <td><img src=""{ent.itemSource}"" alt=""gif_image""/></td>
                    //    ");
                    //}
                    Debug.WriteLine("j is  " + j+" and k is "+k);
                    if (uInput[j] == dbEntry[k])
                    {
                        j++;
                        k++;
                    }
                    if (j == inpLength)
                    {
                        hasFound++;
                        Debug.WriteLine("Found pattern at index -" + (k - j));

                        //MySqlConnection conn = DBConnection();
                        //MySqlCommand cmd = new MySqlCommand("select * from fsl where name=" + dbEntry, conn);
                        //MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                        //DataSet ds = new DataSet();
                        //adp.Fill(ds);
                        //srchResults.DataSource = ds;
                        //srchResults.DataBind();

                        j = lps[j - 1];
                        ret = 1;
                    }

                    else if (k < dbLength && uInput[j] != dbEntry[k])
                    {
                        Debug.WriteLine("input letter '" + uInput[j] + "' not eq " + dbEntry[k]);
                        if (j != 0)
                        {
                            j = lps[j - 1];
                        }
                        else
                        {
                            k++;
                            //Console.WriteLine("pattern not found");
                            Debug.WriteLine("pattern not found");
                            
                        }
                    }
                }
            }

            if (hasFound > 0)
            {
                ret = 1;
            }

            stopwatch.Stop();
            Debug.WriteLine("found pattern " + hasFound + " times in "+dbCount+" db entries");
            Debug.WriteLine("Function ran for {0} ms", stopwatch.ElapsedMilliseconds);
            return ret;
        }

        public int RabinKarp(string uInput, List<dbEntries> DatabaseEntries)
        {
            int ret = 0; 

            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            Thread.Sleep(5000);

            int dbCount = 0;
            double pVal, tVal, exp; //sums
            int ctr, x, y, m, conv, last;//indices


            foreach (var ent in DatabaseEntries)
            {
                dbCount++;
                string dbEntry = ent.itemName;
                int dbLength = dbEntry.Length;
               // Debug.WriteLine("db entry '" + dbEntry + "' length is " + dbLength);


                //#1 Get hash of pattern (user input)
                exp = 0;
                pVal = 0;
                for (ctr = 0, m = 1; ctr < uInput.Length; ctr++, m++)
                {
                    exp = Math.Pow(26, (double)uInput.Length - (double)m);
                    conv = ((int)uInput[ctr]) - 64;
                    exp *= Convert.ToDouble(conv);
                    pVal += exp;
                }
                //Console.WriteLine(pVal);

                //#2 get hash value in txt
                last = dbEntry.Length - uInput.Length;
                for (x = 0, tVal = 0; x <= last && tVal != pVal; x++)
                {
                    tVal = 0;
                    for (y = x, m = 1; y < x + uInput.Length; y++, m++)
                    {
                        exp = Math.Pow(26, (double)uInput.Length - (double)m);
                        conv = ((int)dbEntry[y]) - 64;
                        exp *= Convert.ToDouble(conv);
                        tVal += exp;
                    }
                }
                if(tVal == pVal)
                {
                    Debug.WriteLine("Pattern found at index - " + (x - 1));
                    Debug.WriteLine("found pattern " + dbCount + " db entries");
                    ret = 1;
                }
            }
            //Debug.WriteLine(tVal);
            //Debug.WriteLine(pVal);

            //if (tVal == pVal)
            //{
            //    Debug.WriteLine("Pattern found at index - " + (x - 1));
            //}
            //else
            //{
            //    Debug.WriteLine("Not found!");
            //}

            stopwatch.Stop();
            //Debug.WriteLine("found pattern " + dbCount + " db entries");
            Debug.WriteLine("Function ran for {0} ms", stopwatch.ElapsedMilliseconds);
            return ret;
        }

        public int BoyerMoore(string uInput, List<dbEntries> DatabaseEntries)
        {
            int ret = 0;
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            Thread.Sleep(5000);


            int ctr1, ctr2, lastIndex, y, dbCount = 0, index;
            bool isFound = false;

            //bmTable bm = new bmTable(); badmatch table
            char[] c = new char[uInput.Length];
            int[] val = new int[uInput.Length];

            //initialize the array in the bad match table
            for (ctr1 = 0; ctr1 < uInput.Length; ctr1++)
            {
                c[ctr1] = '*';
            }

            //#1 put character in the bad match table
            for (ctr1 = 0, lastIndex = 0; ctr1 < uInput.Length; ctr1++)
            {
                for (ctr2 = 0; ctr2 < ctr1 && uInput[ctr1] != c[ctr2]; ctr2++) { }
                if (ctr2 < ctr1)
                {
                    val[ctr2] = ctr1; //put latest index
                                      //Console.WriteLine($"Index: {ctr2}");
                                      //Console.WriteLine($"Letter:{c[ctr2]}");
                }
                else
                {
                    c[ctr1] = uInput[ctr1];
                    val[ctr1] = ctr1;
                    lastIndex = ctr1;
                    //Debug.WriteLine(lastIndex);
                    //Console.WriteLine($"Index: {val[ctr1]}");
                    //Console.WriteLine($"Letter:{c[ctr1]}");
                }

            }

            //Debug.WriteLine(lastIndex);
            //val[lastIndex] = lastIndex;

            if (lastIndex < uInput.Length)
            {
                lastIndex += 1;
            }
            Debug.WriteLine(lastIndex);

            //Console.WriteLine($"Index: {val[lastIndex+1]}");
            //Console.WriteLine($"Letter:{c[lastIndex+1]}");

            //#2 add values using length-index-1
            for (ctr1 = 0; ctr1 < lastIndex; ctr1++)
            {
                index = uInput.Length - val[ctr1] - 1;
                if (index > 0)
                {
                    val[ctr1] = index;
                }
                else
                {
                    val[ctr1] = uInput.Length;
                }/*
                Console.WriteLine($"Index: {ctr1}");
                Console.WriteLine($"Letter:{c[ctr1]}");
                Console.WriteLine($"Value:{val[ctr1]}");*/
            }/*
            val[lastIndex] = pattern.Length;
            Console.WriteLine($"Index: {lastIndex}");
            Console.WriteLine($"Letter:{c[lastIndex]}");
            Console.WriteLine($"Value:{val[lastIndex]}");*/

            foreach (var ent in DatabaseEntries)
            {
                dbCount++;
                string dbEntry = ent.itemName;
                int dbLength = dbEntry.Length;
                //Debug.WriteLine("db entry '" + dbEntry + "' length is " + dbLength);



                //#3 matching process
                int s = 0;
                // Console.WriteLine(index);

                while (s<dbLength && isFound != true)
                {
                    for (ctr1 = s + (uInput.Length) - 1, y = dbLength - 1; ctr1 > s && dbEntry[y] == uInput[ctr1]; ctr1--, y--) { } //initial matching
                   
                    if (dbEntry[y] == uInput[ctr1])
                    {
                        isFound = true;
                        Debug.WriteLine($"Pattern found at index {s}");
                        Debug.WriteLine("found pattern " + isFound + " times in " + dbCount + " db entries");
                       
                    }
                    s = dbLength;
                }


                //if (isFound == true)
                //{
                //    Debug.WriteLine($"Pattern found at index {index}");
                //    Debug.WriteLine("found pattern " + isFound + " times in " + dbCount + " db entries");
                //}
            

                //if (isFound == true)
                //{
                //    Debug.WriteLine($"Pattern found at index {index}");
                //    Debug.WriteLine("found pattern " + isFound + " times in " + dbCount + " db entries");
                //}
                //else
                //{
                //    Debug.WriteLine("Pattern not found");
                //}
            }

            if(isFound == true)
            {
                ret = 1;
            }

            stopwatch.Stop();
            
            Debug.WriteLine("Function ran for {0} ms", stopwatch.ElapsedMilliseconds);
            return ret;

        }



        public void computeLPSarray(string uInput, int inpLength, int[] lps)
        {
            int lpsLength = 0;
            int i = 1;
            lps[0] = 0;

            //loop calculates lps[i] for i=1 to m-1
            while (i < inpLength)
            {
                if (uInput[i] == uInput[lpsLength])
                {
                    lpsLength++;
                    lps[i] = lpsLength;
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

        public List<dbEntries> fillList()
        {
            //this is where the algorithm is also implemented
            MySqlConnection con = DBConnection();

            List<dbEntries> toDisplay = new List<dbEntries>();


            string sql = "select * from fsl";
            MySqlCommand comm = new MySqlCommand(sql, con);

            MySqlDataReader msdr;

            msdr = comm.ExecuteReader();

            while (msdr.Read())
            {
                //toDisplay.Add(msdr["word"].ToString());
                toDisplay.Add(new dbEntries
                {
                    itemName = msdr["name"].ToString(),
                    itemDescription = msdr["description"].ToString(),
                    itemSource = msdr["sign_gif"].ToString()
                });
            }

            return toDisplay;
            //msdr.Close();
        }


        public void SearchBtn_Clicked(object sender, EventArgs e)
        {
            //this is where the algorithm is also implemented
            List<dbEntries> toDisplay;
            string uInput = word_search.Text;
            toDisplay = fillList();

            MySqlConnection con = DBConnection();
            string query = "SELECT name, description, sign_gif from fsl WHERE name = '" + uInput+ "'";
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.Connection = con;
            
            //int ret = KMPSearch(uInput, toDisplay);
            //int ret = RabinKarp(uInput, toDisplay);
            int ret = BoyerMoore(uInput, toDisplay);

            MySqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    byte[] sign_gif = (byte[])dr["sign_gif"];
                    string gif_file = Convert.ToBase64String(sign_gif, 0, sign_gif.Length);
                    word_gif.ImageUrl = "data: gif_file/gif;base64," + gif_file;
                    word_gif.Visible = true;
                    word_label.Text = dr["name"].ToString();
                    word_desc.Text = dr["description"].ToString();
                }
            }

        }
            
            //KMPSearch(uInput, toDisplay);
            //RabinKarp(uInput, toDisplay);
            //BoyerMoore(uInput, toDisplay);
            //retvalDisplay = KMPSearch(toDisplay, uInput);
            //}
            //catch (Exception error)
            //{
            //    System.Diagnostics.Debug.WriteLine(error.Message);
            //}

            //return retvalDisplay;
    /*

        public void displaySearchResults (List<string> retvalDisplay)
        {

        }*/

        //public void SearchBtn_Clicked(object sender, EventArgs e)
        //{
        //    MySqlConnection con = DBConnection();


        //}
    }

    public class dbEntries
    {
        public string itemName;
        public string itemSource;
        public string itemDescription;
    }
}