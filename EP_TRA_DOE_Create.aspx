<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EP_TRA_DOE_Create.aspx.cs" Inherits="EP_TRA_DOE_Create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>EPTRA_DOE_Create</title>
     <link rel="stylesheet" href="..\css\styles.css" type="text/css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    
    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>

<script type="text/javascript">
     $(function () {
         $("[id$=Customer_TB]").autocomplete({
             source: function (request, response) {
                 $.ajax({
                     url: '<%=ResolveUrl("EP_TRA_DOE_Create.aspx/GetCustomer") %>',
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
                     url: '<%=ResolveUrl("Query_EP_TRA.aspx/GetNewDevice") %>',
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


        function error_msg( error_sentence) {
            alert(error_sentence);
        }

           

   </script>      










     <script type="text/javascript">
     
        var test_array = new Array();
        var array_count = 0;
        var but_save_id = new Array();
        var but_save_str = new Array(); //存放button數量      
        var but_save_row = new Array();//save每個button在第幾row
        var but_save_rowspan = new Array();
        var but_classname = new Array();
        var but_save_addselect_count = new Array();


        var array_stage = new Array;  //DOE_information資料陣列
        var array_SpeChar = new Array;
        var array_md = new Array;
        var array_cate = new Array;
        var array_kp = new Array;
        var rowspan = 0;
        var row_count = 0;
        
       


      
        function display_array()
        {
            alert(testArray);
        }

      
                                                
        function createtable(count) {
            document.getElementById("a1").innerHTML = count;
            var but_id_savecount = new Array();
            var table_obj = document.getElementById('doe_1');
            //var row = document.getElementById('row_2').rowIndex;
            var table_title_leng = document.getElementById('doe_1').rows.length;
            var c = 0;
            var count_rs = 1;
            var record_num = 0;
            //document.getElementById('a1').textContent = table_title_leng;

            for (i = table_title_leng; i < count + table_title_leng ; i++) {

                var r = document.getElementById('doe_1').insertRow(i)
                
                r.id = "row_" + i;
                for (j = 0; j < 19; j++) {




                    //var col = r.insertCell(j);
                    //col.id = r.id + "_" + "col_" + j;
                    /*if (j == 7 || j == 9)
                    {
                        document.getElementById(col.id).style.width = "2000px";
                    }
                    else
                    {
                        document.getElementById(col.id).style.width = "500px";
                    }*/
                   
                    if (c < count) {
                        if (j == 0) {
                            //col.innerHTML = array_stage[c];
                           
                            if(array_stage[c]!=array_stage[c-1])
                            {
                                //document.getElementById('row_'+i+'_col_0').rows[but_save_row[i]].cells[0].rowSpan
                                record_num = c + table_title_leng;
                                col.innerHTML = array_stage[c];
                                var col = r.insertCell(j);
                                col.id = r.id + "_" + "col_" + j;
                                //console.log(c);
                            }
                            else
                            {
                                count_rs++;
                                //var obj_parent = document.getElementById("row_" + (c + table_title_leng));
                                //var obj_chd = document.getElementById("row_" + (c + table_title_leng) + '_col_0');
                               
                               //obj_parent.removeChild(obj_chd);


                            }
                            
                                document.getElementById('row_' + record_num + '_col_0').rowSpan = count_rs;
                            
                            

                        }
                        if (j == 1)
                        {
                            var col = r.insertCell(j);
                            col.id = r.id + "_" + "col_" + j;
                            col.innerHTML = array_SpeChar[c];
                            
                        }
                            
                        if (j == 2) {
                            var col = r.insertCell(j);
                            col.id = r.id + "_" + "col_" + j;
                            col.innerHTML = array_md[c];
                            
                        }
                            
                        if (j == 3) {
                            var col = r.insertCell(j);
                            col.id = r.id + "_" + "col_" + j;
                            col.innerHTML = array_cate[c];
                        }
                            
                        if (j == 4) {
                            var col = r.insertCell(j);
                            col.id = r.id + "_" + "col_" + j;
                            col.innerHTML = array_kp[c];
                        }
                            
                    }
                    if (j == 5) {
                        var col = r.insertCell(j);
                        col.id = r.id + "_" + "col_" + j;
                        var y = 1;
                        var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = "but_" + i + "_" + j;
                        //but_save_str[i - table_title_leng] = btn.id;
                        but_save_id[c]=btn.id; //計算but被按得次數
                        btn.value = "+"
                        
                        btn.addEventListener('click', function () { Add_Row(this) });
                         document.getElementById(r.id + "_" + "col_" + j).appendChild(btn);
                    }
                    if (j == 6) {
                        var col = r.insertCell(j);
                        col.id = r.id + "_" + "col_" + j;
                        /*var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = "but_" + i + "_" + j;
                        btn.value = "-"
                        btn.addEventListener('click', function () { DeleteRow(this) });
                         document.getElementById(r.id + "_" + "col_" + j).appendChild(btn);*/
                    }
                    if(j>6&&j<19)
                    {
                        var col = r.insertCell(j);
                        col.id = r.id + "_" + "col_" + j;

                        if (j == 8) {
                           
                            var legs = document.getElementById(r.id + "_" + "col_" + j);
                            legs.innerHTML = "±";
                        }
                        
                        else {
                            

                            if (j == 18)
                            {
                                break;
                            }
                            
                            
                            var text = document.createElement("INPUT");
                            text.type = "text";
                            text.id = "text_" + i + "_" + j;
                            //text.value = text.id;

                            document.getElementById(r.id + "_" + "col_" + j).appendChild(text);
                            document.getElementById("text_" + i + "_" + j).style.width = "100px";

                            if (j == 17) //新增下拉式選單
                            {
                               
                                var but = document.createElement("INPUT");
                                but.type = "button";
                                but.id = "AddSel_" + i + "_" + j;
                                but_save_addselect_count[but.id] = 0;
                                but.value = '+';
                                but.addEventListener('click', function () { Add_Select(this) });
                                document.getElementById(r.id + "_" + "col_" + j).appendChild(but);
                                document.getElementById(r.id + "_" + "col_" + j).style.width = "200px";
                            }



                        }
                    }


                    
                }
                c++;//計算資料數
            }
           
        }
        
        function jude_but_id(but,obj)
        {
            
            for(i=0;i<but.length;i++)
            {
                if(but[i] == obj.id)
                {
                    alert(but[obj.id]++);
                }
            }
        }

        function Add_Select(self) {
            var self_id = self.id;
            //alert(self_id);
            (++but_save_addselect_count[self_id]);

            


            if(but_save_addselect_count[self_id]<=3)
            {

            var myOption;
            var row = self.parentNode.parentNode.rowIndex;
            var put_select_position = document.getElementById('doe_1').rows[row].cells[18].parentNode.id+"_col_18";           
            var res_Select = document.createElement("Select");                           
            res_Select.id = put_select_position + "_Select_" + but_save_addselect_count[self_id];
            document.getElementById(put_select_position).appendChild(res_Select);


            myOption = document.createElement("option");
            myOption.text = "AVG";
            myOption.value = "AVG";
            res_Select.appendChild(myOption);
            myOption = document.createElement("option");
            myOption.text = "MAX";
            myOption.value = "MAX";
            res_Select.appendChild(myOption);
            myOption = document.createElement("option");
            myOption.text = "MIN";
            myOption.value = "MIN";
            res_Select.appendChild(myOption);
            
    
            var btn = document.createElement("INPUT");
            btn.type = "button";
            btn.id = put_select_position + "_DeleteSelect_" + but_save_addselect_count[self_id];
            btn.value = '-'
            btn.addEventListener('click', function () { DeleteSelect_but(this) });
            a = document.getElementById(put_select_position).appendChild(btn);

            var temp_id = btn.id
            var temp_but_id = temp_id.split('_');
            for (i = 0; i < temp_but_id.length; i++)
            {
                if(temp_but_id.length-1==i)
                {
                    temp_but_id[i] = temp_but_id[i] - 1;
                }
            }
            var delete_befor = "";
            for (i = 0; i < temp_but_id.length; i++) {
               

                if (temp_but_id.length - 1 == i) {
                    delete_befor += temp_but_id[i];
                }
                else
                {
                    delete_befor += temp_but_id[i] + "_";
                }
            }


            if (but_save_addselect_count[self_id] >= 2)
            {
                document.getElementById(delete_befor).style.visibility = "hidden";
            }


            }
            else {

                alert('超過新增數目!');
                (but_save_addselect_count[self_id]=3);
                
            }


        }
        function DeleteSelect_but(self)
        {
            var self_id = self.id;
            var select_id="";
            alert(self.id);
            var row = self.parentNode.parentNode.rowIndex;
            var parent = document.getElementById(self.parentNode.id);
            var temp_delete_obj = document.getElementById(self.id);
            var temp_cells17_but = document.getElementById('doe_1').rows[row].cells[17].children[1].id;
            
            var temp_str = self_id.split('_');
            for (i = 0; i < temp_str.length; i++)
            {
                if(temp_str[i]=="DeleteSelect")
                {
                    temp_str[i] = "Select";
                }
            }
            for (i = 0; i < temp_str.length; i++)
            {
                if (temp_str.length - 1 == i) {
                    select_id += temp_str[i];
                }
                else
                {
                    select_id += temp_str[i] + "_";
                }
                
            }

            var temp_select_obj = document.getElementById(select_id);
            
            parent.removeChild(temp_delete_obj);
            parent.removeChild(temp_select_obj);
            (but_save_addselect_count[temp_cells17_but]--);

            var obj = event.srcElement;
            var delete_befor = "";
            if (but_save_addselect_count[temp_cells17_but] <= 3) {
                var temp_str  = obj.id
                var temp_id = temp_str.split('_');

                for (i = 0; i < temp_id.length; i++) {
                    if (temp_id.length - 1 == i) {
                        temp_id[i] = temp_id[i] - 1;
                    }
                }
                
                for (i = 0; i < temp_id.length; i++) {


                    if (temp_id.length - 1 == i) {
                        delete_befor += temp_id[i];
                    }
                    else {
                        delete_befor += temp_id[i] + "_";
                    }
                }


                document.getElementById(delete_befor).style.visibility = "visible";
            }


        }




        function Add_Row(row)
        {
            
            var obj = event.srcElement;//抓取是哪一個button動作
            row_num = row.parentNode.parentNode.rowIndex;
            row_num_berfore = row_num - 1;
            row_count = row_num + 1;
            rowspan_nun = row_num;
            
            
            //var dis = (++but_save_str[obj.id]);
            //alert(obj.id+"~~~~"+row_num);
            
            //document.getElementById('a1').textContent = row_count;
            //document.getElementById('a2').textContent = dis;
           
          
            

            var r = document.getElementById("doe_1").insertRow(row_count)
            r.id = "row_" + (row_count);
            document.getElementById(obj.id).style.visibility = "hidden";

            

            
            
            for (i = 0; i < but_save_id.length; i++) {
                var row_ber = document.getElementById(but_save_id[i]).parentNode.parentNode.rowIndex;

                but_save_row[i] = row_ber;
                but_classname[i] = i;
            }
            
           
            
                
            for(i=0;i<14;i++)
            {

                var temp_group;
                


                for (j = 0; j < but_save_row.length; j++) {

                    if (row_num >= but_save_row[j] && row_num < but_save_row[j + 1]) {
                        
                        temp_group = "group_" + but_save_row[j] + "_";
                        //break;
                    
                    }
                    else if (row_num >= but_save_row[but_save_row.length - 1] && j == (but_save_row.length - 1)) {
                        temp_group = "group_" + but_save_row[j] + "_";
                        //break;
                    }


                }


                var col = r.insertCell(i);
                col.id = temp_group + r.id + "_" + "col_" + i;


               

                if (i == 0)
                {

                    var btn = document.createElement("INPUT");
                    btn.type = "button";
                    btn.id = temp_group + "but_" + row_count + "_" + i;
                   
                    btn.value = "+"
                    btn.addEventListener('click', function () { Add_Row(this) });
                    document.getElementById(col.id).appendChild(btn);

                   

                }
                else if(i==1)
                {
                   

                        var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = temp_group + "but_" + row_count + "_" + i;
                        
                        btn.value = "-"
                        btn.addEventListener('click', function () { DeleteRow(this) });
                        document.getElementById(col.id).appendChild(btn);
                    
                }
                else if(i==3)
                {
                    col.innerHTML = "±";
                }
                else if(i>=2 && i!=3 && i!=13)
                {
                    
                    var text = document.createElement("INPUT");
                    text.type = "text";
                    text.id = col.id+"_text_"+i;
                    //text.value = text.id;

                    document.getElementById(col.id).appendChild(text);
                    document.getElementById(text.id).style.width = "100px";

                    if(i==12)
                    {
                        var btn = document.createElement("INPUT");
                        btn.type = "button";
                        btn.id = temp_group + "but_" + row_count + "_" + i;
                        but_save_addselect_count[btn.id] = 0;
                        btn.value = "+"
                        btn.addEventListener('click', function () { Add_Select_additional(this) });
                        document.getElementById(col.id).appendChild(btn);
                    }

                }
                else {
                    //col.innerHTML = col.id;
                }



               
            }
           

            for (i = 0; i < but_save_id.length; i++) {
                var row_ber = document.getElementById(but_save_id[i]).parentNode.parentNode.rowIndex;

                but_save_row[i] = row_ber;
                but_classname[i] = i;
            }

            for (i = 0; i < but_save_row.length; i++) {
                

                


                if (row_num >= but_save_row[i] && row_num < but_save_row[i + 1]) {
                    r.className = but_classname[i];
                    var rowspan = (document.getElementsByClassName(but_classname[i]).length + 1);
                    but_save_rowspan[i] = rowspan;
                    //document.getElementById('a1').textContent = rowspan;

                    if (rowspan - 1 != 1) //隱藏刪除按鈕
                    {

                       
                        var str = obj.id;
                        var temp_str = str.split('_');

                        str = temp_str[0] + "_" + temp_str[1] + "_" + temp_str[2] + "_" + temp_str[3] + "_" + 1;
                      
                        document.getElementById(str).style.visibility = "hidden";
                    }



                    var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = but_save_rowspan[i];
                    var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = but_save_rowspan[i];
                    var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = but_save_rowspan[i];
                    var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = but_save_rowspan[i];
                    var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = but_save_rowspan[i];

                }
                else if (row_num >= but_save_row[but_save_row.length - 1] && i == (but_save_row.length - 1)) {
                    r.className = but_classname[i];
                    var rowspan = (document.getElementsByClassName(but_classname[i]).length + 1);
                    but_save_rowspan[i] = rowspan;
                    //document.getElementById('a1').textContent = rowspan;

                    if (rowspan - 1 != 1) //隱藏刪除按鈕
                    {
                        var str = obj.id;
                        var temp_str = str.split('_');

                        str = temp_str[0] + "_" + temp_str[1] + "_" + temp_str[2] + "_" + temp_str[3] + "_" + 1;

                        document.getElementById(str).style.visibility = "hidden";



                    }

                    var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = but_save_rowspan[i];
                    var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = but_save_rowspan[i];
                    var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = but_save_rowspan[i];
                    var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = but_save_rowspan[i];
                    var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = but_save_rowspan[i];
                }
                

            }


           


        }

        function DeleteRow(point)
        {
            var obj = event.srcElement;//抓取是哪一個button動作
            row_num = point.parentNode.parentNode.rowIndex;
            var row_num_bef = document.getElementById('doe_1').rows[row_num - 1];
            
            var temp_group;

            for (i = 0; i < but_save_id.length; i++) {
                var row_ber = document.getElementById(but_save_id[i]).parentNode.parentNode.rowIndex;

                but_save_row[i] = row_ber;
                
            }
           



            for (i = 0; i < but_save_row.length; i++) {
                
               
               


                if (row_num >= but_save_row[i] && row_num < but_save_row[i + 1]) {
                    
                    var test = (--but_save_rowspan[i]);
                    //document.getElementById('a1').textContent = test;
                     
                    if (row_num - 1 == but_save_row[i]) {
                        var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = 1;
                        var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = 1;
                        var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = 1;
                        var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = 1;
                        var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = 1;

                        var temp_but_id_befor = document.getElementById('doe_1').rows[but_save_row[i]].cells[5].children[0].id;
                        document.getElementById(temp_but_id_befor).style.visibility = "visible";



                    }
                    else
                    {
                        var cell_0 = document.getElementById('doe_1').rows[row_num - 1].cells[0].children[0].id;
                        var cell_1 = document.getElementById('doe_1').rows[row_num - 1].cells[1].children[0].id;


                        document.getElementById(cell_0).style.visibility = "visible";
                        document.getElementById(cell_1).style.visibility = "visible";
                    }

                   
                    


                    var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = but_save_rowspan[i];
                    var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = but_save_rowspan[i];
                    var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = but_save_rowspan[i];
                    var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = but_save_rowspan[i];
                    var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = but_save_rowspan[i];

                }
                else if (row_num >= but_save_row[but_save_row.length - 1] && i == (but_save_row.length - 1)) {
                   
                    //var rowspan = (document.getElementsByClassName(but_classname[i]).length + 1);
                    var test = (--but_save_rowspan[i]);
                    //document.getElementById('a1').textContent = test;


                    if (row_num - 1 == but_save_row[i]) {
                        var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = 1;
                        var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = 1;
                        var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = 1;
                        var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = 1;
                        var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = 1;

                        var temp_but_id_befor = document.getElementById('doe_1').rows[but_save_row[i]].cells[5].children[0].id;
                        document.getElementById(temp_but_id_befor).style.visibility = "visible";

                       

                    }
                    else{
                    var cell_0 = document.getElementById('doe_1').rows[row_num - 1].cells[0].children[0].id; //抓取上一列新增button_id
                    var cell_1 = document.getElementById('doe_1').rows[row_num - 1].cells[1].children[0].id; //抓取上一列刪除button_id
                    document.getElementById(cell_0).style.visibility = "visible";
                    document.getElementById(cell_1).style.visibility = "visible";
                    }

                    var rowspan_0 = document.getElementById('doe_1').rows[but_save_row[i]].cells[0].rowSpan = but_save_rowspan[i];
                    var rowspan_1 = document.getElementById('doe_1').rows[but_save_row[i]].cells[1].rowSpan = but_save_rowspan[i];
                    var rowspan_2 = document.getElementById('doe_1').rows[but_save_row[i]].cells[2].rowSpan = but_save_rowspan[i];
                    var rowspan_4 = document.getElementById('doe_1').rows[but_save_row[i]].cells[3].rowSpan = but_save_rowspan[i];
                    var rowspan_5 = document.getElementById('doe_1').rows[but_save_row[i]].cells[4].rowSpan = but_save_rowspan[i];
                }


            }

            document.getElementById("doe_1").deleteRow(row_num);



        }

        
        function Add_Select_additional(self) {
            var self_id = self.id;
            //alert(self_id);
            (++but_save_addselect_count[self_id]);




            if (but_save_addselect_count[self_id] <= 3) {

                var myOption;
                var row = self.parentNode.parentNode.rowIndex;
                var temp_put_select_position = document.getElementById('doe_1').rows[row].cells[12].children[0].parentNode.id ;
                var temp_str = temp_put_select_position.split('_');
                var put_select_position = "";
                for (i = 0; i < temp_str.length; i++)
                {
                    if(temp_str.length-1==i)
                    {
                        temp_str[i] = (parseInt(temp_str[i]) + 1).toString();
                        put_select_position += temp_str[i];
                    }
                    else
                    {
                        put_select_position += temp_str[i]+"_";
                    }
                }
                
                /*for (i = 0; i < temp_str.length; i++) {
                    if (temp_str.length - 1 == i) {
                        temp_str[i] = temp_str - 1;
                    }
                    else
                    {

                    }
                }*/


                var res_Select = document.createElement("Select");
                res_Select.id = put_select_position + "_Select_" + but_save_addselect_count[self_id];
                document.getElementById(put_select_position).appendChild(res_Select);


                myOption = document.createElement("option");
                myOption.text = "AVG";
                myOption.value = "AVG";
                res_Select.appendChild(myOption);
                myOption = document.createElement("option");
                myOption.text = "MAX";
                myOption.value = "MAX";
                res_Select.appendChild(myOption);
                myOption = document.createElement("option");
                myOption.text = "MIN";
                myOption.value = "MIN";
                res_Select.appendChild(myOption);


                var btn = document.createElement("INPUT");
                btn.type = "button";
                btn.id = put_select_position + "_DeleteSelect_" + but_save_addselect_count[self_id];
                btn.value = '-'
                btn.addEventListener('click', function () { DeleteSelect_but_additional(this) });
                a = document.getElementById(put_select_position).appendChild(btn);

                var temp_id = btn.id
                var temp_but_id = temp_id.split('_');
                for (i = 0; i < temp_but_id.length; i++) {
                    if (temp_but_id.length - 1 == i) {
                        temp_but_id[i] = temp_but_id[i] - 1;
                    }
                }
                var delete_befor = "";
                for (i = 0; i < temp_but_id.length; i++) {


                    if (temp_but_id.length - 1 == i) {
                        delete_befor += temp_but_id[i];
                    }
                    else {
                        delete_befor += temp_but_id[i] + "_";
                    }
                }


                if (but_save_addselect_count[self_id] >= 2) {
                    document.getElementById(delete_befor).style.visibility = "hidden";
                }


            }
            else {

                alert('超過新增數目!');
                (but_save_addselect_count[self_id] = 3);

            }

        }


        function DeleteSelect_but_additional(self) {
            var self_id = self.id;
            var select_id = "";
            alert(self.id);
            var row = self.parentNode.parentNode.rowIndex;
            var parent = document.getElementById(self.parentNode.id);
            var temp_delete_obj = document.getElementById(self.id);
            var temp_cells17_but = document.getElementById('doe_1').rows[row].cells[12].children[1].id;

            var temp_str = self_id.split('_');
            for (i = 0; i < temp_str.length; i++) {
                if (temp_str[i] == "DeleteSelect") {
                    temp_str[i] = "Select";
                }
            }
            for (i = 0; i < temp_str.length; i++) {
                if (temp_str.length - 1 == i) {
                    select_id += temp_str[i];
                }
                else {
                    select_id += temp_str[i] + "_";
                }

            }

            var temp_select_obj = document.getElementById(select_id);

            parent.removeChild(temp_delete_obj);
            parent.removeChild(temp_select_obj);
            (but_save_addselect_count[temp_cells17_but]--);

            var obj = event.srcElement;
            var delete_befor = "";
            if (but_save_addselect_count[temp_cells17_but] <= 3) {
                var temp_str = obj.id
                var temp_id = temp_str.split('_');

                for (i = 0; i < temp_id.length; i++) {
                    if (temp_id.length - 1 == i) {
                        temp_id[i] = temp_id[i] - 1;
                    }
                }

                for (i = 0; i < temp_id.length; i++) {


                    if (temp_id.length - 1 == i) {
                        delete_befor += temp_id[i];
                    }
                    else {
                        delete_befor += temp_id[i] + "_";
                    }
                }


                document.getElementById(delete_befor).style.visibility = "visible";
            }


        }
        function test()
        {
            var obj = event.srcElement;
            var doe_stage = document.getElementById('row_2_col_0').innerHTML + "|";
            var doe_SpeChar = document.getElementById('row_2_col_1').innerHTML+ "|";
            var doe_md = document.getElementById('row_2_col_2').innerHTML+"|";
            var doe_cate = document.getElementById('row_2_col_3').innerHTML + "|";
            var doe_kp = document.getElementById('row_2_col_4').innerHTML + "|";
            var doe_legs_1 = document.getElementById('text_2_7').value + "|";
            var doe_legs_2 = document.getElementById('text_2_9').value + "|";
            var doe_wafer = document.getElementById('text_2_10').value + "|";
            var doe_wt_dm = document.getElementById('text_2_11').value + "|";
            var doe_wt_pc = document.getElementById('text_2_12').value + "|";
            var doe_wt_live = document.getElementById('text_2_13').value + "|";
            var doe_attr = document.getElementById('text_2_14').value + "|";
            var doe_note = document.getElementById('text_2_15').value + "|";
            var doe_lot = document.getElementById('text_2_16').value + "|";
            var doe_duedate = document.getElementById('text_2_17').value;
            var doe_result = "";
            /*if (but_save_addselect_count[obj.id] == 1)
            {
                var x = document.getElementById("row_2_col_18_Select_1").value;
                doe_result = x;
            }*/




            var pass_str = version_name +"|"+ doe_stage + doe_SpeChar + doe_md + doe_cate + doe_kp + doe_legs_1 + doe_legs_2 + doe_wafer + doe_wt_dm + doe_wt_pc + doe_wt_live + doe_attr + doe_note + doe_lot + doe_duedate;

            var str = PageMethods.test_pass(pass_str, display, CallFailed);
           
            


        }

        function display(sign)
        {
            if(sign=="1")
            {
                alert("新增成功!");
                //window.location.replace("Query_EP_TRA.aspx");
                window.history.go(-1);
            }
            else {
                alert("新增失敗!");
            }
        }
            
           

            // alert message on some failure
            function CallFailed(res, destCtrl) {
                alert(res.get_message());
            }
        
   </script>


















<style type="text/css">

.font8
	{color:blue;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:細明體, monospace;
	}
.font6
	{color:blue;
	font-size:20.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	}
        .style-doe-head{
            width:300px;
            height:50px;

        }
        .style-doe-head-2{
            width:500px;
            height:50px;

        }
        .style-doe-head-blue
        {
            width:500px;
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
           
            
            background: #538ED5;
        }
        .style-doe-head-gray
        {
           
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
           
            
            background: #7F7F7F;
        }
        
        .style-doe-head-orange
        {
            width:250px;
            height:50px;
            color:white;
            font-size: 15.0pt;
            font-weight: 400;
            font-style: normal;                        
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            /*padding-left: 2px;
            padding-right: 2px;
            padding-top: 2px;
            padding-bottom: 2px;*/
            
            background: #FFC000;
        }
         p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	         margin-left: 0cm;
             margin-right: 0cm;
             margin-top: 0cm;
         }
         </style>

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
            width: 500pt;
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
            width: 400pt;
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
        
        
   
        
    .auto-style1 {
        border-style: none;
        border-color: inherit;
        border-width: 1;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 8px;
        -moz-border-radius: 8px;
        -webkit-border-radius: 8px;
        box-shadow: 3px 3px 10px #666;
        -moz-box-shadow: 3px 3px 10px #666;
        -webkit-box-shadow: 3px 3px 10px #666;
        position: relative;
        left: 1px;
        top: 0px;
    }
            
        
   
        
    .auto-style2 {
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
            
        
   
        
 </style>  

  


</head>
<body>
    <form id="doe_create" runat="server">

        <asp:Panel ID="query_ver" runat="server">
        <div class="left">
            <fieldset class="auto-style1" style="margin:auto;">
                <legend class="legend" style="font-size:medium;"><strong>DOE_Create</strong></legend>  
                
                 <table >
                    
                     <tr>
                          
                         <th >Customer:</th>
                        <td  class="td_newDevice"><asp:TextBox ID="Customer_TB" runat="server" Height="20px" 
                                 OnTextChanged="Customer_TB_TextChanged" Width="160px"></asp:TextBox></td>
                         <th >New_Device:</th>
                        <td class="td_newDevice"><asp:TextBox ID="ND_TB" runat="server" Height="20px" 
                                 OnTextChanged="ND_TB_TextChanged1" Width="160px"></asp:TextBox></td>
                         <th >&nbsp;</th>
                        <td class="td_newDevice"></td>
                         <td><asp:Button ID="Search_Device" runat="server" class="blueButton button2" 
                                 Height="30px" OnClick="Search_Device_Eptra_table" Text="Search" Width="70px"/></td>
                     </tr>
                     
                    

                 </table>    
             


             </fieldset>
            
            <br />
               
            </div>       
        </asp:Panel>

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>


     <asp:Panel ID="Panel_eptraview" runat="server" >
        <div class="div-eptramain">

            <asp:GridView ID="DOE_gv1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" >
            <Columns>              
                <asp:TemplateField HeaderText="DOE">
                              <ItemTemplate>
                                  <asp:Button ID="But_Create_DOE" runat="server" Text="Create"  OnClick="But_Create_DOE_Click"/>
                              </ItemTemplate>              
                </asp:TemplateField>


                <asp:BoundField HeaderText="EPTRAName" DataField="Ver_Name" />
                 <asp:BoundField HeaderText="版本狀態" DataField="Ver_Status" />
                 <asp:TemplateField HeaderText="串簽狀態">
                              <ItemTemplate>
                                  <asp:Label ID="Label_sta" runat="server" ></asp:Label>
                              </ItemTemplate>              
                </asp:TemplateField>
               
                <asp:BoundField HeaderText="送審人員" DataField="LV_Signoff_SendName" />
                <asp:BoundField HeaderText="送審時間" DataField="LV_Signoff_SendTime" />
                <asp:BoundField HeaderText="審核人員" DataField="LV_Signoff_Name" />
                <asp:BoundField HeaderText="審核時間" DataField="LV_Signoff_Time" />
               
                  
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
             
            
       <br />
       
        </div>
        
         </asp:Panel>

       
    <asp:Panel ID="Panel_EPTRA" runat="server" Visible="true">
                   
      <asp:LinkButton ID="Button_Cancel" runat="server" CausesValidation="False" style="position:fixed;top:0px;left:0px;"
      CommandName="Cancel" Text="取消" OnClick="Button_Cancel_Click"><img src="icon/Cancel.png" height="40px" width="40px" />
      </asp:LinkButton>
       <div style="width:50%;">
       <!--border-collapse:collapse,要讓欄位邊框合併-->
            <table id="doe_1" border="1" style="border-color:black;width:1300px;border-collapse:collapse;margin-left:8px;">
                 <tr id ="head1">
                     <td class="style-doe-head-blue" style="" rowspan="2" >                     
                        <div>Effect Stage</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2" >                     
                        <div>Special Characteristics</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">
                      <div id="a1"></div>
                      <div>Methodology</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">
                      <div id="a2"></div>
                      <div>Category</div>
                     </td>
                     <td class="style-doe-head-blue" rowspan="2">                    
                      <div>Keyparameter</div>
                    <div></div>
                     </td>
                        
                     <td class="style-doe-head-gray" style="width:200px;border-right-style:none;" rowspan="2" colspan="5">
                         <div id="show_len"></div>
                        <div>DOE LEGS</div>
                     </td>
                     <td class="style-doe-head-gray" style="width:400px;" rowspan="2" >
                         <div style="font-size:20px;">Wafer Qn'ty</div>
                     </td>                  
                     <td class="style-doe-head-orange" colspan="3">
                         <div>Wafer Count</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Atrribute</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Note</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                         <div>Lot Number</div>
                     </td>
                     <td class="style-doe-head-orange" style="width:900px;" rowspan="2">
                         <div style="font-size:15pt">Due date</div>
                     </td>
                     <td class="style-doe-head-orange" rowspan="2">
                          <div style="font-size:15pt">Result</div>
                     </td>                                      
                </tr>
                <tr>
                    <td style="width:100px; height:50px" class="style-doe-head-orange">
                        <div>DM</div>
                    </td>
                     <td style="width:100px;" class="style-doe-head-orange">
                         <div>PC</div>
                     </td>
                     <td style="width:100px;" class="style-doe-head-orange">
                         <div>Live</div>
                     </td>                                                                                               
                </tr>
                                                                                                                 
               </table>
            
       
          
         
         <div><input id="Button2" type="button" value="送出" onclick="test()"/></div>
                         
        
        <div><asp:Label ID="Label1" runat="server"></asp:Label></div> 
        
        
        </div>
        
        
        
        
        
        
        
        
        
        
         
    </asp:Panel>

             
             
            
   
      



    </form>
   
</body>
</html>
