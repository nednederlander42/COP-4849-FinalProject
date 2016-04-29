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
                displayTable("Proteus300");
            }
            
        }

        protected void displayTable (string displayThis)
        //protected void displayInitialTable()
        {
            string findprotein = displayThis;
            JObject proteins = JObject.Parse(File.ReadAllText(@"" + Server.MapPath("~/meanscoredata.json")));
            //initial table displays proteus 300
            //ajaxTable.Text = "<h2>Hello</h2>";
            //ajaxTable.Text += proteins;
            //"Proteus300", "GOID": "166", "CM": "2362", "ESM": "1798", "MI": "1597", "SS": "2369", "RMSD": "1727", "SI": "1598", "TMSCORE": "1427", "wRMSD": "1999", "SO": "1631", "SectionNumber"
            
            foreach (JProperty protein in (JToken)proteins)
            {
                JArray jarray = (JArray)protein.Value;
                JObject a = JObject.Parse("" + protein.Value[0] + "");
         
                ajaxTable.Text = "<h2>Protein Data Set: " + findprotein;

                ajaxTable.Text += "<Table class=\"customTable\"><tr><th>GOID</th><th>CM</th><th>ESM</th><th>MI</th><th>SS</th><th>RMSD</th><th>rRMSD</th><th>SI</th><th>TMSCORE</th><th>wRSD</th><th>SO</th></tr>";

                //Test Code....
                //ajaxTable.Text += "<tr><td>" + protein.Name + "</td><td>" + protein.Value + "</td><td>" + protein.Value[0]["DataSetName"] + "</td><td>" + protein.Value[0].Next + "</td><td>" + a["DataSetName"] + "</td><td>" + protein.Value.Count() + "</td><td></td><td></td><td></td><td></td><td></td></tr>";

                for (int i = 0;i< protein.Value.Count(); i++){
                    //if (protein.Value[i]["DataSetName"].ToString().Equals(findprotein)) {
                    if (protein.Value[i]["DataSetName"].ToString() == findprotein) {
                        ajaxTable.Text += "<tr><td>" + protein.Value[i]["GOID"] + "</td><td>" + protein.Value[i]["CM"] + "</td><td>" + protein.Value[i]["ESM"] + "</td><td>" + protein.Value[i]["MI"] + "</td><td>" + protein.Value[i]["SS"] + "</td><td>" + protein.Value[i]["RMSD"] + "</td><td>" + protein.Value[i]["rRMSD"] + "</td><td>" + protein.Value[i]["SI"] + "</td><td>" + protein.Value[i]["TMSCORE"] + "</td><td>" + protein.Value[i]["wRMSD"] + "</td><td>" + protein.Value[i]["SO"] + "</td></tr>";
                    }
                    //ajaxTable.Text += "<tr><td>" + protein.Value[i]["GOID"] + "</td><td>" + protein.Value[i]["ESM"] + "</td><td>" + protein.Value[i]["MI"] + "</td><td>" + protein.Value[i]["SS"] + "</td><td>" + protein.Value[i][""] + "</td><td>" + protein.Value[i]["RMSD"] + "</td><td>" + protein.Value[i]["rRMSD"] + "</td><td>" + protein.Value[i]["SI"] + "</td><td>" + protein.Value[i]["TMSCORE"] + "</td><td>" + protein.Value[i]["wRMSD"] + "</td><td>" + protein.Value[i]["SO"] + "</td></tr>";

                }
                
            }
            //displayCustomTable.Text += "<tr class=\"ct-total\"><td></td><td></td><td>Order Total</td><td>$" + cashTotal + "</td></tr>";
            ajaxTable.Text += "</table>";
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
                    line.RMSD = row["RMSD"].ToString();
                    //display += " SI " + row["SI"].ToString();
                    line.rRMSD = row["rRMSD"].ToString();
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
        //Right the event handlers
        protected void proteusClick(object sender, EventArgs e)
        {
            displayTable("Proteus300");
        }

        protected void homstradClick(object sender, EventArgs e)
        {
            displayTable("Homestrad150");
        }

        protected void ucClick(object sender, EventArgs e)
        {
            displayTable("UC350");
        }
    }
}