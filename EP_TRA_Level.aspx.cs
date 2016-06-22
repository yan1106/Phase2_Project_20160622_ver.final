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





public partial class EP_TRA_Level : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string keyitem = Request.QueryString["keyitem"];
        string stage = Request.QueryString["stage"];
                           
        string Version_Name = Request.QueryString["filename"];

        //Response.Write(keyitem + stage + Version_Name);
        if (!Page.IsPostBack) {
            receive_Lv(Version_Name, stage, keyitem);
        }
       
        HttpContext.Current.Session["Version_Name"] = Version_Name;
        HttpContext.Current.Session["keyitem"] = keyitem;
        HttpContext.Current.Session["stage"] = stage;

    }

    protected Boolean jude_Lv(string filename, string stage, string keyitem,string spechar)/*空為true*/
    {
       
        string sign = "1";
        string sql = "select * from npieptra_lv_main where Ver_Name='" + filename + "' and EPTRA_LV_Stage ='" + stage + "' and EPTRA_KeyItem='" + keyitem + "'";
               

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();
       


        while (mydr.Read())
        {
            if(mydr["EPTRA_LV"].ToString()=="")
            {
                sign = "1";
                break;
            }
            else
            {
                sign = "0";
                break;
            }
        }

        mydr.Close();
        MySqlConn.Close();


        if (sign == "1")
            return true;
        else
            return false;

    }



    protected String select_Lv(string filename, string stage, string keyitem,string spechar)
    {

        string Lv = "";
        string sql = "select EPTRA_LV from npieptra_lv_main where Ver_Name='" + filename + "' and EPTRA_LV_Stage='" + stage + "' and EPTRA_KeyItem='" + keyitem + "' and EPTRA_LV_SpecChar='" + spechar + "'";            

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

       while(mydr.Read())
        {
            Lv = mydr["EPTRA_LV"].ToString();
        }

        mydr.Close();
        MySqlConn.Close();


        return Lv;

    }




    protected void receive_Lv (string filename,string stage,string keyitem)
    {
        
        string SpeChar="";
        string md = "";
        string cate = "";
        string key = "";
       

        string str_sql = "select DISTINCT EP_Cate_Iiitems,EP_Cate_Stage,EP_Cate_SpeChar from npieptraver_category where EP_Cate_Stage='" + stage + "' and EP_Cate_Iiitems='" + keyitem + "' and Ver_Name='"+filename+"'";

        


        clsMySQL db = new clsMySQL(); //Connection MySQL
        clsMySQL.DBReply dr = db.QueryDS(str_sql);
        GridView1.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GridView1.DataBind();
        db.Close();

        



        for(int i=0;i<GridView1.Rows.Count;i++)
        {

            SpeChar = GridView1.Rows[i].Cells[2].Text;
            //md = GridView1.Rows[i].Cells[1].Text;
            //cate = GridView1.Rows[i].Cells[2].Text;
            //key = GridView1.Rows[i].Cells[3].Text;


            if (jude_Lv(filename,stage,keyitem,SpeChar))
            {
                DropDownList  ddl_Lv = (DropDownList)GridView1.Rows[i].Cells[3].FindControl("Doe_Lv");
                ddl_Lv.Items.Add(new ListItem("RC(Lv.3)", "RC(Lv.3)"));
                ddl_Lv.Items.Add(new ListItem("MC(Lv.4)", "MC(Lv.4)"));
                ddl_Lv.Items.Add(new ListItem("LC(Lv.5)", "LC(Lv.5)"));
            }
           else
            {
                DropDownList ddl_Lv = (DropDownList)GridView1.Rows[i].Cells[3].FindControl("Doe_Lv");
                if (select_Lv(filename, stage, keyitem, SpeChar) == "RC(Lv.3)")
                {
                    ddl_Lv.Items.Add(new ListItem("RC(Lv.3)", "RC(Lv.3)"));
                    ddl_Lv.Items.Add(new ListItem("MC(Lv.4)", "MC(Lv.4)"));
                    ddl_Lv.Items.Add(new ListItem("LC(Lv.5)", "LC(Lv.5)"));
                }
                else if(select_Lv(filename, stage,keyitem,SpeChar) == "MC(Lv.4)")
                {
                    ddl_Lv.Items.Add(new ListItem("MC(Lv.4)", "MC(Lv.4)"));
                                    
                    ddl_Lv.Items.Add(new ListItem("LC(Lv.5)", "LC(Lv.5)"));
                    ddl_Lv.Items.Add(new ListItem("RC(Lv.3)", "RC(Lv.3)"));
                }
                else if(select_Lv(filename, stage, keyitem, SpeChar) == "LC(Lv.5)")
                {
                    ddl_Lv.Items.Add(new ListItem("LC(Lv.5)", "LC(Lv.5)"));
                    ddl_Lv.Items.Add(new ListItem("MC(Lv.4)", "MC(Lv.4)"));                   
                    ddl_Lv.Items.Add(new ListItem("RC(Lv.3)", "RC(Lv.3)"));
                }
            }


            


        }


        string strScript = string.Format("<script language='javascript'>gd();</script>");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);

        //test.Items.Remove(test.Items.FindByValue("Lv.4"));



    }





    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string vn =Session["Version_Name"].ToString(); 
        string key = Session["keyitem"].ToString();
        string stage = Session["stage"].ToString();
        GridView1.PageIndex = e.NewPageIndex;
        receive_Lv(vn, stage, key);
    }

    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {
        string vn = Session["Version_Name"].ToString();
        string key = Session["keyitem"].ToString();
        string stage = Session["stage"].ToString();
       
        receive_Lv(vn, stage, key);
    }




   




    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {

            case "Save":
                

                break;

            


        }
    }


   


    protected string count_Lv(string filename, string stage, string keyitem)
    {

        int num_Lv3 = 0, num_Lv4 = 0,num_Lv5=0 ;
        string sql = "select COUNT(EPTRA_LV) from npieptra_lv_main where Ver_Name='" + filename + "'and EPTRA_LV_Stage='" + stage + "' and EPTRA_KeyItem='" + keyitem + "' and EPTRA_LV= 'RC(Lv.3)' ";

        //LC(Lv.5),MC(Lv.4),RC(Lv.3)
        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            num_Lv3 = Convert.ToInt32(mydr["COUNT(EPTRA_LV)"]);
        }

        mydr.Close();
        MySqlConn.Close();

        
        string sql2 = "select COUNT(EPTRA_LV) from npieptra_lv_main where Ver_Name='" + filename + "'and EPTRA_LV_Stage='" + stage + "' and EPTRA_KeyItem='" + keyitem + "' and EPTRA_LV= 'MC(Lv.4)' ";


        MySqlConnection MySqlConn2 = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn2.Open();

        MySqlCommand MySqlCmd2 = new MySqlCommand(sql2, MySqlConn2);
        MySqlDataReader mydr2 = MySqlCmd2.ExecuteReader();

        while (mydr2.Read())
        {
            num_Lv4 = Convert.ToInt32(mydr2["COUNT(EPTRA_LV)"]);
        }

        mydr2.Close();
        MySqlConn2.Close();


        string sql3 = "select COUNT(EPTRA_LV) from npieptra_lv_main where Ver_Name='" + filename + "'and EPTRA_LV_Stage='" + stage + "' and EPTRA_KeyItem='" + keyitem + "' and EPTRA_LV= 'LC(Lv.5)' ";


        MySqlConnection MySqlConn3 = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn3.Open();

        MySqlCommand MySqlCmd3 = new MySqlCommand(sql3, MySqlConn3);
        MySqlDataReader mydr3 = MySqlCmd3.ExecuteReader();

        while (mydr3.Read())
        {
            num_Lv5 = Convert.ToInt32(mydr3["COUNT(EPTRA_LV)"]);
        }

        string str_ret = num_Lv3 + "|" + num_Lv4 + "|" + num_Lv5;

        mydr3.Close();
        MySqlConn3.Close();

        return str_ret;
        

    }




   

    protected void but_insert_Click(object sender, EventArgs e)
    {
        string user = "CIM";
        string vn = Session["Version_Name"].ToString();
        string keyitem = Session["keyitem"].ToString();
        string stage = Session["stage"].ToString();
        int Max = 0, count = 0; ;
        string sign_Lv = "";
        string CreateName = "cre_CIM";
        string UpName = "up_CIM";
        string sta = "Y";

        clsMySQL db = new clsMySQL();

        string SpeChar = "";
        string md = "";
        string cate = "";
        string kp = "";

        string t = "";
        string f = "";
        string insert_sign = "";
        string up_sign = "";
        string str_sign = "";



        string[] split_vn = vn.Split('_');
        string temp_no = split_vn[2];

        char[] pat = new char[] { 'V', 'e', 'r' };/**/
        string[] str_no = temp_no.Split(pat);

        int no = Convert.ToInt32(str_no[3]);

        if (jude_Lv(vn, stage, keyitem, SpeChar))
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                SpeChar = GridView1.Rows[i].Cells[2].Text;

                DropDownList ddl_Lv = (DropDownList)GridView1.Rows[i].Cells[3].FindControl("Doe_Lv");
                string select_str2 = ddl_Lv.SelectedValue;









                String insert_lv = string.Format("insert into npieptra_lv_main" +
                               "(Ver_Name,EPTRA_KeyItem,EPTRA_LV_Stage,EPTRA_LV_SpecChar,EPTRA_LV)Values" +
                               "('{0}','{1}','{2}','{3}','{4}')",
                               vn, keyitem, stage, SpeChar, select_str2);





                try
                {

                    if (db.QueryExecuteNonQuery(insert_lv) == true)
                    {

                        //t += Convert.ToString(i) + ",";
                        insert_sign = "true";
                    }
                    else
                    {
                        //f += Convert.ToString(i) + ",";
                        insert_sign = "false";
                        lblError.Text = insert_lv;
                        break;

                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }



            }
            if (insert_sign == "true")
            {
                str_sign = "EPTRA_Lv新增成功!";

            }
            else
            {
                str_sign = "EPTRA_Lv新增失敗!";

            }

        }
        else
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                SpeChar = GridView1.Rows[i].Cells[2].Text;

                DropDownList ddl_Lv = (DropDownList)GridView1.Rows[i].Cells[3].FindControl("Doe_Lv");
                string select_str2 = ddl_Lv.SelectedValue;








                /*create user & update user 問題*/
                String update_Lv = string.Format("UPDATE npieptra_lv_main " +
                               " SET EPTRA_LV='{0}'" +
                               "where Ver_Name='{1}' and EPTRA_KeyItem='{2}' and EPTRA_LV_Stage='{3}' and EPTRA_LV_SpecChar='{4}'"
                               , select_str2, vn, keyitem, stage, SpeChar);





                try
                {

                    if (db.QueryExecuteNonQuery(update_Lv) == true)
                    {

                        //t += Convert.ToString(i) + ",";
                        up_sign = "true";
                    }
                    else
                    {
                        //f += Convert.ToString(i) + ",";
                        up_sign = "false";
                        lblError.Text = update_Lv;
                        break;
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }



            }
            if (up_sign == "true")
            {
                str_sign = "EPTRA_Lv修改成功!";

            }
            else
            {
                str_sign = "EPTRA_Lv修改失敗!";

            }


        }





        //Max = count_sum_Lv(vn, stage, keyitem);
        string Lv = count_Lv(vn, stage, keyitem);
        string[] Lv_spilt = Lv.Split('|');
        int rc = Convert.ToInt32(Lv_spilt[0]);
        int mc = Convert.ToInt32(Lv_spilt[1]);
        int lc = Convert.ToInt32(Lv_spilt[2]);
        double sum_lv = (rc + mc + lc);
        double count_lv_half = Math.Floor((sum_lv / 3));




        if (rc == 0 && mc == 0 && lc == 0)
        {
            sign_Lv = "int";
        }
        else if (rc >= 1 && mc == 0 && lc == 0)
        {
            sign_Lv = "high";
        }
        else if (rc >= 1 && mc >= 1 && lc == 0)
        {
            sign_Lv = "high";
        }
        else if (rc >= 1 && lc == 0)
        {
            sign_Lv = "high";
        }
        else if (mc >= 1 && lc == 0)
        {
            sign_Lv = "high";
        }
        else if (mc >= 1 && rc >= 1 && lc >= 1)
        {
            sign_Lv = "high";
        }
        else if (mc >= 1 && lc >= 1)
        {
            sign_Lv = "high";
        }
        else if (rc >= 1 && lc >= 1)
        {
            sign_Lv = "high";
        }
        else if (lc >= 1 && rc == 0 && mc == 0)
        {
            sign_Lv = "low";
        }

        



        string strScript = string.Format("<script language='javascript'>ret_value('" + keyitem + "'" + ',' + "'" + stage + "'" + ",'" + sign_Lv +"');</script>");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);

    }
}