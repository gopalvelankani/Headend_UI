<?php echo $header; ?>

  <script type="text/javascript">
          $(document).ready(function(){
          $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
              localStorage.setItem('activeTab', $(e.target).attr('href'));
          });
          var activeTab = localStorage.getItem('activeTab');
         
          if(activeTab){
              $('#tabs a[href="' + activeTab + '"]').tab('show');
          }
      });
</script>
      

<div class="container" id="headend" style="width: 100%;" >
    <ul class="nav nav-tabs" id="tabs" style="margin-bottom: 1%;">
            <li class="active" id="MUX1"><a data-toggle="tab" href="#mux-1" >Mux-1</a></li>
            <li id="MUX2"><a data-toggle="tab" href="#mux-2" >Mux-2</a></li>
            <li id="MUX3"><a data-toggle="tab" href="#mux-3" >Mux-3</a></li>
            
         <span style="margin-left: 25%">NETWORK</span>
        <span  class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#network_setting" onclick="Network();"></span>
            
            <sapn style="margin-left: 5%">SETTINGS</sapn>
            <span  class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#settings" onclick="settings();getFPGAStaticIP();getFpgaVersion();"></span>
            <span id="message_delete" style="margin-left: 2%;"></span>
            <!-- <sapn id="input_message" ></sapn>
            <sapn style="margin-left: 26%">Network</sapn>
            <span  class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#network_setting" onclick="Network();"></span>
            <sapn id="output_message" ></sapn>
            <sapn style="margin-left: 15%">Version-2.2</sapn> -->
    </ul>
    <div class="tab-content">
       <div id="mux-1" class="tab-pane fade in active">
          <div class="row"> 	 
            <div id="Input_Column1" class="col-md-6" ></div>
            <div id="Output_Column1" class="col-md-6" ></div>
         </div>
         <div class="row"> 
             <div id="Input_Column2" class="col-md-6" ></div>
             <div id="Output_Column2" class="col-md-6" ></div>
         </div>
      </div>
     <div id="mux-2" class="tab-pane fade">
          <div class="row"> 
           <div id="Input_Column3" class="col-md-6" ></div>
           <div id="Output_Column3" class="col-md-6" ></div>
         </div>
         <div class="row">
          <div id="Input_Column4" class="col-md-6" ></div>
          <div id="Output_Column4" class="col-md-6" ></div>
        </div>   
      </div>        
      <div id="mux-3" class="tab-pane fade">
        <div class="row">
          <div id="Input_Column5" class="col-md-6"></div>
          <div id="Output_Column5" class="col-md-6"></div>
        </div>
        <div class="row">
           <div id="Input_Column6" class="col-md-6" > </div>
           <div id="Output_Column6" class="col-md-6" ></div>
        </div>
     </div> 
  </div>
</div>        
<div class="modal" id="network_setting" data-backdrop="static">
  </div>
  <div class="modal" id="settings" data-backdrop="static">
  </div>
<!-- MODEL FOR OUTPUT  -->
<?php foreach($Qam_detail as $Qam_value ){ ?>
<?php foreach($QamFreq_detail as $QamFreq_value ){ ?>
      <div class="modal fade" id="Output_Modal<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-lg"  style=" align-self: center; width: 80%;  ">
          <div class="modal-content" >
            <h4 class="modal-title"><span class="glyphicon glyphicon-cog" style="margin-left:10px; margin-top: 5px;"></span><span style="margin-left: 3px;margin-top: 5px;">Chassis</span></h4>
            <div class="modal-body" >
              <div data-role="main" class="ui-content">
                <div class="container-default">
                  <ul class="nav nav-tabs">
                      <li class="active"><a data-toggle="tab" id="tab1" href="#General<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">General</a></li>
                      <li><a data-toggle="tab" href="#Payload<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">PID filters</a></li>
                      <li><a data-toggle="tab" href="#EMM<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">EMM</a></li>
                  </ul>
          <div class="tab-content">
              <div id="General<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" class="tab-pane fade in active">
                
              </div>
           
              <div id="Payload<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" class="tab-pane fade" style="margin-top: 10px;">
                     
              </div>
            <div id="EMM<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" class="tab-pane fade" style="margin-top: 10px; min-height: 100px;">
            
              </div>
              </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php } ?>
 <!-- MODEL FOR OUTPUT  -->
<div class="modal fade" id="message_Modal" role="dialog" data-backdrop="static">
        <div class="modal-dialog modal-lg"  style=" align-self: center; width: auto;  ">
          <div class="modal-content" >
          <h4 id="message" align="center"></h4>
          </div>
       </div>
</div>
  <div class="modal" id="channel_modal" data-backdrop="static">
  </div>
     <!-- modal for ecm_stream_modal -->
        <div class="modal fade" id="stream_modal"  role="dialog" data-backdrop="static" >
        </div>
        <!-- modal for ecm_stream_modal -->   
          <!-- Ecmg channel settings modal -->
              <div class="modal fade" id="ecmg-settings"  role="dialog" data-backdrop="static">
              </div>
              <!-- Ecmg channel settings modal end -->
               <!-- modal for ecmg channelplus -->
              <div class="modal fade" id="ecmg-1plus"  role="dialog" aria-labelledby="ECMGModalLabel" data-backdrop="static" >
              </div>
              <!-- modal for ecmg channel plus --> 
<div id="loading-img"></div>
 <div class="overlay"></div>

<script type="text/javascript">

  
$('.ip').mask('0ZZ.0ZZ.0ZZ.0ZZ', { translation: { 'Z': { pattern: /[0-9]/, optional: true } } });
function Network()
{
  $.ajax({
      url:'index.php?route=common/dashboard/getInsertNIT&token=<?php echo $token; ?>',
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

         $("#network_setting").empty();
             var html='<div class="modal-dialog" role="document" style="width: 60%; align-self: center;" >'
             html+='<div class="modal-content">'
             html+='<div class="modal-body">'
             html+='<table class="genral" style="width:100%; height: 25%;"><tbody>'
             html+='<tr><td><h3 class=" glyphicon glyphicon-cog "  style="margin-left: 0px">Network</h3></td></tr>'
             html+='<tr>'
             html+='<td>Network Name:</td><td><input type="text" class="form-control-default" id="Network_name" style="margin-top: 4px;" value=""></td>'
             html+='<td>Network Id:</td><td><input type="text" class="form-control-default" id="Network_id" style="margin-top: 4px;" value=""></td>'
            
             html+='</tr>'
             html+='</tbody></table></div>'
             html+='<div class="modal-footer"><button type="button" class="btn btn-default" id="Network_save" onclick="insertNIT()" data-dismiss="modal">Insert</button>'
             html+='<button type="button" class="btn btn-default" onclick="disableNIT()" data-dismiss="modal">Disable </button>'
             html+='<button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button>'
             html+='</div></div></div>'
             $("#network_setting").append(html);

              var nitData = new Array();
              nitData =JSON.parse(data);
             
              if(nitData["error"]==0)
               {
                $("#Network_name").val(nitData["list"][0]["network_name"]);
                $("#Network_id").val(nitData["list"][0]["network_id"]);
                
               }
                else
                {
                  $("#Network_name").val("");
                  $("#Network_id").val("");
                
                }
      },
      type: 'GET'
    });
       
}
function insertNIT()
{
  var network_Name=$("#Network_name").val();
  var network_Id=$("#Network_id").val();
  var Version=1;
  if(network_Name!= "" && network_Id!="")
  {
  $.ajax({
      url:'index.php?route=common/dashboard/insertNIT&token=<?php echo $token; ?>&network_Name='+ network_Name+'&network_Id='+network_Id+'&Version='+Version,
      beforeSend: function(){
            $("#loading-img").css({"display": "block"});
            $(".overlay").show();
        },
      error:function()
      {
        var html='<b>Error while Inserting NIT</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
        $("#loading-img").css({"display": "none"});
        $(".overlay").hide();
      },
      success:function(data)
      {
        $("#loading-img").css({"display": "none"});
          $(".overlay").hide();
        if(data==1){

          var html='<b>NIT Inserted Succesfully</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
        }
        else{
          var html='<b>Error while Inserting NIT</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
        };
      },
      type: 'POST'
    });
  }
}
function disableNIT()
{
  var network_Name=$("#Network_name").val();
  var network_Id=$("#Network_id").val();
  if(network_Name!= "" && network_Id!="")
  {
     $.ajax({
      url:'index.php?route=common/dashboard/disableNIT&token=<?php echo $token; ?>',
      beforeSend: function(){
            $("#loading-img").css({"display": "block"});
            $(".overlay").show();
        },
      error:function()
      {
        var html='<b>Error while Disabling NIT</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
        $("#loading-img").css({"display": "none"});
        $(".overlay").hide();
      },
      success:function(data)
      {
        $("#loading-img").css({"display": "none"});
          $(".overlay").hide();
        if(data==1){
          var html='<b>NIT Disabled Successfully</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
        }
        else{
          var html='<b>Error While Disabling NIT</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
        };
      },
      type: 'GET'
    });
  }
}
//*************************CAS***********************************//
  $(document).ready(function()
  {   
    for(var rmx_no=1;rmx_no<=6;rmx_no++){
       <?php foreach($ecmg_channel as $ecmg_value ){ ?>
        var html_ecm='<div class="ecm_div<?php echo $ecmg_value['ecmg_channel_id'];?>" id="ecm_div<?php echo $ecmg_value['ecmg_channel_id'];?>">'
              html_ecm+= '<table class="panel-ecmg" data-toggle="collapse" id="ECMG<?php echo $ecmg_value['ecmg_channel_id'];?>" data-target="#<?php echo $ecmg_value['ecmg_channel_id'];?>'+rmx_no+'">'
                html_ecm+='<colgroup>'
                  html_ecm+='<col style="width: 4%;" />'
                  html_ecm+='<col style="width: 33%;" />'
                  html_ecm+='<col style="width: 5%;" />'
                  html_ecm+='<col style="width: 5%;" />'
                  html_ecm+='<col style="width: 5%;" />'
                html_ecm+='</colgroup>'
                html_ecm+='<tr>'
                  html_ecm+='<td></td>'
                  html_ecm+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><b><?php echo $ecmg_value['Alias'];?></b></td>'
                  html_ecm+='<td><span class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#ecmg-1plus" id="stream_plus" onclick="onclickECMG(<?php echo $ecmg_value['ecmg_channel_id'];?>,'+rmx_no+')" ></span></td>'
                  html_ecm+='<td><span class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#ecmg-settings" id="ecm_channel_settings" onclick="ECMGSettings(<?php echo $ecmg_value['ecmg_channel_id'];?>,'+rmx_no+')"></span></td>'
                  html_ecm+='<td><span id="stream_delete" class="glyphicon glyphicon-trash"  onclick="onclickDeleteECMG(<?php echo $ecmg_value['ecmg_channel_id'];?>)" ></span></td>'
                html_ecm+='</tr>'
              html_ecm+='</table>'
              html_ecm+='</div>'
             html_ecm+=' <div class="collapse" id="<?php echo $ecmg_value['ecmg_channel_id'];?>'+rmx_no+'" >'
               <?php foreach($ecm_stream as $data ){ ?>

                 
                  <?php if($data['ecmg_id'] == $ecmg_value['ecmg_channel_id']){ ?>
              var html_ecm1='<table class="panel2 "ecm_<?php echo $data['ecm_stream_streamid'].'_'.$ecmg_value['ecmg_channel_id'].'_'.$data['ecm_stream_ecmId'].'_'.$data['ecm_stream_CP_number'].'_'.$data['access_criteria'];?>"" id="ecm_<?php echo $data['ecm_stream_streamid'].'_'.$ecmg_value['ecmg_channel_id'].'_'.$data['ecm_stream_ecmId'].'_'.$data['ecm_stream_CP_number'].'_'.$data['access_criteria'];?>"  data-draggable="item" draggable="true" aria-grabbed="false">'
                html_ecm1+='<colgroup>'
                  html_ecm1+='<col style="width: 4%;"/>'
                  html_ecm1+='<col style="width: 33%;"/>'
                  html_ecm1+='<col style="width: 5%;"/>'
                  html_ecm1+='<col style="width: 5%;"/>'
                  html_ecm1+='<col style="width: 5%;"/>'
                html_ecm1+='</colgroup>'
                html_ecm1+='<tr id="ecmRow_<?php echo $data['ecm_stream_streamid'].'_'.$ecmg_value['ecmg_channel_id'].'_'.$data['ecm_stream_ecmId'].'_'.$data['ecm_stream_CP_number'].'_'.$data['access_criteria'];?>">'
                  html_ecm1+='<td style="pointer-events: none;"></td>'
                  html_ecm1+='<td style="text-overflow:ellipsis; overflow:hidden;pointer-events: none;"><span><b><font size="1">ECM</font></b> <?php echo $data['ecm_stream_streamid'];?>:<?php echo $data['alias'];?></span></td>'
                  html_ecm1+='<td style="pointer-events: none;"></td>'
                  html_ecm1+='<td><span class="glyphicon glyphicon-cog" onclick="ecmStreamModal(<?php echo $data['ecm_stream_streamid'];?>,<?php echo $ecmg_value['ecmg_channel_id'];?>,'+rmx_no+');"  style="margin-top: 4%;" data-toggle="modal" data-target="#stream_modal"></span></td>'
                  html_ecm1+='<td><span class="glyphicon glyphicon-trash" onclick="ecmStreamDelete(<?php echo $data['ecm_stream_streamid'];?>,<?php echo $ecmg_value['ecmg_channel_id'];?>,<?php echo $data['ecm_stream_ecmId'] ?>,<?php echo $data['ecm_stream_CP_number'] ?>,<?php echo $data['access_criteria'];?>,);" style="margin-top: 4%;" ></span></td>'
                html_ecm1+='</tr>'
              html_ecm1+='</table>'
               
               if(<?php echo $data['rmx_no']?> == rmx_no)
                  { 
                      html_ecm+=html_ecm1;
                  }
                         
          
                <?php } ?>

              <?php } ?>
               
              html_ecm+='</div>'
               for(var i=1;i<=6;i++){ 
                 if(i==rmx_no)
                  {
                   $("#Input_Column"+i).append(html_ecm);
                  }
              }
   

<?php } ?>
}
});
function ecmStreamDelete(stream_id,ecmg_id,ecm_id,cp_number,access_criteria)
{
  var result = confirm("Want to delete?");
  if(result)
  {
    $.ajax({
      url:'index.php?route=common/dashboard/deleteECMStream&token=<?php echo $token; ?>&ecmg_id='+ ecmg_id+'&stream_id='+stream_id,
      error:function()
      {
        
                    var html='<b>Error while deleting ecmg stream</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
                  
                  /* $("#input_message").empty();
                   $("#input_message").append(html).css("color","red").fadeIn('slow');
                   $('#input_message').delay(1000).fadeOut('slow');*/
      },
      success:function()
      {
                   $("#message").empty();
                   var html='<b>Succesfully Deleted</b>';
                   $("#message").append(html);
                   
                   $('#message_Modal').fadeIn();
                  $('#message_Modal').modal("show");
                  $('#message_Modal').delay(1000).fadeOut('slow');
                  $('.modal-backdrop').fadeOut();
                  
                   /*$("#input_message").empty();
                   $("#input_message").append(html).css("color","green").fadeIn('slow');
                   $('#input_message').delay(1000).fadeOut('slow');*/
              var ele = document.getElementById("ecm_"+stream_id+"_"+ecmg_id+"_"+ecm_id+"_"+cp_number+"_"+access_criteria);
              ele.remove();
      },
      type: 'POST'
    });
  } 
}
function onclickECMG(ecmg_id,rmx_no)
{
  $.ajax({
    url:'index.php?route=common/dashboard/getLastStreamId&token=<?php echo $token; ?>&ecmg_id='+ecmg_id,
    error:function()
    { 
      var html='<b>Error</b>';
       $("#message").append(html);
           $("#message").empty();
          $('#message_Modal').fadeIn();
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
        
       /*$("#input_message").empty();
       $("#input_message").append(html).css("color","red").fadeIn('slow');
       $('#input_message').delay(1000).fadeOut('slow');*/
    },
    success:function(stream_id)
    {
      if(stream_id == '')
      {
        stream_id = 1;
      }
      else
      {
        stream_id = +stream_id + +1;
      }
       $("#ecmg-1plus").empty();

        var html='<div class="modal-dialog" role="document" style="width: 70%; align-self: center; ">'
        html+='<div class="modal-content" >'
        html+='<div class="modal-body">'
        html+='<table class="genral" style="width:100%; height: 20%;"><tbody>'
        html+='<tr><td ><h4 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" style="margin-left: 0px">New ECM Stream</h4></td></tr>'
        html+='<tr><td>Alias:</td>'
        html+='<td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_alias" name=""></td>'
        html+='<td></td>'
        html+='<td>ECM Pid:</td>'
        html+='<td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_Pid" name=""></td>'
        html+='</tr>'
        html+='<tr><td></td>'
        html+='<td><span id="error_stream_alias" style="color: red"></span></td><td></td><td>'
        html+='<span id="error_ecm_pid" style="color: red"></span></td></tr>'
        html+='<tr><td>CW Group:</td>'
        html+='<td><input type="text" class="form-control-default" style="margin-top: 4px;" id="ecm_stream_CW_group" value="'+stream_id+'"></td>'
        html+='<td></td>'
        html+='<td>Access criteria</td>'
        html+='<td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_access_criteria" name=""></td>'
        html+='</tr>'
        html+='<tr><td></td><td><span id="error_stream_cw_number" style="color: red"></span></td><td></td><td></td><td><span id="error_stream_access_criteria" style="color: red"></span></td></tr>'
        html+='<tr><td>Stream ID:</td>'
        html+='<td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_streamid" value="'+stream_id+'" name=""></td>'
        html+='<td></td>'
        html+='<td>ECM ID</td>'
        html+='<td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_ecmId" value="'+stream_id+'" name=""></td>'
        html+='</tr>'
        html+='<tr><td></td><td></td><td></td><td></td><td><span id="error_stream_ecmid" style="color: red"></span></td></tr>'
        
        // html+='<tr><td></td><td></td><td></td><td></td><td><span id="error_stream_cw_number" style="color: red"></span></td></tr>'
        html+='</tbody></table></div>'
        html+='<div class="modal-footer"><button type="button" class="btn btn-default" onClick="ecmgStream('+ecmg_id+','+stream_id+','+rmx_no+')" disabled="disabled" id="ecm_stream_save" data-dismiss="modal" >APPLY & SAVE </button><button type="button" class="btn btn-default"  data-dismiss="modal" >Cancel </button></div></div></div>'

       $("#ecmg-1plus").append(html);
           

         

         $('#ecm_stream_alias, #ecm_stream_ecmId, #ecm_stream_CW_group,#ecm_stream_Pid,#ecm_stream_access_criteria,#ecm_stream_streamid').keyup(function() {
        var empty = false;
        $('#ecm_stream_alias, #ecm_stream_ecmId, #ecm_stream_CW_group,#ecm_stream_Pid,#ecm_stream_access_criteria,#ecm_stream_streamid').each(function() {
            if ($(this).val() == '') {
                empty = true;
            }
        });
        if (empty)
         {
            $('#ecm_stream_save').attr('disabled', 'disabled'); 
         } 
        else
         {
           if(check_ecm_stream_alias() && check_ecm_stream_ecmId()  && check_ecm_cw_number() && check_ecm_pid() && ValidateAccessCriteria())
            {
              $('#ecm_stream_save').removeAttr('disabled'); 
            }
            else
            {
              $('#ecm_stream_save').attr('disabled', 'disabled');
            }
        }
    });
    type:'POST'
    },
  });
}
function ValidateAccessCriteria()
{
   var access_criteria=$("#ecm_stream_access_criteria").val();
  $resp=0;
   var dataStr={access_criteria:access_criteria};
 $("#error_stream_access_criteria").hide();
   $.ajax({
       url:'index.php?route=common/dashboard/getEcmStreamAccessCriteria&token=<?php echo $token; ?>',
       type:'POST',
       dataType:'json',
       data:dataStr,
       error: function()
        {
          alert("error");
        },
       success: function(data)
       {
         if(data==0)
         {
           
         }
         else
         {
              $resp=1;
           $("#error_stream_access_criteria").html("Access Criteria already exist");
            $("#error_stream_access_criteria").show();
            // return false;
         }
          
          
       },

   });
   if($resp==0)
   {
    return true;
   }
   else
   {
    return false;
   }

}
function check_ecm_pid()
{
  var text=$("#ecm_stream_Pid").val().trim();
 
   if (text=='') 
     {
        $("#error_ecm_pid").html("Should not be empty");
        $("#error_ecm_pid").show();
        return false;   
     }
     else if(text <=2599)
     {
      $("#error_ecm_pid").hide();
      return true;
     }
     else
     {
      $("#error_ecm_pid").html("Should Less then 2599");
      $("#error_ecm_pid").show();
      return false;
     }
}
function check_ecm_cw_number()
{
  var text1=$("#ecm_stream_CW_group").val().trim();
    if (text1=='') 
     {
        $("#error_stream_cw_number").html("Should not be empty");
        return false;   
     }
     else if(text1 > 0 && text1<1000)
     {
      $("#error_stream_cw_number").hide();
      return true;
     }
     else
     {
      $("#error_stream_cw_number").html("Should be in range 1 to 999");
      $("#error_stream_cw_number").show();
      return false;
     }
}
function check_ecm_stream_alias()
{ 
    var text=$("#ecm_stream_alias").val().trim();
    if(text=='')
    {
     
      $("#error_stream_alias").html("Alias Should not be empty");
      $("#error_stream_alias").show();
      return false;
    }
    else
    {
      $("#error_stream_alias").hide();
       return true;
    }   
}
function check_ecm_stream_ecmId()
{
  var text1=$("#ecm_stream_ecmId").val().trim();

    if (text1=='') 
     {
        $("#error_stream_ecmid").html("Should not be empty");
        return false; 
     }
     else if(text1 >= 0 && text1<2600)
     {
      $("#error_stream_ecmid").hide();
      return true;
     }
     else
     {
      $("#error_stream_ecmid").html("Should be in Range 0 to 2599");
      $("#error_stream_ecmid").show();
      return false;
     }
}
function ecmgStream(ecmg_id,ecm_stream_streamid,rmx_no)
{
   
   var ecm_stream_alias = $("#ecm_stream_alias").val();
   var ecm_stream_access_criteria = $("#ecm_stream_access_criteria").val();
   var ecm_stream_streamid=$("#ecm_stream_streamid").val();
   var ecm_stream_ecmId = $("#ecm_stream_ecmId").val();
   var ecm_stream_CP_number = ecm_stream_streamid;
   var ecm_stream_CW_group = $("#ecm_stream_CW_group").val();
   var ecm_stream_Pid=$("#ecm_stream_Pid").val();

   var result = confirm("Want to add new ECM Stream?");
   if(result)
   {
     $.ajax({
      url:'index.php?route=common/dashboard/addECMStream&token=<?php echo $token; ?>&ecm_stream_alias=' + ecm_stream_alias+'&ecm_stream_access_criteria='+ecm_stream_access_criteria+'&ecm_stream_ecmId='+ecm_stream_ecmId+'&ecm_stream_CW_group='+ecm_stream_CW_group+'&ecm_stream_CP_number='+ecm_stream_CP_number+'&ecm_stream_streamid='+ecm_stream_streamid+'&ecmg_id='+ecmg_id+'&ecm_stream_Pid='+ecm_stream_Pid+'&rmx_no='+rmx_no,
      error:function()
      {
                   var html='<b>Connection Error</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
                    
                   /*$("#input_message").empty();
                   $("#input_message").append(html).css("color","red").fadeIn('slow');
                   $('#input_message').delay(1000).fadeOut('slow');*/
      },
      success:function(data)
      {
        var data=parseInt(data);
  
        switch(data)
        {
          case -1:
                  var html='<b>ECM Stream Should be Unique</b>';
                  $("#message").empty();
                  $('#message_Modal').fadeIn();
                  $("#message").append(html);
                  $('#message_Modal').modal("show");
                  $('#message_Modal').delay(1000).fadeOut('slow');
                  $('.modal-backdrop').fadeOut();
                 
                 /*  $("#input_message").empty();
                   $("#input_message").append(html).css("color","red").fadeIn('slow');
                   $('#input_message').delay(1000).fadeOut('slow');*/
          break;
          case 0: 
                  var html='<b>Error while adding ecmg stream</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
                    
                   /*$("#input_message").empty();
                   $("#input_message").append(html).css("color","red").fadeIn('slow');
                   $('#input_message').delay(1000).fadeOut('slow');*/
          break;
          case 1:
                  var html='<b>ECMG stream added succesfully</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
                  
                 /*$("#input_message").empty();
                 $("#input_message").append(html).css("color","green").fadeIn('slow');
                 $('#input_message').delay(1000).fadeOut('slow');*/


                 var html_ecm1='<table class="panel2 ecm_'+ecm_stream_streamid+'_'+ecmg_id+'_'+ecm_stream_ecmId+'_'+ecm_stream_CP_number+'_'+ecm_stream_access_criteria+'" id="ecm_'+ecm_stream_streamid+'_'+ecmg_id+'_'+ecm_stream_ecmId+'_'+ecm_stream_CP_number+'_'+ecm_stream_access_criteria+'"  data-draggable="item" draggable="true" aria-grabbed="false">'
                  html_ecm1+='<colgroup>'
                  html_ecm1+='<col style="width: 4%;"/>'
                  html_ecm1+='<col style="width: 33%;"/>'
                  html_ecm1+='<col style="width: 5%;"/>'
                  html_ecm1+='<col style="width: 5%;"/>'
                  html_ecm1+='<col style="width: 5%;"/>'
                  html_ecm1+='</colgroup>'
                  html_ecm1+='<tr id="ecmRow_'+ecm_stream_streamid+'_'+ecmg_id+'_'+ecm_stream_ecmId+'_'+ecm_stream_CP_number+'_'+ecm_stream_access_criteria+'">'
                  html_ecm1+='<td style="pointer-events: none;"></td>'
                  html_ecm1+='<td style="text-overflow:ellipsis; overflow:hidden;pointer-events: none;"><span><b><font size="1">ECM</font></b> '+ecm_stream_streamid+':'+ecm_stream_alias+'</span></td>'
                  html_ecm1+='<td style="pointer-events: none;"></td>'
                  html_ecm1+='<td><span class="glyphicon glyphicon-cog" onclick="ecmStreamModal('+ecm_stream_streamid+','+ecmg_id+','+rmx_no+');"  style="margin-top: 4%;" data-toggle="modal" data-target="#stream_modal"></span></td>'
                  html_ecm1+='<td><span class="glyphicon glyphicon-trash" onclick="ecmStreamDelete('+ecm_stream_streamid+','+ecmg_id+','+ecm_stream_ecmId+','+ecm_stream_CP_number+','+ecm_stream_access_criteria+');" style="margin-top: 4%;" ></span></td>'
                  html_ecm1+='</tr>'
                  html_ecm1+='</table>'
               
              

                  for(var rmx_id=0;rmx_id<=6;rmx_id++)
                  {
                    if(rmx_id == rmx_no)
                     { 
                       $("#"+ecmg_id+rmx_no).append(html_ecm1);
                      }
                  }
                  
          break;
          case 2:
            var html='<b>Error while adding database</b>';
            $("#message").empty();
            $('#message_Modal').fadeIn();
            $("#message").append(html);
            $('#message_Modal').modal("show");
            $('#message_Modal').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
         
           /*$("#input_message").empty();
           $("#input_message").append(html).css("color","red").fadeIn('slow');
           $('#input_message').delay(1000).fadeOut('slow');*/
          break;
          default:
           var html='<b>Invalid Responce</b>';
             $("#message").empty();
             $('#message_Modal').fadeIn();
            $("#message").append(html);
            $('#message_Modal').modal("show");
            $('#message_Modal').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          
           /*$("#input_message").empty();
           $("#input_message").append(html).css("color","red").fadeIn('slow');
           $('#input_message').delay(1000).fadeOut('slow');*/
        }
      
        type:'POST'
      },
    });
   }  
}
function ECMGSettings(ecmg_channel_id,rmx_no)
{
    $.ajax({
      url: 'index.php?route=common/dashboard/getECMG&token=<?php echo $token; ?>&channel_id=' + ecmg_channel_id,
      error:function()
      {
        var html='<b>Error while Opeaning ECMG Modal</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
         
       /*  $("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
      },
      success: function(data)
      {
        var ecmg_arr= JSON.parse(data);
        $("#ecmg-settings").empty();
        
         var html='<div class="modal-dialog" role="document"  style="width: 70%; align-self: center;">'
         html+='<div class="modal-content" >'
         html+='<div class="modal-body">'
         html+='<table class="genral" style="width:100%; height: 20%;">'
         html+='<form><tbody>'
         html+='<tr><td ><h3 class=" glyphicon glyphicon-cog " style="margin-left: 0px">'+ecmg_arr['Alias']+'</h3></td></tr>'
         html+='<tr><td>Alias:</td>'
         html+='<td><input type="text" class="form-control-default ecmg_modal" id="Alias_settings" value="'+ecmg_arr['Alias']+'" style="margin-top: 4px;" name=""></td>'
         html+='<td></td>'
         html+='<td>Cryptoperiod</td>'
         html+='<td><input type="text" class="form-control-default ecmg_modal" id="Cryptoperiod_settings" value="'+ecmg_arr['Cryptoperiod']+'" style="margin-top: 4px;" name=""> Sec</td>'
         html+='</tr>'
         html+='<tr><td></td><td></td><td></td><td><span id="error_Cryptoperiod_settings" style="color: red"></span></td></tr>'


         html+='<tr>'
         html+='<td>Ip Address:</td>'
         html+='<td><input type="text" class="form-control-default ecmg_modal" id="ipAddress_settings" value="'+ecmg_arr['Ip_Address']+'" style="margin-top: 4px;" name=""></td>'
         html+='<td></td>'
         html+='<td>Super CAS ID:(Hex)</td>'
         html+='<td><input type="text" class="form-control-default ecmg_modal" onfocusout="supercas();" id="super_CAS_id_settings" value="'+ecmg_arr['Super_CAS_Id']+'" style="margin-top: 4px;" name=""></td>'
         html+='</tr>'
         html+='<tr><td></td><td><span id="error_ipaddress_settings" style="color: red"></span></td><td></td>'
         html+='<td><span id="error_super_CAS_id_settings" style="color: red"></span></td>'
         html+='</tr>'

         html+='<tr>'
         html+='<td>Port</td>'
         html+='<td><input type="text" class="form-control-default ecmg_modal" value="'+ecmg_arr['Port']+'" id="Port_settings" style="margin-top: 4px;" name=""></td>'
         html+='<td></td>'
         html+='<td>Channel ID:</td>'
         html+='<td><input type="text" class="form-control-default ecmg_modal" id="Channel_id_settings" value="'+ecmg_arr['ecmg_channel_id']+'" style="margin-top: 4px;" name=""></td>'
         html+='</tr>'
         html+='<tr><td></td><td><span id="error_port_settings" style="color: red"></span></td>'
         html+='<td><span id="error_channel_id_settings" style="color: red"></td>'
         html+='<td></td>'
         html+='</tr>'
         html+='<tr><td></td>'
         html+='<td></td>'
         html+='<td></td><td></td><td></td></tr>'
         html+='<tr><td></td><td></td><td></td><td></td></tr>'
         html+='<tr>'
         html+='<td></td>'
         html+='<td></td>'
         html+='<td></td><td></td><td></td></tr>'
         
         html+='</tbody></table>'
         html+='</div><div class="modal-footer"><button type="button" class="btn btn-default" disabled="Disable" onclick="updateECMG('+ecmg_channel_id+','+rmx_no+');" id = "ECMG_onclick_settings" data-dismiss="modal">APPLY&SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button>  </div></form></div></div>'

        $("#ecmg-settings").append(html);
    
          $('#Alias_settings, #super_CAS_id_settings, #ipAddress_settings,#Port_settings,#Cryptoperiod_settings,#Channel_id_settings').keyup(function() {
          var empty = false;
        
          $('#Alias_settings, #super_CAS_id_settings, #ipAddress_settings, #Port_settings,#Cryptoperiod_settings,#Channel_id_settings').each(function() {
          if ($(this).val() == '') 
           {
            empty = true;
           }
          });
        if (empty) 
         {
          $('#ECMG_onclick_settings').attr('disabled', 'disabled'); 
         } 
        else 
         {
        if(check_super_CAS_id_settings() && check_ipAddress_settings() && check_Channel_id_settings() && check_Port_settings() && check_Cryptoperiod_settings())
          {
            $('#ECMG_onclick_settings').removeAttr('disabled'); 
          }
          else
          {
            $('#ECMG_onclick_settings').attr('disabled', 'disabled');
          }
          }
        });
       },
       type: 'POST'
    });
}
    
function check_super_CAS_id_settings()
{
  var text = $("#super_CAS_id_settings").val().trim();
  var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{0,8}$/i);
  if(text == '')
  {
     $("#error_super_CAS_id_settings").html("Should not be empty");
     $("#error_super_CAS_id_settings").show();
      return false;
  }
  else if(pattern.test(text))
  {
      $("#error_super_CAS_id_settings").hide();
      return true;
  }    
  else
  {
    $("#error_super_CAS_id_settings").html("Invalid Super Cas Id ");
    $("#error_super_CAS_id_settings").show();
      return false;
  }
}
function supercas()
{
 var text1 = $("#super_CAS_id_settings").val().trim();
 if(text1.length <10)
 {
    var sub_beg = text1.substr(0,2);
    var sub_end = text1.substr(2,text1.length);
    while(sub_end.length <8)
    {
      sub_end = "0"+sub_end;
    }
    $("#super_CAS_id_settings").val(sub_beg+sub_end) ;
 }     
}
function check_ipAddress_settings()
{
    var text=$("#ipAddress_settings").val().trim();
    var pattern = new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);
   if (text=='') 
   {
      $("#error_ipaddress_settings").html("Ip Address Should not be empty");
      $("#error_ipaddress_settings").show();
      return false;
   }
   else if (pattern.test(text)) 
   {
     $("#error_ipaddress_settings").hide();
     return true;
   }
  else
   {
    $("#error_ipaddress_settings").html("Invalid Ip Address");
    $("#error_ipaddress_settings").show();
    return false;
   }   
}
function check_Channel_id_settings()
{
   var text1=$("#Channel_id_settings").val().trim();
   if (text1=='') 
   {
      $("#error_channel_id_settings").html("Should not be empty");
      $("#error_channel_id_settings").show();
      return false;
   }
     else if((text1>0) && (text1<65536))
   {
    $("#error_channel_id_settings").hide();
    return true;
   }
   else
   {
    $("#error_channel_id_settings").html("Invalid Channel id");
    $("#error_channel_id_settings").show();
    return false;
   }
}
function check_Port_settings()
{
 var text1=$("#Port_settings").val().trim();
 if (text1=='') 
 {
    $("#error_port_settings").html("Should not be empty");
  $("#error_port_settings").show();
  return false;
 }
 else if(text1>1024 && text1<65536)
 {
  $("#error_port_settings").hide();
  return true;
 }
 else
 {      
  $("#error_port_settings").html("Should be in range 1025 to 65536");
  $("#error_port_settings").show();
  return false;
 }
}
function check_Cryptoperiod_settings()
{
  var text=$("#Cryptoperiod_settings").val().trim();  
    if (text=='') {
        $("#error_Cryptoperiod_settings").html("Should not be empty");
      $("#error_Cryptoperiod_settings").show();
      return false;
     }
     else if ( text==0) {
      $("#error_Cryptoperiod_settings").html(" It Should not be zero");
      $("#error_Cryptoperiod_settings").show();
      return false;
    }
    else if (text<10000 && text>0 ) {
      $("#error_Cryptoperiod_settings").hide();
      return true;
    }
    else
    {
      $("#error_Cryptoperiod_settings").html("Invalid Cryptoperiod (>0 and <9999)");
      $("#error_Cryptoperiod_settings").show();
      return false;
    }
}
function updateECMG(original_id,rmx_no)
{
 ip_Address = $('#ipAddress_settings').val();
 port = $('#Port_settings').val();
 super_CAS_Id = $('#super_CAS_id_settings').val();
 ecmg_Channel_Id = $('#Channel_id_settings').val();
 Alias = $('#Alias_settings').val();
 Cryptoperiod = $('#Cryptoperiod_settings').val();
 

    var res = confirm("Want to update ECMG?");
    if(res)
    {
      $.ajax({
              url:'index.php?route=common/dashboard/updateECMGChannel&token=<?php echo $token; ?>&ip_Address=' + ip_Address+'&port=' +port+'&super_CAS_Id=' +super_CAS_Id + '&ecmg_Channel_Id='+ecmg_Channel_Id+ '&Alias=' + Alias+ '&original_id=' + original_id+ '&Cryptoperiod=' + Cryptoperiod,
      error:function()
      {
         var html='<b>Error while updating ECMG</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
          
         /*$("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
      },
      success: function(data) 
      { 
        if(data == 0 || data == 3)
        {
          
          var html='<b>Error while updating ECMG</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
          
         /*$("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
        }
        else if(data == 2)
        {
          
          var html='<b>ECMG Updated succesfully</b>';
          $("#message").empty();
        /* $("#input_message").empty();
         $("#input_message").append(html).css("color","green").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');
          $('#ECMG_onclick_settings').attr('disabled', 'disabled');*/
            $('#message_Modal').fadeIn();

          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();

         




          
          $(".ecm_div"+ecmg_Channel_Id).empty();
        

          var html_ecm= '<table class="panel-ecmg" data-toggle="collapse" id="ECMG'+ecmg_Channel_Id+'" data-target="#'+ecmg_Channel_Id+''+rmx_no+'">'
                html_ecm+='<colgroup>'
                  html_ecm+='<col style="width: 4%;" />'
                  html_ecm+='<col style="width: 33%;" />'
                  html_ecm+='<col style="width: 5%;" />'
                  html_ecm+='<col style="width: 5%;" />'
                  html_ecm+='<col style="width: 5%;" />'
                html_ecm+='</colgroup>'
                html_ecm+='<tr>'
                  html_ecm+='<td></td>'
                  html_ecm+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><b>'+Alias+'</b></td>'
                  html_ecm+='<td><span class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#ecmg-1plus" id="stream_plus" onclick="onclickECMG('+ecmg_Channel_Id+','+rmx_no+')" ></span></td>'
                  html_ecm+='<td><span class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#ecmg-settings" id="ecm_channel_settings" onclick="ECMGSettings('+ecmg_Channel_Id+')"></span></td>'
                  html_ecm+='<td><span id="stream_delete" class="glyphicon glyphicon-trash"  onclick="onclickDeleteECMG('+ecmg_Channel_Id+')" ></span></td>'
                html_ecm+='</tr>'
              html_ecm+='</table>'
          

              $(".ecm_div"+ecmg_Channel_Id).append(html_ecm);
         
           // $("#ECMG"+ecmg_Channel_Id).replaceWith(html_ecm);
        }  
        },
      type: 'POST'
      });
    }
 }
function onclickDeleteECMG(ecmg_id)
{
  var result = confirm("Want to delete?");
  if(result)
  {
    $.ajax({
      url:'index.php?route=common/dashboard/deleteECMG&token=<?php echo $token; ?>&ecmg_id='+ecmg_id,
      error:function()
      {
         var html='<b>Error While Deleting ECMG</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
          
         /*$("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
      },
      success:function(data)
      {
        if(data == 1)
        {
          var html='<b>ECMG Deleted Succesfully</b>';
           $("#message").empty();
          $('#message_Modal').fadeIn();
           $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
          $(".ecm_div"+ecmg_id).remove();
           /*$("#input_message").empty();
           $("#input_message").append(html).css("color","green").fadeIn('slow');
           $('#input_message').delay(1000).fadeOut('slow');*/

        }
        else
        {
         var html='<b>Error While Deleting ECMG</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
          
         /*$("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/ 
        }
      },
      type: 'POST'
    });
  }    
}
function ecmStreamModal(stream_id,channel_id,rmx_no)
 {
   $.ajax({
     url: 'index.php?route=common/dashboard/getECMStreamData&token=<?php echo $token; ?>&stream_id=' + stream_id+'&channel_id=' +channel_id,
      error:function()
      {
        
         var html='<b>Error while opening modal</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
          
         /*$("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
      },
      success: function(data) 
      {
          $("#stream_modal").empty();
          var ecmg_stream_arr= JSON.parse(data);
          $("#stream_modal").append('<div class="modal-dialog" role="document" style="width: 70%; align-self: center; "><div class="modal-content" ><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h4 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" style="margin-left: 0px">'+ecmg_stream_arr['alias']+'</h4></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" value="'+ecmg_stream_arr['alias']+'" id="ecm_stream_alias_settings" name=""></td><td></td><td>ECM Pid:</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" value="'+ecmg_stream_arr['ecm_pid']+'" id="ecm_pid_settings" ></td></tr><tr><td></td><td><span id="error_stream_alias_settings" style="color: red"></span></td><td></td><td></td></tr><tr><td>CW Group:</td><td><input type="text" class="form-control-default" style="margin-top: 4px;" id="ecm_stream_CW_group_settings" value="'+ecmg_stream_arr['cw_group']+'"></td><td></td><td>Access criteria</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_access_criteria_settings" value="'+ecmg_stream_arr['access_criteria']+'" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_access_criteria_settings" style="color: red"></span></td></tr><tr><td>Stream ID:</td><td><b>'+stream_id+'</b></td><td></td><td>ECM ID</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_ecmId_settings" value="'+ecmg_stream_arr['ecm_id']+'" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_ecmid_settings" style="color:red"></span></td></tr><tr hidden="hidden"><td>CP Number:</td><td>'+ecmg_stream_arr['cp_number']+'</td><td></td><td></td><td></td></tr><tr><td></td><td><span id="error_stream_CP_number_settings" style="color:red"></span></td><td></td><td><span id="error_stream_CW_group_settings" style="color:red"></span></td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" onClick="updateECMStream('+stream_id+','+channel_id+','+ecmg_stream_arr['ecm_id']+','+ecmg_stream_arr['cp_number']+','+rmx_no+','+ecmg_stream_arr['access_criteria']+')" disabled="disabled" id="ecm_stream_save_settings"  data-dismiss="modal">APPLY & SAVE </button><button type="button" class="btn btn-default"  data-dismiss="modal" >Cancel </button></div></div></div>');
            $('#ecm_pid_settings').keyup(function()
            {
              $('#ecm_stream_save_settings').removeAttr('disabled');
            });
          $('#ecm_stream_alias_settings, #ecm_stream_ecmId_settings, #ecm_stream_access_criteria_settings, #ecm_stream_CW_group_settings').keyup(function() 
            {
                var empty = false;
                $('#ecm_stream_alias_settings, #ecm_stream_ecmId_settings, #ecm_stream_access_criteria_settings, #ecm_stream_CW_group_settings').each(function() {
                if ($(this).val() == '') 
                {
                empty = true;
                }
                });
                if (empty) 
                {
                $('#ecm_stream_save_settings').attr('disabled', 'disabled'); 
                } 
                else  
                {
                  if(acceess_criteria() && check_ecmId() && check_cwgroup())
                  {
                    $('#ecm_stream_save_settings').removeAttr('disabled'); 
                  }
                  else
                  {
                    $('#ecm_stream_save_settings').attr('disabled', 'disabled');
                  }
                }
            });
          },
      type: 'POST'
      });
 }   
$(document).on('focusout','#ecm_stream_alias_settings', function ()
 {
    var text=$("#ecm_stream_alias_settings").val().trim();
    if(text=='')
    {
      $("#error_stream_alias_settings").html("Alias Should not be empty");
      $("#error_stream_alias_settings").show();
    }
    else
    {
      $("#error_stream_alias_settings").hide();
    }
  });
function check_ecmId()
{
  var text1=$("#ecm_stream_ecmId_settings").val().trim();
     if (text1=='') 
     {
        $("#error_stream_ecmid_settings").html("Should not be empty");
        return false;
        
     }
     else if(text1 > 0 && text1<1000)
     {
      $("#error_stream_ecmid_settings").hide();
      return true;
     }
     else
     {
      $("#error_stream_ecmid_settings").html("Should be in range 1 to 999");
      $("#error_stream_ecmid_settings").show();
      return false;
     }
}
function check_cwgroup()
{
    var text1=$("#ecm_stream_CW_group_settings").val().trim();
     if (text1=='') 
     {
        $("#error_stream_CW_group_settings").html("Should not be empty");
        return false;
     }
     else if(text1 > 0 && text1<1000)
     {
      $("#error_stream_CW_group_settings").hide();
      return true;
     }
     else
     {
      $("#error_stream_CW_group_settings").html("Should be in range 1 to 999");
      $("#error_stream_CW_group_settings").show();
      return false;
     }
}
function check_cp_number()
{
    var text1=$("#ecm_stream_CP_number_settings").val().trim();
     if (text1=='') 
     {
        $("#error_stream_CP_number_settings").html("Should not be empty");
        
         $("#error_stream_CP_number_settings").show();
         return false;
     }
     else if(text1 > 0 && text1<1000)
     {
      $("#error_stream_CP_number_settings").hide();
      return true;
     }
     else
     {
      $("#error_stream_CP_number_settings").html("Should be in range 1 to 999");
      $("#error_stream_CP_number_settings").show();
      return false;
     }
}
function acceess_criteria()
{
    var text = $("#ecm_stream_access_criteria_settings").val().trim();
    var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{0,10}$/i);
    
      return true;
}
function updateECMStream(stream_id,channel_id,old_ecmid,ecm_stream_CP_number,rmx_no,old_accessCriteria)
{
    var ecm_stream_alias = $("#ecm_stream_alias_settings").val();
    var ecm_stream_access_criteria = $("#ecm_stream_access_criteria_settings").val();
    var ecm_stream_ecmId = $("#ecm_stream_ecmId_settings").val();
    var ecm_stream_CW_group = $("#ecm_stream_CW_group_settings").val();
    var ecm_pid=$("#ecm_pid_settings").val();
   
    var res = confirm("Want to update ECMStream?");
    if(res)
    {
      $.ajax({
      url:'index.php?route=common/dashboard/updateECMStream&token=<?php echo $token; ?>&ecm_stream_alias=' + ecm_stream_alias+'&ecm_stream_access_criteria='+ecm_stream_access_criteria+'&ecm_stream_ecmId='+ecm_stream_ecmId+'&ecm_stream_CW_group='+ecm_stream_CW_group+'&ecm_stream_CP_number='+ecm_stream_CP_number+'&original_streamid='+stream_id+'&original_ecmg_id='+channel_id+'&old_ecmid='+old_ecmid+'&ecm_pid='+ecm_pid,
      error:function()
      {
        
        var html='<b>Error while updating</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
         
        /* $("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
      },
      success:function(data)
      { 

        var data =Number(data);
        switch(data)
        {
         case 0: 
          // location.reload();
       
         
           $("#ecm_"+stream_id+'_'+channel_id+'_'+old_ecmid+'_'+ecm_stream_CP_number+'_'+old_accessCriteria).remove();
 
          var html_ecm1='<table class="panel2 ecm_'+stream_id+'_'+channel_id+'_'+ecm_stream_ecmId+'_'+ecm_stream_CP_number+'_'+ecm_stream_access_criteria+'" id="ecm_'+stream_id+'_'+channel_id+'_'+ecm_stream_ecmId+'_'+ecm_stream_CP_number+'_'+ecm_stream_access_criteria+'"  data-draggable="item" draggable="true" aria-grabbed="false">'
                html_ecm1+='<colgroup>'
                  html_ecm1+='<col style="width: 4%;"/>'
                  html_ecm1+='<col style="width: 33%;"/>'
                  html_ecm1+='<col style="width: 5%;"/>'
                  html_ecm1+='<col style="width: 5%;"/>'
                  html_ecm1+='<col style="width: 5%;"/>'
                html_ecm1+='</colgroup>'
                html_ecm1+='<tr id="ecmRow_'+stream_id+'_'+channel_id+'_'+ecm_stream_ecmId+'_'+ecm_stream_CP_number+'_'+ecm_stream_access_criteria+'">'
                  html_ecm1+='<td style="pointer-events: none;"></td>'
                  html_ecm1+='<td style="text-overflow:ellipsis; overflow:hidden;pointer-events: none;"><span><b><font size="1">ECM</font></b> '+stream_id+':'+ecm_stream_alias+'</span></td>'
                  html_ecm1+='<td style="pointer-events: none;"></td>'
                  html_ecm1+='<td><span class="glyphicon glyphicon-cog" onclick="ecmStreamModal('+stream_id+','+channel_id+','+rmx_no+');"  style="margin-top: 4%;" data-toggle="modal" data-target="#stream_modal"></span></td>'
                  html_ecm1+='<td><span class="glyphicon glyphicon-trash" onclick="ecmStreamDelete('+stream_id+','+channel_id+','+ecm_stream_ecmId+','+ecm_stream_CP_number+','+ecm_stream_access_criteria+');" style="margin-top: 4%;" ></span></td>'
                html_ecm1+='</tr>'
              html_ecm1+='</table>'

        $("#"+channel_id+rmx_no).append(html_ecm1);


              var html='<b>ECM Stream Updated Successfully</b>';
              $("#message").empty();
              $('#message_Modal').fadeIn();
              $("#message").append(html);
              $('#message_Modal').modal("show");
              $('#message_Modal').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
         break;
         case -1:
         var html='<b>Duplicate Ecm Id not allowed</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
         
        /* $("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
         break;
         case -2:
         var html='<b>Server Error</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
         
         /*$("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
         break;
         case 1: 
         var html='<b>Database Error</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
          
         /*$("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
         break;
         default:
         var html='<b>Invalid Responce</b>';
          $("#message").empty();
          $('#message_Modal').fadeIn();
          $("#message").append(html);
          $('#message_Modal').modal("show");
          $('#message_Modal').delay(1000).fadeOut('slow');
          $('.modal-backdrop').fadeOut();
          
         /*$("#input_message").empty();
         $("#input_message").append(html).css("color","red").fadeIn('slow');
         $('#input_message').delay(1000).fadeOut('slow');*/
        }
      
      },
      type:'POST'
    });
   }   
}
//*************************END CAS***********************************//
// START  INPUT **********************************************************************
// ***********************************************************************************

  $(document).ready(function(){

  <?php $RE_NO=0; foreach($Selection_detail as $Selection_value) { ?>
   
 var html='<table id="sel_<?php echo $Selection_value['Selection_Id']?>" data-toggle="collapse " data-target="#RE_collapse<?php echo $Selection_value['Selection_Id']?>" style=" width: 100%; min-height: 3vh;">'
     html+=' <colgroup>'
       html+=' <col style="width:1.4%;"/>'
        html+='<col style="width:2%;" />'
        html+='<col style="width:15%;"/>'
        html+='<col style="width:5%;"/>'
        html+='<col style="width:5%;"/>'
      html+='</colgroup>'
   html+='<tr>'
    html+='<td></td>'

    html+='<td><span><b><?php echo $Selection_value['Selection_name'];?></b></span></td>' 
    html+='<td></td>'
    html+='</tr>'
  html+='</table>'

    html+='<div class="collapse in" id="RE_collapse<?php echo $Selection_value['Selection_Id']?>">'
        <?php foreach($ip_input[$Selection_value['Selection_Id']-1] as $RE_value ){ ?>

        html+='<table class="Re_table" id="channel_<?php echo $RE_NO;?>" data-toggle="collapse"   data-target="#demo1<?php echo $RE_NO;?>" style="white-space:nowrap;  width: 100%; min-height: 3.5vh;margin-bottom: 1%;" onClick="getChannels(<?php echo $RE_value['Id'] ?>,<?php echo $Selection_value['Selection_Id']?>,<?php echo $RE_NO;?>)" >'
            html+='<colgroup>'
              html+='<col style="width: 4%;" />'
              html+='<col style="width: 5%;" />'
              html+='<col style="width: 25%;" />'
              html+='<col style="width: 5%;" />'
              html+='<col style="width: 5%;" />'
            html+='</colgroup>'
            html+='<tr>'
              html+='<td></td>'
              html+='<td style="text-overflow:ellipsis; overflow:hidden;" ><span><?php echo $RE_value['RE_name'];?></span></td>'
              html+='<td> <span class="glyphicon glyphicon-info-sign" id="input_bitrate<?php echo $RE_NO;?>" onmouseover="input_bitrate(<?php echo $RE_NO ?>)"></span></td>'
              html+='<td id="no_of_services<?php echo $RE_NO;?>"></td>'
            
            html+='</tr>'
        html+='</table>'
        html+='<div id="demo1<?php echo $RE_NO;?>" class="collapse searchInput" >'
         
        html+='</div>'
         
        <?php $RE_NO++;  } ?>
       
      html+='</div>'

      <?php if($Selection_value['Selection_Id'] == 1){ ?>
        
         $("#Input_Column1").append(html);
       
        <?php } ?>
        <?php if($Selection_value['Selection_Id'] == 2){ ?>
        
         $("#Input_Column2").append(html);
       
        <?php } ?>
        <?php if($Selection_value['Selection_Id'] == 3){ ?>
        
         $("#Input_Column3").append(html);
       
        <?php } ?>
        <?php if($Selection_value['Selection_Id'] == 4){ ?>
        
         $("#Input_Column4").append(html);
       
        <?php } ?>
        <?php if($Selection_value['Selection_Id'] == 5){ ?>
        
         $("#Input_Column5").append(html);
       
        <?php } ?>
        <?php if($Selection_value['Selection_Id'] == 6){ ?>
        
         $("#Input_Column6").append(html);
       
        <?php } ?>
     <?php }?>
     
});
 function getChannels(input,rmx_no,RE_NO)
  {
    var data=$("#channel_"+RE_NO).attr('aria-expanded');
    if(data!="true")
    {
      $.ajax({
          url: 'index.php?route=common/dashboard/getChannels&token=<?php echo $token; ?>&input='+input+'&rmx_no='+rmx_no,
          
          error:function()
          {
            
            var html='<b>invalid data</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
          },
          success: function(data)
          {
           var data = JSON.parse(data);

           if(data["channelList"].length>0)
           {
              var no_of_services='<b>'+data["channelList"].length+'</b>';
              $("#no_of_services"+RE_NO).empty();
              $("#no_of_services"+RE_NO).append(no_of_services);
           }
          
            if(data["error"]==0){
             $("#demo1"+RE_NO).empty();
              for(i=0;i<data["channelList"].length;i++){
               
                var html='<table class="panel1" id="'+input+'~'+data["channelList"][i]["channelnumber"]+'~'+data["channelList"][i]["channelname"]+'~'+RE_NO+'"  data-draggable="item" draggable="true" aria-grabbed="false" tabindex="0">'
                html+='<colgroup>'
                html+='<col style="width: 2%" />'
                html+='<col style="width: 15%"/>'
                html+='<col style="width: 47%"/>'
                html+='<col style="width: 5%" />'
                html+='<col style="width: 10%"/>'
                
              html+='</colgroup>'          
            html+='<tr>'
                html+='<td style="pointer-events: none;"></td>'
                html+='<td style="pointer-events: none;"><span>'+data["channelList"][i]["channelnumber"]+'</span></td>'
                html+='<td style="pointer-events: none;">'+data["channelList"][i]["channelname"]+'</td>'
                html+='<td><span data-toggle="modal" data-target="#channel_modal" onclick ="inputChinfo('+"'"+data["channelList"][i]["channelname"]+"'"+','+"'"+data["channelList"][i]["channelnumber"]+"'"+','+"'"+input+"'"+','+"'"+RE_NO+"'"+','+"'"+8+"'"+')" class="glyphicon glyphicon-cog"  ></span></td>'
                html+='<td id="image'+data["channelList"][i]["channelnumber"]+','+data["rmx_no"]+','+data["input"]+'"><img class="img-active" src="view/image/sh1.gif" id="image_active'+data["rmx_no"]+''+data["input"]+'"></td>'
            
            html+='</tr>'
            html+='</table>'
            
            $("#demo1"+RE_NO).append(html);
              
              }
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

                $("table.panel1 tr:even").css("background-color","white").click(function(){
                  $(this).css('background-color','orange');
                },function(){
                        $(this).css('background-color','white');     
                  });
            }
            else{
                
                    var html='<b>Services NOT Available</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
            }     
       

         }
       });
    }

} 
 function inputChinfo(ch_name,ch_number,input,RE_NO,no_of_input)
{
   rmx_no=Math.floor((RE_NO/no_of_input))+1;
   input = input%no_of_input;
   $.ajax({
      url: 'index.php?route=common/dashboard/getInputChinfo&token=<?php echo $token; ?>&channel_number='+ch_number+'&input_id='+input+'&rmx_no='+rmx_no+'&targetid=0',
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
      success: function(data)
      {
          if(data)
          {   
            
            var arr= JSON.parse(data);
            $("#channel_modal").empty(); 
            


              var html='<div class="modal-dialog"  style="width: 70%; align-self: center; " >'
              html+='<div class="modal-content" >'
              html+='<div class="modal-body" >' 
              html+='<table class="genral" style="width:100%; height:20%;">'
              html+='<div class="modal-header">'
              html+='<h4 class=" glyphicon glyphicon-cog " id="name" style="margin-left: 0px" "><font>'+ch_name+','+ch_number+'</font></h4>'
              
              html+='</div>'

              html+='<tbody><tr>'
              html+='<td>serviceprovider Name:</td>'
              html+='<td><b>'+arr['serviceprovider']+'</b></td>'
              html+='<td></td> <td></td></tr>'
              html+='<tr> <td>Service Type:</td>' 
               html+='<td id="input_service_type"></td>'
            
              html+='<td></td><td>CA Mode:</td><td><b>Not scrambled</b></td></tr>'
              html+='<tr><td>PMT PID:</td><td><b>'+arr['PMTpid']+'</b></td><td></td>'
              html+='<td>EIT Present:</td><td><b>Not Present</b></td></tr><tr><td>PCR PID</td><td><b>'+arr['PCRpid']+'</b></td><td></td><td>EIT present following:</td><td><b>Not present</b></td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button></div></div></div>'

              $("#channel_modal").append(html);
              serviceType(arr["servicetype"]);
              $('select[name="changeServiceType"] option[value='+arr["servicetype"]+']').attr('selected','selected');
          }  
      },
      type:'POST'
    });


}
function serviceType(num)
{ 
  
 var data=Number(num);
 switch(data)
 {
  case 0: 
      var html='<b>reserved for future use</b>';
      $("#input_service_type").append(html);

  break;
  case 1: 
      var html='<b>digital television service</b>';
      $("#input_service_type").append(html);

  break;
  case 2: 
      var html='<b>digital radio sound service</b>';
      $("#input_service_type").append(html);

  break;
  case 3: 
      var html='<b>Teletext service</b>';
      $("#input_service_type").append(html);

  break;
  case 4: 
      var html='<b>NVOD reference service</b>';
      $("#input_service_type").append(html);

  break;
  case 5: 
      var html='<b>NVOD time-shifted service</b>';
      $("#input_service_type").append(html);

  break;
  case 6: 
      var html='<b>mosaic service</b>';
      $("#input_service_type").append(html);

  break;
  case 7: 
      var html='<b>FM radio service</b>';
      $("#input_service_type").append(html);

  break;
  case 8: 
      var html='<b>DVB SRM service</b>';
      $("#input_service_type").append(html);

  break;
  case 10: 
      var html='<b>advanced codec digital radio</b>';
      $("#input_service_type").append(html);

  break;
  case 11: 
      var html='<b>H.264/AVC mosaic service</b>';
      $("#input_service_type").append(html);

  break;
  case 12: 
      var html='<b>data broadcast service</b>';
      $("#input_service_type").append(html);

  break;
  case 14: 
      var html='<b>RCS Map</b>';
      $("#input_service_type").append(html);

  break;
  case 15: 
      var html='<b>RCS FLS</b>';
      $("#input_service_type").append(html);

  break;
  case 16: 
      var html='<b>DVB MHP service</b>';
      $("#input_service_type").append(html);

  break;
  case 17: 
      var html='<b>MPEG-2 HD digital television</b>';
      $("#input_service_type").append(html);

  break;
  case 22: 
      var html='<b>H.264/AVC SD digital television</b>';
      $("#input_service_type").append(html);

  break;

  case 23: 
      var html ='<b>H.264/AVC SD NVOD time-shifted</b>';
      $("#input_service_type").append(html);
      
  break;
  case 24: 
      var html ='<b>H.264/AVC SD NVOD reference</b>';
      $("#input_service_type").append(html);
      
  break;
  case 25: 
      var html ='<b>H.264/AVC HD digital television</b>';
      $("#input_service_type").append(html);
      
  break;
  case 26: 
      var html ='<b>H.264/AVC HD NVOD time-shifted</b>';
      $("#input_service_type").append(html);
      
  break;
  case 27: 
      var html ='<b>H.264/AVC HD NVOD reference</b>';
      $("#input_service_type").append(html);
      
  break;
  case 28: 
      var html ='<b>H.264/AVC HD digital television</b>';
      $("#input_service_type").append(html);
      
  break;
  case 29: 
      var html ='<b>H.264/AVC HD NVOD time-shifted</b>';
      $("#input_service_type").append(html);
      
  break;
  case 30: 
      var html ='<b>H.264/AVC HD NVOD reference</b>';
      $("#input_service_type").append(html);
      
  break;
  case 31: 
      var html ='<b>HEVC digital television</b>';
      $("#input_service_type").append(html);
      
  break;
  default:
        var html ='<b>Unknown Service Type</b>';
        $("#input_service_type").append(html);
  break;
 }
}
function updatechannelstatus()
{
   for(var i = 1;i<=6;i++){
    id = '#RE_collapse'+i+' div';
    $(id).each(function() {

      var table_RE = $(this);
      var RE_expanded = table_RE.attr('aria-expanded');

      if(RE_expanded=="true")
      { 
        re_id = table_RE.attr('id');
        re_no = re_id.substr(5);
        input = re_no%8;

        rmx_no = (re_no >= 0 && re_no <= 7)?1:((re_no >= 8 && re_no <= 15)?2:((re_no >= 16 && re_no <= 23)?3:(re_no >= 24 && re_no <= 31)?4:(re_no >= 32 && re_no <= 39)?5:6));

        control_fpga=(rmx_no == 1 || rmx_no == 2)?0:((rmx_no == 3 || rmx_no == 4)?1:2);
    
          $.ajax({
            url: 'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&input_id='+input+'&control_fpga='+control_fpga+'&re_no='+re_no+'&rmx_no='+rmx_no+'&targetid=0',
            async:false,
            error:function()
            {
              
            },
            success: function(data)
            { 
               
              if(data != -1)
              {
                if(data== 0 )
                {
                  $(id+' img').each(function() {
                    
                      $('#'+re_id+' img').attr('src','view/image/inactive1.jpeg');
                      $('#'+re_id+' table').attr('draggable','false');
                  });                
                }else if(data > 0 ){
                  $(id+' img').each(function() {
                    
                      $('#'+re_id+' img').attr('src','view/image/sh1.gif');
                       $('#'+re_id+' table').attr('draggable','true');
                  });
                }
              }
            },

          });
      }
      
    });
}
}
// Automatic Refresh
 $(document.body).bind("",function(e){
  stopFunction();
 });
 var myVar;
 function Reload()
 {
  updatechannelstatus();
 
 }
 function stopFunction(){
  clearInterval(myVar);
  myVar= setInterval("Reload()",1000);
 }
 $(document).ready(function(){
  myVar=setInterval("Reload()",1000);
 });
// Automatic Refresh

// END INPUT*********************************************************************
//*******************************************************************************
//START OUTPUT
//*******************************************************************************

 $(document).ready(function(){
    <?php foreach($Qam_detail as $Qam_value ){ ?>
      
   var html_output= '<table class="collapse-panel" id="qam_name<?php echo $Qam_value['Qam_ID'];?>" data-toggle="collapse" data-target="#output-qam<?php echo $Qam_value['Qam_ID'];?>" >'
      html_output+='<colgroup>'
        html_output+='<col style="width: 1%"  />'
        html_output+='<col style="width: 35%" />'
        html_output+='<col style="width: 15%" />'
        html_output+='<col style="width: 10%" />'
      html_output+='</colgroup>'
    html_output+='<tr>'
      html_output+='<td></td>'
      html_output+='<td><span><b><?php echo $Qam_value['Qam_name']?></b></span></td>'
      html_output+='<td></td>'
      html_output+='<td><span id="quad_qam<?php echo $Qam_value['Qam_ID'];?>" data-toggle="modal" data-target="#quad_QAM<?php echo $Qam_value['Qam_ID'];?>" class="glyphicon glyphicon-cog"  onClick="getBaseFreq(<?php echo $Qam_value['Qam_ID'];?>,<?php echo $no_of_output;?>);"></span></td>'
    html_output+='</tr> '
    html_output+='</table>'
    html_output+='<div class="modal fade" id="quad_QAM<?php echo $Qam_value['Qam_ID'];?>" tabindex="-1" role="dialog" data-backdrop="static">'
    html_output+='</div>'
    html_output+='<div class="collapse in" id="output-qam<?php echo $Qam_value['Qam_ID'];?>" >'
 
 <?php foreach($QamFreq_detail as $QamFreq_value ){ ?>
  
    <?php if( $Qam_value['Qam_ID'] == $QamFreq_value['qam_id'] ) { ?>
     html_output+='<table class="freq-table"  data-toggle="collapse" data-target="#channel11<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" style="margin-bottom: 1%;height:3.8vh"  id="freq_table<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">'
      html_output+='<colgroup>'
       html_output+='<col style="width: 3%"  />'
        html_output+='<col style="width: 7%" />'
        html_output+='<col style="width: 14%" />'
        html_output+='<col style="width: 13%" />'
        html_output+='<col style="width: 15%" />'
        html_output+='<col style="width: 10%" />'
         
      html_output+='</colgroup>'
     html_output+='<tr id="freq_out_<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>"  data-draggable="target" aria-dropeffect="none">'

        html_output+='<td  onclick="getActivatedProgs(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>);lock_symbol(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>)"></td>'

        html_output+='<td style="text-overflow:ellipsis; overflow:hidden;" onclick="getActivatedProgs(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>);lock_symbol(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>)"><span> <?php echo $QamFreq_value['freq_name'] ?>  </span></td>'

        html_output+='<td onclick="getActivatedProgs(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>);lock_symbol(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>)"><span class="glyphicon glyphicon-info-sign"  id="output_bitrate<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" onmouseover="output_bitrate(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID']?>)"></span></td>'

         html_output+='<td id="no_of_outputServices<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" onclick="getActivatedProgs(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>);lock_symbol(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>)"> </td>'

        html_output+='<td onclick="getActivatedProgs(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>);lock_symbol(<?php echo $QamFreq_value['freq_ID'] ?>,<?php echo $Qam_value['Qam_ID'] ?>)"><span id="freq<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>"><b><?php echo $QamFreq_value['frequency']?></b></span>MHz</td>'

       html_output+='<td id="Output_Modal_button<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" data-toggle="modal" data-target="#Output_Modal<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>"  class="glyphicon glyphicon-cog" onclick="get_TSDetails(<?php echo $QamFreq_value['freq_ID']?>,<?php echo $QamFreq_value['frequency']?>,<?php echo $Qam_value['Qam_ID'];?>); emmTab(<?php echo $QamFreq_value['freq_ID']?>,<?php echo $Qam_value['Qam_ID'];?>);pid_filter(<?php echo $QamFreq_value['freq_ID']?>,<?php echo $Qam_value['Qam_ID'];?>);get_pid_data(<?php echo $QamFreq_value['freq_ID']?>,<?php echo $Qam_value['Qam_ID'];?>);emmCheck(<?php echo $QamFreq_value['freq_ID']?>,<?php echo $Qam_value['Qam_ID'];?>);getEIT(<?php echo $QamFreq_value['freq_ID']?>,<?php echo $Qam_value['Qam_ID'];?>)"></td>'
      
      html_output+='</tr>'
    html_output+='</table>'
    html_output+='<div class="collapse searchOutput" id="channel11<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">'
      
   

      html_output+='</div>'
     
     <?php } ?>
 
     <?php } ?>

html_output+='</div>'
  
<?php if($Qam_value['Qam_ID']== 0){?>
 $("#Output_Column1").append(html_output);
<?php }?>
<?php if($Qam_value['Qam_ID']== 1){?>
 $("#Output_Column2").append(html_output);
<?php }?>
<?php if($Qam_value['Qam_ID']== 2){?>
 $("#Output_Column3").append(html_output);
<?php }?>
<?php if($Qam_value['Qam_ID']== 3){?>
 $("#Output_Column4").append(html_output);
<?php }?>
<?php if($Qam_value['Qam_ID']== 4){?>
 $("#Output_Column5").append(html_output);
<?php }?>
<?php if($Qam_value['Qam_ID']== 5){?>
 $("#Output_Column6").append(html_output);
<?php }?>     
<?php } ?> 



 });

   
function getActivatedProgs(output,qam_id)
{
  
  var rmx_no=qam_id+1;
  $("#channel11"+output+"_"+qam_id).empty();
  var data=$("#channel11"+output+"_"+qam_id).attr('aria-expanded');

  if(data!= "true")
  {
  var data_length=0;
  for(var input=0;input<=7;input++)
  {
     $.ajax({
          url: 'index.php?route=common/dashboard/getActivatedPrograms&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input='+input+'&output='+output,
          async:false, 
          error:function()
          {
            
            var html='<b>invalid data</b>';
            $("#message").empty();
            $('#message_Modal').fadeIn();
            $("#message").append(html);
            $('#message_Modal').modal("show");
            $('#message_Modal').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut(); 
          },
          success: function(data)
          {
            if(data!= "null")
            {
               var data=JSON.parse(data);
               data_length=data_length+data.length;
                $("#no_of_outputServices"+output+"_"+qam_id).empty();
                $("#no_of_outputServices"+output+"_"+qam_id).append('<b>'+data_length+'</b>');
               for(var i=0;i<data.length;i++)
               {
                 
                  var changed_ch_no=data[i]['new_service_id'];
                  var channelnumber =data[i]['original_service_id'];
                  var targetid=output;
                  
                  var qam_targetid=qam_id;
                  var inputid=input;
                  var changed_ch_name=data[i]['new_name'];
                  var channelname=data[i]['original_name'];
                  var Enable_ch_name=0;
                  var Enable_ch_number=0;

                  if(changed_ch_name!= -1)
                  {
                    Enable_ch_name=1;
                  }
                  if(changed_ch_no!= -1)
                  {
                    Enable_ch_number=1;
                  }
                  var Enable_ch_provider=0;
                  var changed_ch_provider=-1;
                 
                  if(changed_ch_no == '-1'){
                  var html='<div id="output_chModal_'+channelnumber+''+targetid+''+rmx_no+'" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">'
                  html+='</div>'
                  } 
                  if(changed_ch_no != '-1'){ 
                  var html='<div id="output_chModal_'+changed_ch_no+''+targetid+''+rmx_no+'" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">'
                  html+='</div>'
                  }  


                  if(changed_ch_no == '-1'){ 
                  html+='<table class="panel1" id="output_'+channelnumber+'_'+targetid+'_'+qam_targetid+'_'+inputid+'" onclick="sourceInput('+inputid+','+rmx_no+');" data-draggable="target" aria-dropeffect="none">'
                  } 
                  if(changed_ch_no != '-1'){ 

                  html+='<table class="panel1" id="output_'+changed_ch_no+'_'+targetid+'_'+qam_targetid+'_'+inputid+'" onclick="sourceInput('+inputid+','+rmx_no+');" data-draggable="target" aria-dropeffect="none">'
                  }  

                  html+='<colgroup>'
                  html+='<col style="width: 7%"  />'
                  html+='<col style="width: 15%" />'
                  html+='<col style="width: 47%" />'
                  html+='<col style="width: 8%" />'
                  html+='<col style="width: 7%" />'
                  html+='</colgroup>'
                  html+='<tr>'
                  html+='<td></td>'
                  if(changed_ch_no == '-1'){ 

                  html+='<td><span> <font size="2">'+channelnumber+'</font> </span></td>'
                  } 
                  if(changed_ch_no != '-1'){ 
                  html+='<td><span> <font size="2">'+changed_ch_no+'</font> </span></td>'
                  }  

                  if(changed_ch_name == '-1'){ 
                  html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><font size="2">'+channelname+'</font></span></td>'
                  } 
                  if(changed_ch_name != '-1'){ 
                  html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><font size="2">'+changed_ch_name+'</font></span></td>'
                  }

                  html+='<td ><span id="output_info'+channelnumber+'_'+targetid+'_'+qam_targetid+'_'+inputid+'"></span></td>'

                  if(changed_ch_no == '-1'){
                  
                  html+='<td><span id="lock_'+channelnumber+'_'+targetid+'_'+qam_targetid+'_'+inputid+'" class="fa fa-unlock" onclick="scrambling('+channelnumber+','+targetid+','+rmx_no+','+inputid+','+changed_ch_no+')"></span></td>'
                  } 
                  if(changed_ch_no != '-1'){ 
                  html+='<td ><span id="lock_'+changed_ch_no+'_'+targetid+'_'+qam_targetid+'_'+inputid+'" class="fa fa-unlock" onclick="scrambling('+channelnumber+','+targetid+','+rmx_no+','+inputid+','+changed_ch_no+')"></span></td>'
                  }  
                  if(changed_ch_no == '-1'){ 

                  html+='<td><span onclick="outputChinfo('+"'"+channelname+"'"+','+"'"+channelnumber+"'"+','+"'"+inputid+"'"+','+"'"+rmx_no+"'"+','+"'"+targetid+"'"+','+"'"+qam_targetid+"'"+','+"'"+changed_ch_no+"'"+','+"'"+changed_ch_name+"'"+','+"'"+Enable_ch_name+"'"+','+"'"+Enable_ch_number+"'"+')"  class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#output_chModal_'+channelnumber+''+targetid+''+rmx_no+'"></span> </td>'


                  } 
                  if(changed_ch_no != '-1'){ 
                  html+='<td><span onclick="outputChinfo('+"'"+channelname+"'"+','+"'"+channelnumber+"'"+','+"'"+inputid+"'"+','+"'"+rmx_no+"'"+','+"'"+targetid+"'"+','+"'"+qam_targetid+"'"+','+"'"+changed_ch_no+"'"+','+"'"+changed_ch_name+"'"+','+"'"+Enable_ch_name+"'"+','+"'"+Enable_ch_number+"'"+')"  class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#output_chModal_'+changed_ch_no+''+targetid+''+rmx_no+'"></span> </td>'
                  } 

                  html+='<td><span onclick="deleteOutputChannel('+channelnumber+','+changed_ch_no+','+targetid+','+inputid+','+rmx_no+');" class="glyphicon glyphicon-trash"></span> </td>'


                  html+=' </tr>'
                  html+='</table>'
                  $("#channel11"+targetid+"_"+qam_targetid).append(html);

            

               }
             
            }
           /* <?php foreach($Allscrambledata as $allscrambledata){ ?>
                 var q_id=<?php echo $allscrambledata['rmx_no'];?> - 1;
                 var chNumber=<?php echo $allscrambledata['programNumbers'];?>;
                 var inp=<?php echo $allscrambledata['input'];?>;
                 var out=<?php echo $allscrambledata['output'];?>;
                if(q_id == qam_targetid && out ==targetid)
                {
                   if(<?php echo $allscrambledata['scramble'];?> == 1)
                   {  
                    $("#lock_"+chNumber+"_"+out+"_"+q_id+"_"+inp).addClass('glyphicon glyphicon-lock').removeClass('fa fa-unlock');
                   }
                 
                 }  
             <?php } ?>*/
          },
      });
 
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

                $("table.panel1 tr:even").css("background-color","white").click(function(){
                  $(this).css('background-color','orange');
                },function(){
                        $(this).css('background-color','white');     
                  });
      }  
 }

}
function lock_symbol(output,qam_id)
{
  var rmx_no=qam_id+1;
   $.ajax({
          url: 'index.php?route=common/dashboard/lock_scramble&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&output='+output,
          error:function()
          {
            var html='<b>invalid data</b>';
            $("#message").empty();
            $('#message_Modal').fadeIn();
            $("#message").append(html);
            $('#message_Modal').modal("show");
            $('#message_Modal').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          },
          success: function(data)
          {
            data=JSON.parse(data);
           
           for(i=0;i<data.length;i++)
           {
              
              if(data[i]['scramble'] == 1)
                   {  
                    $("#lock_"+data[i]['programNumbers']+"_"+output+"_"+qam_id+"_"+data[i]['input']).addClass('glyphicon glyphicon-lock').removeClass('fa fa-unlock');
                   }
           }

          },
        });
}
//QAM-SETTING-MODAL
function getBaseFreq(qam_id,no_of_output)
{
   var rmx_no=qam_id+1;
      $.ajax({
          url: 'index.php?route=common/dashboard/getBaseFreq&token=<?php echo $token; ?>&rmx_no='+rmx_no,
          error:function()
          {
            
            var html='<b>invalid data</b>';
            $("#message").empty();
            $('#message_Modal').fadeIn();
            $("#message").append(html);
            $('#message_Modal').modal("show");
            $('#message_Modal').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          },
          success: function(data)
          {
            if(data==1)
            {
             $("#quad_QAM"+qam_id).empty();
             var html='<div class="modal-dialog" role="document" style="width: 80%; align-self: center;" ><div class="modal-content"><div class="modal-body"><table class="genral" style="width:100%; height: 25%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog "  style="margin-left: 0px">2:quad QAM</h3></td></tr><tr><td>Hw Major version:</td><td>NA</td><td>Base frequency:</td><td><input type="text" class="form-control-default" id="Base_Frequency'+qam_id+'" style="margin-top: 4px;" name="NA" value="NULL">MHz</td></tr><tr><td>Hw minimum version:</td><td>NA</td><td>Channel bandwidth:</td><td>8Mhz</td></tr><tr><td>Standard:</td><td><select id="quad_Standard"><option>DVB-CSA/TS</option></select></td><td>Default symbol rate: </td><td><input type="text" class="form-control-default" id="Default_symbol_rate" style="margin-top: 4px;" name="" value="NULL">MBd</td></tr><tr><td>Payload RX bitrate:</td><td></td><td>Payload TX bitrate:</td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" id="QUAD_QAM'+qam_id+'"  disabled="disabled" >SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button></div></div></div>'
             $("#quad_QAM"+qam_id).append(html);
            }
             else
             {
                 var data = JSON.parse(data);
              
                 $("#quad_QAM"+qam_id).empty();
                 var html='<div class="modal-dialog" role="document" style="width: 80%; align-self: center;" ><div class="modal-content"><div class="modal-body"><table class="genral" style="width:100%; height: 25%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " style="margin-left: 0px">2:quad QAM</h3></td></tr><tr><td>Hw Major version:</td><?php if($maj_ver){?><td><b><?php echo $maj_ver;?></b></td><?php } ?><?php if(!$maj_ver){?><td><b>NA</b></td><?php } ?><td>Base frequency:</td><td><input type="text" class="form-control-default" id="Base_Frequency'+qam_id+'" style="margin-top: 4px;" name="" value='+data['center_frequency']+'>MHz</td></tr><tr><td></td><td></td><td></td><td id="error_baseFreq'+qam_id+'" style="color:red"></td></tr><tr><td>Hw minimum version:</td><?php if($min_ver){?><td><b><?php echo $min_ver; ?></b></td><?php } ?><?php if(!$min_ver){?><td><b>NA</b></td><?php } ?><td>Channel bandwidth:</td><td>8Mhz</td></tr><tr><td>Standard:</td><td><select id="quad_Standard"><option>DVB-CSA/TS</option></select></td><td>Default symbol rate: </td><td><input type="text" class="form-control-default" id="Default_symbol_rate" style="margin-top: 4px;" name="" value="6.875">MBd</td></tr><tr><td>Payload RX bitrate:</td><td></td><td>Payload TX bitrate:</td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" id="QUAD_QAM'+qam_id+'" onClick="validateFrequencies(Base_Frequency'+qam_id+','+qam_id+',<?php echo $no_of_output;?>,'+data['center_frequency']+');" disabled="disabled" >SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button></div></div></div>'
                  $("#quad_QAM"+qam_id).append(html);
            
                $("#Base_Frequency"+qam_id).keyup(function() {
                    var empty = false;
                    $("#Base_Frequency"+qam_id).each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $("#QUAD_QAM"+qam_id).attr('disabled', 'disabled'); 
                      } else {
                            $("#QUAD_QAM"+qam_id).removeAttr('disabled');
                      }
                  });
              }
          },
          type:'POST'
        });  
}
function validateFrequencies(basefrequency_name,qam_id,no_of_output,old_freq)
  {
    var center_frequency = basefrequency_name.value;
    var flag=0;
    var RMX_NO=qam_id+1;
 for(var rmx_no=1;rmx_no<=6;rmx_no++)
 { 
  if(RMX_NO != rmx_no)
  {
      $.ajax({
          url: 'index.php?route=common/dashboard/getBaseFreq&token=<?php echo $token; ?>&rmx_no='+rmx_no,
          async:false,
          error:function()
          {
            var html='<b>invalid data</b>';
            $("#message").empty();
            $('#message_Modal').fadeIn();
            $("#message").append(html);
            $('#message_Modal').modal("show");
            $('#message_Modal').delay(1000).fadeOut('slow');
            $('.modal-backdrop').fadeOut();
          },
          success: function(data)
          {
            var data = JSON.parse(data);
            
           
                 if((center_frequency < (data['center_frequency']-28)) || (center_frequency > (data['center_frequency']+28)))
                  {
                   flag=1;
                  
                  }
                  else{
                    flag=0;
                  }
          },
           type:'POST'
        });
  }
    }
         if(flag==1)
              {
                addBaseFreq(basefrequency_name,qam_id,no_of_output,old_freq);
              }
              else
              {
                
                 var html='<b>Frequency already exist in this range</b>';
                  $("#message").empty();
                  $('#message_Modal').fadeIn();
                  $("#message").append(html);
                  $('#message_Modal').modal("show");
                  $('#message_Modal').delay(1000).fadeOut('slow');
                  $('.modal-backdrop').fadeOut();

              }
  } 
function addBaseFreq(basefrequency_name,Qam_ID,no_of_output,old_freq)
{
  $("#error_baseFreq"+Qam_ID).hide();
  var basefrequency = basefrequency_name.value; 

  if(old_freq != basefrequency){
       if(basefrequency.trim() =='')
       {
        $("#error_baseFreq"+Qam_ID).html("Enter Base Frequency");
        $("#error_baseFreq"+Qam_ID).show();
       }
       else if(basefrequency%2 != 0)
       {
        $("#error_baseFreq"+Qam_ID).html("Base Frequency Should be Even Number");
        $("#error_baseFreq"+Qam_ID).show();
       }
       else if(basefrequency.trim() == 0)
       {
          $("#error_baseFreq"+Qam_ID).html("Base Frequency Should not be 0");
          $("#error_baseFreq"+Qam_ID).show();
          
       }
       else if(basefrequency<50 || basefrequency >872)
       {
        $("#error_baseFreq"+Qam_ID).html("Base Frequency Should be in the Range of 50 and 872");
        $("#error_baseFreq"+Qam_ID).show();
       }
       else
        {
          $("#error_baseFreq"+Qam_ID).hide();
        $.ajax({
        url:'index.php?route=common/dashboard/addBaseFrequency&token=<?php echo $token; ?>&basefrequency='+basefrequency+'&Qam_ID='+Qam_ID,
        error:function()
        {
          
          var html='<b>Error While adding basefrequency</b>';
          $("#message_delete").empty();
          $("#message_delete").append(html).css("color","red").fadeIn('slow');
          $('#message_delete').delay(1000).fadeOut('slow');

        },
        success: function(data) 
        {
          if(data)
          {
             $.ajax({
                       url:'index.php?route=common/dashboard/getFrequencies&token=<?php echo $token; ?>&no_of_output='+no_of_output+'&basefrequency='+basefrequency+'&Qam_ID='+Qam_ID,
                      error:function()
                      {
                        
                        var html='<b>Error While Setting basefrequency</b>';
                        $("#message_delete").empty();
                        $("#message_delete").append(html).css("color","red").fadeIn('slow');
                        $('#message_delete').delay(1000).fadeOut('slow');
                      },
                      success: function(data) 
                      {
                        if(data)
                        {
                          var html='<b>Basefrequency Updated Succesfully</b>';
                          $("#message").empty();
                          $('#message_Modal').fadeIn();
                          $("#message").append(html);
                          $('#message_Modal').modal("show");
                          $('#message_Modal').delay(1000).fadeOut('slow');
                          $('.modal-backdrop').fadeOut();
                           window.location.reload();
                        }
                        else
                        {
                          
                          var html='<b>Error While Changing Base Frequency</b>';
                          $("#message_delete").empty();
                          $("#message_delete").append(html).css("color","red").fadeIn('slow');
                          $('#message_delete').delay(1000).fadeOut('slow');
                        }
                      },
                      type: 'POST'
                  });  
          }
          else
          {
            
            var html='<b>Error While Updating</b>';
            $("#message_delete").empty();
            $("#message_delete").append(html).css("color","red").fadeIn('slow');
            $('#message_delete').delay(1000).fadeOut('slow');
          }
        },
        type: 'POST'
        });
      }
    }
}
//QAM-SETTING-MODAL
//QAM-FREQ-MODAL
 function get_TSDetails(output,frequency,qam_id)
{
  rmx_no=qam_id+1;
  channel_number=output+1;
  $.ajax({
    url:'index.php?route=common/dashboard/get_TSDetails&token=<?php echo $token;?>&output='+output+'&rmx_no='+rmx_no,

    error:function()
    {
      
      var html='<b>Connection Error</b>';
        $("#message_delete").empty();
        $("#message_delete").append(html).css("color","red").fadeIn('slow');
        $('#message_delete').delay(1000).fadeOut('slow');
    },
    success:function(data)
    { 
          switch(data)
          {
            case 1: 
                    var html='<b>Error while getting TS details</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
            break;
            case -1: 
                    var html='<b>Error while getting Modulation</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
            break;
            case -2:
                    var html='<b>Error while getting Gain</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
            break;
            case -3:
                    var html='<b>Error while getting Symbol Rate</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
            break;
            case -4:
                    var html='<b>Error while getting Bit Stream</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
            break;
            case -5:
                    var html='<b>Error while getting NIT Mode</b>';
                    $("#message").empty();
                    $('#message_Modal').fadeIn();
                    $("#message").append(html);
                    $('#message_Modal').modal("show");
                    $('#message_Modal').delay(1000).fadeOut('slow');
                    $('.modal-backdrop').fadeOut();
            break;
            default:;
          }
          var data = JSON.parse(data);

        
            var symbolRate=data['FsymbolRate']/1000;
            symbolRate=symbolRate/1000; 
            symbolRate=symbolRate.toFixed(3);
            $("#General"+output+'_'+qam_id).empty();

            var html = '<table class="genral" style="width:100%; height: 45%;"><tbody><tr><td>Gain</td><td><select name="Gain" id="Gain_'+qam_id+'_'+output+'"><option value="255">1.99</option><option value="128">1.00</option><option value="64">0.50</option></select></td><td>Roll Off</td><td><select id="Roll_Off_'+qam_id+'_'+output+'" name="Roll_Off"><option value="0">0.12</option><option value="1">0.18</option><option value="2">0.15</option><option value="3">0.13</option></select></td></tr><tr><td>Modulation:</td><td><select name="Modulation" id="quad_modulation_'+qam_id+'_'+output+'"><option value="0">16-QAM</option><option value="1">32-QAM</option><option value="2">64-QAM</option><option value="3">128-QAM</option><option value="4" >256-QAM</option></select></td><td>Symbol rate</td><td><input type="text" class="form-control-default" style="margin-top: 4px;" value='+symbolRate+' id="symbolRate_'+qam_id+'_'+output+'">MBD</td></tr><tr><td></td><td></td><td></td><td><span id="error_symbolRate_'+qam_id+'_'+output+'" style="color:red;"></span></td></tr><tr><td>Transport stream ID</td><td><input id="TSID_'+qam_id+'_'+output+'" type="text" class="form-control-default" style="margin-top: 4px;" value='+data['uTS_Id']+'></td><td>Bit Stream </td><td><b>'+data['bitStream']+'</b></td></tr><tr><td></td><td><span id="error_TSID_'+qam_id+'_'+output+'" style="color:red;"></span></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td><span id="error_org_net_ID_'+qam_id+'_'+output+'" style="color:red;"></span></td></tr><tr><td>Frequency</td><td>'+frequency+'<b>MHz</b></td><td>Output Spectrum</td><td><select style="margin-top: 4px;" name="invert_IQ" id="Invert_IQ_'+qam_id+'_'+output+'"><option value="0">Normal</option><option value="1">Inverted</option></select></td></tr><tr class="blank_row"></tr><tr><td>EIT Present</td><td><input type="checkbox" id="EIT_checkbox_'+qam_id+'_'+output+'"/></td></tr>'
           
            html +='<tr class="blank_row"></tr></tbody></table>'
         
         if(data['IpOutputChannel'].length==0)
         {
           html+='<div class="blank_row"></div><div align="left"><button type="button" id="streaming_cheackbox'+qam_id+''+channel_number+'" type="checkbox" class="accordion"  data-toggle="collapse" data-target="#IP_streaming'+qam_id+''+channel_number+'">IP streaming</button></div><div class="blank_row"></div><div class="collapse out" id="IP_streaming'+qam_id+''+channel_number+'"><table class="genral" style="width:80%;"><colgroup><col style="width: 15%"/><col style="width: 15%"/><col style="width: 5%"/><col style="width: 10%"/><col style="width: 10%"/></colgroup>'
              
                html+='<tr class="blank_row"></tr><tr class="" id=""><td><span>IP</span><input id="ipAddress_streaming'+rmx_no+channel_number+'" type="text" class="ip" style="margin-left:2%" ></td><td><span>PORT</span><input id="ip_port'+rmx_no+channel_number+'" type="text" class="port"  style="margin-left:2%;" ></td>'

               html+='<td><button type="button" class="add_ip" data-dismiss="modal" onClick="addIP('+qam_id+','+channel_number+');" id="addIP'+qam_id+'_'+channel_number+'">Add</button></td></tr>'
               html+='<tr>'
               html+='<td style="color:red" id="ip_error'+qam_id+'_'+channel_number+'"></td>'
               html+='<td style="color:red" id="port_error'+qam_id+'_'+channel_number+'"></td>'
               html+='<td></td>'
               html+='</tr>'
               html+='</table></div>'
         }
         else{
              var ip = "'"+data['IpOutputChannel'].Ip_Address+"'"; 
              ip_with_unders = ip.replace(/\./g,'_');
              ip_with_unders = ip_with_unders.replace(/\'/g,'');
             
              var port = data['IpOutputChannel'].Port;
              var channel_no = data['IpOutputChannel'].channel_no;
              var Qam_id= data['IpOutputChannel'].Qam_id;
              var id = data['IpOutputChannel'].id;
                html+='<div class="blank_row"></div><div align="left"><button type="button" id="streaming_cheackbox'+qam_id+''+channel_number+'" type="checkbox" class="accordion"  data-toggle="collapse" data-target="#IP_streaming'+qam_id+''+channel_number+'">IP streaming</button></div><div class="blank_row"></div><div class="collapse in" id="IP_streaming'+qam_id+''+channel_number+'"><table class="genral" style="width:80%;"><colgroup><col style="width: 15%"/><col style="width: 15%"/><col style="width: 5%"/><col style="width: 10%"/><col style="width: 10%"/></colgroup>'

               html+='<tr class="blank_row"></tr><tr class="IP_row" id="IP_row'+rmx_no+'_'+ip_with_unders+'_'+channel_number+'"><td><span>IP</span><input id="ipAddress_streaming'+rmx_no+'_'+ip_with_unders+'_'+channel_number+'" type="text" class="ip" value='+ip+' style="margin-left:2%" ></td><td><span>PORT</span><input id="ip_port'+rmx_no+''+port+''+channel_number+'" type="text" class="port"  style="margin-left:2%;" value='+port+' ></td>'


               html+='<td><button type="button" class="" data-dismiss="modal" onClick="deleteIP('+channel_number+','+rmx_no+','+port+','+ip+')">Delete</button></td><td><button type="button" id="ip_save'+rmx_no+'~'+channel_number+'~'+port+'~'+ip+'" data-dismiss="modal" onclick="updateipStream('+rmx_no+','+port+','+channel_no+','+id+','+ip+');">Update</button></td></tr></table></div>' 
         }
          
            html+='<div align="right"><button type="button" class="btn btn-default" onclick="set_TS_ID('+output+','+data['uTS_Id']+','+rmx_no+','+qam_id+');changeModulation('+qam_id+','+output+','+data['Qam_no']+');setSymbolRate('+rmx_no+','+output+','+data['FsymbolRate']+','+data['Rolloff']+');confGain('+rmx_no+','+output+','+data['Gain']+','+data['invert_IQ']+');EnableEIT('+rmx_no+','+output+');" disabled="disabled"  id="genral_save_'+qam_id+'_'+output+'" data-dismiss="modal">APPLY & SAVE</button><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>'

            $("#General"+output+'_'+qam_id).append(html);

            $('select[name="Modulation"] option[value='+data['Qam_no']+']').attr('selected','selected');
            $('select[name="invert_IQ"] option[value='+data['invert_IQ']+']').attr('selected','selected');
           
            $('select[name="Gain"] option[value='+data['Gain']+']').attr('selected','selected');
            $('select[name="Roll_Off"] option[value='+data['Rolloff']+']').attr('selected','selected');
            $("#nitMode_"+qam_id+"_"+output).change(function(){
               $("#genral_save_"+qam_id+"_"+output).removeAttr('disabled');
            }); 
            $("#Gain_"+qam_id+"_"+output).change(function(){
               $("#genral_save_"+qam_id+"_"+output).removeAttr('disabled');
            });    
            $("#symbolRate_"+qam_id+"_"+output).keyup(function() { 
               $("#genral_save_"+qam_id+"_"+output).removeAttr('disabled'); 
            });  
           
              $("#TSID_"+qam_id+"_"+output).keyup(function() { 
                    var empty = false;
                    $("#TSID_"+qam_id+"_"+output).each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $("#genral_save_"+qam_id+"_"+output).attr('disabled', 'disabled'); 
                      } else {
 
                       if(check_TSID(qam_id,output))
                        {
                          $("#genral_save_"+qam_id+"_"+output).removeAttr('disabled'); 
                        }
                        else
                        {
                          $("#genral_save_"+qam_id+"_"+output).attr('disabled', 'disabled');
                        }
                      }
                  });
               
       
         $("#ipAddress_streaming"+rmx_no+channel_number).keyup(function() { 
                    var empty = false;
                    $("#ipAddress_streaming"+rmx_no+channel_number).each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if(empty) 
                      {
                      $("#addIP"+qam_id+"_"+channel_number).attr('disabled', 'disabled'); 
                      } else {
 
                       if(check_IPout(rmx_no,channel_number))
                        {
                          $("#addIP"+qam_id+"_"+channel_number).removeAttr('disabled'); 
                        }
                        else
                        {
                          $("#addIP"+qam_id+"_"+channel_number).attr('disabled', 'disabled');
                        }
                      }
                  });
         $("#ip_port"+rmx_no+channel_number).keyup(function() { 
                    var empty = false;
                    $("#ip_port"+rmx_no+channel_number).each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if(empty) 
                      {
                      $("#addIP"+qam_id+"_"+channel_number).attr('disabled', 'disabled'); 
                      } else {
 
                       if(check_port_IPout(rmx_no,channel_number))
                        {
                          $("#addIP"+qam_id+"_"+channel_number).removeAttr('disabled'); 
                        }
                        else
                        {
                          $("#addIP"+qam_id+"_"+channel_number).attr('disabled', 'disabled');
                        }
                      }
                  });
       
               $("#quad_modulation_"+qam_id+"_"+output).change(function () {  
                     $( "#genral_save_"+qam_id+"_"+output).removeAttr('disabled');

                 });
                 $("#Invert_IQ_"+qam_id+"_"+output).change(function () {  
                     $("#genral_save_"+qam_id+"_"+output).removeAttr('disabled');
                 });
                  $("#Roll_Off_"+qam_id+"_"+output).change(function () {  
                     $("#genral_save_"+qam_id+"_"+output).removeAttr('disabled');
                 });
              if(qam_id== Qam_id && channel_number== channel_no)
              {
                // $("#streaming_cheackbox"+qam_id+channel_number).attr('checked','checked');
                $("#IP_streaming"+qam_id+channel_number).removeClass("collapse out");
              }
              $("#EIT_checkbox_"+qam_id+'_'+output).click(function(){

                 $("#genral_save_"+qam_id+"_"+output).removeAttr('disabled'); 
              });
           
    },
    type: 'POST'
  });
}
function EnableEIT(rmx_no,output)
{
  var qam_id=rmx_no-1;
 
  if($("#EIT_checkbox_"+qam_id+"_"+output).prop('checked') == true)
  {
    var EIT_value=1;
    
  }
  else
  {
    var EIT_value=0;
  }

  $.ajax({
    url:'index.php?route=common/dashboard/EnableEIT&token=<?php echo $token;?>&EIT_value='+EIT_value+'&output='+output+'&rmx_no='+rmx_no,
    error:function()
    {
      var html='<b>Error while Updating EIT</b>';
      $("#message_delete").empty();
      $("#message_delete").append(html).css("color","red").fadeIn('slow');
      $('#message_delete').delay(1000).fadeOut('slow');
    },
    success:function(data)
    {
     if(data==1)
     {
       if(EIT_value==1)
       {
        var html='<b>EIT Enabled</b>';  
       }
       else
       {
        var html='<b>EIT Disabled</b>';
       }
      
      $("#message_delete").empty();
      $("#message_delete").append(html).css("color","green").fadeIn('slow');
      $('#message_delete').delay(1000).fadeOut('slow');
     }
     else
     {
      alert(data);
     }
     
    },
  });
}
function getEIT(output,qam_id)
{
  $.ajax({
    url:'index.php?route=common/dashboard/getEIT&token=<?php echo $token;?>&output='+output+'&qam_id='+qam_id,
    error:function()
    {
      var html='<b>Connection Error</b>';
      $("#message_delete").empty();
      $("#message_delete").append(html).css("color","red").fadeIn('slow');
      $('#message_delete').delay(1000).fadeOut('slow');
    },
    success:function(data)
    {
     
    if(data==1)
    {
      $("#EIT_checkbox_"+qam_id+"_"+output).attr('checked','checked');
    }

    },
  });
}
function check_TSID(qam_id,output)
{
   var text1=$("#TSID_"+qam_id+"_"+output).val().trim();
     if (text1=='') {
        $("#error_TSID_"+qam_id+"_"+output).html("TS ID Should not be empty");
      $("#error_TSID_"+qam_id+"_"+output).show();
      return false;
     }
    else if (text1>0 && text1<65536 ) {
            $("#error_TSID_"+qam_id+"_"+output).hide();
      return true;
    }
    else
    {
      $("#error_TSID_"+qam_id+"_"+output).html("Invalid TS ID(>0 and <65536)");
      $("#error_TSID_"+qam_id+"_"+output).show();
      return false;
    } 
}

function check_IPout(rmx_no,channel_number)
{
var qam_id=rmx_no-1;
var ippattern=new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);
var ip=$("#ipAddress_streaming"+rmx_no+channel_number).val();
     if (ip=='') {
        $("#ip_error"+qam_id+"_"+channel_number).html("IP Should not be empty");
        $("#ip_error"+qam_id+"_"+channel_number).show();
      return false;
     }
    else if (ippattern.test(ip) ) {
            $("#ip_error"+qam_id+"_"+channel_number).hide();
      return true;
    }
    else
    {
      $("#ip_error"+qam_id+"_"+channel_number).html("Invalid IP address");
      $("#ip_error"+qam_id+"_"+channel_number).show();
      return false;
    }
}
function check_port_IPout(rmx_no,channel_number)
{
  var qam_id=rmx_no-1;
   var port=$("#ip_port"+rmx_no+channel_number).val().trim();
  if (port=='') {
      $("#port_error"+qam_id+"_"+channel_number).html("Port Number Should not be empty");
      $("#port_error"+qam_id+"_"+channel_number).show();
      return false;
   }
  else if (port>1024 && port<65537 ) {
      $("#port_error"+qam_id+"_"+channel_number).hide();
      return true;
  }
  else
   {
      $("#port_error"+qam_id+"_"+channel_number).html("Invalid Port Number(>1024 and <65536)");
      $("#port_error"+qam_id+"_"+channel_number).show();
      return false;
   }
}
function set_TS_ID(output,TS_ID,rmx_no,qam_id)
{
 Set_TSID = $("#TSID_"+qam_id+"_"+output).val();
 

  if((TS_ID!=Set_TSID))
 {
  $.ajax({
    url:'index.php?route=common/dashboard/set_TS_ID&token=<?php echo $token;?>&Set_TSID='+Set_TSID+'&output='+output+'&rmx_no='+rmx_no,
    error:function()
    {
      var html='<b>Error while Updating TSID</b>';
      $("#message_delete").empty();
      $("#message_delete").append(html).css("color","red").fadeIn('slow');
      $('#message_delete').delay(1000).fadeOut('slow');
    },
    success:function(data)
    {
       
      if(data==1)
      {
        
        var html='<b>TS ID Updated Succesfully </b>';
        $("#message_delete").empty();
        $("#message_delete").append(html).css("color","green").fadeIn('slow');
        $('#message_delete').delay(1000).fadeOut('slow');
      }
      else if(data==2)
      {
        
          var html='<b>TS ID already exist</b>';
          $("#message_delete").empty();
          $("#message_delete").append(html).css("color","red").fadeIn('slow');
          $('#message_delete').delay(1000).fadeOut('slow'); 
      }
      else
      {
        var html='<b>'+data+'</b>';
        $("#message_delete").empty();
        $("#message_delete").append(html).css("color","red").fadeIn('slow');
        $('#message_delete').delay(1000).fadeOut('slow');
      }
    },
    type: 'POST'
  });
  }
}
function changeModulation(qam_id,output,modulation)
{
   var Modulation=$("#quad_modulation_"+qam_id+"_"+output).val();
   if(Modulation!=modulation)
   {
   
   var rmx_no=qam_id+1;
   $.ajax({  
        url:'index.php?route=common/dashboard/changeModulation&token=<?php echo $token;?>&qam_no='+Modulation+'&output='+output+'&rmx_no='+rmx_no,
        error:function()
        {
         
          var html='<b>Invalid Data</b>';
          $("#message_delete").empty();
          $("#message_delete").append(html).css("color","red").fadeIn('slow');
          $('#message_delete').delay(1000).fadeOut('slow');
        },
        success: function(data)
        {
          if(data==0)
          {
            var html='<b>Modulation Changed Succesfully</b>';
            $("#message_delete").empty();
            $("#message_delete").append(html).css("color","green").fadeIn('slow');
            $('#message_delete').delay(1000).fadeOut('slow');    
          }
          else
          {
            
              var html='<b>Error While Changing Modulation</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          }
        },
        type:'POST'
      });
   }
}

function setSymbolRate(rmx_no,output,symbolRate,Rolloff)
{
  var qam_id=rmx_no-1;
  var Roll_Off = $("#Roll_Off_"+qam_id+"_"+output).val();
  var newSymbolRate=$("#symbolRate_"+qam_id+"_"+output).val();
  var newSymbolRate=newSymbolRate*1000*1000;
  if(symbolRate != newSymbolRate || Roll_Off!=Rolloff)
  {
    if(newSymbolRate >= 5000000 && newSymbolRate <= 6960000)
    {
      $("#error_symbolRate_"+qam_id+"_"+output).hide();
      $.ajax({
          url: 'index.php?route=common/dashboard/set_symbolRate&token=<?php echo $token; ?>&output='+output+'&newSymbolRate='+newSymbolRate+'&rmx_no='+rmx_no+'&Roll_Off='+Roll_Off,
          error: function() 
          {
              var html='<b>Invalid Data</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             
              var html='<b>Configuration Changed successfully</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
             else
            {
              var html='<b>Error While Changing Configuration</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
          },
          type: 'POST'
          }); 
    
  }
  else
  {
    
      $("#error_symbolRate_"+qam_id+"_"+output).html("Invalid Symbol Rate(>=5.000 and <6.966)");
      $("#error_symbolRate_"+qam_id+"_"+output).show();
   
  }  
  }
}
function confGain(rmx_no,output,Gain,Invert_IQ)
{
   mute=0;
   sin=0;
   var qam_id=rmx_no-1;
  gain = $("#Gain_"+qam_id+"_"+output).val();
  invert_IQ=$("#Invert_IQ_"+qam_id+"_"+output).val();
  if(gain!=Gain || invert_IQ!=Invert_IQ)
  {
    $.ajax({
          url: 'index.php?route=common/dashboard/confGain&token=<?php echo $token; ?>&output='+output+'&gain='+gain+'&rmx_no='+rmx_no+'&invert_IQ='+invert_IQ+'&mute='+mute+'&sin='+sin,
          error: function() 
          {
              var html='<b>Invalid Data</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data) 
          {
            if(data == 0)
            {
              
              var html='<b>Gain Changed successfully</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
             else
            {
              
              var html='<b>Error while Changing Gain</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
          },
          type: 'POST'
          });
  }
   
}


function add_NewInput()
{
  $("#New_Input").append('<div style="border: 1px solid Gainsboro; margin-bottom:10px; min-height:70px;"><table class="genral" style="width:70%;margin-top:10px;"><tr><td>Service timeout:</span></td><td><select class="form-control-default"><option>Never</option><option>Costom Value</option></select></td><td><input type="text" class="form-control-default"></td><td><button type="submit" class="btn btn-default">CLEAR VISITED SIDS</button></td><td><span class="glyphicon glyphicon-trash"></span></td></tr></table></div>');
}

function add_NewInput_PID(freq_id,qam_id)
{
  
   var html='<tr><td><input type="text" id="pid_name'+count+''+freq_id+''+qam_id+'" class="form-control-default" placeholder="NAME" name="pid_name"></td>'
    html+='<td><input type="text" id="pid_value'+count+''+freq_id+''+qam_id+'" class="form-control-default" placeholder="PID" name="pid_value"></td>'
    html+='<td><button type="submit" class="btn-btn-default" onclick="addCustomPid('+count+','+freq_id+','+qam_id+');" data-dismiss="modal">SAVE&APPLY</button></td>'
   
    html+='</tr><tr class="blank_row"></tr>'
    
     $("#PID_Input"+freq_id+qam_id).append(html);count++;

  

}
function pid_filter(freq_id,qam_id)
{   

  $("#Payload"+freq_id+"_"+qam_id).empty();
   var html= '<table id="PID_Input'+freq_id+''+qam_id+'" style="width: 70%;">'
    html+='<colgroup><col style="width:20%"/><col style="width:25%"/><col style="width:10%"/><col style="width:5%"/></colgroup>'
    html+='</table>'
   
    html+='<table>'
    html+='<tr class="blank_row"></tr>'
    html+='<tr>'
    html+='<td><button type="button" class="btn btn-default" style="height:4%; font-size: 80%;" onClick="add_NewInput_PID('+freq_id+','+qam_id+')" >ADD NEW INPUT</button></td>'
    html+='</tr> '
    html+='</table>'


    html+='<div align="right">'

    html+='<div id="error_pidData" style="color:red"></div>'
    html+='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'
    html+='</div>'
    
     $("#Payload"+freq_id+"_"+qam_id).append(html);
}
var count = 0;
function get_pid_data(freq_id,qam_id)
{
  $.ajax({
    url:'index.php?route=common/dashboard/get_pid_data&token=<?php echo $token;?>&freq_id='+freq_id+'&qam_id='+qam_id,

    error:function()
    {
      var html='<b>Invalid Data</b>';
      $("#message").empty();
      $('#message_Modal').fadeIn();
      $("#message").append(html);
      $('#message_Modal').modal("show");
      $('#message_Modal').delay(1000).fadeOut('slow');
      $('.modal-backdrop').fadeOut();
    },
    success:function(data)
    { 
      var pid_data = new Array();
          pid_data =JSON.parse(data);
           if(pid_data["error"]==0)
          {
             
             for (count = 0; count < pid_data["list"].length; count++)
              {
                var html='<tr id="pidrow'+count+''+freq_id+''+qam_id+'"><td><input type="text" id="pid_name'+count+''+freq_id+''+qam_id+'" class="form-control-default" value='+pid_data["list"][count]["name"]+'></td>'
                html+='<td><input type="text" id="pid_value'+count+''+freq_id+''+qam_id+'" class="form-control-default" value='+pid_data["list"][count]["pid"]+'></td>'
                html+='<td><button type="submit" class="btn-btn-default" onclick="updateCustomPid('+pid_data["list"][count]["id"]+','+count+','+freq_id+','+qam_id+');" data-dismiss="modal">Update</button></td>'
                html+='<td><span class="glyphicon glyphicon-trash" onclick="deleteCustomPid('+pid_data["list"][count]["id"]+','+count+','+freq_id+','+qam_id+')" data-dismiss="modal"></span></td>'
                html+='</tr><tr class="blank_row"></tr>'
                
             $("#PID_Input"+freq_id+qam_id).append(html);
             

              }
           count=pid_data["list"].length;
           
          }
          else{
               count=0;
              } 
        
    },
  }); 
}

function emmTab(output,qam_id)
{
 $("#EMM"+output+'_'+qam_id).empty();
     var html='<h4>EMM configuration</h4>';
    
     html+='<table style="width=70%;"><tbody> <colgroup>'
     html+= '<col style="width:15%"/>'
     html+= '<col style="width: 15%"/>'
     html+= '<col style="width:15%"/>' 
     html+= '<col style="width:15%"/>'
     html+='<tr class="blank_row"></tr>'    
     html+='</colgroup><tr>';
     html+='<td><b>Sr.No</b></td>'
     html+='<td><b>Alias</b></td>'
     html+='<td><b>Channel Id</b></td>'
     html+='<td><b>Enable</b></td></tr>'

     
  <?php foreach($emmg_channel as $emmg_value ){ ?>
   html+='<tr>'
   html+='<td><?php echo $emmg_value['channel_id']?></td>'
   html+='<td><?php echo $emmg_value['alias'];?></td>'
   html+='<td><?php echo $emmg_value['channel_id'];?></td>'
    html+='<td><input type="checkbox" id="EnableEMM'+output+'_'+qam_id+'_<?php echo $emmg_value['channel_id'];?>" onChange="enableEMM('+output+','+qam_id+',<?php echo $emmg_value['channel_id'];?>,<?php echo $emmg_value['emm_pid'];?>);" ></td>'
   html+='</tr>'
  <?php } ?>
  html+='</tbody></table><br>'
  html+='<div align="right"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>'
 $("#EMM"+output+'_'+qam_id).append(html);

 


}
function enableEMM(output,qam_id,channel_id,emm_pid)
{

 if($("#EnableEMM"+output+"_"+qam_id+"_"+channel_id).prop('checked') == true)
 {
  var EnableEMM=1;

    var result = confirm("Want to Enable EMM ?");
       if(result)
       {
       $.ajax({
          url: 'index.php?route=common/dashboard/enableEMM&token=<?php echo $token; ?>&output='+output+'&qam_id='+qam_id+'&EnableEMM='+EnableEMM+'&channel_id='+channel_id+'&emm_pid='+emm_pid,
          error: function() 
          {
              var html='<b>Invalid Data</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data) 
          {
            
            if(data == 0)
            {
           
               var html='<b>EMM Enabled Succesfully</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
             
              
            }
           
            else if(data == -1)
            {
              
              var html='<b>Connection Error!</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
            else if(data == 1)
            {
              var html='<b>Database Error!</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
            else
            {
              var html='<b>Sorry cant Enable !</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');;
            }
          },
          type: 'POST'
          });
     }
 }
 else
 {
  var EnableEMM=0;
  var result = confirm("Want to Disable EMM ?");
       if(result)
       {
       $.ajax({
          url: 'index.php?route=common/dashboard/disableEMM&token=<?php echo $token; ?>&output='+output+'&qam_id='+qam_id+'&EnableEMM='+EnableEMM+'&channel_id='+channel_id+'&emm_pid='+emm_pid,
          error: function() 
          {
             var html='<b>Invalid Data</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data) 
          { 
            if(data == 0)
            {
             var html='<b>EMM Disabled</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow'); 
              
            }
           
            else
            {
              var html='<b>Sorry Cannot Disable</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
          },
          type: 'POST'
          });
     }
 }  
}
function emmCheck(output,qam_id)
{

  $.ajax({
          url: 'index.php?route=common/dashboard/emmCheck&token=<?php echo $token; ?>&output='+output+'&qam_id='+qam_id,
          error: function() 
          {
          
          },
          success: function(data) 
          { 
             data=JSON.parse(data);
            for(var i=0;i<data.length;i++)
            {
                if(data[i]['enable'] != 0)
                 {
                  $("#EnableEMM"+output+"_"+qam_id+"_"+data[i]['channel_id']).attr('checked','checked');
                 }
              else
                {
                  $("#EnableEMM"+output+"_"+qam_id+"_"+data[i]['channel_id']).removeAttr('checked');
                } 
            }
            
          },
          type: 'POST'
          });
}
function getBaseFreq(qam_id,no_of_output)
{
   var rmx_no=qam_id+1;
      $.ajax({
          url: 'index.php?route=common/dashboard/getBaseFreq&token=<?php echo $token; ?>&rmx_no='+rmx_no,
          error:function()
          {
            var html='<b>Invalid Data</b>';
              $("#message").empty();
              $('#message_Modal').fadeIn();
              $("#message").append(html);
              $('#message_Modal').modal("show");
              $('#message_Modal').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
          },
          success: function(data)
          {
            if(data==1)
            {
             $("#quad_QAM"+qam_id).empty();
             var html='<div class="modal-dialog" role="document" style="width: 80%; align-self: center;" ><div class="modal-content"><div class="modal-body"><table class="genral" style="width:100%; height: 25%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog "  style="margin-left: 0px">QAM:'+rmx_no+'</h3></td></tr><tr><td>Hw Major version:</td><td>NA</td><td>Base frequency:</td><td><input type="text" class="form-control-default" id="Base_Frequency'+qam_id+'" style="margin-top: 4px;" name="NA" value="NULL">MHz</td></tr><tr><td>Hw minimum version:</td><td>NA</td><td>Channel bandwidth:</td><td>8Mhz</td></tr><tr><td>Standard:</td><td><select id="quad_Standard"><option>DVB-CSA/TS</option></select></td><td>Default symbol rate: </td><td><input type="text" class="form-control-default" id="Default_symbol_rate" style="margin-top: 4px;" name="" value="NULL">MBd</td></tr><tr><td>Payload RX bitrate:</td><td></td><td>Payload TX bitrate:</td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" id="QUAD_QAM'+qam_id+'"  disabled="disabled" >SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button></div></div></div>'
             $("#quad_QAM"+qam_id).append(html);
            }
             else
             {
                 var data = JSON.parse(data);
              
                 $("#quad_QAM"+qam_id).empty();
                 var html='<div class="modal-dialog" role="document" style="width: 80%; align-self: center;" ><div class="modal-content"><div class="modal-body"><table class="genral" style="width:100%; height: 25%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " style="margin-left: 0px">QAM:'+rmx_no+'</h3></td></tr><tr><td>Hw Major version:</td><?php if($maj_ver){?><td><b><?php echo $maj_ver;?></b></td><?php } ?><?php if(!$maj_ver){?><td><b>NA</b></td><?php } ?><td>Base frequency:</td><td><input type="text" class="form-control-default" id="Base_Frequency'+qam_id+'" style="margin-top: 4px;" name="" value='+data['center_frequency']+'>MHz</td></tr><tr><td></td><td></td><td></td><td id="error_baseFreq'+qam_id+'" style="color:red"></td></tr><tr><td>Hw minimum version:</td><?php if($min_ver){?><td><b><?php echo $min_ver; ?></b></td><?php } ?><?php if(!$min_ver){?><td><b>NA</b></td><?php } ?><td>Channel bandwidth:</td><td>8Mhz</td></tr><tr><td>Standard:</td><td><select id="quad_Standard"><option>DVB-CSA/TS</option></select></td><td>Default symbol rate: </td><td><input type="text" class="form-control-default" id="Default_symbol_rate" style="margin-top: 4px;" name="" value="6.875">MBd</td></tr><tr><td>Payload RX bitrate:</td><td></td><td>Payload TX bitrate:</td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" id="QUAD_QAM'+qam_id+'" onClick="validateFrequencies(Base_Frequency'+qam_id+','+qam_id+',<?php echo $no_of_output;?>,'+data['center_frequency']+');" disabled="disabled" >SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button></div></div></div>'
                  $("#quad_QAM"+qam_id).append(html);
            
                $("#Base_Frequency"+qam_id).keyup(function() {
                    var empty = false;
                    $("#Base_Frequency"+qam_id).each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $("#QUAD_QAM"+qam_id).attr('disabled', 'disabled'); 
                      } else {
                            $("#QUAD_QAM"+qam_id).removeAttr('disabled');
                      }
                  });
              }
          },
          type:'POST'
        });  
}
 
function updateipStream(rmx_no,portNo,channel_no,id,ip_address)
{ 
    var ip_with_unders = ip_address.replace(/\./g,'_');
    var Port=$("#ip_port"+rmx_no+portNo+channel_no).val();
    var Ip_Address=$("#ipAddress_streaming"+rmx_no+"_"+ip_with_unders+"_"+channel_no).val();
    var result = confirm("Want to Update?");
    if(result)
    {
     if(rmx_no==1 || rmx_no==2)
     {
       payload_interface="GE1";
     }
     else if(rmx_no==3 || rmx_no==4)
     {
       payload_interface="GE2";
     }
     else
     {
       payload_interface="GE3";
     }
     $.ajax({
          url: 'index.php?route=common/dashboard/updateipStreaming&token=<?php echo $token; ?>&Port='+Port+'&Ip_Address='+Ip_Address+'&rmx_no='+rmx_no+'&payload_interface='+payload_interface+'&id='+id+'&channel_no='+channel_no,
          error: function() 
          {
          
              var html='<b>Invalid Data</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             
             var html='<b>Stream Updated</b>';
             $("#message_delete").empty();
            $("#message_delete").append(html).css("color","green").fadeIn('slow');
            $('#message_delete').delay(1000).fadeOut('slow'); 
            
            } 
            else if(data== 1)
            {
              var html='<b>Database Error</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow'); 
            }  
            else{
   
              var html='<b>Invalid Responce</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow'); 
            } 
          },
          type: 'POST'
          });
  }
}
function deleteIP(channel_number,rmx_no,portNo,ip_address)
{
  var ip_with_unders = ip_address.replace(/\./g,'_');
  var ip_with_unders = ip_with_unders.replace(/\'/g,'');
  var delIp = document.getElementById("IP_row"+rmx_no+"_"+ip_with_unders+"_"+channel_number);
  var qam_id=rmx_no-1;
  var result = confirm("Want to delete?");
       if(result)
       {
       $.ajax({
          url: 'index.php?route=common/dashboard/deleteIP&token=<?php echo $token; ?>&portNo='+portNo+'&ip_address='+ip_address+'&rmx_no='+rmx_no+'&channel_number='+channel_number,
          error: function() 
          {
          var html='<b>Invalid Data</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             var html='<b>Stream Deleted</b>';
             $("#message_delete").empty();
            $("#message_delete").append(html).css("color","green").fadeIn('slow');
            $('#message_delete').delay(1000).fadeOut('slow'); 
             delIp.remove();
            
        
            }
            else if(data == -1)
            {
              var html='<b>Connection Error</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
            else
            {
              var html='<b>Database Error</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
          },
          type: 'POST'
          });
     }
}
function addIP(qam_id,channelNo)
{
 var rmx_no=qam_id+1;
 var Ip =$("#ipAddress_streaming"+rmx_no+channelNo).val();
 var Port=$("#ip_port"+rmx_no+channelNo).val();
 if(Ip != '' || Port != '')
  { 
    var result = confirm("Want to add?");
    if(result)
    {
      if(rmx_no==1 || rmx_no==2)
        {
          payload_interface="GE1";
        }
      else if(rmx_no==3 || rmx_no==4)
        {
          payload_interface="GE2";
        }
      else
        {
          payload_interface="GE3";
        }
         $.ajax({
            url: 'index.php?route=common/dashboard/addipStreaming&token=<?php echo $token; ?>&Ip='+Ip+'&Port='+Port+'&qam_id='+qam_id+'&payload_interface='+payload_interface+'&channelNo='+channelNo,
            error: function() 
            {
             var html='<b>Invalid Data</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            },
            success: function(data) 
            {
              if(data == 0)
              {
               var html='<b>Stream Added</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
              }
               else if(data==1)
              {
                var html='<b>Connection Error</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
              }
              else
              {
               var html='<b>Database Error</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
              }
            },
            type: 'POST'
            });
    }
 
  
}
else
     {
      
     }
}  
function addCustomPid(count,freq_id,qam_id)
  {
    $("#error_pidData").hide();
    var name=$("#pid_name"+count+freq_id+qam_id).val();
    var pid= $("#pid_value"+count+freq_id+qam_id).val();
  
     if(name!="" || pid!="")
     {
        $.ajax({
              url: 'index.php?route=common/dashboard/setCustomPids&token=<?php echo $token; ?>&name='+name+'&pid='+pid+'&freq_id='+freq_id+'&qam_id='+qam_id,
              
              error:function()
              {
                var html='<b>Invalid Data</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
              },
              success: function(data)
              {
               if(data==0)
               {
                var html='<b>Custom Pid Added Successfully</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
               } 
               else{
                var html='<b>Error While Adding</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
               }
               
             },
           });
     }
     else
     {
        $("#error_pidData").html("Please Fill All the Required Parameters");
         $("#error_pidData").show();
     }
  
  }   
  function updateCustomPid(id,count,freq_id,qam_id)
  {
    var name=$("#pid_name"+count+freq_id+qam_id).val();
    var pid= $("#pid_value"+count+freq_id+qam_id).val();
    $.ajax({
          url: 'index.php?route=common/dashboard/updateCustomPids&token=<?php echo $token; ?>&name='+name+'&pid='+pid+'&freq_id='+freq_id+'&qam_id='+qam_id+'&id='+id,
          
          error:function()
          {
            var html='<b>Invalid data</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data)
          {
            
           if(data==2)
           {
            var html='<b>Error While Updating</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
           }
           else if(data==0)
           {
             var html='<b>Custom Pid Updated Successfully</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
           }
           else
           {
            var html='<b>Unable To Update</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
           }
         },
       });
  }  
  function deleteCustomPid(id,count,freq_id,qam_id)
  {
     var name=$("#pid_name"+count+freq_id+qam_id).val();
     var pid= $("#pid_value"+count+freq_id+qam_id).val();
     $.ajax({
          url: 'index.php?route=common/dashboard/deleteCustomPid&token=<?php echo $token; ?>&name='+name+'&pid='+pid+'&freq_id='+freq_id+'&qam_id='+qam_id+'&id='+id,     
          error:function()
          {
            var html='<b>Connection Error</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data)
          {
            
           if(data==0)
           {
            $('#pidrow'+count+freq_id+qam_id).remove();
            var html='<b>Custom Pid Deleted Succesfully</b>';
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
           }
           else
           {
            var html='<b>Unable to Delete</b>';
              $("#message_delete").empty();
              $("#message_delete").append(data).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');;
           }
         },
       });
  }    
//QAM-FREQ-MODAL
//DRAG AND DROP
  for(var 
    targets = document.querySelectorAll('[data-draggable="target"]'), 
    len = targets.length, 
    i = 0; i < len; i ++)
  { 
    targets[i].setAttribute('aria-dropeffect', 'none');
  }
  for(var 
    items = document.querySelectorAll('[data-draggable="item"]'), 
    len = items.length, 
    i = 0; i < len; i ++)
  {
    items[i].setAttribute('draggable', 'true');
    items[i].setAttribute('aria-grabbed', 'false');
    items[i].setAttribute('tabindex', '0');
  }
  var selections = 
  {
    items      : [],
    owner      : null,
    droptarget : null
  };
  function addSelection(item)
  {
    if(!selections.owner)
    {
      selections.owner = item.parentNode;
    }
    else if(selections.owner != item.parentNode)
    {
      return;
    }    
    item.setAttribute('aria-grabbed', 'true');
    selections.items.push(item);
  }
 function removeSelection(item)
 {
    item.setAttribute('aria-grabbed', 'false');
    for(var len = selections.items.length, i = 0; i < len; i ++)
    {
      if(selections.items[i] == item)
      {
        selections.items.splice(i, 1);
        break;
      }
    }
}
function clearSelections()
{
    if(selections.items.length)
    {
      selections.owner = null;
      for(var len = selections.items.length, i = 0; i < len; i ++)
      {
        selections.items[i].setAttribute('aria-grabbed', 'false');
      }    
      selections.items = [];
    }
}
function hasModifier(e)
{
 return (e.ctrlKey || e.metaKey || e.shiftKey);
}
function addDropeffects()
{
    for(var len = targets.length, i = 0; i < len; i ++)
    {

      if
      (
        targets[i] != selections.owner 
        && 
        targets[i].getAttribute('aria-dropeffect') == 'none'
      )
      {
        targets[i].setAttribute('aria-dropeffect', 'move');
        targets[i].setAttribute('tabindex', '0');
      }
    }
    for(var len = items.length, i = 0; i < len; i ++)
    {
      if
      (
        items[i].parentNode != selections.owner 
        && 
        items[i].getAttribute('aria-grabbed')
      )
      {
        items[i].removeAttribute('aria-grabbed');
        items[i].removeAttribute('tabindex');
      }
    }   
  }
function clearDropeffects()
  {
    if(selections.items.length)
    {
      for(var len = targets.length, i = 0; i < len; i ++)
      {
        if(targets[i].getAttribute('aria-dropeffect') != 'none')
        {
          targets[i].setAttribute('aria-dropeffect', 'none');
          targets[i].removeAttribute('tabindex');
        }
      }
      for(var len = items.length, i = 0; i < len; i ++)
      {
        if(!items[i].getAttribute('aria-grabbed'))
        {
          items[i].setAttribute('aria-grabbed', 'false');
          items[i].setAttribute('tabindex', '0');
        }
        else if(items[i].getAttribute('aria-grabbed') == 'true')
        {
          items[i].setAttribute('tabindex', '0');
        }
      }   
    }
}
function getContainer(element)
  {
    do
    {
      if(element.nodeType == 1 && element.getAttribute('aria-dropeffect'))
      {
        return element;
      }
    }
    while(element = element.parentNode);
    return null;
  }
  document.addEventListener('mousedown', function(e)
  {
    if(e.target.getAttribute('draggable'))
    {
      clearDropeffects();
      if
      (
        !hasModifier(e) 
        && 
        e.target.getAttribute('aria-grabbed') == 'false'
      )
      {
        clearSelections();
        addSelection(e.target);
      }
    } 
    else if(!hasModifier(e))
    {
      clearDropeffects();

      clearSelections();
    }
    else
    {
      clearDropeffects();
    }
  }, false);
  document.addEventListener('mouseup', function(e)
  {
    if(e.target.getAttribute('draggable') && hasModifier(e))
    {     
      if(e.target.getAttribute('aria-grabbed') == 'true')
      {   
        removeSelection(e.target);
        if(!selections.items.length)
        {
          selections.owner = null;
        }
      }
      else
      {
        addSelection(e.target);
      }
    }
    else if(!hasModifier(e) 
        && 
        e.target.getAttribute('aria-grabbed') == 'true')
      {
        clearSelections();
        addSelection(e.target);
      }
  }, false);
  document.addEventListener('dragstart', function(e)
  {
    
    if(selections.owner != e.target.parentNode)
    {
      e.preventDefault();
      return;
    }
    if
    (
      hasModifier(e) 
      && 
      e.target.getAttribute('aria-grabbed') == 'false'
    )
    {
      addSelection(e.target);
    }
    e.dataTransfer.setData('text', '');
    addDropeffects();
  }, false);
  document.addEventListener('keydown', function(e)
  {
    if(e.target.getAttribute('aria-grabbed'))
    {
      if(e.keyCode == 32)
      {
        if(hasModifier(e))
        {
          if(e.target.getAttribute('aria-grabbed') == 'true')
          {
            if(selections.items.length == 1)
            {
              clearDropeffects();
            }
            removeSelection(e.target);
            if(selections.items.length)
            {
              addDropeffects();
            }
            if(!selections.items.length)
            {
              selections.owner = null;
            }
          }
          else
          {
            addSelection(e.target);

            addDropeffects();
          }
        }
        else if(e.target.getAttribute('aria-grabbed') == 'false')
        {
          clearDropeffects();
          clearSelections();
          addSelection(e.target);
          addDropeffects();
        }
        else
        { 
          addDropeffects();
        }
        e.preventDefault();
      }
      if(e.keyCode == 77 && hasModifier(e))
      {
        if(selections.items.length)
        {
          addDropeffects();
          if(selections.owner == targets[targets.length - 1])
          {
            targets[0].focus();
          }
          else
          {
            for(var len = targets.length, i = 0; i < len; i ++)
            {
              if(selections.owner == targets[i])
              {
                targets[i + 1].focus();
                break;
              }
            }
          }
        }       
        e.preventDefault();
      }
    }
    if(e.keyCode == 27)
    {
      if(selections.items.length)
      {
        clearDropeffects();
        selections.items[selections.items.length - 1].focus();
        clearSelections();
      }
    }   
  }, false);
  var related = null;

  document.addEventListener('dragenter', function(e)
  {
    related = e.target;
  }, false);
  
  document.addEventListener('dragleave', function(e)
  {
    var droptarget = getContainer(related);
    if(droptarget == selections.owner)
    {
      droptarget = null;

    }
    if(droptarget != selections.droptarget)
    {
      if(selections.droptarget)
      {
        selections.droptarget.className = 
          selections.droptarget.className.replace(/ dragover/g, '');
      }
      if(droptarget)
      {
        droptarget.className += ' dragover';
      }
      selections.droptarget = droptarget;
    }
  }, false);  
  document.addEventListener('dragover', function(e)
  {
    if(selections.items.length)
    {
      e.preventDefault();
    }
  }, false);  
document.addEventListener('drop',function(e )
{  
  var target,prog_list=[];
   for(var len = selections.items.length, i = 0; i < len; i ++)
      {
        prog_list.push(selections.items[i].id)
        if(selections.droptarget != null){
          target= selections.droptarget.id;
        }
      }
      if(target != null)
       {
        
      var target_id=target.substr(0,6);
      var keyword=prog_list.toString();
       var source_id = keyword.split('_');
     
     if(source_id[0]=="ecm" && target_id=="output")
     {
        
        addECMToService(prog_list,target);
     }
     else if(source_id[0]!="ecm" && target_id=="freq_o"){
        addToQam(prog_list,target);
     }
   }
},false);
//END DRAG AND DROP
//ECM ACTIVATION
 function addECMToService(ecm_data,target_data)
{
  
  var ecm_data=ecm_data.toString();
  var target_data = target_data.split('_');
  var ecm_data = ecm_data.split('_');
  var service_id=target_data[1];
  var output=target_data[2];
  var qam_id=target_data[3];
  var input=target_data[4];
  var stream_id=ecm_data[1];
  var channel_id=ecm_data[2];
  var ecm_id=ecm_data[3];
  var cp_number=ecm_data[4];
  var access_criteria=ecm_data[5];
  var rmx_no=Number(qam_id) + 1;
  var addFlag=1;

 
if($("#lock_"+service_id+"_"+output+"_"+qam_id+"_"+input).attr("class") == "glyphicon glyphicon-lock")
{
  // if(access_criteria==service_id){

   $.ajax({
            url: 'index.php?route=common/dashboard/activateEcmStream&token=<?php echo $token; ?>&output='+output+'&rmx_no='+rmx_no+'&stream_id='+stream_id+'&channel_id='+channel_id+'&ecm_id='+ecm_id+'&cp_number='+cp_number+'&access_criteria='+access_criteria+'&service_id='+service_id+'&input='+input+'&addFlag='+addFlag,
           
            error:function()
            {
              var html='<b>Invalid Data</b>';
              $("#message").empty();
              $('#message_Modal').fadeIn();
              $("#message").append(html);
              $('#message_Modal').modal("show");
              $('#message_Modal').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
            },
            success: function(data)
            {
              
              var data= Number(data);
            
             switch(data)
             {
               case 1:
                       var html='<b>Stream already Active</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
               break;
               case -1: 
                        var html='<b>Unable to fetch PID</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
               break;
               case 0: 
                       var html='<b>ECM Stream Activated Successfully</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
               break;
               case 2: 
                        var html='<b>Databse Error</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut(); 
               break;
               case -3: 
                        var html='<b>Service Not Present</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
               break;
               case -2: 
                        var html='<b>Server Error</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
               break;
               case 3:
                        var html='<b>Error While Encryption</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
               break;
               default:
             }
            },
          });

 // }
 // else
 // {
  
 //      var html='<b>Access Criteria and Service Id Should be same</b>';
 //      $("#message").empty();
 //      $('#message_Modal').fadeIn();
 //      $("#message").append(html);
 //      $('#message_Modal').modal("show");
 //      $('#message_Modal').delay(1000).fadeOut('slow');
 //      $('.modal-backdrop').fadeOut();
 // }
  }
  else
  {
    var html='<b>Please Scramble the Service </b>';
      $("#message").empty();
      $('#message_Modal').fadeIn();
      $("#message").append(html);
      $('#message_Modal').modal("show");
      $('#message_Modal').delay(1000).fadeOut('slow');
      $('.modal-backdrop').fadeOut();
  }

}
function deleteActiveECMStream(stream_id,rmx_no,output,channel_id,service_id,pid,access_criteria,cp_number,ecm_id,input)
{
  var addFlag=0;
  $.ajax({
            url: 'index.php?route=common/dashboard/deleteActiveEcmStream&token=<?php echo $token; ?>&output='+output+'&rmx_no='+rmx_no+'&stream_id='+stream_id+'&channel_id='+channel_id+'&ecm_id='+ecm_id+'&cp_number='+cp_number+'&access_criteria='+access_criteria+'&service_id='+service_id+'&input='+input+'&addFlag='+addFlag+'&pid='+pid,
           
            error:function()
            {
              var html='<b>Invalid Data</b>';
              $("#message").empty();
              $('#message_Modal').fadeIn();
              $("#message").append(html);
              $('#message_Modal').modal("show");
              $('#message_Modal').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
            },
            success: function(data)
            {
                  
              var data= Number(data);
             
             switch(data)
             {
               
               case -1: 
                        var html='<b>Server Error</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
               break;
               case 0: 
                       var html='<b>ECM Stream Deleted</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
                         var ele = document.getElementById("activeECMStream"+stream_id); 
                          ele.remove();
               break;
               case 2: 
                      var html='<b>Database Error</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
               break;
               case -3: 
                       var html='<b>Service Not Present</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
               break;
               default:var html='<b>Invalid Responce</b>';
                        $("#message").empty();
                        $('#message_Modal').fadeIn();
                        $("#message").append(html);
                        $('#message_Modal').modal("show");
                        $('#message_Modal').delay(1000).fadeOut('slow');
                        $('.modal-backdrop').fadeOut();
             }
            },
          });
}
//END ECM ACTIVATION
//CHANNEL ACTIVATION
function addToQam(prog_list,target_id)
{
 
  var target_id = target_id.split('_');
  var channel_details,channelnumber=[],re_value,output_channelname=[],input;
  var output_serviceId=target_id[1];
  var freq_id=target_id[2];
  var qam_id=target_id[3];
  for(var i = 0;i<prog_list.length;i++)
  {
    outputdata = prog_list[i];
    channel_details = outputdata.split('~');
    channelnumber.push(channel_details[1]);
    re_value = channel_details[3];
    output_channelname.push(channel_details[2]);
    input= channel_details[0];
  }

  var includeFlag=1;
  var dataStr = {qam_id:qam_id,freq_id:freq_id,re_value:re_value,channlNum:channelnumber,channelName:output_channelname,includeFlag:1,input:input};
     $.ajax({
      url: 'index.php?route=common/dashboard/addToOutput&token=<?php echo $token; ?>',
      type: 'POST', 
      dataType: 'json',
      data: dataStr,
      error: function() 
      {
         var html='<b>Invalid Operation</b>';
          $("#message_delete").empty();
          $("#message_delete").append(html).css("color","red").fadeIn('slow');
          $('#message_delete').delay(1000).fadeOut('slow');
      },
      success: function(data) 
      {
        if(data!=2)
        {
          var duplicate_msg="";
          var is_duplicate=0; 
          var added_channels="";
       
        switch(data['error']){
          case 1:

              var count_services=$("#no_of_outputServices"+freq_id+"_"+qam_id).text();
              
               count_services=Number(count_services)+Number(channelnumber.length);

               $("#no_of_outputServices"+freq_id+"_"+qam_id).empty();
                $("#no_of_outputServices"+freq_id+"_"+qam_id).append('<b>'+count_services+'</b>');
            for(var i = 0;i<channelnumber.length;i++)
            { 
              
              if(data['status_array'][i]==0){
                minus_one=-1;
                zero=0;
                RMX_NUM=parseInt(qam_id)+1;
                var html = '<table  class="panel1" id="output_'+channelnumber[i]+'_'+freq_id+'_'+qam_id+'_'+input+'" onclick="sourceInput('+"'"+input+"'"+','+"'"+RMX_NUM+"'"+')" >'  
                html +'<colgroup>'
                html+='<col style="width: 7%"  />'
                html+='<col style="width: 15%" />'
                html+='<col style="width: 55%" />'
                html+='<col style="width: 7%" />'
                html+='<col style="width: 8%" />'
                html +='</colgroup>'
                html +='<tr>'
                html +='<td></td>'
                html +='<td><span> <font size="2">'+channelnumber[i]+'</font> </span></td>'
                html +='<td><span> <font size="2">'+output_channelname[i]+'</font> </span></td>'
                html+='<td><span id="lock_'+channelnumber[i]+'_'+freq_id+'_'+qam_id+'_'+input+'" class="fa fa-unlock" onclick="scrambling('+channelnumber[i]+','+freq_id+','+RMX_NUM+','+input+','+channelnumber[i]+')"></span></td>'
                html +='<td><span onclick="outputChinfo('+"'"+output_channelname[i]+"'"+','+"'"+channelnumber[i]+"'"+','+"'"+input+"'"+','+"'"+RMX_NUM+"'"+','+"'"+freq_id+"'"+','+"'"+qam_id+"'"+','+"'"+ (minus_one) +"'"+','+"'"+ (-1) +"'"+','+"'"+0+"'"+','+"'"+0+"'"+');"  class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#output_chModal_'+channelnumber[i]+''+freq_id+''+RMX_NUM+'"></span> </td>'
            
                
                html +='<td><span onclick="deleteOutputChannel('+"'"+channelnumber[i]+"'"+','+"'"+ (-1) +"'"+','+"'"+freq_id+"'"+','+"'"+input+"'"+','+"'"+RMX_NUM+"'"+');" class="glyphicon glyphicon-trash"></span> </td>'
                
                html +='</tr>'
                html +='</table>'
                $("#channel11"+freq_id+"_"+qam_id).append(html);
                added_channels=added_channels+","+channelnumber[i];
               
                var modal_html="<div id='output_chModal_"+channelnumber[i]+""+freq_id+""+RMX_NUM+"' class='modal fade' tabindex='-1' role='dialog' data-backdrop='static'></div>";
                $("#output-qam"+qam_id).append(modal_html);
                //serviceoutput
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

                $("table.panel1 tr:even").css("background-color","white").click(function(){
                  $(this).css('background-color','orange');
                },function(){
                        $(this).css('background-color','white');     
                  });
                
              }else{
                is_duplicate = 1;
                duplicate_msg=duplicate_msg+output_channelname[i]+',';
              }
            }
            if(is_duplicate)
            {
              
              var html='<b>Warning:Duplicate channels '+duplicate_msg+'</b>';
              $("#message").empty();
              $('#message_Modal').fadeIn();
              $("#message").append(html);
              $('#message_Modal').modal("show");
              $('#message_Modal').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
            }
            else
            {
              
              var html="<b>Channel's ["+added_channels+"] activated successfully!</b>";
              $("#message").empty();
              $('#message_Modal').fadeIn();
              $("#message").append(html);
              $('#message_Modal').modal("show");
              $('#message_Modal').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
            }
             
            break;
          case -1:
            
              var html="<b>Please drop channel to valid RMX no!</b>";
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            break;
          case 2:
           
              var html="<b>Channel Id already exist!</b>";
              $("#message_delete").empty();
                $("#message_delete").append(html).css("color","red").fadeIn('slow');
                $('#message_delete').delay(1000).fadeOut('slow');
            break;
          case 0:
              var html="<b>Server Error</b>";
              $("#message_delete").empty();
                $("#message_delete").append(html).css("color","red").fadeIn('slow');
                $('#message_delete').delay(1000).fadeOut('slow');
            break;
          default:
              var html="<b>Invalid Responce</b>";
                $("#message_delete").empty();
                $("#message_delete").append(html).css("color","red").fadeIn('slow');
                $('#message_delete').delay(1000).fadeOut('slow');
        }
        }
     else
     {
              var html="<b>Channel Id already exist!</b>";
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
     }
       }, 

     });
}

//END CHANNEL ACTIVATION
//START CHANNEL SETTING BUTTON MODAL FUNCTIONS
function scrambling(channelnumber,targetid,rmx_no,input,changed_ch_no)
 {
   
   var scramble= 0;
   var includeFlag=0;
   var qam_id=Number(rmx_no)-1;
    

   
if(changed_ch_no!=-1)
{
   var lock_class=$("#lock_"+changed_ch_no+"_"+targetid+"_"+qam_id+"_"+input).attr('class');
   if($("#scramble"+changed_ch_no+targetid+rmx_no+input).prop('checked') == true)
   {
    var scramble= 1;
    var includeFlag=1;
   }
   else if(lock_class == "fa fa-unlock")
   {
     var scramble= 1;
    var includeFlag=1;
   }
}
else
{
  var lock_class=$("#lock_"+channelnumber+"_"+targetid+"_"+qam_id+"_"+input).attr('class');
  if($("#scramble"+channelnumber+targetid+rmx_no+input).prop('checked') == true)
   {
    var scramble= 1;
    var includeFlag=1;
   }
   else if(lock_class == "fa fa-unlock")
   {
     var scramble= 1;
     var includeFlag=1;
   }
}
if(scramble==1)
{
  var res = confirm("Want to Scramble?");
}
 else
 {
  var res = confirm("Want to Unscramble?");
 }

   if(res)
   {  
   $.ajax({
          url:'index.php?route=common/dashboard/scrambleService&token=<?php echo $token; ?>&programNumbers='+channelnumber+'&output='+targetid+'&rmx_no='+rmx_no+'&scramble='+scramble+'&input='+input+'&includeFlag='+includeFlag+'&changed_ch_no='+changed_ch_no,
          error:function()
          {
            var html="<b>Invalid Data</b>";
              $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","red").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
          },
          success:function(data)
          {
            
              if(data== 0 )
              {  
                $("#output_chModal_"+channelnumber+targetid+rmx_no).fadeOut();
                if(scramble==1)
                {
                  var html="<b>Scrambled Successfully</b>";
                }
                else
                {
                  var html="<b>Unscrambled Successfully</b>";
                }
                
                $("#message_delete").empty();
                $("#message_delete").append(html).css("color","green").fadeIn('slow');
                $('#message_delete').delay(1000).fadeOut('slow'); 
              if(changed_ch_no!= -1){
                channelnumber=changed_ch_no;
              }
                if(includeFlag==1)
                   {
                    
                    $("#lock_"+channelnumber+"_"+targetid+"_"+qam_id+"_"+input).addClass('glyphicon glyphicon-lock').removeClass('fa fa-unlock');
                    /*$("#output_"+channelnumber+"_"+targetid+"_"+qam_id+"_"+input).attr("data-draggable","target");
                    $("#output_"+channelnumber+"_"+targetid+"_"+qam_id+"_"+input).attr("aria-dropeffect","none");*/
                   }
                   else{
                   
                       $("#lock_"+channelnumber+"_"+targetid+"_"+qam_id+"_"+input).addClass('fa fa-unlock').removeClass('glyphicon glyphicon-lock');
                       
                   }
              
              }
              else if(data==4)
              {
                  var html="<b>Delete ECM Stream before Unscramble</b>";
                  $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","red").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
              }
              else 
              {
                var html="<b>Error While Scrambling</b>";
                 $("#message_delete").empty();
                  $("#message_delete").append(data).css("color","red").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
              }
            
          },
        });
 }
}                     

function outputChinfo(ch_name,ch_number,input,rmx_no,targetid,qam_targetid,changed_number,changed_name,Enable_ch_name,Enable_ch_number)
{ 

        $.ajax({
          url: 'index.php?route=common/dashboard/getChannelInformation&token=<?php echo $token; ?>&channel_number='+ch_number+'&input_id='+input+'&rmx_no='+rmx_no+'&targetid='+targetid+'&changed_number='+changed_number,
          error:function()
          {
            var html="<b>Invalid Data</b>";
              $("#message").empty();
              $('#message_Modal').fadeIn();
              $("#message").append(html);
              $('#message_Modal').modal("show");
              $('#message_Modal').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
          },
          success: function(data)
          {
             
            if(data==1)
            {
              var html="<b>Connection Error</b>";
              $("#message").empty();
              $('#message_Modal').fadeIn();
              $("#message").append(html);
              $('#message_Modal').modal("show");
              $('#message_Modal').delay(1000).fadeOut('slow');
              $('.modal-backdrop').fadeOut();
            }

            else
            {
                var i=0;
                
                var arr= JSON.parse(data);
                 
            
                arr2 = arr['ActiveECMStream'];
                arr3=arr['pmt_alarm'];
                arr4=arr['high_priority'];
                arr5=arr['Scrambled_data'];
               
              
                
                if(changed_number!= -1)
                {
                  var channelnumber = changed_number;
                  
                }
                else
                {
                  var channelnumber = ch_number;
                  
                }
                  if(changed_name!= '-1')
                {
                  var channelname = changed_name;
                }
                else
                {
                  var channelname = ch_name;
                }
                 if(arr['changed_provider']!= '-1')
                {
                  var Enable_ch_provider=1;
                  var channelprovider = arr['changed_provider'];
                }
                else
                {
                  var channelprovider = arr['serviceprovider'];
                  var Enable_ch_provider=0;
                }
                 if(Enable_ch_name==0)
                  {
                    var channelname = ch_name; 
                  }
                  if(Enable_ch_number==0)
                  {
                    var channelnumber = ch_number; 
                  }
                  var org_chname = "'"+channelname+"'";
                  var org_providername="'"+channelprovider+"'";
                   
                var video_bw=Math.floor(((arr['input_rate']/1000)*arr['video_per'])/1000);
                var audio_bw=Math.floor(((arr['input_rate']/1000)*arr['audio_per'])/1000);
                $("#output_chModal_"+channelnumber+targetid+rmx_no).empty();
                var html='<div class="modal-dialog modal-lg"  style=" align-self: center; width: 85%;">'
                html+='<div class="modal-content">'
                html+='<h4 class="modal-title"><span class="glyphicon glyphicon-cog" style="margin-left:10px; margin-top: 5px;"></span>'
                html+='<span style="margin-left: 3px;margin-top: 5px;"><font>'+channelname+','+channelnumber+'</font></span></h4>'
                html+='<span id="service_type_message" style="margin-left:50%"></span>'
                html+='<div class="modal-body">'
                html+='<div data-role="main" class="ui-content">'
                html+='<div class="container-default">'
                html+='<ul class="nav nav-tabs">'
                html+='<li class="active"><a data-toggle="tab" href="#Output_Services'+channelnumber+''+targetid+''+rmx_no+'">Output Services</a></li>'
                html+='<li><a data-toggle="tab" href="#Scrambling'+channelnumber+''+targetid+''+rmx_no+'">Scrambling</a></li></ul>'
                html+='<div class="tab-content">'
                html+='<div id="Output_Services'+channelnumber+''+targetid+''+rmx_no+'" class="tab-pane fade in active">'
                html+='<table class="genral" style="width:100%; height: 45%; margin-top: 20px;">'
                html+='<tbody><tr>'
                html+='<td>Service name</td>'
                html+='<td><b>'+channelname+'</b></td>'
                html+='<td></td></tr>'
               
                html+='<tr><td>Output SID</td><td><input id="checkbox_set_service_id'+channelnumber+''+targetid+''+rmx_no+'" type="checkbox" class="form-control-default" style="margin-top: 4px;margin-right: 4px;"><input id="text_SID'+channelnumber+''+targetid+''+rmx_no+'" value="'+channelnumber+'" type="text" class="form-control-default" style="margin-top: 4px;"></td>'
                html+='<td>Service name override</td>'
                html+='<td><input id="checkbox_set_service'+channelnumber+''+targetid+''+rmx_no+'" type="checkbox" class="form-control-default" style="margin-top: 4px;"><input id="set_service'+channelnumber+''+targetid+''+rmx_no+'" type="textbox" class="form-control-default" style="margin-top:4px;margin-left:10px;" value="'+channelname+'" ></td></tr>'
                html+='<tr><td></td><td><span id="error_outputSID'+channelnumber+''+targetid+''+rmx_no+'" style="color:red;"></span></td><td></td><td><span id="error_set_service'+channelnumber+''+targetid+''+rmx_no+'" style="color:red;"></span></td></tr>'
                
                html+='<tr><td>Set High Priority</td>'
                html+='<td><input id="checkbox_Priority'+channelnumber+''+targetid+''+rmx_no+'" type="checkbox" class="form-control-default"></td></tr>'
                html+='<tr><td><br/></td></tr>'
                html+='<tr><td><b>Output components</b></td></tr>'
                html+='<tr><td><br/></td></tr>'
                html+='<tr><td><b>Type</b></td>'
                html+='<td><b>Languages</b></td>'
                html+='<td><b>In PID</b></td>'
                html+='<td><b>Out PID</b></td>'
                html+='<td><b> Current Bitrate</b></td></tr>' 
                html+='<tr><td>video('+arr['videopid']+')</td><td></td>'
                html+='<td>'+arr['videopid_no']+'</td>'
                html+='<td></td><td>'+video_bw+' Kbps</td></tr>' 
                html+='<tr><td>audio('+arr['audiopid']+')</td><td></td>' 
                html+='<td>'+arr['audiopid_no']+'</td><td></td>'
                html+='<td>'+audio_bw+' Kbps</td></tr>'
                html+='</tbody></table>'
                html+='<div align="right">'
                html+='<button class="accordion"  data-toggle="collapse" data-target="#advance_option'+channelnumber+targetid+rmx_no+'">Advanced options</button></div>'
                html+='<div id="advance_option'+channelnumber+''+targetid+''+rmx_no+'" class="collapse out">'
                html+='<table style="width:70%;">'
                html+='<colgroup><col style="width: 10%"/><col style="width: 30%"/><col style="width: 20%"/><col style="width:20%"/><col style="width:20%"/></colgroup>'
                html+='<tr><td></td><td></td>'
                html+='<td>Provider name</td>'
                html+='<td><b>'+channelprovider+'</b></td></tr>'
                html+='<tr><td>Service Type</td>'


                // html+='<td><b>'+arr['servicetype']+'</b></td>'
               html+='<td><select name="changeServiceType"  id="service_type" onChange="changeServiceType('+rmx_no+','+input+','+ch_number+')">' 
               html+='<option value"0">reserved for future use</option>'
               html+='<option value="1">digital television service</option>'
               html+='<option value="2">digital radio sound service</option>'
               html+='<option value="3">Teletext service</option>'
               html+='<option value="4">NVOD reference service</option>'
               html+='<option value="5">NVOD time-shifted service</option>'
               html+='<option value"6">mosaic service</option>'
               html+='<option value="7">FM radio service</option>'
               html+='<option value="8">DVB SRM service</option>'
               html+='<option value="10">advanced codec digital radio</option>'
               html+='<option value="11">H.264/AVC mosaic service</option>'
               html+='<option value="12">data broadcast service</option>'
               html+='<option value="14">RCS Map</option>'
               html+='<option value="15">RCS FLS</option>'
               html+='<option value"16">DVB MHP service</option>'
               html+='<option value="17">MPEG-2 HD digital television</option>'
               html+='<option value="22">H.264/AVC SD digital television</option>'
               html+='<option value="23"> H.264/AVC SD NVOD time-shifted</option>'
               html+='<option value="24">H.264/AVC SD NVOD reference</option>'
               html+='<option value="25">H.264/AVC HD digital television</option>' 
               html+='<option value="26">H.264/AVC HD NVOD time-shifted</option>'
               html+='<option value="27">H.264/AVC HD NVOD reference</option>'
               html+='<option value="28">H.264/AVC HD digital television</option>'
               html+='<option value="29">H.264/AVC HD NVOD time-shifted</option>'
               html+='<option value="30">H.264/AVC HD NVOD reference</option>'
               html+='<option value="31">HEVC digital television</option>'
               html+='</select></td>'


                html+='<td>Provider name override</td>'
                html+='<td><input id="checkbox_set_provider'+channelnumber+''+targetid+''+rmx_no+'" type="checkbox" class="form-control-default"  style="margin-top: 4px;">'
                html+='<input id="set_provider'+channelnumber+''+targetid+''+rmx_no+'" type="textbox" class="form-control-default" value="'+channelprovider+'" style="margin-top:4px;margin-left:10px;"></td></tr>'
                html+='<tr><td></td><td></td><td></td>'
                html+='<td><span id="error_set_provider'+channelnumber+''+targetid+''+rmx_no+'" style="color:red;"></span></td></tr>'
                html+='<tr><td>PMT Download</td>'
                html+='<td><button type="button" class="glyphicon glyphicon-download" id="PMT_Download'+channelnumber+''+targetid+''+rmx_no+'" style="background-color:white" onClick="downloadTables(1,'+channelnumber+','+rmx_no+')" data-dismiss="modal"></button></td>'
                html+='<td>PMT Alarm</td><td>'
                html+='<select id="PMT_Alarm'+channelnumber+''+targetid+''+rmx_no+'" name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'">'
                html+='<option value="1" selected="selected">Enable</option><option value="0" selected="selected">Disable</option></select></td></tr>'
                html+='</table></div>'
                html+='<div align="right" style="margin-top:10px;">' 
                html+='<button type="button" class="btn btn-default" onClick="setPriority('+channelnumber+','+ch_number+','+input+','+rmx_no+','+targetid+','+arr4.Priority_checkbox+');changeOutputSid('+input+','+targetid+','+rmx_no+','+channelnumber+','+ch_number+','+org_chname+','+org_providername+','+Enable_ch_provider+','+Enable_ch_name+','+Enable_ch_number+');set_PMT_alarm('+input+','+channelnumber+','+rmx_no+','+targetid+','+arr3+');" id="save_output_sid'+channelnumber+''+targetid+''+rmx_no+'" disabled="disabled" data-dismiss="modal">APPLY & SAVE</button>'
                html+='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div></div>'
                html+='<div id="Scrambling'+channelnumber+''+targetid+''+rmx_no+'" class="tab-pane fade fade">'
                html+='<table class="genral" style="width:70%; height: 25%;">'
                html+='<tbody><tr><td>Scrambling</td>'
                html+='<td><input type="checkbox" class="form-control-default" style="margin-top: 4px;" id="scramble'+channelnumber+''+targetid+''+rmx_no+''+input+'" ></td></tr>'
                /*html+='<tr><td><b>Scrambled components</b></td></tr>'
                html+='<tr><td><input type="checkbox" class="form-control-default" id="scrambleAll'+channelnumber+''+targetid+''+rmx_no+'"><span style="margin-left: 7px;">All</span></td>'
                html+='<td><input type="checkbox" class="form-control-default" id="scrambleVideo'+channelnumber+''+targetid+''+rmx_no+'"><span style="margin-left: 7px;">video</span></td>'
                html+='<td><input type="checkbox" class="form-control-default" id="scrambleSubtitle'+channelnumber+''+targetid+''+rmx_no+'"><span style="margin-left: 7px;">subtitle</span></td>'
                html+='<td><input type="checkbox" class="form-control-default" id="scrambleOther'+channelnumber+''+targetid+''+rmx_no+'" ><span style="margin-left: 7px;">other</span>'
                html+='<span><input type="text" class="form-control-default" style="margin-top: 4px;" id="scrambleOthertext'+channelnumber+''+targetid+''+rmx_no+'"></span></td></tr>'
                html+='<tr><td></td><td><input type="checkbox" class="form-control-default" id="scrambleAudio'+channelnumber+''+targetid+''+rmx_no+'"><span style="margin-left: 7px;">audio</span></td>'
                html+='<td><input type="checkbox" class="form-control-default" id="scrambleteletext'+channelnumber+''+targetid+''+rmx_no+'"><span style="margin-left: 7px;">Teletext</span></td>'
                html+='<td><button type="button" class="btn btn-default" data-dismiss="" style="height:4%; font-size: 80%;margin-top: 5px;">USE CHASSIS PRESETS</button></td>'
                html+='</tr><tr><td></td><td>'
                html+='<input type="checkbox" class="form-control-default" id="AC3-audio'+channelnumber+''+targetid+''+rmx_no+'">'
                html+='<span style="margin-left:7px;">AC3-audio</span>'
                html+='</td><td></td><td></td></tr>'*/
                html+='<tr><td><br/></td></tr><tr> <td><b>Channel Id</b></td><td><b>Stream Id</b></td>'
                html+='<td><b>Access criteria</b></td>' 
                html+='<td><b>ECM Id</b></td><td></td>'
                for (var ecm_count = 0; ecm_count < arr2.length; ecm_count++) {
                  
                  html+='</tr><tr id="activeECMStream'+arr['ActiveECMStream'][ecm_count]['stream_id']+'"> <td>'+arr['ActiveECMStream'][ecm_count]['channel_id']+'</td><td>'+arr['ActiveECMStream'][ecm_count]['stream_id']+'</td><td>'+arr['ActiveECMStream'][ecm_count]['access_criteria']+'</td><td>'+arr['ActiveECMStream'][ecm_count]['ecm_id']+'</td><td><button type="button" class="btn btn-default" onclick="deleteActiveECMStream('+arr['ActiveECMStream'][ecm_count]['stream_id']+','+arr['ActiveECMStream'][ecm_count]['rmx_no']+','+arr['ActiveECMStream'][ecm_count]['output']+','+arr['ActiveECMStream'][ecm_count]['channel_id']+','+arr['ActiveECMStream'][ecm_count]['service_id']+','+arr['ActiveECMStream'][ecm_count]['pid']+','+arr['ActiveECMStream'][ecm_count]['access_criteria']+','+arr['ActiveECMStream'][ecm_count]['cp_number']+','+arr['ActiveECMStream'][ecm_count]['ecm_id']+','+arr['ActiveECMStream'][ecm_count]['input']+');">Delete</button</td>'
                  
                 }
                  html+='</tbody></table><div align="right" style="margin-top:10px;">'
                   html+='<button type="button" class="btn btn-default"  id="applyScrambling'+channelnumber+''+targetid+''+rmx_no+'" data-dismiss="modal" onClick="scrambling('+ch_number+','+targetid+','+rmx_no+','+input+','+channelnumber+')">APPLY & SAVE</button>'
                   html+='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div> </div></div></div></div></div></div></div>'
                  $("#output_chModal_"+channelnumber+targetid+rmx_no).append(html);

                  $('select[name="changeServiceType"] option[value='+arr["servicetype"]+']').attr('selected','selected');

                  $("#set_Lcn"+channelnumber+targetid+rmx_no).keyup(function() {
                    $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled');
                  });
                  $("#checkbox_Priority"+channelnumber+targetid+rmx_no).click(function() {
                    $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled');
                  });  
                  $("#PMT_Alarm"+channelnumber+targetid+rmx_no).change(function() {
                    $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled');
                  });
                  $("#checkbox_set_service"+channelnumber+targetid+rmx_no).click(function()
                  {
                     $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled');
                  });
                  $("#checkbox_set_service_id"+channelnumber+targetid+rmx_no).click(function()
                  {
                     $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled');
                  });
                  $("#checkbox_set_provider"+channelnumber+targetid+rmx_no).click(function()
                  {
                     $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled');
                  });
                  $("#set_service"+channelnumber+targetid+rmx_no).hide();
                  $("#set_provider"+channelnumber+targetid+rmx_no).hide();
                  $("#text_SID"+channelnumber+targetid+rmx_no).hide();
                  if(Enable_ch_name==1)
                  {
                     $("#set_service"+channelnumber+targetid+rmx_no).show();
                     $("#checkbox_set_service"+channelnumber+targetid+rmx_no).attr('checked','checked');
                  }
                  if(Enable_ch_number==1)
                  {
                     $("#text_SID"+channelnumber+targetid+rmx_no).show();
                     $("#checkbox_set_service_id"+channelnumber+targetid+rmx_no).attr('checked','checked');
                  }
                  if(Enable_ch_provider==1)
                  {
                     $("#set_provider"+channelnumber+targetid+rmx_no).show();
                     $("#checkbox_set_provider"+channelnumber+targetid+rmx_no).attr('checked','checked');
                  }
        // Priority and PMT alarm
                   if(arr3==0)
                     {   
                       $('select[name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'"] option[value="1"]').removeAttr('selected'); 
                       $('select[name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'"] option[value="0"]').attr('selected','selected'); 
                     }
                   else if(arr3==1)
                    {
                       $('select[name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'"] option[value="0"]').removeAttr('selected'); 
                       $('select[name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'"] option[value="1"]').attr('selected','selected'); 
                    }
                   if(arr4.Priority_checkbox==0)
                    {                     
                       
                    }
                    else if(arr4.Priority_checkbox==1)
                    {     
                        $("#checkbox_Priority"+channelnumber+targetid+rmx_no).attr('checked','checked');             
                    }
       // Priority and PMT alarm
      // set service name
                  $("#checkbox_set_service"+channelnumber+targetid+rmx_no).click(function()
                  {
                    if(this.checked)
                    {

                    $("#set_service"+channelnumber+targetid+rmx_no).show();
                    }
                    else{

                    $("#set_service"+channelnumber+targetid+rmx_no).hide();
                    }
                  });
      // set service name
      // set service id
                  $("#checkbox_set_service_id"+channelnumber+targetid+rmx_no).click(function()
                  {
                    if(this.checked)
                    {

                    $("#text_SID"+channelnumber+targetid+rmx_no).show();
                    }
                    else{

                    $("#text_SID"+channelnumber+targetid+rmx_no).hide();
                    }
                  });
      // set service id
      //advance option
                  $("#checkbox_set_provider"+channelnumber+targetid+rmx_no).click(function()
                  {
                    if(this.checked)
                    {

                    $("#set_provider"+channelnumber+targetid+rmx_no).show();
                    }
                    else{

                    $("#set_provider"+channelnumber+targetid+rmx_no).hide();
                    }
                  });
      //advance option
      $("#set_service"+channelnumber+targetid+rmx_no).keyup(function() {
         var empty = false;
                    $("#set_service"+channelnumber+targetid+rmx_no).each(function() 
                    {
                          if ($(this).val() == '') 
                          {
                          empty = true;
                          }
                    });
                      if (empty) 
                      {
                        $("#save_output_sid"+channelnumber+targetid+rmx_no).attr('disabled', 'disabled'); 
                      }
                      else 
                      {
                         
                         if(checkServiceName(channelnumber,targetid,rmx_no))
                          {
                             $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled'); 
                          }
                         else
                          {
                             $("#save_output_sid"+channelnumber+targetid+rmx_no).attr('disabled', 'disabled');
                          } 
                          
                          
                      }
      });
       $("#set_provider"+channelnumber+targetid+rmx_no).keyup(function() {
         var empty = false;
                    $("#set_provider"+channelnumber+targetid+rmx_no).each(function() 
                    {
                          if ($(this).val() == '') 
                          {
                          empty = true;
                          }
                    });
                      if (empty) 
                      {
                        $("#save_output_sid"+channelnumber+targetid+rmx_no).attr('disabled', 'disabled'); 
                      }
                      else 
                      {
                         
                         if(checkProviderName(channelnumber,targetid,rmx_no))
                          {
                             $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled'); 
                          }
                         else
                          {
                             $("#save_output_sid"+channelnumber+targetid+rmx_no).attr('disabled', 'disabled');
                          } 
                          
                          
                      }
      });
                $("#text_SID"+channelnumber+targetid+rmx_no).keyup(function() {
                    var empty = false;
                    $("#text_SID"+channelnumber+targetid+rmx_no).each(function() 
                    {
                          if ($(this).val() == '') 
                          {
                          empty = true;
                          }
                    });
                      if (empty) 
                      {
                        $("#save_output_sid"+channelnumber+targetid+rmx_no).attr('disabled', 'disabled'); 
                      }
                      else 
                      {
                         if(checkOutputsid(channelnumber,targetid,rmx_no))
                          {
                             $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled'); 
                          }
                         else
                          {
                             $("#save_output_sid"+channelnumber+targetid+rmx_no).attr('disabled', 'disabled');
                          }
                      }
                  });
                // scrambling................
                   $("#scrambleAll"+channelnumber+targetid+rmx_no).click(function()
                    {
                      if(this.checked)
                      {
                      $("#scrambleAudio"+channelnumber+targetid+rmx_no).attr('checked','checked');
                      $("#scrambleVideo"+channelnumber+targetid+rmx_no).attr('checked','checked');
                      $("#scrambleteletext"+channelnumber+targetid+rmx_no).attr('checked','checked');
                      $("#scrambleSubtitle"+channelnumber+targetid+rmx_no).attr('checked','checked');
                      $("#scrambleOther"+channelnumber+targetid+rmx_no).attr('checked','checked');
                      $("#AC3-audio"+channelnumber+targetid+rmx_no).attr('checked','checked');
                      }
                      else
                      {
                      $("#scrambleAudio"+channelnumber+targetid+rmx_no).removeAttr('checked');
                      $("#scrambleVideo"+channelnumber+targetid+rmx_no).removeAttr('checked');
                      $("#scrambleteletext"+channelnumber+targetid+rmx_no).removeAttr('checked');
                      $("#scrambleSubtitle"+channelnumber+targetid+rmx_no).removeAttr('checked');
                      $("#scrambleOther"+channelnumber+targetid+rmx_no).removeAttr('checked');
                      $("#AC3-audio"+channelnumber+targetid+rmx_no).removeAttr('checked');
                      }
                    });

                   if(arr5==1)
                   {
                      $("#scramble"+channelnumber+targetid+rmx_no+input).attr('checked','checked');   
                   }
                   else
                   {
                    $("#scramble"+channelnumber+targetid+rmx_no+input).removeAttr('checked');

                    
                   }
                //scrambling.................
                
              }
          },
       type:'POST'
    });
}
function changeServiceType(rmx_no,input,channelNumber)
{
  var service_type=$("#service_type").val();
  if(service_type=="reserved for future use")
  {
    service_type=0;  
  }
 
  $.ajax({
            url: 'index.php?route=common/dashboard/changeServiceType&token=<?php echo $token; ?>&input='+input+'&rmx_no='+rmx_no+'&channelNumber='+channelNumber+'&service_type='+service_type,
            async:false,
            error:function()
            {
              var html='<b>invalid data</b>';
               $("#service_type_message").empty();
               $("#service_type_message").append(html).css("color","red").fadeIn('slow');
               $('#service_type_message').delay(1000).fadeOut('slow');
            },
            success: function(data)
            {
              if(data==1)
              {
                var html='<b>Service Type Updated</b>';
                 $("#service_type_message").empty();
                 $("#service_type_message").append(html).css("color","green").fadeIn('slow');
                 $('#service_type_message').delay(1000).fadeOut('slow');
              }
              else
              {
                
                 $("#service_type_message").empty();
                 $("#service_type_message").append(data).css("color","red").fadeIn('slow');
                 $('#service_type_message').delay(1000).fadeOut('slow');
              }
            
            },

          });
  
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
            var html="<b>Invalid Data</b>";
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data)
          {
            if(data==0)
            {
             
             var html="<b>Table Downloaded Succesfully Into Tables Folder</b>";
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","green").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');    
            }
            else
            {
              
              var html="<b>Error While Downloading Tables</b>";
              $("#message_delete").empty();
              $("#message_delete").append(html).css("color","red").fadeIn('slow');
              $('#message_delete').delay(1000).fadeOut('slow');
            }
          },
          type:'POST'
        });
   } 
}
function checkOutputsid(channelnumber,targetid,rmx_no)
{
    var text1=$("#text_SID"+channelnumber+targetid+rmx_no).val().trim();
     if (text1=='') 
     {
        $("#error_outputSID"+channelnumber+targetid+rmx_no).html("Should not be empty");
        return false; 
     }
     else if(text1 >0 && text1<10000)
     {
      $("#error_outputSID"+channelnumber+targetid+rmx_no).hide();
      return true;
     }
     else
     {
      $("#error_outputSID"+channelnumber+targetid+rmx_no).html("Should be in Range 1 to 9999");
      $("#error_outputSID"+channelnumber+targetid+rmx_no).show();
      return false;
     }
}
function checkServiceName(channelnumber,targetid,rmx_no)
{
   var channelname=$("#set_service"+channelnumber+targetid+rmx_no).val().trim();
   
   if(/^[a-zA-Z0-9- ]*$/.test(channelname)==false)
   {
    $("#error_set_service"+channelnumber+targetid+rmx_no).html("Service Name is Invalid");
    $("#error_set_service"+channelnumber+targetid+rmx_no).show();
    return false;
   
   }
   else
   {
      $("#error_set_service"+channelnumber+targetid+rmx_no).hide();
      return true;
   }
}
function checkProviderName(channelnumber,targetid,rmx_no)
{
   var channelname=$("#set_provider"+channelnumber+targetid+rmx_no).val().trim();
   
   if(/^[a-zA-Z0-9- ]*$/.test(channelname)==false)
   {
    $("#error_set_provider"+channelnumber+targetid+rmx_no).html("Provider Name is Invalid");
    $("#error_set_provider"+channelnumber+targetid+rmx_no).show();
    return false;
   
   }
   else
   {
      $("#error_set_provider"+channelnumber+targetid+rmx_no).hide();
      return true;
   }
}
function setPriority(channelnumber,program_number,input,rmx_no,targetid,old_Prioritycheckbox)
 {
    var Priority_checkbox=0;
     if($("#checkbox_Priority"+channelnumber+targetid+rmx_no).prop('checked') == true)
        {
          Priority_checkbox = 1;       
        }
      if(Priority_checkbox != old_Prioritycheckbox)
      {
        $.ajax({
            url:'index.php?route=common/dashboard/set_high_priority&token=<?php echo $token; ?>&program_number='+program_number+'&input='+input+'&Priority_checkbox='+Priority_checkbox+'&rmx_no='+rmx_no,
          error: function() 
          {
            var html="<b>Invalid Data</b>";
              $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","red").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');          
          },
          success: function(data) 
          {
            if(data == 0)
            {
              var html="<b>Success</b>";
             $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","green").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
            }
             else if(data==1)
            {
              var html="<b>Error While Setting Priority</b>";
              $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","red").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
            }
          },
           type: 'POST'
          });
      }
}
function changeOutputSid(input,output,rmx_no,old_channelnumber,original_chNumber,org_chname,org_chprovider,old_enablechProv,old_enablechname,old_enablechnumber)
{
 var new_channelnumber = $("#text_SID"+old_channelnumber+output+rmx_no).val();
 var new_service_name = $("#set_service"+old_channelnumber+output+rmx_no).val();
 var service_provider = $("#set_provider"+old_channelnumber+output+rmx_no).val();
 
  if($("#checkbox_set_service"+old_channelnumber+output+rmx_no).prop('checked') == true)
        {
          var Enable_serviceName = 1;
        }
  else
        {
          var Enable_serviceName = 0;
        }
  if($("#checkbox_set_provider"+old_channelnumber+output+rmx_no).prop('checked') == true)
        {
          var Enable_serviceProvider = 1;
        }
  else
        {
          var Enable_serviceProvider = 0;
        }
  if($("#checkbox_set_service_id"+old_channelnumber+output+rmx_no).prop('checked') == true)
        {
          var Enable_serviceNumber = 1;
        }
  else
        {
          var Enable_serviceNumber = 0;
        }
   if(new_channelnumber!=old_channelnumber || new_service_name!=org_chname || org_chprovider!=service_provider || old_enablechProv !=Enable_serviceProvider || old_enablechname!= Enable_serviceName || old_enablechnumber!= Enable_serviceNumber)
   {
     
      $.ajax({
          url:'index.php?route=common/dashboard/changeOutputSID&token=<?php echo $token; ?>&original_chNumber='+original_chNumber+'&new_channelnumber='+new_channelnumber+'&input='+input+'&output='+output+'&new_service_name='+new_service_name+'&Enable_serviceName='+Enable_serviceName+'&service_provider='+service_provider+'&Enable_serviceProvider='+Enable_serviceProvider+'&rmx_no='+rmx_no+'&old_channelnumber='+old_channelnumber+'&org_chname='+org_chname+'&org_chprovider='+org_chprovider+'&old_enablechProv='+old_enablechProv+'&old_enablechname='+old_enablechname+'&old_enablechnumber='+old_enablechnumber+'&Enable_serviceNumber='+Enable_serviceNumber,
        error:function()
        {
          var html="<b>Invalid Data</b>";
           $("#message_delete").empty();
          $("#message_delete").append(html).css("color","red").fadeIn('slow');
          $('#message_delete').delay(1000).fadeOut('slow');
        },
        success:function(data)
        {
          var resp = parseInt(data);
         
          switch(resp)
          {
            case 0: 
                    var html="<b>Error While updating service id</b>";
                    $("#message_delete").empty();
                    $("#message_delete").append(html).css("color","red").fadeIn('slow');
                    $('#message_delete').delay(1000).fadeOut('slow');
            break;
            case 1:$('.modal-backdrop').remove();
                    var html="<b>Service Updated Succesfully</b>";
                    $("#message_delete").empty();
                    $("#message_delete").append(html).css("color","green").fadeIn('slow');
                    $('#message_delete').delay(1000).fadeOut('slow');

                   getActivatedProgs(output,rmx_no-1);

            break;
            case 2:
                    var html="<b>Error While Updating Service</b>";
                    $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","red").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
            break;
            
            case 4:
                   var html="<b>Error While Updating Service</b>";
                    $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","red").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
            break;
            case 5:
                   var html="<b>Service Updated Successfully</b>";
                    $("#message_delete").empty();
                    $("#message_delete").append(html).css("color","green").fadeIn('slow');
                    $('#message_delete').delay(1000).fadeOut('slow');
                     getActivatedProgs(output,rmx_no-1);
            break;
            case -1:
                    var html="<b>Duplicate service id is not allowed</b>";
                   $("#message_delete").empty();
                   $("#message_delete").append(html).css("color","red").fadeIn('slow');
                   $('#message_delete').delay(1000).fadeOut('slow');
            break;
            case 6:
                    var html="<b>Duplicate service Name is not allowed</b>";
                   $("#message_delete").empty();
                   $("#message_delete").append(html).css("color","red").fadeIn('slow');
                   $('#message_delete').delay(1000).fadeOut('slow');
            break;
            default:
                    var html="<b>"+data+"</b>";
                    $("#message_delete").empty();
                    $("#message_delete").append(html).css("color","green").fadeIn('slow');
                    $('#message_delete').delay(1000).fadeOut('slow');
          }
           
        },
        type: 'POST'
      });
   }  
}
function set_PMT_alarm(input,progNum,rmx_no,targetid,old_pmtalarm)
{
  var Pmt_alarm = $("#PMT_Alarm"+progNum+targetid+rmx_no).find('option:selected').val(); 

   if(Pmt_alarm != old_pmtalarm)
   {
      $.ajax({
            url:'index.php?route=common/dashboard/set_pmt_alarm&token=<?php echo $token; ?>&input='+input+'&progNum='+progNum+'&Pmt_alarm='+Pmt_alarm+'&rmx_no='+rmx_no,
          error: function() 
          {
            var html="<b>Invalid Data</b>";
                  $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","red").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
          },
          success: function(data) 
          {
            if(data == 0)
            {
              var html="<b>Updated PMT Alarm successfully</b>";
                  $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","green").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow'); 
            }
             else if(data==1)
            {
              
              var html="<b>Error While Updating PMT Alarm</b>";
                  $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","red").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
            } 
          },
          type: 'POST'
          });
   }
}

//END CHANNEL SETTING BUTTON MODAL FUNCTIONS
//DELETE OUTPUT CHANNEL
 function deleteOutputChannel(ch_number,changed_no,target_id,inputid,rmx_no)
{
    
    var includeFlag=0;
    var qam_id=rmx_no-1;

var result = confirm("Want to delete?");
    if(result)
    {
      $.ajax({
              url: 'index.php?route=common/dashboard/deleteChannel&token=<?php echo $token; ?>&ch_number=' + ch_number+'&target_id='+target_id+'&inputid='+inputid+'&includeFlag='+includeFlag+'&rmx_no='+rmx_no,
      error:function()
      {
        var html="<b>Invalid Data</b>";
        $("#message_delete").empty();
        $("#message_delete").append(html).css("color","green").fadeIn('slow');
        $('#message_delete').delay(1000).fadeOut('slow');
      },
      success:function(data)
      {
        if(changed_no!= -1)
        {
           ch_number=changed_no;
        }
        else
        {
           ch_number=ch_number;
        }
        var data= Number(data);
        switch(data)
        {
          case 0:
              var html="<b>Connection Error</b>";
                  $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","green").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
          break;
          case 1:
               
                    
                  var ele = document.getElementById("output_"+ch_number+"_"+target_id+"_"+qam_id+"_"+inputid);
                  ele.remove();
                
               
                  var count_services=$("#no_of_outputServices"+target_id+"_"+qam_id).text();
                  count_services=Number(count_services)-1;
                  $("#no_of_outputServices"+target_id+"_"+qam_id).empty();
                  $("#no_of_outputServices"+target_id+"_"+qam_id).append('<b>'+count_services+'</b>');
                
                  var html='<b>Service Deleted Succesfully</b>';
                  $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","green").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
          break;
          case 2:
              var html="<b>Unable To Delete From Database </b>";
                   $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","green").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');
          break;  
          default:var html="<b>Invalid Responce</b>";
                  $("#message_delete").empty();
                  $("#message_delete").append(html).css("color","green").fadeIn('slow');
                  $('#message_delete').delay(1000).fadeOut('slow');               
        } 
      },
       type: 'POST'
    });
   }  
}
//DELETE OUTPUT CHANNEL
// END OUTPUT
//*******************************************************************************
function sourceInput(INPUT,RMX_NO)
  {
    
    RE_NO=0;
    for(rmx_no=1;rmx_no<=6;rmx_no++)
    { 
      for(input=0;input<=7;input++)
      { 
       $('#channel_'+RE_NO +' tr').removeClass("hover2");
       if(rmx_no==RMX_NO && input==INPUT)
       {   
             // $('#channel_'+RE_NO).removeProp("background-color");
             $('#channel_'+RE_NO +' tr').addClass("hover2"); 
       }
        RE_NO++; 
      }
    }    
  }

<?php foreach($Qam_detail as $Qam_value ){ ?>
$(document).on("click",'#quad_qam<?php echo $Qam_value['Qam_ID'];?>',function (e){
  e.stopPropagation();
});
<?php } ?>
<?php foreach($Qam_detail as $Qam_value ){ ?>
<?php foreach($QamFreq_detail as $QamFreq_value ){ ?>

$(document).on("click",'#Output_Modal_button<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>',function (e){
  e.stopPropagation();
});
<?php }?>
<?php }?>



$(document).on("click",'#ecm_channel_settings',function (e){
  e.stopPropagation();
});
$(document).on("click",'#stream_plus',function (e){
  e.stopPropagation();
});
$(document).on("click",'#stream_delete',function (e){
  e.stopPropagation();
});


$('.modal').on('show.bs.modal',function(){
  $("tr").unbind();
});
$('.modal').on('hidden.bs.modal',function(){
  $("tr").hover(function(){
    $(this).addClass("hover1");
  },function(){
    $(this).removeClass("hover1");
  });
  $("tr").click(function(){
    $("tr").removeClass("afterclick");
    $(this).removeClass("hover1").addClass("afterclick");
  });
});

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

$(document).ready(function(){
var no_of_output=8;

 for(var i=0;i<6;i++)
 {
   var old_centerFrequency=Number($("#freq0"+'_'+i).text())+28;
  var Qam_ID=i;
  var rmx_no=Qam_ID+1;
  
  $.ajax({
          url: 'index.php?route=common/dashboard/getBaseFreq&token=<?php echo $token; ?>&rmx_no='+rmx_no,
          async:false,
          error:function()
          {
            
          },
          success: function(data)
          {
           var data = JSON.parse(data);
           var basefrequency=data['center_frequency'];
           if(basefrequency!=old_centerFrequency)
           {
             $.ajax({
              url:'index.php?route=common/dashboard/getFrequencies&token=<?php echo $token; ?>&no_of_output='+no_of_output+'&basefrequency='+basefrequency+'&Qam_ID='+Qam_ID,
              error:function()
              {
                
              },
              success: function(data) 
              {
              
              },
                type: 'POST'
            }); 
           }
           
         }
       });
  }
});

// Input type
 $(document).ready(function(){
 
    var control_fpga=0;
      
      $.ajax({
           url:'index.php?route=common/dashboard/getInputType&token=<?php echo $token; ?>&control_fpga='+control_fpga,
           async:false,
              error:function()
                {
                 
                },
                success: function(data) 
                {
                  data=JSON.parse(data);

         
                },
                type: 'POST'
            });

 });

function output_bitrate(output,qam_id) {
  var rmx_no=qam_id+1;
   $.ajax({
           url:'index.php?route=common/dashboard/get_output_bitrate&token=<?php echo $token; ?>&output='+output+'&rmx_no='+rmx_no+'&input=0',
    
            error:function()
            {
              
            },
            success: function(data)
            { 
              var data=Math.floor(data/1000000);
               $("#output_bitrate"+output+"_"+qam_id).attr('title',data+'Mbps');
            },
       });
}
function input_bitrate(re_no)
{
   var input=Math.floor((re_no%8));
   var rmx_no = (re_no >= 0 && re_no <= 7)?1:((re_no >= 8 && re_no <= 15)?2:((re_no >= 16 && re_no <= 23)?3:(re_no >= 24 && re_no <= 31)?4:(re_no >= 32 && re_no <= 39)?5:6));
       $.ajax({
          url:'index.php?route=common/dashboard/get_input_bitrate&token=<?php echo $token; ?>&input='+input+'&rmx_no='+rmx_no+'&re_no='+re_no+'&output=0',
    
            error:function()
            {
              
            },
            success: function(data)
            { 
              var data=Math.floor(data/1000000);
               $("#input_bitrate"+re_no).attr('title',data+'Mbps');
            },
       });
}
// ------------------------------------ SETTINGS ----------------------------------
function settings()
{
  
      $("#settings").empty();
     var html='<div class="modal-dialog" role="document" style="width: 60%; align-self: center;" >'
     html+='<div class="modal-content">'
     html+='<div class="modal-body" >'
     html+='<table class="genral" style="width:100%; height: 25%;"><tbody>'
     html+='<tr><td><h3 class=" glyphicon glyphicon-cog "  style="margin-left: 0px">Settings</h3></td></tr>'

     html+='<tr style="margin-top: 10px">'
     html+='<td>Backup System Configuration:</td><td><button class="glyphicon glyphicon-download" id="system_backup" onclick="systemBackup();" data-dismiss="modal"></button></td>'


     html+='<td>Factory Reset: </td><td><button class="glyphicon glyphicon-download" id="factory_reset" onclick="factoryReset();" data-dismiss="modal"></button></td>'
     html+='</tr>'
      html+='<tr class="blank_row"></tr>'
     html+='<tr class="blank_row"></tr>'
     html+='<tr>'
     html+='<form id="uploadzip" action="" method="post" enctype="multipart/form-data">'
     html+='<td>System Restore:</td><td><input type="file" id="file" name="file" /></td>'
     // <input type="file" id="file" name="file" />
        
     html+='<td><button id="upload" onclick="restoreSystem();" data-dismiss="modal">Upload</button></td>'
     html+='</form>'
     html+='</tr>'
     html+='<tr class="blank_row"></tr>'
     html+='<tr class="blank_row"></tr>'
     html+='<tr>'
     html+='<td>IP Address</td>'
     html+='<td><input placeholder="GE1-IP" type="text" id="GE_IP1" name="GE1_IP" class="ip" /></td>'
     html+='<td><button type="button"   onclick="ChangeDataPortIP(1)" >Update</button></td>'
     html=='</tr>'
     html+='<tr class="blank_row"></tr>'
     html+='<tr class="blank_row"></tr>'
     html+='<tr>'
     html+='<td>IP Address</td>'
     html+='<td><input placeholder="GE2-IP" type="text" id="GE_IP2" name="GE2_IP" class="ip" /></td>'
     html+='<td><button type="button"   onclick="ChangeDataPortIP(2)" >Update</button></td>'
     html+='</tr>'
     html+='<tr class="blank_row"></tr>'
     html+='<tr class="blank_row"></tr>'
     html+='<tr>'
     html+='<td>IP Address</td>'
     html+='<td><input placeholder="GE3-IP" type="text" id="GE_IP3" name="GE3_IP" class="ip" /></td>'
     html+='<td><button type="button"   onclick="ChangeDataPortIP(3)" >Update</button></td>'
     html+='</tr>'
    
         
    html+='</tbody></table></div>'
    html+='<table id="myTable" class="table fix-head responsive table-striped" >'
    html+='<thead id="table_head_col">'
    html+='<tr>'
    html+='<th>FPGA NO.</th>'
    html+='<th>Version</th>'
    html+='<th>RMX NO.</th>'
    html+='<th>Firmware Version</th>'
    html+='</tr>'
    html+='</thead>'
    html+='<tbody id="table_body_col">'
      for(var i=1;i<=13;i++)
      {
         
         html+='<tr>'
         html+='<td>'+i+'</td>'
         html+='<td><span id="fpga_'+i+'"></span></td>'  
      if(i<=6)
       {
         html+='<td>'+i+'</td>'
         html+='<td><span id="firmware_'+i+'"></span></td>'
       }
            
         html+='</tr>'

      }
    html+='</tbody>'
    html+='</table>'
     html+='<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal" >Close </button>'
     html+='</div></div>'


     $("#settings").append(html);   
       
}

function ChangeDataPortIP(data_ip_id)
{
   var ip_address=$("#GE_IP"+data_ip_id).val();

 
   $.ajax({
      url:'index.php?route=common/dashboard/ChangeDataPortIP&token=<?php echo $token; ?>&ip_address='+ip_address+'&data_ip_id='+data_ip_id,
      error:function()
      {
        alert('Error');
      },
      success:function(data)
      { 
        
        if(data==1)
        {
          alert("IP Changed");
        }
        else
        {
          alert(data);
        }
      },
      type: 'POST'
    });


 }

 function getFPGAStaticIP()
 {

    $.ajax({
      url:'index.php?route=common/dashboard/getFPGAStaticIP&token=<?php echo $token; ?>',
      error:function()
      {
        alert('Error');
      },
      success:function(data)
      { 
       data=JSON.parse(data);
       for(var i=1;i<=3;i++)
       {
        if(data[i]=="0")
        {
          
        }
        else
        {
          $("#GE_IP"+i).val(data[i]);
        }
       }
        
      },

     type: 'GET' 
    });

 }
 function getFpgaVersion()
 {
  $.ajax({
      url:'index.php?route=common/dashboard/getFpgaVersion&token=<?php echo $token; ?>',
      error:function()
      {
        alert('Unable to fetch FPGA Versions');
      },
      success:function(data)
      {
      
        data=JSON.parse(data);
         
          
          var data_1to3_maj=data['Version1to3']['maj_ver'].toString();
          var maj_V1to3=data_1to3_maj.split(',');
          var data_1to3_min=data['Version1to3']['min_ver'].toString();
          var min_V1to3=data_1to3_min.split(',');
          var V_1to3=1;
          for(i=0;i<=2;i++)
          {
            var version1to3='<b>'+  min_V1to3[i]+'.'+maj_V1to3[i]+'</b>';
            $("#fpga_"+V_1to3).append(version1to3);

            V_1to3++;
             
          }
         
          var V_5to7=5;
          for(i=0;i<=2;i++)
          {
            var version=parseInt(data['Version5to7']['version'][i]);
            version=version/10000000;
            version=version.toFixed(1)
            var version5to7='<b>'+version+'</b>';
            $("#fpga_"+V_5to7).append(version5to7);

            V_5to7++;
             
          }
          var data_8to13_maj=data['Version8to13']['maj_ver'].toString();
          var maj_V8to13=data_8to13_maj.split(',');
          var data_8to13_min=data['Version8to13']['min_ver'].toString();
          var min_V8to13=data_8to13_min.split(',');
          var V_8to13=8;
          for(i=0;i<=5;i++)
          {
            var version8to13='<b>'+  min_V8to13[i]+'.'+maj_V8to13[i]+'</b>';
            $("#fpga_"+V_8to13).append(version8to13);

            V_8to13++;
             
          }

            var version4=parseInt(data['Version4']['version']);
            version4=version4/1000000;
            version4=version4.toFixed(1)
            var version4='<b>'+version4+'</b>';
            $("#fpga_4").append(version4);

            for(var rmx_no=1;rmx_no<=6;rmx_no++)
            {
              var maj_version=parseInt(data['FirmwareVersion'+rmx_no]['maj_ver']);
              var min_version=parseInt(data['FirmwareVersion'+rmx_no]['min_ver']);

              var html='<b>'+  min_version+'.'+maj_version+'</b>';
            $("#firmware_"+rmx_no).append(html);
            }
      },
      type: 'GET'
    });
}
 
function systemBackup() {
  $.ajax({
      url:'index.php?route=common/dashboard/getSystemBackup&token=<?php echo $token; ?>',
      error:function()
      {
        alert('Error');
      },
      success:function(data)
      { 
        var backup = JSON.parse(data);
        if(backup["error"] == false){
         
          window.location.href = backup["path"];
          alert(backup["message"]);
        }else{
          alert(backup["message"]);
        }
        
      },
      type: 'GET'
    });
}
function factoryReset() {
   $.ajax({
      url:'index.php?route=common/dashboard/setFactoryReset&token=<?php echo $token; ?>',
      beforeSend: function(){
            $("#loading-img").css({"display": "block"});
            $(".overlay").show();
        },
      error:function()
      {
        alert('Error');
        $("#loading-img").css({"display": "none"});
        $(".overlay").hide();
      },
      success:function(data)
      { 
        $("#loading-img").css({"display": "none"});
        $(".overlay").hide();
      
        var backup = JSON.parse(data);
        if(backup["error"] == true){
          alert(backup["message"]);
        }else{
          alert(backup["message"]);
        }
        
      },
      type: 'GET'
    });
}
function restoreSystem() {
    
    var file_data = $('#file').prop('files')[0];
    var form_data = new FormData();
    form_data.append("file", file_data);
    $.ajax({
      url:'index.php?route=common/dashboard/restoreSystem&token=<?php echo $token; ?>',
      data: form_data,

      beforeSend: function(){
            $("#loading-img").css({"display": "block"});
            $(".overlay").show();
        },
      error:function()
      {
        alert('Error');
        $("#loading-img").css({"display": "none"});
        $(".overlay").hide();
      },
      success:function(data)
      { 
        $("#loading-img").css({"display": "none"});
        $(".overlay").hide();
        
        var backup = JSON.parse(data);
        if(backup["error"] == true){
          alert(backup["message"]);
        }else{
          alert(backup["message"]);
        }
        
      },
      cache: false,
      contentType: false,
      processData: false,
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
              $("#message_delete").empty();
                $("#message_delete").append(html).css("color","red").fadeIn('slow');
                $('#message_delete').delay(1000).fadeOut('slow');
            },
            success: function(data) 
                {
                  var html="<b>Password Updated Succesfully</b>";
                 $("#message_delete").empty();
                $("#message_delete").append(html).css("color","green").fadeIn('slow');
                $('#message_delete').delay(1000).fadeOut('slow');
                },
            type: 'POST'
        });
      }
}
// ------------------------------------ SETTINGS ----------------------------------

// Search functionality
/*$("#search_input").keyup(function(){
  var search_text=$("#search_input").val().toLowerCase();
  $(".searchInput table").each(function(){
    
    if(!contains($(this).text().toLowerCase(),search_text))
    {

      $(this).hide();
    }
    else
    {

      $(this).show();
    }
  });


});*/
/*$("#search_output").keyup(function(){
  var search_text=$("#search_output").val().toLowerCase();
  $(".searchOutput table").each(function(){
    
    if(!contains($(this).text().toLowerCase(),search_text))
    {

      $(this).hide();
    }
    else
    {

      $(this).show();
    }
  });


});
function contains(text_one,text_two)
{
    
  if(text_one.indexOf(text_two)  == -1)
 {
  
    return false;
 }
 else
 {
  
   return true;
 }
  
}*/
// Search functionality

</script>