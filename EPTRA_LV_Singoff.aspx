<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EPTRA_LV_Singoff.aspx.cs" Inherits="EPTRA_LV_Singoff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />    
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>    
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>    


<script type="text/javascript">

     $(function () {
         $("[id$=Customer_TB]").autocomplete({
             source: function (request, response) {
                 $.ajax({
                     url: '<%=ResolveUrl("EPTRA_LV_Singoff.aspx/GetCustomer") %>',
                     data: "{ 'prefix': '" + request.term + "'}",
                     dataType: "json",
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     success: function (data) {
                         response($.map(data.d, function (item) {
                             return {
                                 label: item.split(',')[0],
                                 val: item.split(',')[1]
                             }
                         }))
                     },
                     error: function (response) {
                         alert(response.responseText);
                     },
                     failure: function (response) {
                         alert(response.responseText);
                     }
                 });
             },         
             minLength: 1
         });
     });


     $(function () {
         $("[id$=ND_TB]").autocomplete({
             source: function (request, response) {
                 $.ajax({
                     url: '<%=ResolveUrl("EPTRA_LV_Singoff.aspx/GetNewDevice") %>',
                     data: "{ 'prefix': '" + request.term + "'}",
                     dataType: "json",
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     success: function (data) {
                         response($.map(data.d, function (item) {
                             return {
                                 label: item.split(',')[0],
                                 val: item.split(',')[1]
                             }
                         }))
                     },
                     error: function (response) {
                         alert(response.responseText);
                     },
                     failure: function (response) {
                         alert(response.responseText);
                     }
                 });
             },
             minLength: 1
         });
     });

    function view_open(str)/*開啟view視窗*/
    {
        window.open("EPTRA_View_Table.aspx?filename=" + str, "_self");
        //window.open("http://yahoo.com.tw");
    }

   
    var text_val;
    function AddWork_acc() {
       
        $(function () {
            
            document.getElementById("TextBox1").style.display = "block";

            $("#dialog").dialog({
                autoOpen: false,
                width: 350,
                height: 400,
                title: "簽核人建議(接受)",              
                modal: true,/*background disable*/
                buttons: {
                    "確認": function () {
                        if (confirm("你確定將Command送出?")) {
                            text_val = document.getElementById("TextBox1").value;
                            document.getElementById('hf_command_value').value = text_val;
                            __doPostBack('cmdFilter', '')
                            $(this).dialog("close");
                        }
                    },
                    "取消": function () {
                        $(this).dialog("close");
                    }
                }




            });
            
            $("#dialog").dialog("open");
            return false;

            

        });
         
    }




    function AddWork_rej() {

        $(function () {

            document.getElementById("TextBox1").style.display = "block";

            $("#dialog").dialog({
                autoOpen: false,
                width: 350,
                height: 400,
                title: "簽核人建議(拒絕)",
                modal: true,/*background disable*/
                buttons: {
                    "確認": function () {

                        if (confirm("你確定將Command送出?")) {
                            text_val = document.getElementById("TextBox1").value;
                            document.getElementById('hf_command_value').value = text_val;
                            __doPostBack('cmdFilter', '')
                            $(this).dialog("close");
                        }
                    },
                    "取消": function () {
                        $(this).dialog("close");
                    }
                }




            });

            $("#dialog").dialog("open");
            return false;



        });

    }


</script>

   <style type="text/css">

     .style-querymain-table
     {
        
        background:#FFFFFF;
        border:1.0pt solid blue;

     }
             
     .style-querymain-head {
         text-align: center;        
         font-size: 12.0pt; 
         color:white;  
         border-bottom: 1.0pt solid blue;
         border-left:1.0pt solid blue;
         border-right:1.0pt solid blue;
         padding: 0px;
         font-weight:bolder;
         background:#003C9D;
         
     }
      .style-querymain-head-main {
         text-align: center;        
         font-size: 12.0pt; 
         color:white;  
         border-bottom: 1.0pt solid blue;
         border-left:1.0pt solid blue;
         border-right:1.0pt solid blue;
         padding: 0px;
         font-weight:bolder;
         background:#0066FF;
         
     }
      .style-querymain-head-NewDevice {
         text-align: center;        
         font-size: 12.0pt; 
         color:white;  
         border-bottom: 1.0pt solid blue;
         border-left:1.0pt solid blue;
         border-right:1.0pt solid blue;
         padding: 0px;
         font-weight:bolder;
         background:#254061;
         
     }
     .style-space
     {
         background:transparent;
         color:windowtext;
     }
     .style-querymain-content
     {
        text-align: center;        
         font-size: 12.0pt; 
         color:#000066;
         border: .5pt solid white;
         padding: 0px;
        font-weight:bold;
                    
                

     }
     .style-querymain-content-two {
         text-align: center;        
         font-size: 12.0pt;                  
         padding: 0px;
         border-left:1.0pt solid gray;
         border-right:1.0pt solid gray;
         
     }



      .style-querymain-content-two
     {
       
        
        padding: 0px;        
        border-bottom: 1.0pt solid blue;               
        border-left: 1.0pt solid blue;
        border-right:1.0pt solid blue;
        

     }
     .div-eptramain {
         width: 100%;
         float:left
         
     }  


   .style2
        {
            color: #FFFFFF;            
        }
     .div-por {
         width: 70%;
         float: inherit;
         
     }  
    .left 
        {
            float: left;
            width: 100%;
        }              
     
     .style-keyitem
        {
             
            color: white;          
            padding: 0px;
            background: #5A5A5A;      
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;                         
            
            border-top: .5pt solid white;
            border-bottom: .5pt solid white;


        }
        .style-keyitem-number
        {
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border: .4pt solid white;
            padding: 0px;
            background: #7F7F7F;
            height: 21px;

        }
        .style-keyitem-details
        {
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
            border-left: .5pt solid white;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top: .5pt solid white;
            border-bottom: .5pt solid white;
            padding: 0px;
            background: #538ED5;
            height: 21px;
        }
        .style-head
        {
            width: 60pt;
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: 1.0pt solid white;
            border-right: 1.0pt solid white;
            border-top: 1.0pt solid white;
            border: 1.0pt solid white;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding: 0px;
            background: #254061;
        }

      
        .style-PProcessTRA {
            /*width: 500pt;*/
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: 1.0pt solid white;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top: 1.0pt solid white;
            border-bottom: 1.0pt solid white;
            padding: 0px;
            background: #254061;
        }
        .style-Effect {
            /*width: 400pt;*/
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: 1.0pt solid white;
            padding: 0px;
            background: #254061;
        }
       


        .style-td-white {
           
            color: windowtext;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid white;
            padding: 0px;
            background: white;
        }
        .style-td-gray
        {
            color: windowtext;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid white;
            padding: 0px;
            background: #D8D8D8;
            height: 18pt;
         
        }
        .style-td-red
        {
            color: #C0504D;
           
            
        }
        .style-td-blue
        {
            color: #1F497D;
            
        }
        
        
   
        
     .style-button_cancel
     {
        position:fixed;
        top:0px;
        left:0px;
     }
   
        
    </style>  
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
    
                <div style="width:60%;">
                   
                <fieldset style="margin:auto;" class="fieldset">
                <legend class="legend" style="font-size:medium;"><strong>LV_SignOff</strong></legend>
               <table cellpadding="2" cellspacing="2">
                    
                  <tr>
                   <th >Customer:</th>
                        <td  class="td_newDevice"><asp:TextBox ID="Customer_TB" runat="server" Height="20px" 
                                  Width="160px"></asp:TextBox></td>
                         <th >New_Device:</th>
                        <td class="td_newDevice">
                            <asp:TextBox ID="ND_TB" runat="server" Height="20px" 
                            Width="160px"></asp:TextBox>
                        </td>
                         <th >
                             <asp:Button ID="Search_Lv" runat="server" class="blueButton button2" 
                                Height="25px"  Text="Search" Width="90px" OnClick="Search_Lv_Click1" />

                         </th>                                                                                      
                    </tr>
                </table>
            </fieldset>
            
           </div>    
        <asp:HiddenField ID="hf_command_value" runat="server" Value="1" />
        <asp:HiddenField ID="Lv_sign" runat="server" Value="f" />
        <br />
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        
        <br />
        <div>
            <asp:Panel ID="Panel_gv1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="內容">
                        <ItemTemplate>
                             <asp:ImageButton ID="ImageButton_View" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="View" ImageUrl="icon/view.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="狀態">
                              <ItemTemplate>
                                  <asp:Label ID="Label_sta" runat="server" ></asp:Label>
                              </ItemTemplate>              
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="EPTRAName" DataField="Ver_Name" />
                    <asp:BoundField HeaderText="Ver" DataField="Ver_No" />
                    <asp:BoundField HeaderText="送審人員" DataField="LV_Signoff_SendName" />
                    <asp:BoundField HeaderText="送審時間" DataField="LV_Signoff_SendTime" />
                    <asp:TemplateField HeaderText="審核">
                            <ItemTemplate>                             
                                <asp:Button ID="butt_Acc"  runat="server" Text="Accept" CommandName="Acc"   OnClick="butt_Acc_Click1" />
                                <asp:Button ID="butt_Rej" runat="server" Text="Rejcet" CommandName="Rej"   OnClick="butt_Rej_Click"/>                              
                            </ItemTemplate>

                    </asp:TemplateField>
                    
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="40" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
          </asp:Panel>
            <asp:Button ID="cmdFilter" runat="server"  Text="Button" ClientIDMode="Static" Style="display: none;"  OnClick="cmdFilter_Click"/>
        </div>
        <asp:Panel ID="Panel_gv2" runat="server">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCommand="GridView2_RowCommand">
            <Columns>
               <asp:TemplateField HeaderText="內容">
                        <ItemTemplate>
                             <asp:ImageButton ID="ImageButton_View" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="View" ImageUrl="icon/view.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="狀態">
                              <ItemTemplate>
                                  <asp:Label ID="Label_sta" runat="server" ></asp:Label>
                              </ItemTemplate>              
                </asp:TemplateField>
                <asp:BoundField HeaderText="EPTRAName" DataField="Ver_Name" />
                <asp:BoundField HeaderText="Ver" DataField="Ver_Status" />
                <asp:BoundField HeaderText="送審人員" DataField="LV_Signoff_SendName" />
                <asp:BoundField HeaderText="送審時間" DataField="LV_Signoff_SendTime" />
                <asp:BoundField HeaderText="審核人員" DataField="LV_Signoff_Name" />
                <asp:BoundField HeaderText="審核時間" DataField="LV_Signoff_Time" />
                <asp:BoundField HeaderText="審核意見" DataField="LV_Signoff_Command" />
                
                  
            </Columns>
            
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"  Height="40"/>
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
      </asp:Panel>
        
        <div id="dialog" >

            
        <asp:TextBox ID="TextBox1" runat="server" Height="200px" TextMode="MultiLine" Width="300px"  Columns="20" Rows="5" style="display:none;"></asp:TextBox>
            
                             
        </div>
    </form>
</body>
</html>
