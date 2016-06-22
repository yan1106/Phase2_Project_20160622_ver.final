using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Linq;
using System.Web.Configuration;
using MySql.Data.MySqlClient;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using System.Text;



public partial class EP_TRA_DOE_Create : System.Web.UI.Page
{

    public static string global_Ver_Name = "";




    [System.Web.Services.WebMethod]
    public static string[] GetCustomer(string prefix)
    {
        List<string> Customer = new List<string>();
        string strSQL2 = "select DISTINCT npiapp.New_Customer,npiimportdata.New_Customer,npimanual.New_Customer  from npiapp,npiimportdata,npimanual Where npiapp.New_Customer Like '" + prefix + "%' ";
        string strSQL = " select DISTINCT npiapp.New_Customer from npiapp where npiapp.New_Customer like '" + prefix + "%' union  select  npiimportdata.New_Customer from  npiimportdata where   npiimportdata.New_Customer like '" + prefix + "%' union select  npimanual.New_Customer from npimanual where npimanual.New_Customer like'" + prefix + "%'";

        clsMySQL db = new clsMySQL();
        foreach (DataRow dr in db.QueryDataSet(strSQL).Tables[0].Rows)
        {
            //customers.Add(string.Format("{0},{1}", dr["new_customer"], dr["new_device"]));
            Customer.Add(string.Format("{0}", dr["New_Customer"]));
        }
        return Customer.ToArray();
    }
    [System.Web.Services.WebMethod]
    public static string[] GetNewDevice(string prefix)
    {
        List<string> New_Device = new List<string>();
        string strSQL = " select DISTINCT npiapp.New_Device from npiapp where npiapp.New_Device like '" + prefix + "%' union  select  npiimportdata.New_Device from  npiimportdata where   npiimportdata.New_Device like '" + prefix + "%' union select  npimanual.New_Device from npimanual where npimanual.New_Device like'" + prefix + "%'";
        clsMySQL db = new clsMySQL();
        foreach (DataRow dr in db.QueryDataSet(strSQL).Tables[0].Rows)
        {
            //customers.Add(string.Format("{0},{1}", dr["new_customer"], dr["new_device"]));
            New_Device.Add(string.Format("{0}", dr["New_Device"]));
        }
        return New_Device.ToArray();
    }















    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Panel_EPTRA.Visible = false;
            Panel_eptraview.Visible = false;
            //Panel_EPTramain.Visible = false;
            //Search_Device.Attributes.Add("onclick", "return false;");
        }
    }

  
   


   
  
 


    protected int count_EffectLabel(string Key_item)
    {
        string sql = "select COUNT(DISTINCT EP_Cate_SpeChar) from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "'";
        int temp=0;

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read()) {
            temp = Convert.ToInt32(mydr["COUNT(DISTINCT EP_Cate_SpeChar)"]);
        }

        mydr.Close();
        MySqlConn.Close();
        

        return temp;


    }

    protected int count_Effectstage(string Key_item)
    {
        string sql = "select COUNT(DISTINCT EP_Cate_Stage) from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "'";
        int temp = 0;

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp = Convert.ToInt32(mydr["COUNT(DISTINCT EP_Cate_Stage)"]);
        }

        mydr.Close();
        MySqlConn.Close();


        return temp;


    }


    protected int count_EffectLabel_stage(string Key_item,string stage)
    {
        string sql = "select COUNT(DISTINCT EP_Cate_SpeChar) from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "'and EP_Cate_Stage='" + stage + "'";
        int temp = 0;

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp = Convert.ToInt32(mydr["COUNT(DISTINCT EP_Cate_SpeChar)"]);
        }

        mydr.Close();
        MySqlConn.Close();


        return temp;


    }



    protected string display_Effectstage(string Key_item, int temp_num=0)
    {
        string sql = "select DISTINCT EP_Cate_Stage from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "'";
        string temp;
        List<string> temp_effect = new List<string>();
        //temp_num = 0;

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp_effect.Add(Convert.ToString(mydr["EP_Cate_Stage"]));
        }

        mydr.Close();
        MySqlConn.Close();


        return temp_effect[temp_num];

    }



    protected string display_EffectLabel(string Key_item,string stage, int temp_num=0)
    {
        string sql = "select DISTINCT EP_Cate_SpeChar from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "' and EP_Cate_Stage='"+stage+"'";
        string temp;
        List<string> temp_effect = new List<string>();
        

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp_effect.Add(Convert.ToString(mydr["EP_Cate_SpeChar"]));
        }

        mydr.Close();
        MySqlConn.Close();


        return temp_effect[temp_num];

    }

    protected Boolean jude_keyitem(string keyitem)
    {

        string sql = "select DISTINCT EP_Cate_Stage from npi_ep_category where EP_Cate_Iiitems='" + keyitem + "'";
        string temp = "";


        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp = mydr["EP_Cate_Stage"].ToString();
        }

        mydr.Close();
        MySqlConn.Close();


        if (temp !="")
            return true;
        else
            return false;



    }


    protected void btn_Click(object sender, EventArgs e)
    {
        string keyitem = "";
        string stage = "";
        string SpeChar = "";


        //here type cast the sender as LinkButton type and know which is the button that clicked.
        LinkButton bttn = sender as LinkButton;
        string query_str = bttn.ID;

        string[] doe_split = query_str.Split('_');

        keyitem = doe_split[1];
        stage = doe_split[2];
        SpeChar = doe_split[3];

        string redirect = keyitem + "&" + stage + "&" + SpeChar;

        //string strScript = string.Format("<script language='javascript'>error_msg('"+redirect+"');</script>");
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        Response.Redirect("DOE_yes.aspx?"+redirect);
    }


    protected void keyitem_put_data2(Panel temp_Lv, Panel temp_stage, Panel temp_pot, Label lab_stage, Label lab_pot, string keyitem)
    {

        List<int> b = new List<int>(); // 存放count_EffectLabel_stage 值
        int a = count_Effectstage(keyitem);
        //int b = count_EffectLabel(keyitem);
        string temp_effect_name = "";
        string temp_pot_name = "";
        string br = "";
        string temp_pot_name2 = "";

        string Version_name = "";
        Version_name = Session["Version_name"].ToString();

        if (jude_keyitem(keyitem) == true)
        {
            for (int i = 0; i < a; i++)
            {
                Label effect = new Label();
                ImageButton TraLv = new ImageButton();
                Label Tratext = new Label();

                temp_effect_name = display_Effectstage(keyitem, i);
                effect.ID = "stage_" + temp_effect_name + i;
                TraLv.ID = "Imagebutton_" + keyitem +"_"+ temp_effect_name;
                b.Add(count_EffectLabel_stage(keyitem, temp_effect_name));

                for (int j = 0; j < b[i] + 1; j++)
                {
                    br += "<br />";

                }
                
                effect.Text = temp_effect_name + br;
                temp_stage.Controls.Add(effect);

                //TraLv.OnClientClick = "window.open(EP_TRA_Level.aspx,Set_DOE_Lv,width = 200,height = 100)";
                //TraLv.Attributes.Add("onclientClick", "window.open(/EP_TRA_Level.aspx, Set_DOE_Lv)");


                br = "";

                                          

                HyperLink Potential = new HyperLink();
                string str = "";

                for (int k = 0; k < b[i]; k++)
                {

                    temp_pot_name = display_EffectLabel(keyitem, temp_effect_name, k);
                    temp_pot_name2 += temp_pot_name + "<br />";
                    if (k != (b[i] - 1)) { 
                    str += temp_pot_name + "|";
                    }
                    else
                    {
                        str += temp_pot_name;
                    }


                    if (b[i] - 1 == k)
                    {
                        Potential.Text += "<br />";
                    }


                    Potential.Attributes.Remove("href");
                    temp_pot.Controls.Add(Potential);

                }


                TraLv.ImageUrl = "icon/red.gif";
                string session = "filename=" + Version_name + "&" + "keyitem=" + keyitem + "&" + "stage=" + temp_effect_name + "";


                TraLv.OnClientClick = "test(" + "\"" + session + "\"" + ");";
                TraLv.Attributes.Add("onclick", "return false;");

                TraLv.Width = Unit.Pixel(30);
                TraLv.Height = Unit.Pixel(30);
                temp_Lv.Controls.Add(TraLv);



                Tratext.Text = "<br />" + "<br />" + "<br />";

                temp_Lv.Controls.Add(Tratext);




                //string redirect = "File_Name='" + Version_name + "'&" + "keyitem='" + keyitem + "'&" + "stage='" + temp_effect_name + "'&" + "SpeChar='" + temp_pot_name + "'";
                string redirect = "File_Name='" + Version_name + "'&" + "keyitem='" + keyitem + "'&" + "stage='" + temp_effect_name + "'";
                string url = "DOE_yes.aspx?" + redirect;
                Potential.ID = "Potential_" + keyitem + "_" + temp_effect_name + "_" + temp_pot_name;
                Potential.NavigateUrl = url;
                Potential.Target = "_self";
                Potential.Text = temp_pot_name2 + "<br />";
                temp_pot_name2 = "";

            }

        }
        else
        {
            lab_stage.Text = "Not Defined!";
            lab_stage.ForeColor = System.Drawing.Color.Red;
            lab_pot.Text = "Not Defined!";
            lab_pot.ForeColor = System.Drawing.Color.Red;

        }


    }




    protected void keyitem_put_data(Panel temp_stage,Panel temp_pot,Label lab_stage,Label lab_pot,string keyitem)
    {
       
        List<int> b = new List<int>(); // 存放count_EffectLabel_stage 值
        int a = count_Effectstage(keyitem);
        //int b = count_EffectLabel(keyitem);
        string temp_effect_name = "";
        string temp_pot_name = "";
        string br = "";
        string temp_pot_name2 = "";
        if (jude_keyitem(keyitem) == true)
        {
            for (int i = 0; i < a; i++)
            {
                Label effect = new Label();
                ImageButton TraLv = new ImageButton();
                temp_effect_name = display_Effectstage(keyitem, i);
                effect.ID = "stage_" + temp_effect_name + i;
                b.Add(count_EffectLabel_stage(keyitem, temp_effect_name));

                for (int j = 0; j < b[i] + 1; j++)
                {
                    br += "<br />";
                }
                
                effect.Text = temp_effect_name + br;
                
               
                temp_stage.Controls.Add(effect);
                br = "";
                string Version_name = "";
                Version_name = Session["Version_name"].ToString();


                
                
              HyperLink Potential = new HyperLink();
                    
                   
              for (int k = 0; k < b[i]; k++)
              {

                    temp_pot_name = display_EffectLabel(keyitem, temp_effect_name, k);
                    temp_pot_name2 += temp_pot_name + "<br />";
                   


                    if (b[i] - 1 == k)
                    {
                        Potential.Text += "<br />";
                    }

                    
                    Potential.Attributes.Remove("href");
                    temp_pot.Controls.Add(Potential);

                }

                string redirect = "File_Name='" + Version_name + "'&" + "keyitem='" + keyitem + "'&" + "stage='" + temp_effect_name + "'&" + "SpeChar='" + temp_pot_name + "'";
                string url = "DOE_yes.aspx?" + redirect;
                Potential.ID = "Potential_" + keyitem + "_" + temp_effect_name + "_" + temp_pot_name;
                Potential.NavigateUrl = url;
                Potential.Target = "_self";
                Potential.Text = temp_pot_name2+"<br />";
                temp_pot_name2 = "";

            }

        }
        else
        {
            lab_stage.Text = "Not Defined!";
            lab_stage.ForeColor = System.Drawing.Color.Red;
            lab_pot.Text = "Not Defined!";
            lab_pot.ForeColor = System.Drawing.Color.Red;

        }


    }


    


   




    /*
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        int i = 0;
        index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selecteRow = GridView1.Rows[index];
        TableCell productName_Device = selecteRow.Cells[1];
        TableCell productName_Production_Site = selecteRow.Cells[2];
        TableCell productName_PKG = selecteRow.Cells[3];
        TableCell productName_Wafer = selecteRow.Cells[4];
        TableCell productName_fab = selecteRow.Cells[5];
        TableCell productWaferPSV = selecteRow.Cells[6];
        TableCell productRVSI = selecteRow.Cells[7];
        TableCell productCustomer = selecteRow.Cells[8];



        if (e.CommandName == "search")
        {


        

     

        }
    }
    */

    protected Boolean jude_Query_EPTRA(string sql)
    {
        string Temp_Cus = "";
        string Temp_New = "";
        clsMySQL db = new clsMySQL();

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            Temp_Cus = (String)mydr["Ver_New_Customer"];
            Temp_New = (String)mydr["Ver_New_Device"];

        }

        if (Temp_Cus == Customer_TB.Text && Temp_New == ND_TB.Text)
        {
            return true;
        }
        else
            return false;

    }



    protected string rec_Ver_Name_Str(string sql)
    {
        string Ver_Name = "";
        
        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            Ver_Name = (String)mydr["Ver_Name"];
           
        }

        return Ver_Name;
       

    }



    protected Boolean jude_doe_signoff(string sql)/*判斷doe_signoff裡是不是有Ver_Name的紀錄*/
    {
        string Ver_Name = "";
        clsMySQL db = new clsMySQL();

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            Ver_Name = (String)mydr["Ver_Name"];
            

        }

        if (Ver_Name=="")
        {
            return true;
        }
        else
            return false;

    }



    protected void Search_Device_Eptra_table(object sender, EventArgs e)
    {
        int count = 0;
        string Ver_Name = "";
        //"select * from npieptraver_main AS T1,npieptra_lv_main_status AS T2 where T1.Ver_New_Customer='" + Customer_TB.Text + "' and T1.Ver_New_Device='" + ND_TB.Text + "' and T1.Ver_Status=T2.Ver_Status ";
        string sql_jude_Ver_Sta = "select * from npieptraver_main AS T1,npieptra_lv_main_status AS T2 where T1.Ver_New_Customer = '" + Customer_TB.Text + "'and T1.Ver_New_Device= '" + ND_TB.Text + "' and T1.Ver_Status = T2.Ver_Status  and T2.LV_Signoff_Status='Acc'";
        Ver_Name = rec_Ver_Name_Str(sql_jude_Ver_Sta);


        string sql_jude_Lv_Sta = "select * from npieptra_doe_signoff where Ver_Name='" + Ver_Name + "'";

        if (Customer_TB.Text.Trim() != "" && ND_TB.Text.Trim() == "")
        {
            string strScript = string.Format("<script language='javascript'>error_msg('您沒輸入New_Device條件,請重新輸入!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        }
        else if (Customer_TB.Text.Trim() == "" && ND_TB.Text.Trim() != "")
        {

            string strScript = string.Format("<script language='javascript'>error_msg('您沒輸入New_Customer條件,請重新輸入!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);


        }
        else if (Customer_TB.Text.Trim() == "" && ND_TB.Text.Trim() == "")
        {

            string strScript = string.Format("<script language='javascript'>error_msg('您沒輸入New_Customer與New_Device條件,請重新輸入!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);


        }
        else if (jude_Query_EPTRA(sql_jude_Ver_Sta) && jude_doe_signoff(sql_jude_Lv_Sta) )
        {

           
            Panel_eptraview.Visible = true;
            clsMySQL db = new clsMySQL(); //Connection MySQL
            clsMySQL.DBReply dr = db.QueryDS(sql_jude_Ver_Sta);
            DOE_gv1.DataSource = dr.dsDataSet.Tables[0].DefaultView;
            DOE_gv1.DataBind();
            db.Close();


        }
        else if (!jude_Query_EPTRA(sql_jude_Ver_Sta))
        {

            string strScript = string.Format("<script language='javascript'>error_msg('"+Ver_Name+"還未做Level送審');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);



        }
        else if (!jude_doe_signoff(sql_jude_Lv_Sta))
        {


            string strScript = string.Format("<script language='javascript'>error_msg('" + Ver_Name + "已做DOE送審');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);


        }
        else
        {
            
            string strScript = string.Format("<script language='javascript'>error_msg('無此版本!!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        }




        /*
        clsMySQL db = new clsMySQL(); //Connection MySQL
        clsMySQL.DBReply dr = db.QueryDS(str_eptraver_main);
        DOE_gv1.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        DOE_gv1.DataBind();
        db.Close();
        */
    }

    protected void Customer_TB_TextChanged(object sender, EventArgs e)
    {

    }

    protected void ND_TB_TextChanged1(object sender, EventArgs e)
    {

    }





    /*protected void Butt_Search_Eptra_click(object sender, EventArgs e)
    {
        Panel_EPTRA.Visible = true;
        string sql_porgodlen = "select * from npieptraver_por where Ver_Name='" + Lab_Ver.Text + "'";
        string sql_newdevice = "select * from npieptraver_new where Ver_Name='" + Lab_Ver.Text + "'";
        string sql_gap = "select * from npieptraver_gap where Ver_Name='" + Lab_Ver.Text + "'";

        display_PORGOlden_data(sql_porgodlen);
        display_NewDevice_data(sql_newdevice);
        display_gap_data(sql_gap);
        gap_compare();

    }
    */
   

    

    protected void Button_Cancel_Click(object sender, EventArgs e)
    {
        Panel_EPTRA.Visible = false;
        query_ver.Visible = true;
        Panel_eptraview.Visible = true;
    }

    protected void But_Create_DOE_Click(object sender, EventArgs e)
    {
        GridViewRow myRow = (GridViewRow)((Button)sender).NamingContainer;
        int global_RowIndex = myRow.RowIndex;

        global_Ver_Name = DOE_gv1.Rows[global_RowIndex].Cells[1].Text;
      

        rec_categorydata(global_Ver_Name);

        Panel_eptraview.Visible = false;
        query_ver.Visible = false;
        Panel_EPTRA.Visible = true;

    }


    public void rec_categorydata(string Ver_Name)
    {
        //string doe_str = "select * from npi_ep_category where EP_Cate_Stage='PI1' and  EP_Cate_SpeChar='PI Thickness(ASI)' and EP_Cate_Iiitems='Wafer PSV type / Thickness' ";
        string doe_str = "select * from npieptraver_category  where Ver_Name='"+Ver_Name+"'";
        string count = "";        
        int num = 0;
        string[] category_kp = new string[50];
        List<string> str_stage = new List<string>();
        List<string> str_kp = new List<string>();
        List<string> str_md = new List<string>();
        List<string> str_cate = new List<string>();
        List<string> str_SpeChar = new List<string>();
        string kp = "";


        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(doe_str, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();


        while (mydr.Read())
        {
            str_stage.Add("'" + (String)mydr["EP_Cate_Stage"] + "'");
            str_SpeChar.Add("'" + (String)mydr["EP_Cate_SpeChar"] + "'");
            str_md.Add("'" + (String)mydr["EP_Cate_Md"] + "'");
            str_cate.Add("'" + (String)mydr["EP_Cate_Cate"] + "'");
            str_kp.Add("'" + (String)mydr["EP_Cate_KP"] + "'");


            num++;
        }
        //Response.Write(num);
        StringBuilder sb = new StringBuilder(); //using System.Text;
        sb.Append("<script>");
        sb.Append(" var array_stage = new Array; var array_SpeChar = new Array;var array_md = new Array;var array_cate = new Array;var array_kp = new Array; var row_count = 0; var version_name;");



        foreach (string str in str_stage)
        {
            sb.Append("array_stage.push(" + str + ");");
        }
        foreach (string str in str_SpeChar)
        {
            sb.Append("array_SpeChar.push(" + str + ");");
        }
        foreach (string str in str_md)
        {
            sb.Append("array_md.push(" + str + ");");
        }
        foreach (string str in str_cate)
        {
            sb.Append("array_cate.push(" + str + ");");
        }
        foreach (string str in str_kp)
        {
            sb.Append("array_kp.push(" + str + ");");
        }
        sb.Append("row_count=" + num + ";");
        sb.Append("version_name='" + Ver_Name + "';");
        //sb.Append("createtable(" + num + ")");
        sb.Append("</script>");

        ClientScript.RegisterStartupScript(this.GetType(), "TestArrayScript", sb.ToString());

        string strScript = string.Format("<script language='javascript'>createtable(" + num + ");</script>");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);


    }





}



















