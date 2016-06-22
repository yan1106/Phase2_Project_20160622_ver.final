using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EPTRA_Level_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string keyitem = Request.QueryString["keyitem"];
        string stage = Request.QueryString["stage"];

        string Version_Name = Request.QueryString["filename"];
        if (!Page.IsPostBack)
        {
            receive_Lv(Version_Name,stage,keyitem);
        }
    }

    protected void receive_Lv(string filename, string stage, string keyitem)
    {
        string SpeChar = "";
        string md = "";
        string cate = "";
        string key = "";

        string str_sql = "select * from npieptra_lv_main where EPTRA_LV_Stage='" + stage + "' and EPTRA_KeyItem='" + keyitem + "' and Ver_Name='" + filename + "'";


        clsMySQL db = new clsMySQL(); //Connection MySQL
        clsMySQL.DBReply dr = db.QueryDS(str_sql);
        GridView1.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GridView1.DataBind();
        db.Close();
    }

}