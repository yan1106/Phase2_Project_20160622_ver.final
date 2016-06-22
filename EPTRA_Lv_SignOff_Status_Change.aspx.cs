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
using System.Text;
using System.Threading;


public partial class EPTRA_Lv_SignOff_Status_Change : System.Web.UI.Page
{
    public static int  global_RowIndex =0;
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

    protected string rec_vername(string sql)
    {
        string ver_name = "";



        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            ver_name = (String)mydr["Ver_Name"];

        }
        mydr.Close();
        MySqlConn.Close();

        return ver_name;


    }


    protected void Page_Load(object sender, EventArgs e)
    {

       




    }





    protected void Search_Lv_Click1(object sender, EventArgs e)
    {
        string str_eptraver_main = "select * from npieptraver_main where Ver_New_Customer = '" + Customer_TB.Text + "'and Ver_New_Device= '" + ND_TB.Text + "' and Ver_Status ='Enable'";

        //string str_eptraver_main_count = "select count(Ver_No) from npieptraver_main where Ver_New_Customer = '" + Customer_TB.Text + "'and Ver_New_Device= '" + ND_TB.Text + "' and Ver_Status ='" + DDList_Status.SelectedValue + "'";
        // string str_eptraver_main = "select * from npieptraver_main where Ver_New_Customer = '" + Customer_TB.Text + "'and Ver_New_Device= '" + ND_TB.Text + "' and Ver_Status ='Enable'";


        string Ver_name = rec_vername(str_eptraver_main);
        string sql_eptraver_main_sta = "select * from npieptra_lv_main_Status where Ver_Name='" + Ver_name + "' and Ver_Status='Enable' ";



        if (Customer_TB.Text.Trim() != "" && ND_TB.Text.Trim() == "")
        {
            string strScript = string.Format("<script language='javascript'>alert('您沒輸入New_Device條件,請重新輸入!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        }
        else if (Customer_TB.Text.Trim() == "" && ND_TB.Text.Trim() != "")
        {

            string strScript = string.Format("<script language='javascript'>alert('您沒輸入New_Customer條件,請重新輸入!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);


        }
        else if (Customer_TB.Text.Trim() == "" && ND_TB.Text.Trim() == "")
        {

            string strScript = string.Format("<script language='javascript'>alert('您沒輸入New_Customer與New_Device條件,請重新輸入!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);


        }
        else if (jude_Query_EPTRA(sql_eptraver_main_sta, Ver_name))
        {
            Panel_gv1.Visible = true;
            Panel_gv2.Visible = false;

            clsMySQL db = new clsMySQL(); //Connection MySQL
            clsMySQL.DBReply dr = db.QueryDS(sql_eptraver_main_sta);
            gv_display_Lv_signoffdata.DataSource = dr.dsDataSet.Tables[0].DefaultView;
            gv_display_Lv_signoffdata.DataBind();
            db.Close();
            set_sta_srt("gv1");


        }
        else if (!jude_Query_EPTRA(sql_eptraver_main_sta, Ver_name))
        {
            Panel_gv1.Visible = false;
            Panel_gv2.Visible = false;
            string strScript = string.Format("<script language='javascript'>alert('"+Ver_name+"已被更改為Disable，請到TRA比對');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        }
        else
        {
            string strScript = string.Format("<script language='javascript'>alert('"+Ver_name+"還未送審!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        }
    }


    protected void set_sta_srt(string sign)/*將LV_Signoff_Status更改為,接受,拒絕,待簽中*/
    {


        if(sign =="gv1")
        {

            for (int i = 0; i < gv_display_Lv_signoffdata.Rows.Count; i++)
            {
                Label lab = (Label)gv_display_Lv_signoffdata.Rows[i].Cells[2].FindControl("Label_sta");
                string Ver_name = gv_display_Lv_signoffdata.Rows[i].Cells[1].Text;
                string sql_sta = "select * from npieptra_lv_main_Status where Ver_Name = '" + Ver_name + "'";
                string sta_str = rec_lvmain_status_srt(sql_sta);
                if (sta_str == "NA")
                {
                    lab.Text = "待簽中";
                }
                else if (sta_str == "Acc")
                {
                    lab.Text = "接受";
                }
                else if (sta_str == "Rej")
                {
                    lab.Text = "拒絕";
                }

            }
        

        }
        else
        {
            for (int i = 0; i < signoff_gv2.Rows.Count; i++)
            {
                Label lab = (Label)signoff_gv2.Rows[i].Cells[2].FindControl("Label_sta");
                string Ver_name = signoff_gv2.Rows[i].Cells[0].Text;
                string sql_sta = "select * from npieptra_lv_main_Status where Ver_Name = '" + Ver_name + "'";
                string sta_str = rec_lvmain_status_srt(sql_sta);
                if (sta_str == "NA")
                {
                    lab.Text = "待簽中";
                }
                else if (sta_str == "Acc")
                {
                    lab.Text = "接受";
                }
                else if (sta_str == "Rej")
                {
                    lab.Text = "拒絕";
                }

            }
        }








       


    }


    protected string rec_lvmain_status_srt(string sql)
    {
        string sta = "";



        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            sta = (String)mydr["LV_Signoff_Status"];

        }
        mydr.Close();
        MySqlConn.Close();

        return sta;


    }



    protected Boolean jude_Query_EPTRA(string sql, string vername)
    {
        string Lv_main_vername = "";
        clsMySQL db = new clsMySQL();

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            Lv_main_vername = (String)mydr["Ver_Name"];
        }

        mydr.Close();
        MySqlConn.Close();

        if (Lv_main_vername == vername)
        {
            return true;
        }
        else
            return false;



    }





    protected void But_Change_Click(object sender, EventArgs e)
    {

        

        GridViewRow myRow = (GridViewRow)((Button)sender).NamingContainer;
        global_RowIndex = myRow.RowIndex;


        global_Ver_Name = gv_display_Lv_signoffdata.Rows[global_RowIndex].Cells[2].Text;


        string strScript = string.Format("<script language='javascript'>AddWork_acc();</script>");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);


    }

    protected void up_lv_signoff_sta(int RowIndex, string com)
    {
        string ver = gv_display_Lv_signoffdata.Rows[RowIndex].Cells[1].Text;



        string up_Name = "bruno";
        clsMySQL db = new clsMySQL();

        String update_Lv = string.Format("UPDATE npieptra_lv_main_status " +
                              " SET Ver_Status='{0}',UpdateName='{1}',UpdateTime=NOW(),LV_Signoff_Status_Change_Command='{2}'" +
                              "where Ver_Name='{3}' and Ver_Status='{4}'",
                              "Disable",up_Name, com, ver, "Enable");

        string str_eptraver_main_sta = "select * from npieptra_lv_main_Status where Ver_Name='" + ver + "'";

        try
        {

            if (db.QueryExecuteNonQuery(update_Lv) == true)
            {

                Panel_gv1.Visible = false;
                Panel_gv2.Visible = true;

                clsMySQL.DBReply dr = db.QueryDS(str_eptraver_main_sta);
                signoff_gv2.DataSource = dr.dsDataSet.Tables[0].DefaultView;
                signoff_gv2.DataBind();
                set_sta_srt("gv2");

            }
            else
            {
                lblError.Text = update_Lv+db.ToString();
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        db.Close();


    }


    protected void cmdFilter_Click(object sender, EventArgs e)
    {
        string str_command = hf_command_value.Value;
        

      
       
        up_lv_signoff_sta(global_RowIndex,str_command);
       
              

    }




}