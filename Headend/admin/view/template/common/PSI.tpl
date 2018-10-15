 <?php echo $header; ?>
<style type="text/css">
table.fix-head>tbody, table {
        display:block;
        
    }

     table.fix-head>tbody {
        overflow-y: scroll;
        height: 300px;
}
#table_head_col tr td{
  
  width: 165px;
}
#table_body_col tr td{
  
  width: 165px;
}

#myTable{
  width:100%;
}
.error_message {
  color: red;
}
</style>
 <div class="row"> 	 
  <div id="OutputChannels" class="col-md-6" style="height: 85vh;">
  </div>
  <div id="PSITables" class="col-md-6" style="height: 85vh;"></div>        
</div>
<div id="loading-img"></div>
<div class="overlay"></div>
<div class="modal fade" id="message_Modal_psi" role="dialog" data-backdrop="static">
  <div class="modal-dialog modal-lg"  style=" align-self: center; width: 40%;  ">
    <div class="modal-content" >
    <h4 id="message_psi" align="center"></h4>
    </div>
 </div>
</div>
<div class="modal fade bs-example-modal-lg" tabindex="-1" aria-labelledby="myLargeModalLabel" id="BATModal" role="dialog" data-backdrop="static" ></div>
        
<div class="modal fade" id="BAT_UpdateModal" role="dialog" data-backdrop="static" ></div>
<!-- <div class="modal fade bs-example-modal-lg" tabindex="-1" aria-labelledby="myLargeModalLabel" id="secondLoopModal" role="dialog" data-backdrop="static" ></div> --> 
<div id="secondLoopModal" class="modal fade" role="dialog"></div>     
 <script type="text/javascript">
 	  var global_bouquet_ids = [];
    var global_bouquet_names = [];
    var bouquetTable="";
    var global_PrivateData_id = 1;
$(document).ready(function(){

    <?php foreach($Qam_detail as $Qam_value ){ ?>
   var html_output= '<table class="panel2" id="qam_name<?php echo $Qam_value['Qam_ID'];?>" data-toggle="collapse" data-target="#output-qam<?php echo $Qam_value['Qam_ID'];?>" style="width:100%">'
      html_output+='<colgroup>'
        html_output+='<col style="width: 3%"  />'
        html_output+='<col style="width: 33%" />'
        html_output+='<col style="width: 5%" />'
        html_output+='<col style="width: 10%" />'
      html_output+='</colgroup>'
    html_output+='<tr >'
      html_output+='<td></td>'
      html_output+='<td><span><b><?php echo $Qam_value['Qam_name']?></b></span></td>'
      html_output+='<td></td>'
      
    html_output+='</tr> '
    html_output+='</table>'
    html_output+='<div class="modal fade" id="quad_QAM<?php echo $Qam_value['Qam_ID'];?>" tabindex="-1" role="dialog" data-backdrop="static">'
    html_output+='</div>'
    html_output+='<div class="collapse " id="output-qam<?php echo $Qam_value['Qam_ID'];?>" >'
 <?php foreach($QamFreq_detail as $QamFreq_value ){ ?>
    <?php if( $Qam_value['Qam_ID'] == $QamFreq_value['qam_id'] ) { ?>
     html_output+='<table class="freq-table"  data-toggle="collapse" data-target="#channel11<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" style="margin-top:1%;width:100%">'
      html_output+='<colgroup>'
       html_output+='<col style="width: 3%"  />'
        html_output+='<col style="width: 33%" />'
        html_output+='<col style="width: 5%" />'
        html_output+='<col style="width: 10%" />'
      html_output+='</colgroup>'
     html_output+='<tr id="freq_out_<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>"  data-draggable="target" aria-dropeffect="none" >'
        html_output+='<td></td>'
        html_output+='<td><span> <?php echo $QamFreq_value['freq_name'] ?></span></td>'
        html_output+='<td><b><?php echo $QamFreq_value['frequency']?></b>MHz</td>'
         html_output+='<td></td>'
      html_output+='</tr>'
    html_output+='</table>'
    html_output+='<div class="collapse" id="channel11<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">'
        <?php foreach($outputdata as $value ){ ?>

          <?php if($value['targetid'] == $QamFreq_value['freq_ID'] &&  $value['qam_targetid'] == $Qam_value['Qam_ID']){ ?>
            <?php if($value['changed_ch_no'] == -1){ ?>
               html_output+='<div id="output_chModal_<?php echo $value['channelnumber'].''.$value['targetid'].''.$value['rmx_no'];?>" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">'
               html_output+='</div>'
             <?php } ?>
             <?php if($value['changed_ch_no'] != -1){ ?>
             html_output+='<div id="output_chModal_<?php echo $value['changed_ch_no'].''.$value['targetid'].''.$value['rmx_no'];?>" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">'
             html_output+='</div>'
            <?php } ?> 

          
           <?php if($value['changed_ch_no'] == -1){ ?>
            html_output+='<table class="panel1" id="output_<?php echo $value['channelnumber'].'_'.$value['targetid'].'_'.$value['qam_targetid'].'_'.$value['inputid'];?>" style="width:100%">'
             <?php } ?>
             <?php if($value['changed_ch_no'] != -1){ ?>
            
            html_output+='<table class="panel1" id="output_<?php echo $value['changed_ch_no'].'_'.$value['targetid'].'_'.$value['qam_targetid'].'_'.$value['inputid'];?>"  style="width:100%">'
             <?php } ?> 
        
          html_output+='<colgroup>'
           html_output+='<col style="width: 3%"  />'
          html_output+='<col style="width: 7%" />'
          html_output+='<col style="width: 23%" />'
          html_output+='<col style="width: 18%" />'
          html_output+='<col style="width: 7%" />'
           html_output+='<col style="width: 7%" />'
          html_output+='</colgroup>'
           html_output+='<tr>'
            html_output+='<td></td>'
            <?php if($value['changed_ch_no'] == -1){ ?>
            html_output+='<td><span> <font size="2"><?php echo $value['channelnumber'];?></font> </span></td>'
             <?php } ?>
             <?php if($value['changed_ch_no'] != -1){ ?>
            html_output+='<td><span> <font size="2"><?php echo $value['changed_ch_no'];?></font> </span></td>'
             <?php } ?> 
             <?php if($value['changed_ch_name'] == '-1'){ ?>
             html_output+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><font size="2"><?php echo $value['channelname'];?></font></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_name'] != '-1'){ ?>
            html_output+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><font size="2"><?php echo $value['changed_ch_name'];?></font></span></td>'
             <?php } ?> 
             <?php if($value['changed_ch_no'] == '-1'){ ?>
              html_output+='<td>Set SerId:<input type="text" id="Set_SerId_<?php echo $value['channelnumber'].'_'.$value['targetid'].'_'.$value['rmx_no'].'_'.$value['inputid'];?>" style="width:50%;height:30%;" value="" onfocusout="SetSerId(<?php echo $value['channelnumber'] ?>,<?php echo $value['rmx_no'];?>,<?php echo $value['targetid'];?>,<?php echo $value['inputid'];?>,<?php echo $value['changed_ch_no'];?>)"></td>'
             <?php } ?>
             <?php if($value['changed_ch_no'] != '-1'){ ?>
            html_output+='<td >Set SerId:<input type="text" id="Set_SerId_<?php echo $value['changed_ch_no'].'_'.$value['targetid'].'_'.$value['rmx_no'].'_'.$value['inputid'];?>" style="width:50%;height:30%;" value="<?php echo $value['changed_ch_no'];?>" onfocusout="SetSerId(<?php echo $value['channelnumber'] ?>,<?php echo $value['rmx_no'];?>,<?php echo $value['targetid'];?>,<?php echo $value['inputid'];?>,<?php echo $value['changed_ch_no'];?>)"></td>'
             <?php } ?> 
             <?php if($value['changed_ch_no'] == '-1'){ ?>
             html_output+='<td>LCN:<input type="text" id="LCN_<?php echo $value['channelnumber'].'_'.$value['targetid'].'_'.$value['rmx_no'].'_'.$value['inputid'];?>" style="width:50%;height:30%;" value="<?php echo $value['Lcn'];?>" onfocusout="setLCN(<?php echo $value['channelnumber'] ?>,<?php echo $value['rmx_no'];?>,<?php echo $value['targetid'];?>,<?php echo $value['inputid'];?>,<?php echo $value['changed_ch_no'];?>,<?php echo $value['Lcn'];?>)"></td>'
            <?php } ?> 
            <?php if($value['changed_ch_no'] != '-1'){ ?>
            	html_output+='<td>LCN:<input type="text" id="LCN_<?php echo $value['changed_ch_no'].'_'.$value['targetid'].'_'.$value['rmx_no'].'_'.$value['inputid'];?>" style="width:50%;height:30%;" value="<?php echo $value['Lcn'];?>" onfocusout="setLCN(<?php echo $value['channelnumber'] ?>,<?php echo $value['rmx_no'];?>,<?php echo $value['targetid'];?>,<?php echo $value['inputid'];?>,<?php echo $value['changed_ch_no'];?>,<?php echo $value['Lcn'];?>)"></td>'
            <?php } ?>
            html_output+='<td></td>'
             /*html_output+='<td><button type="button" onclick="setLCN(<?php echo $value['channelnumber'] ?>,<?php echo $value['rmx_no'];?>,<?php echo $value['targetid'];?>,<?php echo $value['inputid'];?>,<?php echo $value['changed_ch_no'];?>)">APPLY</button></td>'*/
         

           
             
            
         html_output+=' </tr>'
        html_output+='</table>'


          <?php } ?> 
        
        <?php } ?>  

      html_output+='</div>'
     <?php } ?>
     <?php } ?>
html_output+='</div>'
     
 $("#OutputChannels").append(html_output);
<?php } ?>
 //******************************************BAT**********************************************************   //
     var html='<div style="background-color:silver;">'
         html+='<table data-target="#BAT" style="margin-top:10%;" >'
              html+='<colgroup>'
                html+='<col style="width: 1%"/>'
                html+='<col style="width: 10%"/>'
                html+='<col style="width: 3%"/>'
                html+='<col style="width: 1%"/> '
                html+='<col style="width: 65%"/> '
                html+='<col style="width: 0%"/> '
                html+='<col style="width: 10%"/> '
              html+='</colgroup>'
            html+='<tr>'
              html+='<td></td>'
              html+='<td><span ><b>Bouq ID</b></span></td>'
              html+='<td></td>'
              html+='<td></td>'
              html+='<td><span ><b>Bouquet Name</b></span></td>'
              html+='<td></td>'
              html+='<td><span id="BAT_add" onclick="newBAT(-1,-1,0);" class="glyphicon glyphicon-plus"  data-toggle="modal" data-target="#BATModal"></span></td> '
              html+='<td></td>'
              html+='<td><button type="button" class="btn btn-default" id="insert_bat" onclick="insertBAT();">Insert BAT </button> </td>'
            html+='</tr>'
       html+='</table>' 
       html+='</div>'
       html+=' <div class="collapse in" id="BAT" >'
          <?php foreach($BAT_detail as $BAT){ ?>
            global_bouquet_ids.push(<?php echo $BAT['bouquet_id'];?>);
            global_bouquet_names.push('<?php echo $BAT['Name'];?>');
            var html2='<table class="panel2" data-toggle="collapse" id="bat_<?php echo $BAT['bouquet_id'];?>" >'
                html2+='<colgroup>'
                  html2+='<col style="width: 4%;" />'
                  html2+='<col style="width: 5%;" />'
                  html2+='<col style="width: 4%;" />'
                  html2+='<col style="width: 60%;" />'
                  html2+='<col style="width: 4%;" />'
                 html2+='<col style="width: 10%;" />'
                  html2+='<col style="width: 1%;" />'
                  html2+='<col style="width: 15%;" />'
                  html2+='<col style="width: 4%;" />'
               html2+='</colgroup>'

               html2+='<tr>'
                html2+='<td></td>'
                html2+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $BAT['bouquet_id'];?></td>'
                 html2+='<td></td>'
                html2+='<td style="text-overflow:ellipsis; overflow:hidden;"><span id="bouquet_<?php echo $BAT['bouquet_id'];?>"><?php echo $BAT['Name'];?></td>'
                  html2+='<td></td>'
                  html2+='<td id="bouquet_update_<?php echo $BAT['bouquet_id'];?>"><span onclick="newBAT(<?php echo $BAT['bouquet_id'];?>,'+"'"+'<?php echo $BAT['Name'];?>'+"'"+',<?php echo $BAT['genreType'];?>);" class="glyphicon glyphicon-cog"  data-toggle="modal" data-target="#BATModal"></span></td>'
                  html2+='<td></td>'
                  html2+='<td><span id="bouquet_delete_<?php echo $BAT['bouquet_id'];?>" onclick="deleteBouquet(<?php echo $BAT['bouquet_id'];?>,'+"'"+'<?php echo $BAT['Name'];?>'+"'"+');" class="glyphicon glyphicon-trash"></span></td> '
                  html2+='<td></td>'
               html2+='</tr>'
              html2+='</table> '
               html+=html2;
        <?php } ?>
       
            html+='</div>'
            
            bouquetTable=html;
       $("#OutputChannels").append(html);   
  
 });
 function SetSerId(channelnumber,rmx_no,targetid,inputid,changed_ch_no)
 {
  
    
  if(changed_ch_no== -1)
  {
   var changed_ch_number=$("#Set_SerId_"+channelnumber+"_"+targetid+"_"+rmx_no+"_"+inputid).val();
 
  }
  else
  {
   
   var changed_ch_number=$("#Set_SerId_"+changed_ch_no+"_"+targetid+"_"+rmx_no+"_"+inputid).val();
   
  }
 
  if(changed_ch_number!="")
  {
    addFlag=1;

  }
  else
  {
     addFlag=0;
     changed_ch_number=-1;
  }
   $.ajax({
            url: 'index.php?route=common/PSI/setServiceId&token=<?php echo $token; ?>&channelnumber='+channelnumber+'&targetid='+targetid+'&rmx_no='+rmx_no+'&inputid='+inputid+'&changed_ch_no='+changed_ch_number+'&addFlag='+addFlag,
          error:function()
          {
            var html='<b>Invalid Data</b>';
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          
          },
          success:function(data)
          { 
            data=JSON.parse(data);
            if(data["error"]==true)
            {
              $("#message_psi").empty();
              $('#message_Modal_psi').fadeIn();
              $("#message_psi").append($data["resp"]);
              $('#message_Modal_psi').modal("show");
              $('#message_Modal_psi').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut(); 
            }
            

         
          },
      }); 
 
 
 }
 var serviceTable="";
function newBAT(bouquet_id,bouquet_name,genreType)
{

  $("#BATModal").empty();
  var bat_id="";
  var bat_name= "";
  var bouquet_id_input ="";
  var is_new=0;
    if (bouquet_id != -1) {
      is_new = -1;
     bouquet_id_input= '<td><input type="text" class="form-control-default " value="'+bouquet_id+'" id="bat_id" style="margin-bottom:2%;" readonly=""></td>'
      bat_name = bouquet_name;

    }else{
      is_new = 1;
      bouquet_id_input= '<td><input type="text" class="form-control-default " value="" id="bat_id" style="margin-bottom:2%;"></td>'
    }
    var html='<div class="modal-dialog modal-lg" >'
        html+='<div class="modal-content" >'
        html+='<div class="modal-header"><b>BAT</b></div>'
          html+='<div class="modal-body">'
            html+='<table class="genral" style="width:100%;"><tbody>'
             html+='<colgroup><col style="width:22%;"/><col style="width:22%;"/> </colgroup>'
             html+='<tr>' 
              html+='<td>Bouquet Id</td>'
              html+=bouquet_id_input
              html+='<td id="error_bat_id" class="error_message"></td>'
              if(genreType==1)
              {
              html+='<td ><input style="margin-left:50%;" type="checkbox" checked="checked" name="Genre_Type"    id="Genre_Type" onclick="Genre()" /><span>Main Genre</span></td>'
              }
              else
              {
                html+='<td ><input style="margin-left:50%;" type="checkbox"  name="Genre_Type"    id="Genre_Type" onclick="Genre()" /><span>Main Genre</span></td>'
              }
             html+='</tr>'
             html+='<tr>' 
              html+='<td>Bouquet Name</td>'
              html+='<td><input type="text" class="form-control-default ecmg_modal" value="'+bat_name+'" id="bat_name"   style="margin-bottom:2%;"></td>'
              html+='<td id="error_bat_name" class="error_message"></td>'
             html+='</tr>'
             html+='<tr>'
              html+='<table id="myTable" class="table fix-head responsive table-striped" >'
              if(genreType==0)
              {
                var serviceTable='<thead id="table_head_col">'
                serviceTable+='<tr>' 
                serviceTable+='<td>Sr No</td> <td>Select<input type="checkbox" name="selectAll"   id="selectAll"/></td><td>Service Id</td><td>Service Name</td><td>LCN</td>'
                serviceTable+='</tr>'
                serviceTable+='</thead>'
                serviceTable+='<tbody id="table_body_col">'
                var i=1;

            /* $.ajax({
                  url:'index.php?route=common/PSI/getActivatedChannels&token=<?php echo $token; ?>',
                  error:function()
                  {
                    var html='<b>Error While Opeaning Modal</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
                  },
                  success:function(data)
                  { 
                    data=JSON.parse(data);
                    for(var j=0;j<data.length;j++)
                    {
                       serviceTable+='<tr>' 
                      var service_id;
                      if(data[j]['changed_ch_number'] == -1)
                      {
                        service_id = data[j]['channelnumber'];
                      }
                      else if(data[j]['changed_ch_number'] != -1){ 
                        service_id = data[j]['changed_ch_number'];
                      } 
                      serviceTable+='<td>'+i+'</td>' 
                      serviceTable+='<td><input type="checkbox" class="service_list" name="service_list" value="'+service_id+'_'+data[j]['rmx_no']+'_'+data[j]['inputid']+'_'+data[j]['targetid']+'" id="'+service_id+'_'+data[j]['rmx_no']+'_'+data[j]['inputid']+'_'+data[j]['targetid']+'"/></td>'
                      serviceTable+='<td>'+service_id+'</td>'
                      if(data[j]['changed_ch_name'] == -1 )
                      {
                        serviceTable+='<td>'+data[j]['channelname']+'</td>'
                      }
                      else
                      {
                        serviceTable+='<td>'+data[j]['changed_ch_name']+'</td>'
                      }
                      
                      serviceTable+='<td> ('+data[j]['Lcn']+' == "")? "Null" : '+data[j]['Lcn']+'</td>'
                      serviceTable+='</tr>'
                      i++; 
                    }
                    
                  },
                type:'GET'

              });*/


                <?php foreach($outputdata as $value ){ ?>

                  serviceTable+='<tr>' 
                  var service_id;
                  <?php if($value['changed_ch_no'] == -1){ ?>
                    service_id = <?php echo $value['channelnumber'];?>;
                  <?php }else if($value['changed_ch_no'] != -1){ ?>
                    service_id = <?php echo $value['changed_ch_no'];?>;
                  <?php } ?>
                  serviceTable+='<td>'+i+'</td>' 
                  serviceTable+='<td><input type="checkbox" class="service_list" name="service_list" value="'+service_id+'_<?php echo $value['rmx_no'];?>_<?php echo $value['inputid'];?>_<?php echo $value['targetid'];?>" id="'+service_id+'_<?php echo $value['rmx_no'];?>_<?php echo $value['inputid'];?>_<?php echo $value['targetid'];?>"/></td>'
                  serviceTable+='<td>'+service_id+'</td>'
                  if('<?php echo $value['changed_ch_name'];?>' == -1 )
                  {
                    serviceTable+='<td><?php echo $value['channelname'];?></td>'
                  }
                  else
                  {
                    serviceTable+='<td><?php echo $value['changed_ch_name'];?></td>'
                  }
                  
                  serviceTable+='<td><?php echo ($value['Lcn'] == "")? "Null" : $value['Lcn'];?></td>'
                  serviceTable+='</tr>'
                  i++;

                <?php } ?>

                html+=serviceTable;
                
              html+='</tbody>'
            }
            else
            {
              var html1='<thead id="table_head_col">'
                html1+='<tr>' 
                html1+='<td>Sr No</td> <td>Select<input type="checkbox" name="selectAll_bouquet"   id="selectAll_bouquet"/></td><td>Bouquet Id</td><td>Bouquet Name</td><td></td>'
                html1+='</tr>'
                html1+='</thead>'
                html1+='<tbody id="table_body_col">'
                var i=1;
                
                 <?php foreach($BAT_detail as $BAT){ ?>
                  var sub_bouquet_id=<?php echo $BAT['bouquet_id'];?>;
                 /* global_bouquet_ids.push(<?php echo $BAT['bouquet_id'];?>);
                  global_bouquet_names.push('<?php echo $BAT['Name'];?>');*/
                  var genreType=<?php echo $BAT['genreType'];?>;
                  if(genreType==0)
                  {
                     html1+='<tr>' 
                 
                  html1+='<td>'+i+'</td>' 
                  html1+='<td><input type="checkbox" class="bouquet_list" name="bouquet_list" value="'+sub_bouquet_id+'" id="genre_'+sub_bouquet_id+'"/></td>'
                  html1+='<td>'+sub_bouquet_id+'</td>'
                  html1+='<td><?php echo $BAT['Name'];?></td>'
                  html1+='<td></td>'
                  html1+='</tr>'
                  i++;
                  }
                 
                <?php } ?>
                 
              html1+='</tbody>'
              html+=html1;
            }

              html+'</table>'
             html+='</tr>'
            html+='</tbody></table>'
            html+='<div id="error_bat_service_list" class="error_message"> </div>'
         html+='</div>'
          html+='<div class="modal-footer"><button type="button" class="btn btn-default"  id ="addBAT" onclick="addBAT('+is_new+');" >SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" id="bat_cancel">Cancel</button></div>'
       html+='</div>'
  html+='</div>'
  $("#BATModal").append(html);
  if(bouquet_id != -1){

    if(genreType==0)
    {
      $.ajax({
              url: 'index.php?route=common/dashboard/getBouquetDetails&token=<?php echo $token; ?>&bouquet_id='+bouquet_id,
          error:function()
          {
            var html='<b>Invalid Data</b>';
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          
          },
          success:function(data)
          { 
            var bouquet_info = JSON.parse(data);

            for (var i = 0; i < bouquet_info.length; i++) {
              var id = bouquet_info[i]["service_id"]+"_"+bouquet_info[i]["rmx_id"]+"_"+bouquet_info[i]["input"]+"_"+bouquet_info[i]["output"];
              if (!$('#'+id).is(':checked')){

                $('#'+id).prop("checked",true);



                
              }
            }
          },
      });
    }
    else
    {
    
      $.ajax({
              url: 'index.php?route=common/dashboard/getGenreDetails&token=<?php echo $token; ?>&bouquet_id='+bouquet_id,
          error:function()
          {
            var html='<b>Invalid Data</b>';
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          
          },
          success:function(data)
          { 
            var bouquet_info = JSON.parse(data);
            for (var i = 0; i < bouquet_info.length; i++) {
              
              if (!$('#genre_'+bouquet_info[i]['sub_bouquet_id']).is(':checked')){
                $('#genre_'+bouquet_info[i]['sub_bouquet_id']).prop("checked",true);
              }
            }
          },
      });
    }
  }
$("#selectAll").click(function(){
    if(this.checked)
    {
   
      $(".service_list").prop("checked",true);
    } 
    else
    {
     $(".service_list").prop("checked",false);
    }
  });
}

function Genre()
{
  var check=$("input[name='Genre_Type']");
  if(check.prop("checked"))
    { 
      $("#myTable").empty();
       var html1='<thead id="table_head_col">'
                html1+='<tr>' 
                html1+='<td>Sr No</td> <td>Select<input type="checkbox" name="selectAll_bouquet"   id="selectAll_bouquet"/></td><td>Bouquet Id</td><td>Bouquet Name</td><td></td>'
                html1+='</tr>'
                html1+='</thead>'
                html1+='<tbody id="table_body_col">'
                var i=1;
          $.ajax({
          url: 'index.php?route=common/dashboard/getBATList&token=<?php echo $token; ?>',
          error:function()
          {
            var html='<b>Invalid Data</b>';
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          
          },
          success:function(data)
          { 
            
            var Bat_list=JSON.parse(data);
            for(var j=0;j<Bat_list.length;j++)
            {
              var bouquet_id=Bat_list[j]['bouquet_id'];
                
                  var genreType=Bat_list[j]['genreType'];
                  if(genreType==0)
                  {
                     html1+='<tr>' 
                 
                  html1+='<td>'+i+'</td>' 
                  html1+='<td><input type="checkbox" class="bouquet_list" name="bouquet_list" value="'+bouquet_id+'" id="'+bouquet_id+'"/></td>'
                  html1+='<td>'+bouquet_id+'</td>'
                  html1+='<td>'+Bat_list[j]['Name']+'</td>'
                  html1+='<td></td>'
                  html1+='</tr>'
                  i++;
                  }
            }
            html1+='</tbody>'
              
      $("#myTable").append(html1);       
          },

      });

    } 
    else
    {
     $("#myTable").empty();
     serviceTable='<thead id="table_head_col">'
                serviceTable+='<tr>' 
                serviceTable+='<td>Sr No</td> <td>Select<input type="checkbox" name="selectAll"   id="selectAll"/></td><td>Service Id</td><td>Service Name</td><td>LCN</td>'
                serviceTable+='</tr>'
                serviceTable+='</thead>'
                serviceTable+='<tbody id="table_body_col">'
                var i=1;
                <?php foreach($outputdata as $value ){ ?>
                  serviceTable+='<tr>' 
                  var service_id;
                  <?php if($value['changed_ch_no'] == -1){ ?>
                    service_id = <?php echo $value['channelnumber'];?>;
                  <?php }else if($value['changed_ch_no'] != -1){ ?>
                    service_id = <?php echo $value['changed_ch_no'];?>;
                  <?php } ?>
                  serviceTable+='<td>'+i+'</td>' 
                  serviceTable+='<td><input type="checkbox" class="service_list" name="service_list" value="'+service_id+'_<?php echo $value['rmx_no'];?>_<?php echo $value['inputid'];?>_<?php echo $value['targetid'];?>" id="'+service_id+'_<?php echo $value['rmx_no'];?>_<?php echo $value['inputid'];?>_<?php echo $value['targetid'];?>"/></td>'
                  serviceTable+='<td>'+service_id+'</td>'
                  serviceTable+='<td><?php echo $value['channelname'];?></td>'
                  serviceTable+='<td><?php echo ($value['Lcn'] == "")? "Null" : $value['Lcn'];?></td>'
                  serviceTable+='</tr>'
                  i++;
                <?php } ?>
                serviceTable+='</tbody>'
     $("#myTable").append(serviceTable);
    }
    $("#selectAll_bouquet").click(function(){
    if(this.checked)
    {
   
      $(".bouquet_list").prop("checked",true);
    } 
    else
    {
     $(".bouquet_list").prop("checked",false);
    }
  });
}

function addBAT(is_new)
{
  var BAT_Name=$("#bat_name").val();
  var BAT_Id=$("#bat_id").val();
  var service_arr = [];  
  var bouquetId_arr = [];
  $.each($("input[name='service_list']:checked"), function(){            
      service_arr.push($(this).val());
  });

  var check=$("input[name='Genre_Type']");
if(check.prop("checked"))
{ 

  $.each($("input[name='bouquet_list']:checked"), function(){            
      bouquetId_arr.push($(this).val());
  });

 if(validateBouquetInput(BAT_Name,BAT_Id,bouquetId_arr,is_new) == false){
   var post_data ={'Main_BAT_Id':BAT_Id,'bouquetId_list':bouquetId_arr,'BAT_Name':BAT_Name};
      $.ajax({
            url: 'index.php?route=common/dashboard/addGenre&token=<?php echo $token; ?>',
            type: 'GET',
            contentType: 'application/json',
            data:  post_data,
            beforeSend: function(){
              $("#loading-img").css({"display": "block"});
              $(".overlay").show();
            },
            error:function()
            {
              $("#loading-img").css({"display": "none"});
              $(".overlay").hide();
              var html='<b>Invalid Data</b>';
              $("#message_psi").empty();
              $('#message_Modal_psi').fadeIn();
              $("#message_psi").append(html);
              $('#message_Modal_psi').modal("show");
              $('#message_Modal_psi').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
            
            },
             success:function(data)
            {
              $("#loading-img").css({"display": "none"});
              $(".overlay").hide();
              var comma = "'";
              var add_qouquet_resp = JSON.parse(data);
              if(add_qouquet_resp["error"]==false)
              { 
                if(is_new == -1){
                  
                  $("#bouquet_"+BAT_Id).html(BAT_Name);
                  $("#bouquet_update_"+BAT_Id).empty();
                  $("#bouquet_update_"+BAT_Id).html('<span onclick="newBAT('+BAT_Id+','+comma+BAT_Name+comma+',1);" class="glyphicon glyphicon-cog"  data-toggle="modal" data-target="#BATModal"></span>');
                  var new_genre = {"bouquet_id":bouquet_id,"Name":BAT_Name,"genreType":1};
                  $BAT_detail.push(new_genre);
                }else{

                  global_bouquet_ids.push(Number(BAT_Id));
                  global_bouquet_names.push(BAT_Name);
                  var table='<table class="panel2" data-toggle="collapse in" id="bat_'+BAT_Id+'" >'
                  table+='<colgroup>'
                  table+='<col style="width: 4%;" />'
                  table+='<col style="width: 5%;" />'
                  table+='<col style="width: 4%;" />'
                  table+='<col style="width: 60%;" />'
                  table+='<col style="width: 4%;" />'
                  table+='<col style="width: 10%;" />'
                  table+='<col style="width: 1%;" />'
                  table+='<col style="width: 15%;" />'
                  table+='<col style="width: 4%;" />'
                  table+='</colgroup>'
                  table+='<tr>'
                  table+='<td></td>'
                  table+='<td style="text-overflow:ellipsis; overflow:hidden;"><span>'+BAT_Id+'</td>'
                  table+='<td></td>'
                  table+='<td style="text-overflow:ellipsis; overflow:hidden;"><span id="bouquet_'+BAT_Id+'">'+BAT_Name+'</span></td>'
                  table+='<td></td>'
                  table+='<td id="bouquet_update_'+BAT_Id+'"><span onclick="newBAT('+BAT_Id+','+comma+BAT_Name+comma+',1);" class="glyphicon glyphicon-cog"  data-toggle="modal" data-target="#BATModal"></span></td>'
                  table+='<td></td>'
                  table+='<td><span id="bouquet_delete_'+BAT_Id+'" onclick="deleteBouquet('+BAT_Id+','+"'"+BAT_Name+"'"+');" class="glyphicon glyphicon-trash"></span></td> '
                  table+='<td></td>'
                  table+='</tr>'
                  table+='</table> '
                  $('#BAT').append(table);
                }
                var html='<b>'+add_qouquet_resp["message"]+'</b>';
                $("#message_psi").empty();
                $('#message_Modal_psi').fadeIn();
                $("#message_psi").append(html);
                $('#message_Modal_psi').modal("show");
                $('#message_Modal_psi').delay(1000).fadeOut('slow');
                $('.modal-backdrop').fadeOut();
                
              }else
              {
                $("#message_psi").empty();
                $('#message_Modal_psi').fadeIn();
                $("#message_psi").append(add_qouquet_resp);
                $('#message_Modal_psi').modal("show");
                $('#message_Modal_psi').delay(1000).fadeOut('slow');
                $('.modal-backdrop').fadeOut();
              }
              location.reload();
            },
      });
      $("#bat_cancel").click();
 }  
}
 
else
{
  if(validateBouquetInput(BAT_Name,BAT_Id,service_arr,is_new) == false){
    
    var post_data ={'bat_name':BAT_Name,'bat_id':BAT_Id,'service_list':service_arr};
    $.ajax({
            url: 'index.php?route=common/dashboard/addBAT&token=<?php echo $token; ?>',
            type: 'GET',
            contentType: 'application/json',
            data:  post_data,
            beforeSend: function(){
              $("#loading-img").css({"display": "block"});
              $(".overlay").show();
            },
            error:function()
            {
              $("#loading-img").css({"display": "none"});
              $(".overlay").hide();
              var html='<b>Invalid Data</b>';
              $("#message_psi").empty();
              $('#message_Modal_psi').fadeIn();
              $("#message_psi").append(html);
              $('#message_Modal_psi').modal("show");
              $('#message_Modal_psi').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
            
            },
            success:function(data)
            {
              $("#loading-img").css({"display": "none"});
              $(".overlay").hide();
              var comma = "'";
              var add_qouquet_resp = JSON.parse(data);
              if(add_qouquet_resp["error"]==false)
              {
                if(is_new == -1){
                  
                  global_bouquet_names.push(BAT_Name);
                  $("#bouquet_"+BAT_Id).html(BAT_Name);
                  $("#bouquet_update_"+BAT_Id).empty();
                  $("#bouquet_update_"+BAT_Id).html('<span onclick="newBAT('+BAT_Id+','+comma+BAT_Name+comma+',0);" class="glyphicon glyphicon-cog"  data-toggle="modal" data-target="#BATModal"></span>');
                  /*var new_genre = {"bouquet_id":bouquet_id,"Name":BAT_Name,"genreType":1};
                  $BAT_detail.push(new_genre);
                  alert($BAT_detail);*/
                }else{
                global_bouquet_ids.push(Number(BAT_Id));
                  global_bouquet_names.push(BAT_Name);
                  var table='<table class="panel2" data-toggle="collapse" id="bat_'+BAT_Id+'" >'
                  table+='<colgroup>'
                  table+='<col style="width: 4%;" />'
                  table+='<col style="width: 5%;" />'
                  table+='<col style="width: 4%;" />'
                  table+='<col style="width: 60%;" />'
                  table+='<col style="width: 4%;" />'
                  table+='<col style="width: 10%;" />'
                  table+='<col style="width: 1%;" />'
                  table+='<col style="width: 15%;" />'
                  table+='<col style="width: 4%;" />'
                  table+='</colgroup>'
                  table+='<tr>'
                  table+='<td></td>'
                  table+='<td style="text-overflow:ellipsis; overflow:hidden;"><span>'+BAT_Id+'</td>'
                  table+='<td></td>'
                  table+='<td style="text-overflow:ellipsis; overflow:hidden;"><span id="bouquet_'+BAT_Id+'">'+BAT_Name+'</span></td>'
                  table+='<td></td>'
                  table+='<td id="bouquet_update_'+BAT_Id+'"><span onclick="newBAT('+BAT_Id+','+comma+BAT_Name+comma+',0);" class="glyphicon glyphicon-cog"  data-toggle="modal" data-target="#BATModal"></span></td>'
                  table+='<td></td>'
                  table+='<td><span id="bouquet_delete_'+BAT_Id+'" onclick="deleteBouquet('+BAT_Id+','+"'"+BAT_Name+"'"+');" class="glyphicon glyphicon-trash"></span></td>'
                  table+='<td></td>'
                  table+='</tr>'
                  table+='</table> '
                  $('#BAT').append(table);
                }
                var html='<b>'+add_qouquet_resp["message"]+'</b>';
                $("#message_psi").empty();
                $('#message_Modal_psi').fadeIn();
                $("#message_psi").append(html);
                $('#message_Modal_psi').modal("show");
                $('#message_Modal_psi').delay(1000).fadeOut('slow');
                $('.modal-backdrop').fadeOut();
                
              }else
              {
                $("#message_psi").empty();
                $('#message_Modal_psi').fadeIn();
                $("#message_psi").append(add_qouquet_resp);
                $('#message_Modal_psi').modal("show");
                $('#message_Modal_psi').delay(1000).fadeOut('slow');
                $('.modal-backdrop').fadeOut();
              }
            },
      });
    $("#bat_cancel").click();
  }
 }  
}

function validateBouquetInput(BAT_Name,BAT_Id,service_arr,is_new){
  var error_input = false;
  $("#error_bat_id").html("");
  $("#error_bat_name").html("");
  $("#error_bat_service_list").html("");

  var regex_name=/(^[a-zA-Z][0-9a-zA-Z_ ]*){1,30}$/;
  var regex_id=/^[1-9][0-9]*$/;
  
  if(regex_id.test(BAT_Id) == false){
    error_input = true;
    $("#error_bat_id").html("Error: Please enter valid bouquet Id!");
  }else if(BAT_Id > 255){
    error_input = true;
    $("#error_bat_id").html("Error: Please enter valid bouquet Id(Less then 256)!");
  }
   else{
    if(is_new == 1){
      if (isValidBouquetId(BAT_Id)) 
      {
        error_input = true;
        $("#error_bat_id").html("Error: Bouquet Id alread exist!");
      }
    }
  }
  if(regex_name.test(BAT_Name) == false){
    error_input = true;
    $("#error_bat_name").html("Error: Please enter valid bouquet Name!");
  }else if(BAT_Name.length > 32){
    error_input = true;
    $("#error_bat_name").html("Error: Bouquet Name length should be <= 32!");
  }
  else{
    if(is_new == 1 || is_new == -1){

      if (isValidBouquetName(BAT_Name)) 
      {
        error_input = true;
        $("#error_bat_name").html("Error: Bouquet Name alread exist!");
      }
    }
  }
  if(service_arr.length == 0){
    error_input = true;
    $("#error_bat_service_list").html("Error: Please select atlease 1 services for bouquet!");
  }
  return error_input;
}
function isValidBouquetId(b_id){
    return (jQuery.inArray(Number(b_id), global_bouquet_ids) > -1);
}
function isValidBouquetName(b_name){
    return (jQuery.inArray(b_name, global_bouquet_names) > -1);
}
function deleteBouquet(bouquet_id,bouquet_name)
{
  
   var del_resp = confirm("Do you want to delete bouquet?");
   if(del_resp)
   {
     $.ajax({
            url: 'index.php?route=common/dashboard/deleteBouquet&token=<?php echo $token; ?>&bouquet_id='+bouquet_id,
        beforeSend: function(){
          $("#loading-img").css({"display": "block"});
          $(".overlay").show();
        },
        error:function()
        {
          $("#loading-img").css({"display": "none"});
          $(".overlay").hide();
          var html='<b>Invalid Data</b>';
          $("#message_psi").empty();
          $('#message_Modal_psi').fadeIn();
          $("#message_psi").append(html);
          $('#message_Modal_psi').modal("show");
          $('#message_Modal_psi').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
        
        },
        success:function(data)
        {
          
          $("#loading-img").css({"display": "none"});
          $(".overlay").hide();
          var add_qouquet_resp = JSON.parse(data);
          
          if(add_qouquet_resp["error"]==false)
          {
            var bat_id = 'bat_'+bouquet_id;
            $("#"+bat_id).remove();
            deleteBouquetIdFromGlobalArray(bouquet_id);
            deleteBouquetNameFromGlobalArray(bouquet_name);
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append("Bouquet deleted successfully!");
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
            
          }else
          {
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(data);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          }
        },
    });
  }
}
function insertBAT(){
  $.ajax({
            url: 'index.php?route=common/dashboard/insertBAT&token=<?php echo $token; ?>',
        beforeSend: function(){
          $("#loading-img").css({"display": "block"});
          $(".overlay").show();
        },
        error:function()
        {
          $("#loading-img").css({"display": "none"});
          $(".overlay").hide();
          var html='<b>Invalid Data</b>';
          $("#message_psi").empty();
          $('#message_Modal_psi').fadeIn();
          $("#message_psi").append(html);
          $('#message_Modal_psi').modal("show");
          $('#message_Modal_psi').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
        
        },
        success:function(data)
        {
          // alert(data);
          $("#loading-img").css({"display": "none"});
          $(".overlay").hide();
          var add_qouquet_resp = JSON.parse(data);
          if(add_qouquet_resp["error"]==false)
          {
            
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(add_qouquet_resp['message']);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
            
          }else
          {
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(data);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          }
        },
    });
}
function deleteBouquetIdFromGlobalArray(bq_id) {
  var index = jQuery.inArray(Number(bq_id), global_bouquet_ids);

  if (index > -1) {
     global_bouquet_ids.splice(index, 1);
  }
}
function deleteBouquetNameFromGlobalArray(bq_name) {
  var index = jQuery.inArray(bq_name, global_bouquet_names);
  
  if (index > -1) {

     global_bouquet_names.splice(index, 1);
  }
}    

//*********************************************BAT*******************************************************   //
 function setLCN(programNumber,rmx_no,output,input,changed_ch_no,old_lcn)
 {
 	if(changed_ch_no== -1)
 	{
 	  var Lcn=$("#LCN_"+programNumber+"_"+output+"_"+rmx_no+"_"+input).val();	
 	}
 	if(changed_ch_no!= -1)
 	{
 	  var Lcn=$("#LCN_"+changed_ch_no+"_"+output+"_"+rmx_no+"_"+input).val();	
 	}
  if(old_lcn!=Lcn )
  {
  var addFlag=1;
 	if(Lcn!="")
  {
  $.ajax({
          url: 'index.php?route=common/dashboard/setLCN&token=<?php echo $token; ?>&input=' + input+'&programNumber='+programNumber+'&rmx_no='+rmx_no+'&output='+output+'&channelNumber='+Lcn+'&addFlag='+addFlag,
      error:function()
      {
        var html='<b>Invalid Data</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();
      
      },
      success:function(data)
      {
        if(data==0)
        {
          
          
        }
        else
        { 
        
          $("#message_psi").empty();
          $('#message_Modal_psi').fadeIn();
          $("#message_psi").append(data);
          $('#message_Modal_psi').modal("show");
          $('#message_Modal_psi').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
        }

      },
  });
  }
  else
  {
    $.ajax({
          url: 'index.php?route=common/dashboard/unsetLCN&token=<?php echo $token; ?>&input=' + input+'&programNumber='+programNumber+'&rmx_no='+rmx_no+'&output='+output,
      error:function()
      {
        var html='<b>Invalid Data</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();
      },
      success:function(data)
      {
        if(data==0)
        {
          
          
        }
        else
        {
          $("#message_psi").empty();
          $('#message_Modal_psi').fadeIn();
          $("#message_psi").append(data);
          $('#message_Modal_psi').modal("show");
          $('#message_Modal_psi').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
        }

      },
  });
  }
 }
 }
 /**************************************************************
     PSI/SI TABLES
 **************************************************************/

 $(document).ready(function(){
    var rmx_no=1;
    var output=0;
    var qam_id=0;
    $.ajax({
          url:'index.php?route=common/dashboard/GetTables&token=<?php echo $token;?>&output='+output+'&rmx_no='+rmx_no,
          error:function()
          {
           var html='<b>Invalid Data</b>';
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          },
          success: function(data)
          {
            if(data == -1)
            {alert("Connection Error");
            $("#PSITables").empty();
              var html='<table class="genral" style="width:100%; height: 25%;">'
               html+='<colgroup>'
                  html+='<col style="width: 4%;" />'
                  html+='<col style="width: 3%;" />'
                  html+='<col style="width: 5%;" />'
                  html+='<col style="width: 5%;" />'
                html+='</colgroup>'
              html+='<tbody>'
              html+='<tr>'
              html+='<th>Table</th>'
              html+='<th>Generate mode</th>'
              html+='<th>Insertion[ms]</th>'
              html+='</tr>'
              html+='<tr>'
              html+='<td><b>PAT</b></td>'
              html+='<td><select id="PAT_dropdown_'+output+'_'+qam_id+'" onChange="disabletextbox('+output+','+qam_id+');" name="PAT_dropdown_'+output+'_'+qam_id+'">'
              html+='<option value="1" selected="selected">Automatic</option>'
              html+='<option value="2" selected="selected">Disable</option>'
              html+='</select></td>'
              html+='<td><input type="text" name="PAT_text_'+output+'_'+qam_id+'" value="NULL" class="form-control-default" style="margin-top: 4px;"  id="PAT_'+output+'_'+qam_id+'" >&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="PAT_Download_'+output+'_'+qam_id+'"  onClick="downloadTables(0,00,'+rmx_no+');" ></button></td>'
              html+='</tr>'
              html+='<tr><td></td><td></td><td><span id="error_PAT_'+output+'_'+qam_id+'" style="color:red;"></span></td></tr>'
              html+='<tr><td><b>CAT</b></td><td>'
              html+='<select id="CAT_dropdown_'+output+'_'+qam_id+'" name="CAT_dropdown_'+output+'_'+qam_id+'" onChange="disabletextbox('+output+','+qam_id+');">'
              html+='<option value="1" selected="selected">Automatic</option>'
              html+='<option value="2" selected="selected">Disable</option>'
              html+='</select></td>'
              html+='<td><input type="text" class="form-control-default" style="margin-top: 4px;" id="CAT_'+output+'_'+qam_id+'" >&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="CAT_Download_'+output+'_'+qam_id+'" onClick="downloadTables(0,01,'+rmx_no+');" disabled="disabled"></button></td>'
              html+='</tr>'
              html+='<tr><td><b>SDT</b></td><td><select id="SDT_dropdown_'+output+'_'+qam_id+'" onChange="disabletextbox('+output+','+qam_id+');" name="SDT_dropdown_'+output+'_'+qam_id+'">'
              html+='<option value="1" selected="selected">Automatic</option>'
              html+='<option value="2" selected="selected">Disable</option>'
              html+='</select></td>'
              html+='<td><input type="text" class="form-control-default" style="margin-top: 4px;"  id="SDT_'+output+'_'+qam_id+'" value="NULL">&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="SDT_Download_'+output+'_'+qam_id+'" onClick="downloadTables(0,66,'+rmx_no+');"></button></td>'
              html+='</tr>'
              html+='<tr><td></td><td></td><td><span id="error_SDT_'+output+'_'+qam_id+'" style="color:red;"></span></td></tr>'
              html+='<tr><td><b>NIT</b></td><td><select id="NIT_dropdown_'+output+'_'+qam_id+'" onChange="disabletextbox('+output+','+qam_id+');" name="NIT_dropdown_'+output+'_'+qam_id+'">'
              html+='<option value="1" selected="selected">Automatic</option>'
              html+='<option value="2" selected="selected">Disable</option>'
              html+='</select></td>'
              html+='<td><input type="text" class="form-control-default" style="margin-top: 4px;"  id="NIT_'+output+'_'+qam_id+'" value="NULL">&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="NIT_Download_'+output+'_'+qam_id+'" onClick="downloadTables(0,64,'+rmx_no+');"></button></td>'
              html+='</tr>'
              html+='<tr><td></td><td></td><td><span id="error_NIT_'+output+'_'+qam_id+'" style="color:red;"></span></td></tr>'
              /*html+='<tr><td><b>Template</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>TDT & TOT</b> </td><td><select>'
              html+='<option>Passthrough from input</option>'
              html+='<option>Disable</option>'
              html+='</select></td></tr>'
              html+='<tr><td><b>TDT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>TOT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>Input</b></td><td><select><option>None</option></select></td></tr>'
              html+='<tr><td><b>LTO</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>EIT</b></td><td><select><option>Disable</option></select></td></tr>'*/
              html+='</tbody>'
              html+='</table><br>'
              html+='<div align="right"><button class="accordion"  data-toggle="collapse" data-target="#advance_option1_'+output+qam_id+'">Advanced options</button></div>'
              html+='<div id="advance_option1_'+output+qam_id+'" class="collapse out" >'
              html+='<table style="width:80%;">'
              html+='<colgroup><col style="width: 20%" />'
              html+='<col style="width: 20%" />'
              html+='<col style="width: 20%" />'
              html+='<col style="width:20%" />'
              html+='<col style="width:10%" />'
              html+='</colgroup>'
              html+='<tr><td></td><td><b>NIT</b></td><td><b>PAT</b></td><td><b>SDT</b></td><td></td></tr>'
              html+='<tr><th>Set Version</th>'
              html+='<td><input type="checkbox" class="form-control-default" checked="checked" id="nit_ver_checkbox_'+output+'_'+qam_id+'">&nbsp;<input type="text" class="form-control-default"  value="NULL" style="width:30%;" id="nit_ver_'+output+'_'+qam_id+'"></td>'
              html+='<td><input type="checkbox" class="form-control-default" checked="checked" id="pat_ver_checkbox_'+output+'_'+qam_id+'">&nbsp;<input type="text" class="form-control-default"  value="NULL" style="width:30%;" id="pat_ver_'+output+'_'+qam_id+'"></td>'
              html+='<td><input type="checkbox" class="form-control-default" checked="checked" id="sdt_ver_checkbox_'+output+'_'+qam_id+'">&nbsp;<input type="text" class="form-control-default"  value="NULL" style="width:30%;" id="sdt_ver_'+output+'_'+qam_id+'"></td>'
              html+='<td></td></tr>'
              html+='<tr><td></td><td><span id="error_nit_ver_'+output+'_'+qam_id+'" style="color:red"></span></td>'
              html+='<td><span id="error_pat_ver_'+output+'_'+qam_id+'" style="color:red"></span></td>'
              html+='<td><span id="error_sdt_ver_'+output+'_'+qam_id+'" style="color:red"></span></td>'
              html+='<td></td></tr></table></div><br>'
              html+='<div align="right"><button type="button" class="btn btn-default"  disabled="disabled">APPLY & SAVE</button></div>'

               html+='<div id="NIT_Mode"></div>'
              html+='<table >'
              html+='<colgroup>'
              html+='<col style="width: 10%" />'
              html+='<col style="width: 10%" />'
              html+='<col style="width: 10%" />'
              html+='<col style="width:10%" />'
              html+='<col style="width:10%" />'
              html+='</colgroup>'
              html+='<tr class="blank_row" ></tr>'
              html+='<tr id="Network_id_row"></tr>'
              html+='</table>'
              
            
              
               /*html+='<div  id="Private_data_row" >'
               
			      
			        html+=' <div class="multi-field-wrapper">'
			           html+='<div class="multi-fields">'
			             html+='<div class="multi-field">'
			               html+='<span style="margin-right:2%;">Private Data</span>'
			               html+='<input type="text" class="PrivateData" name="stuff[]" style="margin-right:2%;" id="private_data">'
			              
			               html+='<button type="button" class="remove-field" style="margin-right:2%;margin-left:2%">-</button>'
			               html+='<button type="button" id="save">save</button>'
			             html+='</div>'
			           html+='</div>'
			         html+='<button type="button" class="add-field"  >+</button>'
			       html+='</div>'
			
              html+='</div>'*/
              
              
             $("#PSITables").append(html);
            }
            else
            {
            var data = JSON.parse(data);
             $("#PSITables").empty();
             var html='<table class="genral" style="width:100%; height: 25%;">'
               html+='<colgroup>'
                  html+='<col style="width: 4%;" />'
                  html+='<col style="width: 3%;" />'
                  html+='<col style="width: 5%;" />'
                  html+='<col style="width: 5%;" />'
                html+='</colgroup>'
              html+='<tbody>'
              html+='<tr>'
              html+='<th>Table</th>'
              html+='<th>Generate mode</th>'
              html+='<th>Insertion[ms]</th>'
              html+='</tr>'
              html+='<tr>'
              html+='<td><b>PAT</b></td>'
              html+='<td><select id="PAT_dropdown_'+output+'_'+qam_id+'" onChange="disabletextbox('+output+','+qam_id+');" name="PAT_dropdown_'+output+'_'+qam_id+'">'
              html+='<option value="1" selected="selected">Automatic</option>'
              html+='<option value="2" selected="selected">Disable</option>'
              html+='</select></td>'
              html+='<td><input type="text" name="PAT_text_'+output+'_'+qam_id+'" value='+data['pat_int']+' class="form-control-default" style="margin-top: 4px;"  id="PAT_'+output+'_'+qam_id+'" >&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="PAT_Download_'+output+'_'+qam_id+'"  onClick="downloadTables(0,00,'+rmx_no+');" ></button></td>'
              html+='</tr>'
              html+='<tr><td></td><td></td><td><span id="error_PAT_'+output+'_'+qam_id+'" style="color:red;"></span></td></tr>'
              html+='<tr><td><b>CAT</b></td><td>'
              html+='<select id="CAT_dropdown_'+output+'_'+qam_id+'" name="CAT_dropdown_'+output+'_'+qam_id+'" onChange="disabletextbox('+output+','+qam_id+');">'
              html+='<option value="1" selected="selected">Automatic</option>'
              html+='<option value="2" selected="selected">Disable</option>'
              html+='</select></td>'

              html+='<td><input type="text" class="form-control-default"  id="CAT_'+output+'_'+qam_id+'" disabled="disabled">&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="CAT_Download_'+output+'_'+qam_id+'" onClick="downloadTables(0,01,'+rmx_no+');" ></button></td>'
              html+='</tr>'
              html+='<tr><td><b>SDT</b></td><td><select id="SDT_dropdown_'+output+'_'+qam_id+'" onChange="disabletextbox('+output+','+qam_id+');" name="SDT_dropdown_'+output+'_'+qam_id+'">'
              html+='<option value="1" selected="selected">Automatic</option>'
              html+='<option value="2" selected="selected">Disable</option>'
              html+='</select></td>'
              html+='<td><input type="text" class="form-control-default" style="margin-top: 4px;"  id="SDT_'+output+'_'+qam_id+'" value='+data['sdt_int']+'>&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="SDT_Download_'+output+'_'+qam_id+'" onClick="downloadTables(0,66,'+rmx_no+');"></button></td>'
              html+='</tr>'
              html+='<tr><td></td><td></td><td><span id="error_SDT_'+output+'_'+qam_id+'" style="color:red;"></span></td></tr>'
              html+='<tr><td><b>NIT</b></td><td><select id="NIT_dropdown_'+output+'_'+qam_id+'" onChange="disabletextbox('+output+','+qam_id+');" name="NIT_dropdown_'+output+'_'+qam_id+'">'
              html+='<option value="1" selected="selected">Automatic</option>'
              html+='<option value="2" selected="selected">Disable</option>'
              html+='</select></td>'
              html+='<td><input type="text" class="form-control-default" style="margin-top: 4px;"  id="NIT_'+output+'_'+qam_id+'" value='+data['nit_int']+'>&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="NIT_Download_'+output+'_'+qam_id+'" onClick="downloadTables(0,64,'+rmx_no+');"></button></td>'
              html+='</tr>'
              html+='<tr><td></td><td></td><td><span id="error_NIT_'+output+'_'+qam_id+'" style="color:red;"></span></td></tr>'
             /* html+='<tr><td><b>Template</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>TDT & TOT</b> </td><td><select>'
              html+='<option>Passthrough from input</option>'
              html+='<option>Disable</option>'
              html+='</select></td></tr>'
              html+='<tr><td><b>TDT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>TOT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>Input</b></td><td><select><option>None</option></select></td></tr>'
              html+='<tr><td><b>LTO</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>EIT</b></td><td><select><option>Disable</option></select></td></tr>'*/
              html+='</tbody>'
              html+='</table><br>'
              html+='<div align="right"><button class="accordion"  data-toggle="collapse" data-target="#advance_option1_'+output+qam_id+'">Advanced options</button></div>'
              html+='<div id="advance_option1_'+output+qam_id+'" class="collapse out" >'
              html+='<table style="width:80%;">'
              html+='<colgroup><col style="width: 20%" />'
              html+='<col style="width: 20%" />'
              html+='<col style="width: 20%" />'
              html+='<col style="width:20%" />'
              html+='<col style="width:10%" />'
              html+='</colgroup>'
              html+='<tr><td></td><td><b>NIT</b></td><td><b>PAT</b></td><td><b>SDT</b></td><td></td></tr>'
              html+='<tr><th>Set Version</th>'
              html+='<td><input type="checkbox" class="form-control-default" checked="checked" id="nit_ver_checkbox_'+output+'_'+qam_id+'">&nbsp;<input type="text" class="form-control-default"  value='+data['nit_ver']+' style="width:30%;" id="nit_ver_'+output+'_'+qam_id+'"></td>'
              html+='<td><input type="checkbox" class="form-control-default" checked="checked" id="pat_ver_checkbox_'+output+'_'+qam_id+'">&nbsp;<input type="text" class="form-control-default"  value='+data['pat_ver']+' style="width:30%;" id="pat_ver_'+output+'_'+qam_id+'"></td>'
              html+='<td><input type="checkbox" class="form-control-default" checked="checked" id="sdt_ver_checkbox_'+output+'_'+qam_id+'">&nbsp;<input type="text" class="form-control-default"  value='+data['sdt_ver']+' style="width:30%;" id="sdt_ver_'+output+'_'+qam_id+'"></td>'
              html+='<td></td></tr>'
              html+='<tr><td></td><td><span id="error_nit_ver_'+output+'_'+qam_id+'" style="color:red"></span></td>'
              html+='<td><span id="error_pat_ver_'+output+'_'+qam_id+'" style="color:red"></span></td>'
              html+='<td><span id="error_sdt_ver_'+output+'_'+qam_id+'" style="color:red"></span></td>'
              html+='<td></td></tr>'
              html+='</table></div><br>'
              html+='<div align="right"><button type="button" class="btn btn-default" onclick="set_table_ver('+data['nit_ver']+','+data['pat_ver']+','+data['sdt_ver']+','+output+','+rmx_no+','+qam_id+'); set_PsiSiINT('+data['pat_int']+','+data['sdt_int']+','+data['nit_int']+','+output+','+rmx_no+','+qam_id+');updateGenratemode('+"'"+data['PAT_TEXT']+"'"+','+"'"+data['CAT_TEXT']+"'"+','+"'"+data['SDT_TEXT']+"'"+','+"'"+data['NIT_TEXT']+"'"+','+output+','+rmx_no+','+qam_id+');" id="save_table_'+output+'_'+qam_id+'" disabled="disabled">APPLY & SAVE</button></div>'
            html+='<div class="blank_row" style="margin-top:2%;margin-bottom:2%;"></div>'
              html+='<div id="NIT_Mode"></div>'
              html+='<table >'
              html+='<colgroup>'
              html+='<col style="width: 10%" />'
              html+='<col style="width: 10%" />'
              html+='<col style="width: 10%" />'
              html+='<col style="width:10%" />'
              html+='<col style="width:10%" />'
              html+='</colgroup>'
              html+='<tr class="blank_row" ></tr>'
              html+='<tr id="Network_id_row"></tr>'
              html+='<tr class="blank_row" ></tr>'
              html+='</table>'
              
             
              $("#PSITables").append(html);
       
             

      //*****************************************************************************************************************************

          var privateData_html='<div style="background-color:silver;">'
         privateData_html+='<table class="collapse-panel" data-toggle="collapse" data-target="#PrivateData" style="margin-top:2%;width:100%;" >'
              privateData_html+='<colgroup>'
                privateData_html+='<col style="width:3%">'
                privateData_html+='<col style="width:44%">'
                privateData_html+='<col style="width:6%">'
                privateData_html+='<col style="width:5%">'
                privateData_html+='<col style="width:15%">'
               
              privateData_html+='</colgroup>'
              privateData_html+='<tbody'
            privateData_html+='<tr>'
              privateData_html+='<td></td>'
             
              
              
              privateData_html+='<td><span ><b> Private Data</b></span></td>'
               privateData_html+='<td><span ><b> Loop</b></span></td>'
                privateData_html+='<td><span ><b> Table</b></span></td>'
            privateData_html+='<td></td>'
             
          
            privateData_html+='</tr>'
            privateData_html+='</tbody>'
       privateData_html+='</table>'  
       privateData_html+='</div>'
     
       

        var PrivateData_html2='<div class="collapse in" id="PrivateData">'
          PrivateData_html2+='<table class="panel2" id="private_data_table" style="width:100%;">'
          PrivateData_html2+='<colgroup>'
          PrivateData_html2+='<col style="width:5%">'
          PrivateData_html2+='<col style="width:60%">'
          PrivateData_html2+='<col style="width:10%">'
          PrivateData_html2+='<col style="width:12%">'
          PrivateData_html2+='<col style="width:12%">'
          PrivateData_html2+='<col style="width:6%">'
          PrivateData_html2+='</colgroup>'
          PrivateData_html2+='<tbody>'
          <?php foreach($Private_data['nit_bat'] as $private_data) { ?>
            var loop=<?php echo $private_data['loop_no'] ?>;
            var table=<?php echo $private_data['Table_type'] ?>;

            var table_value=(table == 0 )?"NIT":((table == 1 )?"BAT":"SDT");
            if(loop==0)
            {
              var loop_value="First";
            }
            else
            {
              var loop_value="Second";
            }
        var data='<?php echo $private_data['private_data'] ?>'.substr(0,42);
        data = (data.length < 42) ? data : data+'...';
        var update_id='<?php echo $private_data['id'] ?>';
          PrivateData_html2+='<tr id="PrivateData_Row'+update_id+'">'
          PrivateData_html2+='<td></td>'
          PrivateData_html2+='<td>'+data+'</td>'
          PrivateData_html2+='<td>'+loop_value+'</td>'
          PrivateData_html2+='<td>'+table_value+'</td>'
          PrivateData_html2+='<td><span id="updatePrivateData" class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#secondLoopModal" onclick="newPrivateData('+update_id+',0,'+table+',-1,-1);"></span></td>'
           PrivateData_html2+='<td><span id="deletePrivateData" class="glyphicon glyphicon-trash" onclick="addPrivateData('+update_id+',0,'+"'"+'<?php echo $private_data['private_data'] ?>'+"'"+',-2,<?php echo $private_data['loop_no'] ?>,<?php echo $private_data['Table_type'] ?>,-1,-1)"></span></td>'
          PrivateData_html2+='</tr>'
          global_PrivateData_id+=1;
        <?php } ?>


          PrivateData_html2+='</tbody>'
         PrivateData_html2+='</table>'
         
         PrivateData_html2+='</div>'
   privateData_html+=PrivateData_html2;
   $("#PSITables").append(privateData_html);


         var PrivateData_html3='<table class="genral">'
         PrivateData_html3+='<colgroup>'
         PrivateData_html3+='<col style="width:25%">'
         PrivateData_html3+='<col style="width:25%">'
         PrivateData_html3+='<col style="width:25%">'
         PrivateData_html3+='</colgroup>'
         PrivateData_html3+='<tr class="blank_row"></tr>'
         PrivateData_html3+='<tr>'
         PrivateData_html3+='<td><button class="glyphicon glyphicon-plus btn btn-default " id="PrivateData_add" onclick="newPrivateData(-1,-1,0,-1,-1);" data-toggle="modal" data-target="#secondLoopModal">NIT</button></td>'
         PrivateData_html3+='<td><button class="btn btn-default glyphicon glyphicon-plus" id="PrivateData_add" onclick="newPrivateData(-1,-1,1,-1,-1);" data-toggle="modal" data-target="#secondLoopModal">BAT</button></td>'
      
         PrivateData_html3+='</tr>'
         PrivateData_html3+='</table>'
       
       $("#PSITables").append(PrivateData_html3);

       //*********************************************** SDT PRIVATE DAta ******************************************************************************

          var privateData_html='<div style="background-color:silver;">'
         privateData_html+='<table class="collapse-panel" data-toggle="collapse" data-target="#SDTPrivateData" style="margin-top:2%;width:100%;" >'
              privateData_html+='<colgroup>'
                privateData_html+='<col style="width:3%">'
                privateData_html+='<col style="width:40%">'
                privateData_html+='<col style="width:10%">'
                privateData_html+='<col style="width:10%">'
              
                privateData_html+='<col style="width:1%">'
               
              privateData_html+='</colgroup>'
              privateData_html+='<tbody'
            privateData_html+='<tr>'
              privateData_html+='<td></td>'
             
              
              
              privateData_html+='<td><span ><b> Private Data</b></span></td>'
               privateData_html+='<td><span ><b> RMX_NO (OUTPUT)</b></span></td>'
                privateData_html+='<td><span ><b> SERVICE ID</b></span></td>'
            privateData_html+='<td></td>'
             
            privateData_html+='</tr>'
            privateData_html+='</tbody>'
       privateData_html+='</table>'  
       privateData_html+='</div>'
     
       

        var PrivateData_html2='<div class="collapse in" id="SDT_PrivateData">'
          PrivateData_html2+='<table class="panel2" id="sdt_private_data_table" style="width:100%;">'
          PrivateData_html2+='<colgroup>'
          PrivateData_html2+='<col style="width:5%">'
          PrivateData_html2+='<col style="width:60%">'
          PrivateData_html2+='<col style="width:10%">'
          PrivateData_html2+='<col style="width:12%">'
          PrivateData_html2+='<col style="width:12%">'
          PrivateData_html2+='<col style="width:6%">'
          PrivateData_html2+='</colgroup>'
          PrivateData_html2+='<tbody>'
          <?php foreach($Private_data['sdt'] as $private_data) { ?>
            var ts_id=<?php echo $private_data['ts_id'] ?>;
            var service_id=<?php echo $private_data['service_id'] ?>;
            var rmx_no = Math.floor(ts_id/8)+1;
            var output = Math.floor(ts_id%8); 

          var data='<?php echo $private_data['private_data'] ?>'.substr(0,42);
          data = (data.length < 42) ? data : data+'...';
        var update_id='<?php echo $private_data['id'] ?>';
          PrivateData_html2+='<tr id="PrivateData_Row'+update_id+'">'
          PrivateData_html2+='<td></td>'
          PrivateData_html2+='<td>'+data+'</td>'
          PrivateData_html2+='<td>'+rmx_no+'('+output+')</td>'
          PrivateData_html2+='<td>'+service_id+'</td>'
          PrivateData_html2+='<td><span id="sdt_updatePrivateData" class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#secondLoopModal" onclick="newPrivateData('+update_id+',0,2,'+ts_id+','+service_id+');"></span></td>'
           PrivateData_html2+='<td><span id="deletePrivateData" class="glyphicon glyphicon-trash" onclick="addPrivateData('+update_id+',0,'+"'"+'<?php echo $private_data['private_data'] ?>'+"'"+',-2,-1,-1,'+ts_id+','+service_id+')"></span></td>'
          PrivateData_html2+='</tr>'
          global_PrivateData_id+=1;
        <?php } ?>

        
          PrivateData_html2+='</tbody>'
         PrivateData_html2+='</table>'
         
         PrivateData_html2+='</div>'
   privateData_html+=PrivateData_html2;
   $("#PSITables").append(privateData_html);

   var PrivateData_html4='<table class="genral">'
         PrivateData_html4+='<colgroup>'
         PrivateData_html4+='<col style="width:25%">'
         PrivateData_html4+='<col style="width:25%">'
         PrivateData_html4+='<col style="width:25%">'
         PrivateData_html4+='</colgroup>'
         PrivateData_html4+='<tr class="blank_row"></tr>'
         PrivateData_html4+='<tr>'
       
         PrivateData_html4+='<td><button class="btn btn-default glyphicon glyphicon-plus" id="PrivateData_add" onclick="newPrivateData(-1,-1,2,-1,-1);" data-toggle="modal" data-target="#secondLoopModal">SDT</button></td>'
         PrivateData_html4+='</tr>'
         PrivateData_html4+='</table>'
       
       $("#PSITables").append(PrivateData_html4);
      //*****************************************************************************************************************************
    
                 $("#nit_ver_checkbox_"+output+'_'+qam_id || "#pat_ver_checkbox_"+output+'_'+qam_id || "#sdt_ver_checkbox_"+output+'_'+qam_id).click(function()
                  {
                     $("#save_table_"+output+'_'+qam_id).removeAttr('disabled');
                  });
                  if(data['nit_isenable']==0)
                  {
                    $("#nit_ver_checkbox_"+output+'_'+qam_id).removeAttr('checked');
                  }
                  if(data['pat_isenable']==0)
                  {
                    $("#pat_ver_checkbox_"+output+'_'+qam_id).removeAttr('checked');
                  }
                  if(data['sdt_isenable']==0)
                  {
                    $("#sdt_ver_checkbox_"+output+'_'+qam_id).removeAttr('checked');
                  }
                  if(data['PAT_TEXT']=="Automatic")
                  {
                    $('select[name="PAT_dropdown_'+output+'_'+qam_id+'"] option[value="2"]').removeAttr('selected'); 
                    $('select[name="PAT_dropdown_'+output+'_'+qam_id+'"] option[value="1"]').attr('selected','selected'); 
                  }
                   if(data['CAT_TEXT']=="Automatic")
                  {
                    $('select[name="CAT_dropdown_'+output+'_'+qam_id+'"] option[value="2"]').removeAttr('selected'); 
                    $('select[name="CAT_dropdown_'+output+'_'+qam_id+'"] option[value="1"]').attr('selected','selected');
                  }
                   if(data['SDT_TEXT']=="Automatic")
                  {
                    $('select[name="SDT_dropdown_'+output+'_'+qam_id+'"] option[value="2"]').removeAttr('selected'); 
                    $('select[name="SDT_dropdown_'+output+'_'+qam_id+'"] option[value="1"]').attr('selected','selected');
                  }
                   if(data['NIT_TEXT']=="Automatic")
                  {
                    $('select[name="NIT_dropdown_'+output+'_'+qam_id+'"] option[value="2"]').removeAttr('selected'); 
                    $('select[name="NIT_dropdown_'+output+'_'+qam_id+'"] option[value="1"]').attr('selected','selected');
                  }
                
                   if(data['PAT_TEXT']=="Disable")
                    {
                      $('select[name="PAT_dropdown_'+output+'_'+qam_id+'"] option[value="1"]').removeAttr('selected');
                      $('select[name="PAT_dropdown_'+output+'_'+qam_id+'"] option[value="2"]').attr('selected','selected');

                        PAT_TEXT = $("#PAT_dropdown_"+output+'_'+qam_id ).find('option:selected').text();
                        var input=document.getElementById('PAT_'+output+'_'+qam_id+'');
                        input.disabled=PAT_TEXT=="Disable";
                        var patdownload=document.getElementById('PAT_Download_'+output+'_'+qam_id+'');
                        patdownload.disabled=PAT_TEXT=="Disable";
                    }
                  if(data['CAT_TEXT']=="Disable")
                    {
                      $('select[name="CAT_dropdown_'+output+'_'+qam_id+'"] option[value="1"]').removeAttr('selected');
                      $('select[name="CAT_dropdown_'+output+'_'+qam_id+'"] option[value="2"]').attr('selected','selected');               
                        CAT_TEXT = $("#CAT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
                        var input1=document.getElementById('CAT_'+output+'_'+qam_id+'');
                        input1.disabled=CAT_TEXT=="Disable";
                        var catdownload=document.getElementById('CAT_Download_'+output+'_'+qam_id+'');
                        catdownload.disabled=CAT_TEXT=="Disable";
                    }
                  if(data['SDT_TEXT']=="Disable")
                    {
                      $('select[name="SDT_dropdown_'+output+'_'+qam_id+'"] option[value="1"]').removeAttr('selected');
                      $('select[name="SDT_dropdown_'+output+'_'+qam_id+'"] option[value="2"]').attr('selected','selected');

                        SDT_TEXT = $("#SDT_dropdown_"+output+'_'+qam_id ).find('option:selected').text();
                        var input2=document.getElementById('SDT_'+output+'_'+qam_id+'');
                        input2.disabled=SDT_TEXT=="Disable";
                        var sdtdownload=document.getElementById('SDT_Download_'+output+'_'+qam_id+'');
                        sdtdownload.disabled=SDT_TEXT=="Disable";
                    }
                 if(data['NIT_TEXT']=="Disable")
                    {
                      $('select[name="NIT_dropdown_'+output+'_'+qam_id+'"] option[value="1"]').removeAttr('selected');
                      $('select[name="NIT_dropdown_'+output+'_'+qam_id+'"] option[value="2"]').attr('selected','selected');
                        NIT_TEXT = $("#NIT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
                        var input3=document.getElementById('NIT_'+output+'_'+qam_id+'');
                        input3.disabled=NIT_TEXT=="Disable";
                        var nitdownload=document.getElementById('NIT_Download_'+output+'_'+qam_id+'');
                        nitdownload.disabled=NIT_TEXT=="Disable";                         
                    }             
              $("#PAT_dropdown_"+output+'_'+qam_id).change(function()
              {
                $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
              });
              $( "#CAT_dropdown_"+output+'_'+qam_id).change(function()
              {
                $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
              });
              $( "#SDT_dropdown_"+output+'_'+qam_id).change(function()
              {
                $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
              });
              $("#NIT_dropdown_"+output+'_'+qam_id).change(function()
              {
                $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
              });

              $("#nit_ver_"+output+'_'+qam_id).keyup(function() {
                    var empty = false;
                        if ($(this).val() == '') 
                          {
                          empty = true;
                          }
                      if (empty) 
                      {
                        $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled'); 
                      }
                      else 
                      {
                         if(check_nit_ver(output,qam_id) )
                          {
                             $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
                          }
                         else
                          {
                             $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled');
                          }
                      }
                  });
                  $("#pat_ver_"+output+'_'+qam_id).keyup(function() {
                    var empty = false;
                        if ($(this).val() == '') 
                          {
                          empty = true;
                          }
                      if (empty) 
                      {
                        $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled'); 
                      }
                      else 
                      {
                         if( check_pat_ver(output,qam_id))
                          {
                             $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
                          }
                         else
                          {
                             $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled');
                          }
                      }
                  });
                  $("#sdt_ver_"+output+'_'+qam_id).keyup(function() {
                    var empty = false;
                        if ($(this).val() == '') 
                          {
                          empty = true;
                          }
                      if (empty) 
                      {
                        $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled'); 
                      }
                      else 
                      {
                         if(check_sdt_ver(output,qam_id))
                          {
                             $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
                          }
                         else
                          {
                             $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled');
                          }
                      }
                  });;
                  function check_nit_ver(output,qam_id)
                  {
                    nit_ver=$("#nit_ver_"+output+'_'+qam_id).val();
                    if(nit_ver>=0 && nit_ver<=31)
                       {
                        $("#error_nit_ver_"+output+'_'+qam_id).hide();
                        return true;
                       }
                    else
                       {
                        $("#error_nit_ver_"+output+'_'+qam_id).html("Should be in between 0-31");
                        $("#error_nit_ver_"+output+'_'+qam_id).show();
                         return false;
                       }                   
                  }
                  function check_pat_ver(output,qam_id)
                  {
                    pat_ver=$("#pat_ver_"+output+'_'+qam_id).val();
                    if(pat_ver>=0 && pat_ver<=31)
                       {
                        $("#error_pat_ver_"+output+'_'+qam_id).hide();
                        return true;
                       }
                    else
                       {
                        $("#error_pat_ver_"+output+'_'+qam_id).html("Should be in between 0-31");
                        $("#error_pat_ver_"+output+'_'+qam_id).show();
                         return false;
                       }                  
                  }
                  function check_sdt_ver(output,qam_id)
                  {
                    sdt_ver=$("#sdt_ver_"+output+'_'+qam_id).val();
                    if(sdt_ver>=0 && sdt_ver<=31)
                       {
                        $("#error_sdt_ver_"+output+'_'+qam_id).hide();
                        return true;
                       }
                    else
                       {
                        $("#error_sdt_ver_"+output+'_'+qam_id).html("Should be in between 0-31");
                        $("#error_sdt_ver_"+output+'_'+qam_id).show();
                         return false;
                       }                 
                  }
             $( "#PAT_"+output+'_'+qam_id).keyup(function() {
              var empty = false;
                    $( "#PAT_"+output+'_'+qam_id).each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled'); 
                      } else {

                       if( check_PAT(output,qam_id))
                        {
                          $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
                        }
                        else
                        {
                          $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled');
                        }
                      }
                  });
              $( "#SDT_"+output+'_'+qam_id).keyup(function() {
              var empty = false;
                    $( "#SDT_"+output+'_'+qam_id).each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled'); 
                      } else {

                       if( check_SDT(output,qam_id))
                        {
                          $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
                        }
                        else
                        {
                          $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled');
                        }
                      }
                  });
                   $("#NIT_"+output+'_'+qam_id).keyup(function() {
                     var empty = false;
                    $("#NIT_"+output+'_'+qam_id).each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled'); 
                      } else {

                       if(check_NIT(output,qam_id) )
                        {
                          $("#save_table_"+output+'_'+qam_id).removeAttr('disabled'); 
                        }
                        else
                        {
                          $("#save_table_"+output+'_'+qam_id).attr('disabled', 'disabled');
                        }
                      }
                  });
            }
          },
          type:'POST'
        }); 
 });
function check_PAT(output,qam_id)
{
    var text1=$("#PAT_"+output+'_'+qam_id).val().trim();
     if (text1=='') 
     {
        $("#error_PAT_"+output+'_'+qam_id).html("Should not be Empty");
        return false;
     }
     else if(text1 > 24 && text1<60000)
     {
      $("#error_PAT_"+output+'_'+qam_id).hide();
      return true;
     }
     else
     {
      $("#error_PAT_"+output+'_'+qam_id).html("Should be in Range 25 to 60000");
      $("#error_PAT_"+output+'_'+qam_id).show();
      return false;
     }
  }
function check_SDT(output,qam_id)
{
    var text1=$("#SDT_"+output+'_'+qam_id).val().trim();    
     if (text1=='') 
     {
        $("#error_SDT_"+output+'_'+qam_id).html("Should Not be Empty");
        return false;
     }
     else if(text1 > 24 && text1<60000)
     {
      $("#error_SDT_"+output+'_'+qam_id).hide();
      return true;
     }
     else
     {
      $("#error_SDT_"+output+'_'+qam_id).html("Should be in range 25 to 60000");
      $("#error_SDT_"+output+'_'+qam_id).show();
      return false;
     }
  }
function check_NIT(output,qam_id)
{
    var text1=$("#NIT_"+output+'_'+qam_id).val().trim();
     if (text1=='') 
     {
        $("#error_NIT_"+output+'_'+qam_id).html("Should not be Empty");
        return false;
     }
     else if(text1 > 24 && text1<60000)
     {
      $("#error_NIT_"+output+'_'+qam_id).hide();
      return true;
     }
     else
     {
      $("#error_NIT_"+output+'_'+qam_id).html("Should be in range 25 to 60000");
      $("#error_NIT_"+output+'_'+qam_id).show();
      return false;
     }
  }
  function newPrivateData(id,check,table_type,ts_id,service_id)
  {
    $("#secondLoopModal").empty();
    if(id == -1)
    {
      id=global_PrivateData_id;
    }
   
    var html='<div class="modal-dialog">'

   
   html+=' <div class="modal-content">'
      html+='<div class="modal-header">'
        
        html+='<h4 class="modal-title">Frequencies</h4>'
      html+='</div>'
      html+='<div class="modal-body">'
       html+='<table class="genral" style="width:100%;">'
       html+='<colgroup><col style="width:10%;"/><col style="width:22%;"/> </colgroup>'
         html+='<tr>'
           html+='<td>Private Data</td>'
           html+='<td><textarea rows="2" cols="50" type="text"   id="private_data'+id+'">0x</textarea></td>'
         html+='</tr>'
         
         if(table_type == 1)
         {
          html+='<tr id="loop_table'+id+'">'
           html+='<td>Loop</td>'
           html+='<td><select id="PrivateDataLoop'+id+'" name="PrivateDataLoop'+id+'" onclick="loopType('+id+');changeLoop(this.value,'+id+');">'
           html+='<option value="1">Second Loop</option>'
           html+='</select></td>'
         html+='</tr>'
       }
       else if(table_type == 2)
       {
        html+='<tr id="loop_table'+id+'" hidden="hidden">'
           html+='<td>Loop</td>'
           html+='<td><select id="PrivateDataLoop'+id+'" name="PrivateDataLoop'+id+'" onclick="loopType('+id+');changeLoop(this.value,'+id+');">'
           html+='<option value="0">First Loop</option>'
           html+='<option value="1">Second Loop</option>'
           html+='</select></td>'
         html+='</tr>'


         html+='<tr id="ts_table'+id+'">'
           html+='<td>Freq(TS)</td>'
           html+='<td><select id="PrivateDataTS'+id+'" name="PrivateDataTS'+id+'" onclick="getTSchannels('+id+')">'
           var j=0;
           <?php foreach($QamFreq_detail as $value ){ ?>
             html+='<option value='+j+'><?php echo $value['frequency'] ?>  (<?php echo $value['ts_id'] ?>)</option>'
            j++;
           
         <?php } ?>
                     
           html+='</select></td>'
         html+='</tr>'
          html+='<tr class="blank_row"></tr>'
          html+='<tr id="service_table'+id+'">'
           html+='<td>Service id</td>'
           html+='<td><select id="PrivateDataService'+id+'" name="PrivateDataService'+id+'" >'

         html+='</select></td>'
         html+='</tr>'
       }else{

          html+='<tr id="loop_table'+id+'">'
           html+='<td>Loop</td>'
           html+='<td><select id="PrivateDataLoop'+id+'" name="PrivateDataLoop'+id+'" onclick="loopType('+id+');changeLoop(this.value,'+id+');">'
           html+='<option value="0">First Loop</option>'
           html+='<option value="1">Second Loop</option>'
           html+='</select></td>'
         html+='</tr>'

          
       }
         html+='<tr class="blank_row"></tr>'
          /*html+='<tr>'
           html+='<td>Table</td>'
           html+='<td><select id="Table'+id+'" name="Table'+id+'" onclick="TableType('+id+')">'
           html+='<option value="0">NIT</option>'
           html+='<option value="1">BAT</option>'
           html+='<option value="2">SDT</option>'
           html+='</select></td>'
         html+='</tr>'*/
       html+='</table>'
       html+='<table class="table fix-head responsive table-striped" style="width:100%;" id="table_second_loop">'
        
       html+='</table>'
      html+='</div>'
      html+='<div class="modal-footer">'
      html+='<button type="button" class="btn btn-default" data-dismiss="modal" onclick="addPrivateData('+id+',1,0,'+check+',0,'+table_type+',-1,-1)">Save</button>'
        html+='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'
      html+='</div>'
    html+='</div>'

  html+='</div>'
    
    $("#secondLoopModal").append(html);
    if(table_type == 1){
      loopType(id);
    }else if(table_type==2){
      getTSchannels(id);

     
    }

    if(check != -1)
    {
      $.ajax({
               url:'index.php?route=common/dashboard/getPrivateDataDetails&token=<?php echo $token;?>',
               type:'POST',
               dataType:'json',
               data:{id:id,table_type:table_type},
               error:function()
               {
                 alert("error");
               },
               success:function(data)
               { 
                 if(data[0]['Table_type']==2)
                 {
                  $("#loop_table"+id).attr("hidden","hidden");
                 }
                $("#private_data"+data[0]['id']).val(data[0]['private_data']);
                $('select[name="PrivateDataLoop'+data[0]['id']+'"] option[value='+data[0]['loop_no']+']').attr('selected','selected');
                $('select[name="Table'+data[0]['id']+'"] option[value='+data[0]['Table_type']+']').attr('selected','selected');
                if(data[0]['loop_no']==1)
                {
                    var html ='<thead id="table_head_col">'
                    html+='<tr>' 
                              html+='<td>Sr No</td> <td>Select<input type="checkbox" name="selectall"   id="selectall"/></td><td>Frequency(TS_ID)</td>'
                    html+='</tr>'
                    html+='</thead>'
                    html+='<tbody id="table_body_col">'
                    var i=1;
                    var j=0;
                    <?php foreach($QamFreq_detail as $value ){ ?>
                    html+='<tr >'
                    html+='<td>'+i+'</td>'
                            html+='<td><input type="checkbox" class="freq_list" name="freq_list'+data[0]['id']+'" value='+j+' id="check_box'+j+'"/></td>'
                            html+='<td><?php echo $value['frequency'] ?> (<?php echo $value['ts_id'] ?>)</td>' 
                    html+='</tr>'
                     i++;
                     j++;
                    <?php } ?>
                    html+='</tbody>'
                    $("#table_second_loop").empty();
                      $("#table_second_loop").append(html);
                  
        
      
                      var freq_check=data[0]['output_list'].toString();
                       freq_check=freq_check.split(",");
                    
                      for(var i=0;i<freq_check.length;i++)
                        {
                          
                          $("#check_box"+freq_check[i]).attr("checked","checked");
                        }

                      $("#selectall").click(function(){
                        if(this.checked)
                        {
                       
                          $(".freq_list").prop("checked",true);
                        } 
                        else
                        {
                         $(".freq_list").prop("checked",false);
                        }
                      });
                      
                }
          if(table_type==2)
          { 

          $('select[name="PrivateDataService'+id+'"] option[value='+service_id+']').attr('selected','selected');
         $('select[name="PrivateDataTS'+id+'"] option[value='+ts_id+']').attr('selected','selected');
          }
               },

      });
    }

    
  }
  function getTSchannels(id)
  {
    var ts_id=$("#PrivateDataTS"+id).val();
$("#PrivateDataService"+id).empty();
    $.ajax({
      url:'index.php?route=common/dashboard/getTSchannels&token=<?php echo $token;?>&ts_id='+ts_id,
       
      error:function()
      {
        var html='<b>Invalid Data</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        // $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();
       
      },
      success:function(data)
      { 
        
        data = JSON.parse(data);
        var html="";
        if(data.length>0){
          for (var i = 0; i<data.length; i++) {
            html+='<option value='+data[i]+'> '+data[i]+' </option>';          
            }
           
          $("#PrivateDataService"+id).append(html);
        }
      },
      type:'post',
    });

  }
  function changeLoop(value,id)
  {
    if(value==0)
    {
      $('select[name="Table'+id+'"] option[value=0]').attr('selected','selected');
      $("#Table"+id).attr("disabled","disabled");
    }
    else
    {
      $("#Table"+id).removeAttr("disabled");
    }
  }
  function TableType(id)
  {
    var table=$("#Table"+id).val();
    $("#table_second_loop").empty();
    if(table==2 )
    {
     $("#loop_table"+id).Attr("hidden","hidden"); 
      var html ='<thead id="table_head_col">'
        html+='<tr>' 
                  html+='<td>Sr No</td> <td>Select<input type="checkbox" name="selectall"   id="selectall"/></td><td>Frequency(TS_ID)</td>'
        html+='</tr>'
        html+='</thead>'
        html+='<tbody id="table_body_col">'
        var i=1;
        var j=0;
        <?php foreach($QamFreq_detail as $value ){ ?>
        html+='<tr>'
        
         html+='<td>'+i+'</td>'
                html+='<td><input type="checkbox" class="freq_list" name="freq_list'+id+'" value='+j+' id="check_box'+j+'"/></td>'
                html+='<td><?php echo $value['frequency'] ?>  (<?php echo $value['ts_id'] ?>)</td>' 
        html+='</tr>'
         i++;
         j++;
        <?php } ?>
        html+='</tbody>'
      $("#table_second_loop").append(html);  
      $("#selectall").click(function(){
      if(this.checked)
      {
     
        $(".freq_list").prop("checked",true);
      } 
      else
      {
       $(".freq_list").prop("checked",false);
      }
  });
    }
    else{
      $("#loop_table"+id).removeAttr("hidden");
      $("#table_second_loop").empty();
    }
  }
  function loopType(id)
  {
    var loop=$("#PrivateDataLoop"+id).val();
    
$("#table_second_loop").empty();
    if(loop==1 )
    {
      var html ='<thead id="table_head_col">'
        html+='<tr>' 
                  html+='<td>Sr No</td> <td>Select<input type="checkbox" name="selectall"   id="selectall"/></td><td>Frequency(TS_ID)</td>'
        html+='</tr>'
        html+='</thead>'
        html+='<tbody id="table_body_col">'
        var i=1;
        var j=0;
        <?php foreach($QamFreq_detail as $value ){ ?>
        html+='<tr>'
        
         html+='<td>'+i+'</td>'
                html+='<td><input type="checkbox" class="freq_list" name="freq_list'+id+'" value='+j+' id="check_box'+j+'"/></td>'
                html+='<td><?php echo $value['frequency'] ?>  (<?php echo $value['ts_id'] ?>)</td>' 
        html+='</tr>'
         i++;
         j++;
        <?php } ?>
        html+='</tbody>'
      $("#table_second_loop").append(html);  
      $("#selectall").click(function(){
      if(this.checked)
      {
     
        $(".freq_list").prop("checked",true);
      } 
      else
      {
       $(".freq_list").prop("checked",false);
      }
  });
    }
    else{
      $("#table_second_loop").empty();
    }
  }
/*function selectFrequencies(type,id)
{
  var value=$("#PrivateDataLoop"+id).val();
  var checked_freq=$("#freq_secondloop"+id).val();
 
  if(checked_freq.length>0)
  {
   checked_freq= checked_freq.split(',');
  }
 
   
 
  
  $("#secondLoopModal").empty();
  

  var html='<div class="modal-dialog">'

   
   html+=' <div class="modal-content">'
      html+='<div class="modal-header">'
        
        html+='<h4 class="modal-title">Frequencies</h4>'
      html+='</div>'
      html+='<div class="modal-body">'
       html+='<table class="table fix-head responsive table-striped" style="width:100%;">'
        html+='<thead id="table_head_col">'
        html+='<tr>' 
                  html+='<td>Sr No</td> <td>Select<input type="checkbox" name="selectall"   id="selectall"/></td><td>Frequency</td>'
        html+='</tr>'
        html+='</thead>'
        html+='<tbody id="table_body_col">'
        var i=1;
        var j=0;
        <?php foreach($QamFreq_detail as $value ){ ?>
        html+='<tr>'
        
         html+='<td>'+i+'</td>'
                html+='<td><input type="checkbox" class="freq_list" name="freq_list'+id+'" value='+j+' id="check_box'+j+'"/></td>'
                html+='<td><?php echo $value['frequency'] ?></td>' 
        html+='</tr>'
         i++;
         j++;
        <?php } ?>
        html+='</tbody>'
       html+='</table>'
      html+='</div>'
      html+='<div class="modal-footer">'
      html+='<button type="button" class="btn btn-default" data-dismiss="modal" onclick="saveFreq('+id+')">OK</button>'
        html+='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'
      html+='</div>'
    html+='</div>'

  html+='</div>'
    
    $("#secondLoopModal").append(html);
if(type==1)
{
  if(checked_freq.length>0)
  {
    for(var i=0;i<checked_freq.length;i++)
    {
      
      $("#check_box"+checked_freq[i]).attr("checked","checked");
    }
  }
}
if(type==0)
{
  <?php foreach($Private_data as $private_data) { ?>
    checked_freq='<?php echo $private_data['output_list'];?>';
   checked_freq= checked_freq.split(',');
  if(checked_freq.length>0)
  {
    for(var i=0;i<checked_freq.length;i++)
    {
      
      $("#check_box"+checked_freq[i]).attr("checked","checked");
    }
  }
   <?php } ?>
}  
    if(value==1)
    {
    $modal = $('#secondLoopModal');
    $modal.modal('show');
  }
  $("#selectall").click(function(){
    if(this.checked)
    {
   
      $(".freq_list").prop("checked",true);
    } 
    else
    {
     $(".freq_list").prop("checked",false);
    }
  });
}
function saveFreq(id)
{
   var freq_arr ="" ;
   $.each($("input[name='freq_list"+id+"']:checked"), function(){            
      freq_arr+=($(this).val())+",";
  });
   
   $("#freq_secondloop"+id).val(freq_arr.substr(0,freq_arr.length-1));

}*/
function set_PsiSiINT(PAT,SDT,NIT,output,rmx_no,qam_id)
{
Set_PAT = $("#PAT_"+output+'_'+qam_id).val();
Set_SDT = $("#SDT_"+output+'_'+qam_id).val();
Set_NIT = $("#NIT_"+output+'_'+qam_id).val();


  if(PAT!=Set_PAT || SDT!=Set_SDT || NIT!=Set_NIT)
  {
    $.ajax({
      url:'index.php?route=common/dashboard/set_PSISiINT&token=<?php echo $token;?>&Set_PAT='+Set_PAT+'&Set_SDT='+Set_SDT+'&Set_NIT='+Set_NIT,
       beforeSend: function(){
            $("#loading-img").css({"display": "block"});
            $(".overlay").show();
        },
      error:function()
      {
        var html='<b>Invalid Data</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();
        $("#loading-img").css({"display": "none"});
        $(".overlay").hide();
      },
      success:function(data)
      { 
        $("#loading-img").css({"display": "none"});
          $(".overlay").hide();
        /*var html='<b>Success</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();*/
      },
      type: 'POST'
    });
  }
}
function updateGenratemode(PAT,CAT,SDT,NIT,output,rmx_no,qam_id)
{

 var PAT_TEXT = $("#PAT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
 var CAT_TEXT = $("#CAT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
 var SDT_TEXT = $("#SDT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
 var NIT_TEXT = $("#NIT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
 
  /*if(PAT_TEXT!=PAT || CAT_TEXT!=CAT || SDT_TEXT!=SDT ||  NIT_TEXT!=NIT)
        {*/
          $.ajax({
              url: 'index.php?route=common/dashboard/generate_mode&token=<?php echo $token; ?>&PAT_TEXT=' + PAT_TEXT+'&CAT_TEXT='+CAT_TEXT+'&SDT_TEXT='+SDT_TEXT+'&NIT_TEXT='+NIT_TEXT+'&output='+output+'&rmx_no='+rmx_no,
              error:function()
              {
                var html='<b>Invalid Data</b>';
                $("#message_psi").empty();
                $('#message_Modal_psi').fadeIn();
                $("#message_psi").append(html);
                $('#message_Modal_psi').modal("show");
                $('#message_Modal_psi').delay(1000).fadeOut('slow');
                $('.modal-backdrop').fadeOut();
              },
              success: function(data) 
              {
                
                var html='<b>Configuration Changed</b>';
                $("#message_psi").empty();
                $('#message_Modal_psi').fadeIn();
                $("#message_psi").append(html);
                $('#message_Modal_psi').modal("show");
                $('#message_Modal_psi').delay(1000).fadeOut('slow');
                $('.modal-backdrop').fadeOut();
              },
              type: 'POST'
              });
        // }
}
function set_table_ver(nit_ver,pat_ver,sdt_ver,output,rmx_no,qam_id)
{ 
   var changed_nit_ver=$("#nit_ver_"+output+'_'+qam_id).val();
   var changed_pat_ver=$("#pat_ver_"+output+'_'+qam_id).val();
   var changed_sdt_ver=$("#sdt_ver_"+output+'_'+qam_id).val();
   var nit_isenable=0;
   var pat_isenable=0;
   var sdt_isenable=0;
   if(changed_nit_ver!=nit_ver || changed_pat_ver!=pat_ver || changed_sdt_ver!=sdt_ver)
    {
   if($("#nit_ver_checkbox_"+output+'_'+qam_id).prop('checked') == true)
      {
        nit_isenable = 1;       
      }
  if($("#pat_ver_checkbox_"+output+'_'+qam_id).prop('checked') == true)
    {
      pat_isenable = 1;       
    }
  if($("#sdt_ver_checkbox_"+output+'_'+qam_id).prop('checked') == true)
    {
      sdt_isenable = 1;       
    }
  
   $.ajax({
          url:'index.php?route=common/dashboard/set_table_ver&token=<?php echo $token; ?>&changed_nit_ver='+changed_nit_ver+'&changed_pat_ver='+changed_pat_ver+'&changed_sdt_ver='+changed_sdt_ver+'&nit_isenable='+nit_isenable+'&pat_isenable='+pat_isenable+'&sdt_isenable='+sdt_isenable+'&output='+output+'&rmx_no='+rmx_no,
            beforeSend: function(){
            $("#loading-img").css({"display": "block"});
            $(".overlay").show();
            },
            error: function() 
            {
              var html='<b>Invalid Data</b>';
              $("#message_psi").empty();
              $('#message_Modal_psi').fadeIn();
              $("#message_psi").append(html);
              $('#message_Modal_psi').modal("show");
              $('#message_Modal_psi').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
              $("#loading-img").css({"display": "none"});
              $(".overlay").hide();
            },
          success: function(data) 
          {
            $("#loading-img").css({"display": "none"});
            $(".overlay").hide();
            if(data == 0)
            {
            /* var html='<b>Table Version Updated</b>';
              $("#message_psi").empty();
              $('#message_Modal_psi').fadeIn();
              $("#message_psi").append(html);
              $('#message_Modal_psi').modal("show");
              $('#message_Modal_psi').delay(1000).fadeOut('slow'); 
              $('.modal-backdrop').fadeOut();*/
            }
             else if(data == 1)
            {
              var html='<b>Unable To Update</b>';
              $("#message_psi").empty();
              $('#message_Modal_psi').fadeIn();
              $("#message_psi").append(html);
              $('#message_Modal_psi').modal("show");
              $('#message_Modal_psi').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
            }
          },
          type: 'POST'
          });   
 }
  
}
function downloadTables(type,table,rmx_no)
{
   var res = confirm("Want to download table?");
   if(res)
   {
     $.ajax({
         
          url:'index.php?route=common/dashboard/downloadTables&token=<?php echo $token;?>&type='+type+'&table='+table+'&rmx_no='+rmx_no,
          error:function()
          {
           var html='<b>Invalid Data</b>';
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          },
          success: function(data)
          {
            if(data==0)
            {
             var html='<b>Table Downloaded</b>';
              $("#message_psi").empty();
              $('#message_Modal_psi').fadeIn();
              $("#message_psi").append(html);
              $('#message_Modal_psi').modal("show");
              $('#message_Modal_psi').delay(1000).fadeOut('slow'); 
              $('.modal-backdrop').fadeOut();     
            }
            else
            {
              var html='<b>Unable To Download</b>';
              $("#message_psi").empty();
              $('#message_Modal_psi').fadeIn();
              $("#message_psi").append(html);
              $('#message_Modal_psi').modal("show");
              $('#message_Modal_psi').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
            }
          },
          type:'POST'
        });
   } 
}
function disabletextbox(output,qam_id)
{  
    PAT_TEXT = $("#PAT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
    var input=document.getElementById('PAT_'+output+'_'+qam_id+'');
    input.disabled=PAT_TEXT=="Disable";
    var patdownload=document.getElementById('PAT_Download_'+output+'_'+qam_id+'');
    patdownload.disabled=PAT_TEXT=="Disable";
    CAT_TEXT = $("#CAT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
    var input1=document.getElementById('CAT_'+output+'_'+qam_id+'');
    input1.disabled=CAT_TEXT=="Disable";
    var catdownload=document.getElementById('CAT_Download_'+output+'_'+qam_id+'');
    catdownload.disabled=CAT_TEXT=="Disable";
    SDT_TEXT = $("#SDT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
    var input2=document.getElementById('SDT_'+output+'_'+qam_id+'');
    input2.disabled=SDT_TEXT=="Disable";
    var sdtdownload=document.getElementById('SDT_Download_'+output+'_'+qam_id+'');
    sdtdownload.disabled=SDT_TEXT=="Disable";
    NIT_TEXT = $("#NIT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
    var input3=document.getElementById('NIT_'+output+'_'+qam_id+'');
    input3.disabled=NIT_TEXT=="Disable";
    var nitdownload=document.getElementById('NIT_Download_'+output+'_'+qam_id+'');
    nitdownload.disabled=NIT_TEXT=="Disable";     
  }
  function addPrivateData(count,addFlag,private_data,check,loop,Table,ts_id,service_id)
  {
    
    var rmx_no=-1;
    var output=-1;
    if(addFlag==0)
    {
      var Private_data=private_data;
      var loop=loop;
    }
    else
    {

      var Private_data=$("#private_data"+count).val();
       var loop=$("#PrivateDataLoop"+count).val();
      // var Table=$("#Table"+count).val();
    }

    if(Table==2)
    {
      loop=1;
      service_id=$("#PrivateDataService"+count).val();
      ts_id=$("#PrivateDataTS"+count).val();
      rmx_no=Math.floor(ts_id/8)+1;
      output=Math.floor(ts_id%8);
    }
    if(check== -1)
    {
      global_PrivateData_id+=1;
    }
   var sub_privateData=Private_data.substr(0,45);
   sub_privateData = (sub_privateData.length < 42) ? sub_privateData : sub_privateData+'...';
   

   var frequencies ="" ;
   $.each($("input[name='freq_list"+count+"']:checked"), function(){            
      frequencies+=($(this).val())+",";
  });

  	$.ajax({
	    url:'index.php?route=common/dashboard/addPrivateData&token=<?php echo $token;?>&Private_data='+Private_data+'&addFlag='+addFlag+'&count='+count+'&frequencies='+frequencies+'&loop='+loop+'&Table='+Table+'&service_id='+service_id+'&ts_id='+ts_id,

	    error:function()
	    {
	      var html='<b>Invalid Data</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();
	    },
	    success:function(data)
	    {
	    	if(data!=1)
	    	{
	    	 
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(data);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');	
        $('.modal-backdrop').fadeOut();
	    	}
	    	else
	    	{
          if(check==-2)
          {
            var html='<b>Private Data Deleted</b>';
            var ele = document.getElementById("PrivateData_Row"+count); 
                          ele.remove();
           
          }
         else if(check== -1)
          {
             var html='<b>Private Data Added</b>';
           if(Table!=2)
           {
            var Table_type=(Table == 0 )?"NIT":((Table == 1 )?"BAT":"SDT");
            if(loop==0)
            {
              var loop="First";
            }
            else
            {
              var loop="Second";
            }
           
             var html1='<tr id="PrivateData_Row'+count+'">'
              html1+='<td></td>'
              html1+='<td>'+sub_privateData+'</td>'
              html1+='<td>'+loop+'</td>'
              html1+='<td>'+Table_type+'</td>'
              html1+='<td><span id="updatePrivateData" class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#secondLoopModal" onclick="newPrivateData('+count+',0,'+Table+',-1,-1);"></span></td>'
               html1+='<td><span id="deletePrivateData" class="glyphicon glyphicon-trash" onclick="addPrivateData('+count+',0,'+"'"+Private_data+"'"+',-2,'+loop+','+Table+',-1,-1)"></span></td>'
              html1+='</tr>'
    
          $("#private_data_table").append(html1);
           }
           else
           {
             var html1='<tr id="PrivateData_Row'+count+'">'
            html1+='<td></td>'
            html1+='<td>'+sub_privateData+'</td>'
            html1+='<td>'+rmx_no+'('+output+')</td>'
            html1+='<td>'+service_id+'</td>'
            html1+='<td><span id="updatePrivateData" class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#secondLoopModal" onclick="newPrivateData('+count+',0,2,'+ts_id+','+service_id+');"></span></td>'
             html1+='<td><span id="deletePrivateData" class="glyphicon glyphicon-trash" onclick="addPrivateData('+count+',0,'+"'"+Private_data+"'"+',-2,'+loop+','+Table+','+ts_id+','+service_id+')"></span></td>'
            html1+='</tr>'

            $("#sdt_private_data_table").append(html1);
           }
            
      

          }
          else
          {
            var html='<b>Private Data Updated</b>';
            if(Table!=2)
            {
            var Table_type=(Table == 0 )?"NIT":((Table == 1 )?"BAT":"SDT");
            if(loop==0)
            {
              var loop="First";
            }
            else
            {
              var loop="Second";
            }
            

            var ele = document.getElementById("PrivateData_Row"+count); 
                          ele.remove();
          var html1='<tr id="PrivateData_Row'+count+'">'
          html1+='<td></td>'
          html1+='<td>'+sub_privateData+'</td>'
          html1+='<td>'+loop+'</td>'
          html1+='<td>'+Table_type+'</td>'
          html1+='<td><span id="updatePrivateData" class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#secondLoopModal" onclick="newPrivateData('+count+',0,'+Table+',-1,-1);"></span></td>'
           html1+='<td><span id="deletePrivateData" class="glyphicon glyphicon-trash" onclick="addPrivateData('+count+',0,'+"'"+Private_data+"'"+',-2,'+loop+','+Table+',-1,-1)"></span></td>'
          html1+='</tr>'

          $("#private_data_table").append(html1);
          }
          else
          {
            var ele = document.getElementById("PrivateData_Row"+count); 
                          ele.remove();
          var html1='<tr id="PrivateData_Row'+count+'">'
          html1+='<td></td>'
          html1+='<td>'+sub_privateData+'</td>'
          html1+='<td>'+rmx_no+'('+output+')</td>'
          html1+='<td>'+service_id+'</td>'
          html1+='<td><span id="updatePrivateData" class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#secondLoopModal" onclick="newPrivateData('+count+',0,2,'+ts_id+','+service_id+');"></span></td>'
           html1+='<td><span id="deletePrivateData" class="glyphicon glyphicon-trash" onclick="addPrivateData('+count+',0,'+"'"+Private_data+"'"+',-2,'+loop+','+Table+','+ts_id+','+service_id+')"></span></td>'
          html1+='</tr>'

          $("#sdt_private_data_table").append(html1);
          }
	    		}
          $("#message_psi").empty();
          $('#message_Modal_psi').fadeIn();
          $("#message_psi").append(html);
          $('#message_Modal_psi').modal("show");
          $('#message_Modal_psi').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
          
	    	}
	    	
	    },

    });
  	
  }
 
  
  $(document).ready(function(){
  	var output=0;
  	var rmx_no=1;
  	var qam_id=0;
   $.ajax({
    url:'index.php?route=common/dashboard/getNITMode&token=<?php echo $token;?>&output='+output+'&rmx_no='+rmx_no,

    error:function()
    {
      var html='<b>Invalid Data</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();
    },
    success:function(data)
    {
      
      if(data!= -1)
      {
      	 var data = JSON.parse(data);
         var nitMode=data['nitMode'];
         var nitCode=data['nitCode'];
         var html='<span style="margin-right:3%">NIT Mode</span>'
       html+='<select class="btn btn-default" id="nitMode" name="modes" onChange="nit_Mode('+"'"+nitMode+"'"+');"><option value="0">Passthrough</option><option value="1">Channel Naming</option><option value="2">Host Provided</option><option value="3">No NIT</option></select>'
        $("#NIT_Mode").append(html);
         $('select[name="modes"] option[value='+nitCode+']').attr('selected','selected');
      }
      else
      {
      	var html='<span style="margin-right:3%">NIT Mode</span>'
      html+='<select class="btn btn-default" id="nitMode" name="modes" ><option value="0">Passthrough</option><option value="1">Channel Naming</option><option value="2">Host Provided</option><option value="3">No NIT</option></select>'
        $("#NIT_Mode").append(html);
         $('select[name="modes"] option[value='+0+']').attr('selected','selected');
      }
    },
  });
  });

function nit_Mode(nitMode)
{
  var nit_mode = $("#nitMode").val();
  var nit_text=$("#nitMode").find('option:selected').text();
 
 
    $.ajax({
        url: 'index.php?route=common/dashboard/set_nit_mode&token=<?php echo $token; ?>&nit_mode='+nit_mode,
         beforeSend: function(){
            $("#loading-img").css({"display": "block"});
            $(".overlay").show();
        },
        error: function() 
        {
        var html='<b>Invalid Data</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();
        $("#loading-img").css({"display": "none"});
	      $(".overlay").hide();
	    
        },
        success: function(data) 
        {
        	$("#loading-img").css({"display": "none"});
          $(".overlay").hide();
          if(data == 0)
          {
          var html='<b>Mode Updated</b>';
          $("#message_psi").empty();
          $('#message_Modal_psi').fadeIn();
          $("#message_psi").append(html);
          $('#message_Modal_psi').modal("show");
          $('#message_Modal_psi').delay(1000).fadeOut('slow'); 
          $('.modal-backdrop').fadeOut();
          }
           else
          {
            var html='<b>Unable to Update Mode</b>';
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          }
        },
        type: 'POST'
        });
  
}
$(document).ready(function(){
var output=0;
var rmx_no=1;
$.ajax({
        url: 'index.php?route=common/dashboard/get_network_id&token=<?php echo $token; ?>&output='+output+'&rmx_no='+rmx_no,
        error: function() 
        {
        var html='<b>Connection Error</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();
        },
        success: function(data) 
        {
          var data = JSON.parse(data);
          if(data != -1)
          {
              var html='<td>ON ID</td>'
			  html+='<td><input type="text" id="Org_network_id" value='+data['uOrigNet_Id']+'></td>'
			  html+='<td>Network ID	</td>'
			  html+='<td><input type="text" id="network_id" value='+data['uNet_Id']+'></td>'
			  html+='<td><button type="button" id="update_network_id" onclick="setNetworkId()">Update</button></td>' 
			  $("#Network_id_row").append(html);
          }
           else
          {
              var html='<td>Original Network ID</td>'
			  html+='<td><input type="text" id="Org_network_id" value='+0+'></td>'
			  html+='<td>Network ID	</td>'
			  html+='<td><input type="text" id="network_id" value='+0+'></td>'
			  html+='<td><button type="button" id="update_network_id" onclick="setNetworkId()">Update</button></td>' 
			  $("#Network_id_row").append(html);
          }
        },
        type: 'POST'
        });

  
});

function setNetworkId()
{
  var org_network_id=$("#Org_network_id").val();
  var network_id=$("#network_id").val();
  $.ajax({
        url: 'index.php?route=common/dashboard/set_network_id&token=<?php echo $token; ?>&org_network_id='+org_network_id+'&network_id='+network_id,
         beforeSend: function(){
            $("#loading-img").css({"display": "block"});
            $(".overlay").show();
        },
        error: function() 
        {
          var html='<b>Invalid Data</b>';
        $("#message_psi").empty();
        $('#message_Modal_psi').fadeIn();
        $("#message_psi").append(html);
        $('#message_Modal_psi').modal("show");
        $('#message_Modal_psi').delay(1000).fadeOut('slow');
        $('.modal-backdrop').fadeOut();
          $("#loading-img").css({"display": "none"});
	      $(".overlay").hide();
	      
        },
        success: function(data) 
        {
          $("#loading-img").css({"display": "none"});
          $(".overlay").hide();
          if(data== 0)
          {
          	var html='<b>Success</b>';
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          }
          else
          {
          	var html='<b>Error</b>';
            $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          }

         },
        type: 'POST'
        });

}
function changePass()
{
 password = $("#pass").val();
 repeat_password = $("#pass_repeat").val();
 var id=1;
      var res = confirm("Want to update password?");
      if(res)
      {
        
        $.ajax({
            url: 'index.php?route=user/user/update_password&token=<?php echo $token; ?>&password='+password+'&id='+id,
            error:function()                                                                   
            {
              var html="<b>Error While Updating Password</b>";
              $("#message_psi").empty();
            $('#message_Modal_psi').fadeIn();
            $("#message_psi").append(html);
            $('#message_Modal_psi').modal("show");
            $('#message_Modal_psi').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
            },
            success: function(data) 
                {
                  var html="<b>Password Updated Succesfully</b>";
                $("#message_psi").empty();
                $('#message_Modal_psi').fadeIn();
                $("#message_psi").append(html);
                $('#message_Modal_psi').modal("show");
                $('#message_Modal_psi').delay(1000).fadeOut('slow');
                $('.modal-backdrop').fadeOut();
                },
            type: 'POST'
        });
      }
}
$(document).ready(function()
{
  $("tr").hover(function(){  
    $(this).addClass("hover1");
  },function()
  {
    $(this).removeClass("hover1"); 
  });
  $("tr").click(function(){
    $("tr").removeClass("afterclick");
    $(this).removeClass("hover1").addClass("afterclick");
  });

 $("table.panel1 tr:odd").css("background-color","#F5DEB3").hover(function(){
  $(this).css('background-color','lightblue');
},function(){
        $(this).css('background-color','#F5DEB3');     
  });

$("table.panel1 tr:odd").css("background-color","#F5DEB3").click(function(){
  $(this).css('background-color','orange');
},function(){
        $(this).css('background-color','#F5DEB3');     
  });

$("table.panel1 tr:even").css("background-color","white").hover(function(){
  $(this).css('background-color','lightblue');
},function(){
        $(this).css('background-color','white');     
  });
$("table.panel1 tr:even").css("background-color","white").click(function(){
  $(this).css('background-color','orange');
},function(){
        $(this).css('background-color','white');     
  });

$("table.freq-table tr:even").css("background-color","#E0FFFF").hover(function(){
  $(this).css('background-color','lightblue');
},function(){
        $(this).css('background-color','#E0FFFF');     
  });

$("table.freq-table tr:odd").css("background-color","white").hover(function(){
  $(this).css('background-color','lightblue');
},function(){
        $(this).css('background-color','white');     
  });

$("table.Re_table tr:even").css("background-color","#E0FFFF").hover(function(){
  $(this).css('background-color','lightblue');
},function(){
        $(this).css('background-color','#E0FFFF');     
  });
$("table.Re_table tr:odd").css("background-color","white").hover(function(){
  $(this).css('background-color','lightblue');
},function(){
        $(this).css('background-color','white');     
  });

});
$(document).on("click",'#BAT_add',function (e){
  e.stopPropagation();
});
$(document).on("click",'#BAT_Update',function (e){
  e.stopPropagation();
});
$(document).on("click",'#PrivateData_add',function (e){
  e.stopPropagation();
});
 </script>
