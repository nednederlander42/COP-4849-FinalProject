using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COP_4849FinalProject
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if file does not exist do connect()
            if (connect())
            {
                string display = "JSON Created successfully";
                ClientScript.RegisterStartupScript(this.GetType(), "Info", "alert('" + display + "');", true);
            }
        }

        protected Boolean connect()
        {
            Boolean status = true;
            MySqlConnection msqlConnection = null;
            msqlConnection = new MySqlConnection("server=localhost;user id=root;Password=noonan79;database=teamproj;persist security info=True");
                //define the command reference
            MySqlCommand msqlCommand = new MySqlCommand();
            //define the connection used by the command object
            msqlCommand.Connection = msqlConnection;
            msqlCommand.CommandText = "SELECT * FROM meanrankscoretable;";
            try
            {
                //open the connection
                msqlConnection.Open();
                //use a DataReader to process each record
                MySqlDataReader msqlReader = msqlCommand.ExecuteReader();
                DataTable meanrankscore = new DataTable();
                meanrankscore.Load(msqlReader);
                dynamic line = new JObject();
                string json = "{ \"server_response\": [";
                int counter = 0;
                foreach (DataRow row in meanrankscore.Rows)
                {
                    
                    //string display = "DataSetName " + row["DataSetName"].ToString();
                    line.DataSetName = row["DataSetName"].ToString();
                    //display += " GOID " + row["GOID"].ToString();
                    line.GOID = row["GOID"].ToString();
                    //display += " CM " + row["CM"].ToString();
                    line.CM = row["CM"].ToString();
                    //display += " ESM " + row["ESM"].ToString();
                    line.ESM = row["ESM"].ToString();
                    //display += " MI " + row["MI"].ToString();
                    line.MI = row["MI"].ToString();
                    //display += " SS " + row["SS"].ToString();
                    line.SS = row["SS"].ToString();
                    //display += " SSRMSD " + row["SSRMSD"].ToString();
                    line.SSRMSD = row["SSRMSD"].ToString();
                    //display += " SI " + row["SI"].ToString();
                    line.SI = row["SI"].ToString();
                    //display += " TMSCORE " + row["TMSCORE"].ToString();
                    line.TMSCORE = row["TMSCORE"].ToString();
                    //display += " wRMSD " + row["wRMSD"].ToString();
                    line.wRMSD = row["wRMSD"].ToString();
                    //display += " SO " + row["SO"].ToString();
                    line.SO = row["SO"].ToString();
                    //display += " SectionNumber " + row["SectionNumber"].ToString();
                    line.SectionNumber = row["SectionNumber"].ToString();
                    //File.WriteAllText(@"" + Server.MapPath("~/meanscoredata.json"), JsonConvert.SerializeObject(line));
                    if(counter != 0)
                    {
                        json += ",";
                    }
                    counter += 1;
                    json += JsonConvert.SerializeObject(line);
                    //using (StreamWriter writeObject = new StreamWriter(Server.MapPath("~/meanscoredata.json"), true))
                    //{
                    //    writeObject.WriteLine(line.toString()); // Write the file.
                    //}
                    ClientScript.RegisterStartupScript(this.GetType(), "Info", "alert('" + line.ToString() + "');", true);
                }
                json += "]}";
                File.WriteAllText(@"" + Server.MapPath("~/meanscoredata.json"), json);
                //File.WriteAllText(@"c:/meanscoredata.json", json);
                //using (StreamWriter file = File.CreateText(@"" + Directory.GetCurrentDirectory() + "meanscoredata.json"))
                //    { 
                //        JsonSerializer serializer = new JsonSerializer();
                //        serializer.Serialize(file, movie);
                //    }
            }
            catch (Exception er)
            {
                //do something with the exception
                ClientScript.RegisterStartupScript(this.GetType(), "Info", "alert('" + er.Message + "');", true);
                status = false;
            }
            finally
            {
                //always close the connection
                msqlConnection.Close();
            }
            return status;
        }
    }
}