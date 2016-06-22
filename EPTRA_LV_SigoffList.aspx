<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EPTRA_LV_SigoffList.aspx.cs" Inherits="EPTRA_LV_SigoffList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="..\css\styles.css" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>    
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>

    
    
       
    <script type="text/javascript" >
        var count_lamp;
         $(function () {
             $("[id$=Customer_TB]").autocomplete({
             source: function (request, response) {
                 $.ajax({
                     url: '<%=ResolveUrl("EPTRA_LV_SigoffList.aspx/GetCustomer") %>',
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
                     url: '<%=ResolveUrl("EPTRA_LV_SigoffList.aspx/GetNewDevice") %>',
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
            $('#date_pre').datepicker({ dateFormat: "yy-mm-dd" });
            $('#date_lastone').datepicker({ dateFormat: "yy-mm-dd" });
        });

        /*({
                "dateFormat": "yy-mm-dd",
                "timeFormat": "HH:mm"
            });*/

        function Lv_View(Ver_Name)
        {
            window.open("EPTRA_View_Table.aspx?filename=" + Ver_Name, "_self");
            //window.open("www.google.com","_self");
        }


        function reflash() {

            window.location.replace("EPTRA_LV_Setting.aspx");
            alert('送審成功!');
        }

        


         $(function () {
         $("[id$=Customer_TB]").autocomplete({
             source: function (request, response) {
                 $.ajax({
                     url: '<%=ResolveUrl("EPTRA_LV_SigoffList.aspx/GetCustomer") %>',
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
                     url: '<%=ResolveUrl("EPTRA_LV_SigoffList.aspx/GetNewDevice") %>',
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

        
        function LvSign_sign() {
            if (confirm('確定要將您設定的Lv送審?')) {
                document.getElementById('sign_hf').value = "t";
                __doPostBack('cmdFilter', '')
            }
            else {
                document.getElementById('sign_hf').value = "f";
            }
        }




        function set_lamp(str1, str2, sign)
        {

            var obj = document.getElementById('Imagebutton_' + str1 + '_' + str2);

            if (sign == "high") {
                obj.src = "icon/red.gif";
                
            }
            else if (sign == "mid") {
                obj.src = "icon/yellow.gif";
               
            }
            else if (sign == "low") {
                obj.src = "icon/green.gif";
                
            }
            else {
                obj.src = "icon/white.gif";
            }

          

        }

       


      

        function AddWork_Lv_Setting(Ver_Name, keyitem, stage) {

            
            $(function () {



                $("#dialog").dialog({
                    autoOpen: false,
                    width: 800,
                    height: 500,
                    title: "Lv_Setting(" + keyitem + "_" + stage + ")",
                    modal: true,/*background disable*/
                    buttons: {
                        "確認": function () {
                            if (confirm("你確定將Level更新?")) {                                
                                
                                //window.parent.$('#cmdFilter').click();
                                
                                document.getElementById('dialogFrame').contentWindow.call_butinsert(keyitem,stage);
                                count_lamp--;
                                document.getElementById("HiddenField_count_lamp").value=count_lamp;
                                //window.child.$('#but_insert').click();
                                $(this).dialog("close");
                            }
                        

                        },
                        "取消": function () {
                            $(this).dialog("close");
                        }
                    }




                });

                $("#dialogFrame").attr('src', "EP_TRA_Level.aspx?filename=" + Ver_Name + "&" + "keyitem=" + keyitem + "&" + "stage=" + stage);
                $("#dialogFrame")
                $("#dialog").dialog("open");
                return false;



            });




        }


        function AddWork_Lv_View(Ver_Name, keyitem, stage) {


            $(function () {



                $("#dialog").dialog({
                    autoOpen: false,
                    width: 800,
                    height: 500,
                    title: "Lv_Setting(" + keyitem + "_" + stage + ")",
                    modal: true,/*background disable*/
                    buttons: {
                        "取消": function () {
                            $(this).dialog("close");
                        }
                    }




                });

                $("#dialogFrame").attr('src', "EP_TRA_Level.aspx?filename=" + Ver_Name + "&" + "keyitem=" + keyitem + "&" + "stage=" + stage);
                $("#dialogFrame")
                $("#dialog").dialog("open");
                return false;



            });




        }





        function Confirm_delete() {
            if (confirm('返回上一頁，將會把所有設定過的Lv值刪除\n確定要返回上一頁嗎?')) {
                __doPostBack('Button_Cancel', '')
            }
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
   
        
          .auto-style1 {
              height: 39px;
          }
   
        
    </style>   
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="HiddenField_count_lamp" runat="server" value="7"    />
        <asp:HiddenField ID="sign_hf" runat="server" value="s"    />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <asp:Panel ID="Panel_SignoffList" runat="server">
      <div style="width:60%;">

         
                <fieldset style="margin:auto;" class="fieldset">
                <legend class="legend" style="font-size:medium;"><strong>LV_SignOff</strong></legend>
               <table cellpadding="2" cellspacing="2">
                    
                  <tr>
                   <th class="auto-style1" >Date:</th>
                        <td  class="auto-style1">
                        <asp:TextBox ID="date_pre" runat="server" Height="20px" Width="80px"></asp:TextBox>
                         ~         
                        <asp:TextBox ID="date_lastone" runat="server" Height="20px" Width="80px"></asp:TextBox>



                        </td>
                         <th class="auto-style1" >Status:</th>
                        <td class="auto-style1">
                            <asp:DropDownList ID="ddl_signofflist_sta"  runat="server" Width="100">
                                <asp:ListItem Value="Rej">拒絕</asp:ListItem>
                                <asp:ListItem Value="Acc">接受</asp:ListItem>                                
                                <asp:ListItem Value="NA">待簽中</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                         <th class="auto-style1" >
                              <asp:Button ID="signofflist_Search"  runat="server" class="blueButton button2" 
                                Height="25px"  Text="Search" Width="90px" OnClick="signofflist_Search_Click" />

                         </th>
                          <td class="auto-style1">


                          </td> 
                          <th class="auto-style1" >
                             
                         </th>
                          <td class="auto-style1">


                          </td>                                                                                  
                    </tr>
                   <tr>
                       <th >Customer:</th>
                        <td  class="td_newDevice">
                            <asp:TextBox ID="Customer_TB" runat="server" Height="20px" Width="160px"></asp:TextBox>
                       </td>
                         <th >NewDevice:</th>
                        <td class="td_newDevice">
                            <asp:TextBox ID="ND_TB" runat="server" Height="20px" Width="160px"></asp:TextBox>
                        </td>
                         <th >
                            
                             &nbsp;</th>           


                   </tr>
                </table>
            </fieldset>
          </div>
         
            


       </asp:Panel>

        <asp:Panel ID="Panel_gv_signofflist" runat="server">
            <div style="margin-left:20px;margin-top:30px;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" EmptyDataText="NotRecord!">
            <Columns>
                <asp:TemplateField HeaderText="LV內容">
                    <ItemTemplate>
                        <asp:Button ID="But_Modify" runat="server" Text="Modify" OnClick="But_Modify_Click" />
                         <asp:Button ID="But_View" runat="server" Text="View" OnClick="But_View_Click" />
                    </ItemTemplate>


                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label ID="Label_sta" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>


                </asp:TemplateField>

                
                <asp:BoundField DataField="Ver_Name" HeaderText="EPTRAName" />
                <asp:BoundField DataField="Ver_No" HeaderText="VER" />
                <asp:TemplateField HeaderText="送審人">
                    <ItemTemplate>
                        <asp:Label ID="Label_SendName" runat="server" ></asp:Label>
                        <asp:Label ID="Label_SendTime" runat="server" ></asp:Label>
                    </ItemTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="審核">
                    <ItemTemplate>
                        <asp:Label ID="Label_SignOffName" runat="server" ></asp:Label>
                        <asp:Label ID="Label_SignOffTime" runat="server" ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="LV_Signoff_Command" HeaderText="審核人意見" />
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
                <br />
                <br />
         </div>
        </asp:Panel>



        <asp:Panel ID="Panel_EPTRA" runat="server">
            
            
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
           <asp:LinkButton ID="Button_Cancel" runat="server" CausesValidation="False"  class="style-button_cancel"
            CommandName="Cancel" Text="取消"    style="position:fixed;top:0px;left:0px;" OnClick="Button_Cancel_Click">       
        <img src="icon/Cancel.png" height="40px" width="40px" />
            </asp:LinkButton>

         <asp:Button ID="Button1" runat="server" class="blueButton button2" 
        Height="30px"  Text="SignOff_Lv" Width="100px" OnClick="Save_Main_Lv_Status_Click"   Style="position:fixed;top:40px;left:0px;" />

        

                    <div style="width:20%;margin-left:120px;margin-bottom:-15px;margin-top:3px;" >
                   
        <fieldset style="margin:auto;" class="fieldset" >
        <legend class="legend" style="font-size:medium;"><strong>ALL_LV_Select</strong></legend>


        <table>                    
             <tr>
                 <th >Select:</th>
                 <td  class="td_newDevice">
                     <asp:DropDownList ID="ddl_select_alllv" width="100" runat="server" OnSelectedIndexChanged="ddl_select_alllv_SelectedIndexChanged"  AutoPostBack="true">
                         
                         <asp:ListItem  Value="自行選擇LV">自行選擇LV</asp:ListItem>
                         <asp:ListItem  Value="RC(Lv.3)" >RC(Lv.3)</asp:ListItem>
                         <asp:ListItem  Value="MC(Lv.4)" >MC(Lv.4)</asp:ListItem>    
                         <asp:ListItem  Value="LC(Lv.5)">LC(Lv.5)</asp:ListItem>    
                         
                     </asp:DropDownList></td>                                                   
            </tr>
          
        </table>
        </fieldset>
         <br />
         <br />       
       </div>




            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse;width:80%;top:0px;left:0px;">
                <tr style="width:40%;">
                    <th class="style-head" colspan="4" rowspan="2" style="">Key item</th>
                    <th class="style-head" rowspan="2" >Capability</th>
                    <th class="style-head" rowspan="2" >POR (Baseline)</th>
                    <th class="style-head" rowspan="2" >New Device</th>
                    <th class="style-head" rowspan="2">Gap<br /> (Y/N)</th>
                    <th colspan="6" class="style-PProcessTRA">Package/ProcessTRA</th>
                </tr>
                <tr >
                    <th class="style-Effect" >Effect stage</th>
                    <th class="style-Effect">Potential
                        <br>Effect</th>
                    <th class="style-Effect">TRA Lv.</th>
                    <th class="style-Effect" >Recommend action</th>
                    <th class="style-Effect" >Owner</th>
                    <th class="style-Effect" >Due Date</th>
                </tr>
                <tr class="style-td-white" >
                    <td class="style-keyitem-details" style="text-align:center;" colspan="4" height="22">PROD</td>
                    <td >
                        <asp:Label ID="CAP_EP_1" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_1" runat="server"></asp:Label>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="lab_gap1" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_01" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_01" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_01" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_01" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_1" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray">
                    <td  class="style-keyitem" height="126" rowspan="5" ><span  style="-webkit-writing-mode: vertical-rl;width:45pt;text-align:center;">
                        <br />
                        Device Information</span></td>
                    <td class="style-keyitem-number">1</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_02" runat="server" Text="Customer&nbsp;"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_2" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_2" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_2" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap2" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_02" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_02" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_02" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_02" runat="server">
                        </asp:Panel>
                    </td>
                    <td>&nbsp;<asp:Panel ID="Panel_Lv_2" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white">
                    <td class="style-keyitem-number">2</td>
                    <td class="style-keyitem-details" colspan="2"><span style="mso-spacerun:yes">&nbsp;<asp:Label ID="Lab_keyitem_03" runat="server">Device</asp:Label>
                        </span></td>
                    <td>
                        <asp:Label ID="CAP_EP_3" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_3" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_3" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap3" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_03" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_03" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_03" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_03" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_3" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="12">
                    <td class="style-keyitem-number">3</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_04" runat="server">Die size(mm*mm)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_4" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_4" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">&nbsp;<asp:Label ID="lab_Ver_New_4" runat="server"></asp:Label>
                        &nbsp;&nbsp;</td>
                    <td>
                        <asp:Label ID="lab_gap4" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_04" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_04" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_04" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_04" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_4" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="38">
                    <td class="style-keyitem-number" height="38">4</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_05" runat="server">C/P probe card type</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_5" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_5" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_5" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap5" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_05" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_05" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_05" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_05" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_5" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22">5</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_06" runat="server">Probing on bump pad (Y/N)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_6" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_6" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_6" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap6" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_06" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_06" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_06" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_06" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_6" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white">
                    <td class="style-keyitem" rowspan="7"><span style="-webkit-writing-mode: vertical-lr;">Wafer Information</span> </td>
                    <td class="style-keyitem-number">6</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_07" runat="server">Wafer Fab</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_7" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_7" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_7" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap7" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_07" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_07" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_07" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_07" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_7" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22">7</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_08" runat="server">Wafer tech.(nm)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_8" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_8" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_8" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap8" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_08" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_08" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_08" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_08" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_8" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22">8</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_09" runat="server">Low K Type</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_9" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_9" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_9" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap9" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_09" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_09" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_09" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_09" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_9" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="38">
                    <td class="style-keyitem-number" height="38">9</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_10" runat="server">Final Metal Pad type</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_10" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_10" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_10" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap10" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_10" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_10" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_10" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_10" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_10" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22">10</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_11" runat="server">RV hole(Y/N)</asp:Label>
                    </td>
                    <td class="auto-style243" width="160">
                        <asp:Label ID="CAP_EP_11" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_11" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_11" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap11" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_11" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_11" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_11" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_11" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_11" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22">11</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_12" runat="server">Wafer PSV type / Thickness</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_12" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_12" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_12" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap12" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_12" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_12" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_12" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_12" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_12" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number">12</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_13" runat="server">Seal-Ring Protected by SiN (Y/N)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_13" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_13" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_13" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap13" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_13" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_13" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_13" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_13" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_13" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="95">
                    <td class="style-keyitem" height="234" rowspan="5"><span style="-webkit-writing-mode: vertical-lr;">Bump structure</span> </td>
                    <td class="style-keyitem-number">13</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_14" runat="server">PKG Type</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_14" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_14" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_14" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap14" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_14" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_14" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_14" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_14" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_14" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">14</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_15" runat="server">PI type</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_15" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_15" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_15" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap15" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_15" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_15" runat="server">
                        </asp:Panel>
                        <br />
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_15" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_15" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_15" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray">
                    <td class="style-keyitem-number" width="32">15</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_16" runat="server">PI Thickness (um)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_16" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_16" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_16" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap16" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_16" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_16" runat="server">
                        </asp:Panel>
                        <br />
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_16" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_16" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_16" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white">
                    <td class="style-keyitem-number" width="32">16</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_17" runat="server">UBM type / Thickness (um)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_17" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_17" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_17" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap17" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_17" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_17" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_17" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_17" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_17" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="57">
                    <td class="style-keyitem-number" height="57" width="32">17</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_18" runat="server">Bump composition</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_18" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_18" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_18" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style289">
                        <asp:Label ID="lab_gap18" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style214">
                        <asp:Label ID="lab_Eff_18" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_18" runat="server">
                        </asp:Panel>
                    </td>
                    <td class="auto-style214">
                        <asp:Label ID="lab_Pot_18" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_18" runat="server">
                        </asp:Panel>
                    </td>
                    <td class="auto-style14">　<asp:Panel ID="Panel_Lv_18" runat="server">
                        </asp:Panel>
                    </td>
                    <td class="auto-style14">　</td>
                    <td>　</td>
                    <td class="auto-style14">　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem" height="368" rowspan="17" width="51"><span style="-webkit-writing-mode: vertical-lr;">Bump design</span> </td>
                    <td class="style-keyitem-number" width="32">18</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_19" runat="server">REPSV PI Opening Size(um)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_19" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_19" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_19" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap19" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_19" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_19" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_19" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_19" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_19" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22" width="32">19</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_20" runat="server">Min fianl metal trace to seal ring (um)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_20" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_20" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_20" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap20" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_20" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_20" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_20" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_20" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_20" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">20</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_21" runat="server" Text="PI via opening bottom edge to pad psv. Edge (um)">PI via opening bottom <br> edge to pad psv. Edge (um)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_21" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_21" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_21" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap21" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_21" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_21" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_21" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_21" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_21" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22" width="32">21</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_22" runat="server">PI edge inside seal ring (um)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_22" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_22" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_22" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap22" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_22" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_22" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_22" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_22" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_22" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="38">
                    <td class="style-keyitem-number" height="38" width="32">22</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_23" runat="server">PR thickness(um)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_23" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_23" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_23" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap23" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_23" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_23" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_23" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_23" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_23" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22" width="32">23</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_24" runat="server">UBM Size(um)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_24" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_24" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_24" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap24" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_24" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_24" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_24" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_24" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_24" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">24</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_25" runat="server">UBM Overlap PSV (um)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_25" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_25" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_25" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap25" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_25" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_25" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_25" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_25" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_25" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22" width="32">25</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_26" runat="server">UBM insdie final metal for FOC (um)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_26" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_26" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_26" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap26" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_26" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_26" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_26" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_26" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_26" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">26</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_27" runat="server">UBM Plating Area(dm2)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_27" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_27" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_27" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap27" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_27" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_27" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_27" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_27" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_27" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22" width="32">27</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_28" runat="server">UBM Density (UBM Area/Die Area)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_28" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_28" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_28" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap28" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_28" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_28" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_28" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_28" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_28" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white">
                    <td class="style-keyitem-number" width="32">28</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_29" runat="server">Mushroom CD(um)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_29" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_29" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_29" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap29" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_29" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_29" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_29" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_29" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_29" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22" width="32">29</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_30" runat="server">Min Mushroom space(um)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_30" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_30" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_30" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap30" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_30" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_30" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_30" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_30" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_30" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22">30</td>
                    <td class="style-keyitem-details" colspan="2">
                        <asp:Label ID="Lab_keyitem_31" runat="server">Min. Bump pitch (um)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_31" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_31" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_31" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap31" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_31" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_31" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_31" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_31" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_31" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22" width="32">31</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_32" runat="server">Bump Height(um)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_32" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_32" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_32" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap32" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_32" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_32" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_32" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_32" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_32" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">32</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_33" runat="server">Bump Diameter(um)</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_33" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_33" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_33" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap33" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_33" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_33" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_33" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_33" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_33" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22" width="32">33</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_34" runat="server">Bump Density (Bump Q&#39;ty/Die Area)</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_34" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_34" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_34" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap34" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_34" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_34" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_34" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_34" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_34" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" width="32">34</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_35" runat="server">BH/UBM ratio</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_35" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_35" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_35" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap35" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_35" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_35" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_35" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_35" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_35" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem" height="200" rowspan="8" width="51"><span style="-webkit-writing-mode: vertical-lr;">Outgoing criteria</span> </td>
                    <td class="style-keyitem-number" width="32">35</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_36" runat="server">LF Bump Ag% target</asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="CAP_EP_36" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_36" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap36" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_36" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_36" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_36" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_36" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_36" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">36</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_37" runat="server">Bump Height(um)</asp:Label>
                    </td>
                    <td  colspan="2" width="274">
                        <asp:Label ID="CAP_EP_37" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_37" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap37" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_37" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_37" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_37" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_37" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_37" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22" width="32">37</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_38" runat="server">Bump diameter</asp:Label>
                    </td>
                    <td  colspan="2">
                        <asp:Label ID="CAP_EP_38" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_38" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap38" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_38" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_38" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_38" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_38" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_38" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">38</td>
                    <td class="style-keyitem-details" colspan="2" width="321"><span style="mso-spacerun:yes">
                        <asp:Label ID="Lab_keyitem_39" runat="server">Bump Coplanarity</asp:Label>
                        </span></td>
                    <td  colspan="2" width="274">
                        <asp:Label ID="CAP_EP_39" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_39" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap39" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_39" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_39" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_39" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_39" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_39" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="34">
                    <td class="style-keyitem-number" height="34" width="32">39</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_40" runat="server">Bump Shear Strenght</asp:Label>
                    </td>
                    <td  colspan="2">
                        <asp:Label ID="CAP_EP_40" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_40" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap40" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_40" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_40" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_40" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_40" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_40" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">40</td>
                    <td class="style-keyitem-details" colspan="2" width="321"><span style="mso-spacerun:yes">
                        <asp:Label ID="Lab_keyitem_41" runat="server">Bump void</asp:Label>
                        </span></td>
                    <td  colspan="2">
                        <asp:Label ID="CAP_EP_41" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_41" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap41" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_41" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_41" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_41" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_41" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_41" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="34">
                    <td class="style-keyitem-number" height="34" width="32">41</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_42" runat="server">PI Rougness (Ra)</asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="CAP_EP_42" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_42" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="lab_gap42" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_42" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_42" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_42" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_42" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_42" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">42</td>
                    <td class="style-keyitem-details" colspan="2" width="321">
                        <asp:Label ID="Lab_keyitem_43" runat="server">Bump Resistance (POR capability)</asp:Label>
                    </td>
                    <td  colspan="2">
                        <asp:Label ID="lab_Ver_POR_36" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_43" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap43" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_43" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_43" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_43" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_43" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_43" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem" height="448" rowspan="15"><span style="-webkit-writing-mode: vertical-lr;">Metrology tool</span> </td>
                    <td class="style-keyitem-number" rowspan="7" width="32">43</td>
                    <td class="style-keyitem-details" rowspan="7" width="129">
                        <asp:Label ID="Lab_keyitem_44" runat="server" Text="August"></asp:Label>
                    </td>
                    <td class="style-keyitem-details">
                        <asp:Label ID="Lab_keyitem_44_1" runat="server">Gross die</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_43" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_1" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_44" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="lab_gap44" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_44" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_44" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_44" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_44" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_44" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td class="auto-style14">　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-details">
                        <asp:Label ID="Lab_keyitem_44_2" runat="server">Expose pad</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_44" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP__POR_2" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_45" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style290">
                        <asp:Label ID="lab_gap45" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style266">
                        <asp:Label ID="lab_Eff_45" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_45" runat="server">
                        </asp:Panel>
                    </td>
                    <td class="auto-style266">
                        <asp:Label ID="lab_Pot_45" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_45" runat="server">
                        </asp:Panel>
                    </td>
                    <td class="auto-style265">
                        <asp:Panel ID="Panel_Lv_45" runat="server">
                        </asp:Panel>
                    </td>
                    <td class="auto-style265">　</td>
                    <td>　</td>
                    <td class="auto-style265">　</td>
                </tr>
                <tr class="style-td-gray" height="42">
                    <td class="style-keyitem-details" height="42" width="192">
                        <asp:Label ID="Lab_keyitem_44_3" runat="server" Text="PSV1(PI1/PBO1) opening">PSV1(PI1<br>/PBO1) opening</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_45" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_3" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_46" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap46" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_46" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_46" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_46" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_46" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_46" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-details" height="22" width="192">
                        <asp:Label ID="Lab_keyitem_44_4" runat="server">Bump diameter</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_46" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_4" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_47" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap47" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_47" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_47" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_47" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_47" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_47" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="42">
                    <td class="style-keyitem-details" height="42" width="192">
                        <asp:Label ID="Lab_keyitem_44_5" runat="server" Text="Low SPEC of min RDL Width" >Low SPEC of <br> min RDL Width</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_47" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_5" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_48" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap48" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_48" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_48" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_48" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_48" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_48" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="42">
                    <td class="style-keyitem-details" height="42" width="192">
                        <asp:Label ID="Lab_keyitem_44_6" runat="server" Text="Low SPEC of min RDL Spacing" >Low SPEC of <br> min RDL Spacing</asp:Label>
                    </td>
                    <td class="auto-style274">
                        <asp:Label ID="CAP_EP_48" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_6" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_49" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap49" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_49" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_49" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_49" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_49" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_49" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="42">
                    <td class="style-keyitem-details" height="42" width="192">
                        <asp:Label ID="Lab_keyitem_44_7" runat="server" Text="Min RDL Width/Spacing pattern & location">Min RDL <br> Width/Spacing <br> pattern & location</asp:Label>
                    </td>
                    <td class="auto-style18">
                        <asp:Label ID="CAP_EP_49" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_7" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_50" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap50" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_50" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_50" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_50" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_50" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_50" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="88" rowspan="4" width="32">44</td>
                    <td class="style-keyitem-details" rowspan="4" width="129">
                        <asp:Label ID="Lab_keyitem_45" runat="server" Text="RVSI"></asp:Label>
                    </td>
                    <td class="style-keyitem-details">
                        <asp:Label ID="Lab_keyitem_45_1" runat="server">Gross die</asp:Label>
                    </td>
                    <td class="auto-style274">
                        <asp:Label ID="CAP_EP_50" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_8" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_51" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap51" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_51" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_51" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_51" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_51" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_51" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-details" height="22" width="192">
                        <asp:Label ID="Lab_keyitem_45_2" runat="server">Bump count per die</asp:Label>
                    </td>
                    <td class="auto-style18">
                        <asp:Label ID="CAP_EP_51" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP__POR_9" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_52" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap52" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_52" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_52" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_52" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_52" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_52" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-details" height="22" width="192">
                        <asp:Label ID="Lab_keyitem_45_3" runat="server">Bump height</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_52" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_10" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_53" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap53" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_53" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_53" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_53" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_53" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_53" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-details" height="22" width="192">
                        <asp:Label ID="Lab_keyitem_45_4" runat="server">Bump diameter</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_53" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_11" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_54" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap54" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_54" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_54" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_54" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_54" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_54" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">45</td>
                    <td class="style-keyitem-details" width="129">
                        <asp:Label ID="Lab_keyitem_46" runat="server" Text="RS meter"></asp:Label>
                    </td>
                    <td class="style-keyitem-details" width="192">
                        <asp:Label ID="Lab_keyitem_46_1" runat="server">Bump diameter</asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP_54" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP__POR_12" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_55" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap55" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_55" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_55" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_55" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_55" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_55" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="38">
                    <td class="style-keyitem-number" height="38" width="32">46</td>
                    <td class="style-keyitem-details" width="129">
                        <asp:Label ID="Lab_keyitem_47" runat="server" Text="Void (X-ray)"></asp:Label>
                    </td>
                    <td class="style-keyitem-details" width="192">
                        <asp:Label ID="Lab_keyitem_47_1" runat="server">Bump diameter</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_55" runat="server"></asp:Label>
                    </td>
                    <td  width="114">
                        <asp:Label ID="CAP_EP__POR_13" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_56" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap56" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_56" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_56" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_56" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_56" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_56" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">47</td>
                    <td class="style-keyitem-details" width="129">
                        <asp:Label ID="Lab_keyitem_48" runat="server" Text="Bump shear"></asp:Label>
                    </td>
                    <td class="style-keyitem-details" width="192">
                        <asp:Label ID="Lab_keyitem_48_2" runat="server">Bump diameter</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_56" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="CAP_EP__POR_14" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_57" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap57" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_57" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_57" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_57" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_57" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_57" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="44">
                    <td class="style-keyitem-number" height="44" width="32">48</td>
                    <td class="style-keyitem-details" width="129">
                        <asp:Label ID="Lab_keyitem_49" runat="server" Text="Bump pull"></asp:Label>
                    </td>
                    <td " width=" 192"="" class="style-keyitem-details">
                        <asp:Label ID="Lab_keyitem_49_1" runat="server">Bump diameter</asp:Label>
                    </td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_57" runat="server"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="CAP_EP__POR_15" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_58" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap58" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_58" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_58" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_58" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_58" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_58" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="42">
                    <td class="style-keyitem" height="86" rowspan="3" width="51"><span style="-webkit-writing-mode: vertical-lr;">AB&nbsp; requirement</span> </td>
                    <td class="style-keyitem-number" width="32">49</td>
                    <td class="style-keyitem-details" width="129">
                        <asp:Label ID="Lab_keyitem_59" runat="server">Bump to bump space</asp:Label>
                    </td>
                    <td class="style-keyitem-details" width="192">　</td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_58" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_37" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_59" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap59" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_59" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_59" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_59" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_59" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_59" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="22">
                    <td class="style-keyitem-number" height="22">50</td>
                    <td class="style-keyitem-details">
                        <asp:Label ID="Lab_keyitem_60" runat="server">SMO</asp:Label>
                    </td>
                    <td class="style-keyitem-details">　</td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_59" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red" >
                        <asp:Label ID="lab_Ver_POR_38" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_60" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap60" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_60" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_60" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_60" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_60" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_60" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22">51</td>
                    <td class="style-keyitem-details">
                        <asp:Label ID="Lab_keyitem_61" runat="server">UBM/SMO ratio</asp:Label>
                    </td>
                    <td class="style-keyitem-details">　</td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_60" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_39" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_61" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap61" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_61" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_61" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_61" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_61" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_61" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="42">
                    <td class="style-keyitem" height="128" rowspan="4" width="51"><span style="-webkit-writing-mode: vertical-lr;">Special&nbsp; Requirement</span></td>
                    <td class="style-keyitem-number" width="32">52</td>
                    <td class="style-keyitem-details" width="129">
                        <asp:Label ID="Lab_keyitem_62" runat="server">Process/Machine</asp:Label>
                    </td>
                    <td class="style-keyitem-details" width="192">　</td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_61" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_40" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_62" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap62" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_62" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_62" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_62" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_62" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_62" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">53</td>
                    <td class="style-keyitem-details" width="129">
                        <asp:Label ID="Lab_keyitem_63" runat="server">Material</asp:Label>
                    </td>
                    <td class="style-keyitem-details" width="192">　</td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_62" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_41" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_63" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap63" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_63" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_63" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_63" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_63" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_63" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-gray" height="42">
                    <td class="style-keyitem-number" height="42" width="32">54</td>
                    <td class="style-keyitem-details" width="129">
                        <asp:Label ID="Lab_keyitem_64" runat="server">Measurement tool</asp:Label>
                    </td>
                    <td class="style-keyitem-details" width="192">　</td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_63" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_42" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_64" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap64" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_64" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_64" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_64" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_64" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　<asp:Panel ID="Panel_Lv_64" runat="server">
                        </asp:Panel>
                    </td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
                <tr class="style-td-white" height="22">
                    <td class="style-keyitem-number" height="22" width="32">55</td>
                    <td class="style-keyitem-details" width="129">
                        <asp:Label ID="Lab_keyitem_65" runat="server">Reliability</asp:Label>
                    </td>
                    <td class="style-keyitem-details" width="192">　</td>
                    <td width="160">
                        <asp:Label ID="CAP_EP_64" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-red">
                        <asp:Label ID="lab_Ver_POR_43" runat="server"></asp:Label>
                    </td>
                    <td class="style-td-blue">
                        <asp:Label ID="lab_Ver_New_65" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_gap65" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Eff_65" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Eff_65" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Label ID="lab_Pot_65" runat="server"></asp:Label>
                        <asp:Panel ID="Panel_Pot_65" runat="server">
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel_Lv_65" runat="server">
                        </asp:Panel>
                        　</td>
                    <td>　</td>
                    <td>　</td>
                    <td>　</td>
                </tr>
            </table>
            
       




        </asp:Panel>


        <asp:Button ID="cmdFilter" runat="server"  Text="Button" ClientIDMode="Static" Style="display: none;"  OnClick="cmdFilter_Click"/>

         <div id="dialog"> <iframe src="" frameborder="0" height="100%" width="100%" id="dialogFrame" scrolling="auto"></iframe> </div>






    </form>
</body>
</html>
