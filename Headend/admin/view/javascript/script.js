
function myfunction(ch_number,target_id,inputid,rmx_no)
  {
      var result = confirm("Want to delete?");
      var includeFlag=0;
      if(result)
      {
        $.ajax({
      url: 'index.php?route=common/dashboard/deleteChannel&token=<?php echo $token; ?>&ch_number=' + ch_number+'&target_id='+target_id+'&inputid='+inputid+'&includeFlag='+includeFlag+'&rmx_no='+rmx_no,
      error:function()
      {
        alert('Error while deleting channel');
      },
      success:function(data)
      {
        var ele = document.getElementById("output"+ch_number);
        ele.remove();
        alert('channel deleted succesfully');
         $.ajax({
          url: 'index.php?route=common/dashboard/getActivatedChannels&token=<?php echo $token; ?>',
          error:function()
          {
            alert("invalid channel");
          },
          success: function(data)
          {
      $("#channel").val("0");
      $("#inputchannels").empty();
        $("#inputchannels").append('<div > Input Services ');
          $("#inputchannels").append('<?php foreach($Selection_detail as $Selection_value ){ foreach($ip_input[$Selection_value['Selection_Id']-1] as $api ){ foreach($api['channels'] as $value1 ){?><table id="service_ch" class="panel1" style="background-color:#f2f2f2;width: 100%; min-height: 4vh; border: 1px solid Gainsboro; white-space:nowrap; table-layout:fixed;" onClick="Input_status_INPUT(<?php echo $value1['channelnumber']?>);Input_status_OUTPUT(<?php echo $value1['channelnumber']?>);"><col style="width: 30%" /><col style="width: 45%" /><col style="width: 10%" /><tr><td><span style="margin-left:10%"><font size="2"><?php echo $value1['channelnumber'];?></span></td><td style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden" ><?php echo $value1['channelname'];?></td><td><img src="view/image/sh1.gif"  style="width:70%;cursor:pointer"  ></td></tr></table><?php } }}?>');
         $("#inputchannels").append('</div>');
         var list = JSON.parse(data);
          $("#inputchannels").append('<div> output services');
         
         <?php foreach($outputdata as $value ){ ?>
            var html=' <table class="panel1" style="background-color:#f2f2f2;width: 100%; min-height: 4vh; border: 1px solid Gainsboro;  white-space:nowrap; table-layout:fixed; ><col style="width:30%" /> <col style="width:35%" /><col style="width:30%" /><tr>'
        
            <?php if($value['changed_ch_no'] == -1){ ?>
            html+='<td><span style="margin-left:10%"><?php echo $value['channelnumber'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_no'] != -1){ ?>
            html+='<td><span style="margin-left:10%"><?php echo $value['changed_ch_no'];?></span></td>'
             <?php } ?> 
             <?php if($value['changed_ch_name'] == '-1'){ ?>
             html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['channelname'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_name'] != '-1'){ ?>
            html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['changed_ch_name'];?></span></td>'
             <?php } ?>
             html+='<td></td></tr></table> '
             $("#inputchannels").append(html);
             <?php } ?>
          $("#inputchannels").append('</div');
            location.reload();
          },
          type:'GET'
        });
       
      },
      type: 'POST'
      });
      }  
  }

    function EMMGModal()
    {

      $.ajax({
        url: 'index.php?route=common/dashboard/getEMMid&token=<?php echo $token; ?>',
        error:function()
        {
          $("#EMMG_modal").empty();
          $("#EMMG_modal").append('<div class="modal-dialog" role="document"  style="width: 30%; align-self: center;"><div class="modal-content" style="background-color: #f2f2f2"><div class="modal-body"><h4>Error while opening modal</h4></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></div></div>');
        },
        success:function(data)
        {
          
          if(data == 0)
          {
            var id = 1;
          }
          else
          {
           var id = +data + +1;
          }
          
          $("#EMMG_modal").empty();
          $("#EMMG_modal").append('<div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content" style="background-color: #f2f2f2"><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " id="EMMGModalLabel" style="margin-left: 0px">NEW EMMG</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_alias"  style="margin-top: 4px;" name=""></td><td></td><td>Status:</td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default emmg_modal" id="emm_enable" style="margin-top: 4px;" checked name=""></td><td></td><td>Bandwidth:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_bw" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_bw" style="color: red"></span></td></tr><tr><td>Channel ID:</td><td><b>'+id+'</b></td><td></td><td style="margin-top: 4px;">Stream_id:</td><td style="margin-top: 4px;"><b>'+id+'</b></td></tr><tr><td>Client ID:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_clientid" onfocusout="emmClientValidation()" style="margin-top: 4px;" name=""></td><td></td><td>Data ID:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_dataid" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_emm_clientid" style="color: red"></span></td><td></td><td></td><td><span id="error_emm_dataid" style="color: red"></span></td></tr><tr><td>Current Bitrate:</td><td></td><td></td><td>Port:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_port" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_port" style="color: red"></span></td></tr><tr></tbody></table> </div><div class="modal-footer"><button type="button" class="btn btn-default" Disabled="Disabled" id ="EMMG_onclick" onclick="addEMMG('+id+');">SAVE</button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></div></div>');

              $('#emm_alias, #emm_bw, #emm_channelid,#emm_clientid,#emm_port,#emm_dataid').keyup(function() 
                 {
                   var empty = false;
              $('#emm_alias, #emm_bw, #emm_channelid,#emm_clientid,#emm_port,#emm_dataid').each(function() 
                 {
                    if ($(this).val() == '') {
                    empty = true;
                     }
                  });

                  if (empty)
                  {
                    $('#EMMG_onclick').attr('disabled', 'disabled'); 
                  } 
                  else
                  {
                    if(emmBWValidation() && emmClientValidation() && emmDataidValidation() && emmPortValidation())
                    {
                      $('#EMMG_onclick').removeAttr('disabled'); 
                    }
                    else
                    {
                      $('#EMMG_onclick').attr('disabled', 'disabled'); 
                    }
                    
                  }
              });
            },
        type:'POST'
      });
 }
function emmBWValidation()
{
  var emm_bw = $("#emm_bw").val();
  if(emm_bw>-1 && emm_bw<65535)
  {
    $("#error_emm_bw").hide();
    return true;
  }
  else
  {
    $("#error_emm_bw").html("Bandwidth should be in the range of 0-65535");
     $("#error_emm_bw").show();
    return false;
  }
}
function emmClientValidation()
{
  var text = $("#emm_clientid").val().trim();
      var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1,10}$/i);
      if(pattern.test(text))
      {
        
          if((text.length)%2 == 0)
          {
            $("#error_emm_clientid").hide();
           return true;
          }
          else
          {
            ("#error_emm_clientid").html("Client ID should have even digits");
          $("#error_emm_clientid").show();
          return false;
          }
      }    
      else
      {
        $("#error_emm_clientid").html("Client ID starts with 0x");
          $("#error_emm_clientid").show();
           return false;
      }
}
function emm_clientid()
{

  var text = $("#emm_clientid").val().trim();
    var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1}[0-9a-fA-F]{0,7}$/i);
    if(text == '')
    {
       $("#error_emm_clientid").html("Should not be empty");
        $("#error_emm_clientid").show();
        
    }
    else if(pattern.test(text))
    {
        $("#error_emm_clientid").hide();
        if(text.length <10)
       {
          var sub_beg = text.substr(0,2);
          var sub_end = text.substr(2,text.length);
          while(sub_end.length <8)
          {
            sub_end = "0"+sub_end;
          }
         
          $("#emm_clientid").val(sub_beg+sub_end) ;
          
       }
        
    }    
    else
    {
      $("#error_emm_clientid").html("Super Cas Id starts with 0x and should be heaxadecimal(<0xffffffff)");
        $("#error_emm_clientid").show();
       
    }
  
}
function emmDataidValidation()
{
  var emm_bw = $("#emm_dataid").val();
  if(emm_bw>-1 && emm_bw<65535)
  {
    $("#error_emm_dataid").hide();
    return true;
  }
  else
  {
    $("#error_emm_dataid").html("Dataid should be in the range of 0-65535");
     $("#error_emm_dataid").show();
    return false;
  }
}
function emmPortValidation()
{
  var emm_bw = $("#emm_port").val();
  if(emm_bw>-1 && emm_bw<65535)
  {
    $("#error_emm_port").hide();
    return true;
  }
  else
  {
    $("#error_emm_port").html("Port number should be in the range of 0-65535");
     $("#error_emm_port").show();
    return false;
  }
}
    /*EMMG validation*/


    /*EMMG Plus Script*/
  
    function addEMMG(data)
    {
          emm_alias = $('#emm_alias').val();
          emm_bw = $('#emm_bw').val();
          emm_clientid = $('#emm_clientid').val();
          emm_port = $('#emm_port').val();
          emm_dataid = $('#emm_dataid').val();

          if($('#emm_enable').prop('checked') == true)
          {
          var emm_enable = 1;
          }
          else
          {
          var  emm_enable = 0;
          }
         var res = confirm("want to add new EMMG?");
         if(res)
         {
          $.ajax({
          url: 'index.php?route=common/dashboard/addEMMGChannel&token=<?php echo $token; ?>&emm_alias='+ emm_alias+'&emm_bw=' +emm_bw+'&emm_channelid='+data + '&emm_streamid='+data+ '&emm_clientid=' + emm_clientid+ '&emm_port=' + emm_port+ '&emm_dataid=' + emm_dataid+ '&emm_enable=' + emm_enable,
          error:function()
          {
          alert("Error while adding EMMG");
          },
          success: function(data) 
          {
            if(data == 1)
            {
              alert('EMMG added succesfully');
              location.reload();
            }
            else
            {
              alert('Error while adding EMMG');
            }
          },
          type: 'POST'
          });
         }
        
    }

    function EMMG_settings(channel_id)
    {
         $.ajax({
          url: 'index.php?route=common/dashboard/getEMMGData&token=<?php echo $token; ?>&channel_id='+ channel_id,
          error:function()
          {
          alert("Error while Opening EMMG modal");
          },
          success: function(data) 
          { 
          	if (data==1) 
          	{
                alert("Error");
          	}
           var emmdata = JSON.parse(data);
           $("#emmg_settings_modal").empty();
          $("#emmg_settings_modal").append('<div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content" style="background-color: #f2f2f2"><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " id="EMMGModalLabel" style="margin-left: 0px">'+emmdata['alias']+'</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_settings_alias" value="'+emmdata['alias']+'"  style="margin-top: 4px;" name=""></td><td></td><td>Status:</td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default emmg_modal" id="emm_settings_enable" style="margin-top: 4px;" checked name=""></td><td></td><td>Bandwidth:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_settings_bw" value="'+emmdata['bandwidth']+'" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_settings_bw" style="color: red"></span></td></tr><tr><td>Channel ID:</td><td><b>'+emmdata['channel_id']+'</b></td><td></td><td style="margin-top: 4px;">Stream_id:</td><td style="margin-top: 4px;"><b>'+emmdata['stream_id']+'</b></td></tr><tr><td>Client ID:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_settings_clientid" onfocusout="emm_settings_clientid()" value="'+emmdata['client_id']+'" style="margin-top: 4px;" name=""></td><td></td><td>Data ID:</td><td><input type="text" class="form-control-default emmg_modal" value="'+emmdata['data_id']+'" id="emm_settings_dataid" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_emm_settings_clientid" style="color: red"></span></td><td></td><td></td><td><span id="error_emm_dataid" style="color: red"></span></td></tr><tr><td>Current Bitrate:</td><td></td><td></td><td>Port:</td><td><input value="'+emmdata['port']+'" type="text" class="form-control-default emmg_modal" id="emm_settings_port" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_settings_port" style="color: red"></span></td></tr><tr></tbody></table> </div><div class="modal-footer"><button type="button" class="btn btn-default" Disabled="Disabled" id ="EMMG_Settings" onclick="updateEMMG('+emmdata['channel_id']+');">APPLY & SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></div></div>');

              $('#emm_settings_alias, #emm_settings_bw,#emm_settings_clientid,#emm_settings_port,#emm_settings_dataid').keyup(function() 
                 {
                   var empty = false;
              $('#emm_settings_alias, #emm_settings_bw,#emm_settings_clientid,#emm_settings_port,#emm_settings_dataid').each(function() 
                 {
                    if ($(this).val() == '') {
                    empty = true;
                     }
                  });

                  if (empty)
                  {
                    $('#EMMG_Settings').attr('disabled', 'disabled'); 
                  } 
                  else
                  {
                    if(emmsettingsBWValidation() && emmsettingsClientValidation() && emmsettingsDataidValidation() && emmsettingsPortValidation())
                    {
                      $('#EMMG_Settings').removeAttr('disabled'); 
                    }
                    else
                    {
                      $('#EMMG_Settings').attr('disabled', 'disabled'); 
                    }
                    
                  }
              });
          },
          type: 'POST'
          });
    }

  function updateEMMG(data)
    {
      emm_alias = $('#emm_settings_alias').val();
      emm_bw = $('#emm_settings_bw').val();
      emm_clientid = $('#emm_settings_clientid').val();
      emm_port = $('#emm_settings_port').val();
      emm_dataid = $('#emm_settings_dataid').val();

        if($('#emm_settings_enable').prop('checked') == true)
        {
        var emm_enable = 1;
        }
        else
        {
        var  emm_enable = 0;
        }
        var result = confirm("Want to update EMM data?");
        if(result)
        {
           $.ajax({
            url: 'index.php?route=common/dashboard/updateEMMG&token=<?php echo $token; ?>&emm_alias='+ emm_alias+'&emm_bw=' +emm_bw+'&emm_channelid='+data + '&emm_streamid='+data+ '&emm_clientid=' + emm_clientid+ '&emm_port=' + emm_port+ '&emm_dataid=' + emm_dataid+ '&emm_enable=' + emm_enable,
            error:function()
            {
            alert("Error while Updating EMMG");
            },
            success: function(data) 
            {
              if(data == 1)
              {
                alert('EMMG updated succesfully');
                 $('#EMMG_Settings').attr('disabled', 'disabled'); 
              }
              else
              {
                alert('Error while updating EMMG');
              }
            },
            type: 'POST'
          });
        }
    }

function emmsettingsBWValidation()
{
  var emm_bw = $("#emm_settings_bw").val();
  if(emm_bw>-1 && emm_bw<65535)
  {
    $("#error_emm_settings_bw").hide();
    return true;
  }
  else
  {
    $("#error_emm_settings_bw").html("Bandwidth should be in the range of 0-65535");
     $("#error_emm_settings_bw").show();
    return false;
  }
}

function emmsettingsClientValidation()
{
  var text = $("#emm_settings_clientid").val().trim();
      var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1,10}$/i);
      if(pattern.test(text))
      {
          $("#error_emm_settings_clientid").hide();
          return true;
      }    
      else
      {
        $("#error_emm_settings_clientid").html("Access criteria starts with 0x and should be hexadecimal");
          $("#error_emm_settings_clientid").show();
           return false;
      }
}
function emm_settings_clientid()
{

  var text = $("#emm_settings_clientid").val().trim();
    var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1}[0-9a-fA-F]{0,7}$/i);
    if(text == '')
    {
       $("#error_emm_settings_clientid").html("Should not be empty");
        $("#error_emm_settings_clientid").show();
        // return false;
    }
    else if(pattern.test(text))
    {
        $("#error_emm_settings_clientid").hide();
        if(text.length <10)
       {
          var sub_beg = text.substr(0,2);
          var sub_end = text.substr(2,text.length);
          while(sub_end.length <8)
          {
            sub_end = "0"+sub_end;
          }
         
          $("#emm_settings_clientid").val(sub_beg+sub_end) ;
          // alert(sub_beg+sub_end);
       }
        // return true;
    }    
    else
    {
      $("#error_emm_clientid").html("Client id starts with 0x and should be heaxadecimal(<0xffffffff)");
        $("#error_emm_settings_clientid").show();
        // return false;
    }
  
}
/*function emmsettingsClientValidation()
{
  var text = $("#emm_settings_clientid").val().trim();
      var pattern = new RegExp(/^[0]{1}[x]{1}[0-9]{1,10}$/i);
      if(pattern.test(text))
      {
        // $("#error_stream_access_criteria").html("in success");
          $("#error_emm_settings_clientid").hide();
           return true;
      }    
      else
      {
        $("#error_emm_settings_clientid").html("Access criteria starts with 0x");
          $("#error_emm_settings_clientid").show();
           return false;
      }
}*/
function emmsettingsDataidValidation()
{
  var emm_bw = $("#emm_settings_dataid").val();
  if(emm_bw>-1 && emm_bw<65535)
  {
    $("#error_emm_settings_dataid").hide();
    return true;
  }
  else
  {
    $("#error_emm_settings_dataid").html("Dataid should be in the range of 0-65535");
     $("#error_emm_settings_dataid").show();
    return false;
  }
}
function emmsettingsPortValidation()
{
  var emm_bw = $("#emm_settings_port").val();
  if(emm_bw>-1 && emm_bw<65535)
  {
    $("#error_emm_settings_port").hide();
    return true;
  }
  else
  {
    $("#error_emm_settings_port").html("Port number should be in the range of 0-65535");
     $("#error_emm_settings_port").show();
    return false;
  }
}
  function deleteEMMG(channel_id)
  {
    var res = confirm("Want to delete EMMG?");
    if(res)
    {
      $.ajax({
          url: 'index.php?route=common/dashboard/deleteEMMG&token=<?php echo $token; ?>&emm_channelid='+ channel_id,
          error:function()
          {
          alert("Error while Updating EMMG");
          },
          success: function(data) 
          {
            if(data == 1)
            {
              alert('EMMG Deleted succesfully');
              location.reload();
            }
            else
            {
              alert('Error while Deleting EMMG');
            }
          },
          type: 'POST'
          });
    }
    
  }

     function onclickModal(ch_name,ch_number,input,RE_NO,no_of_input)
     {
  
         rmx_no=Math.floor((RE_NO/no_of_input))+1;
         input = input%no_of_input;
        $.ajax({
          url: 'index.php?route=common/dashboard/getChannelInformation&token=<?php echo $token; ?>&channel_number='+ch_number+'&input_id='+input+'&rmx_no='+rmx_no,
          error:function()
          {
            alert("Error While Opeaning Modal");
          },
          success: function(data)
          {
           
              if(data)
              {   
               
                var arr= JSON.parse(data);
                 $("#channel_modal").empty();
                 
                $("#channel_modal").append('<div class="modal-dialog"  style="width: 70%; align-self: center; " ><div class="modal-content" style="background-color:#f2f2f2";  ><div class="modal-body" > <table class="genral" style="width:100%; height:20%;"><div class="modal-header"><h4 class=" glyphicon glyphicon-cog " id="name" style="margin-left: 0px" "><font>'+ch_name+','+ch_number+'</font></h4></div><tbody><tr><td>serviceprovider Name:</td> <td><b>'+arr['serviceprovider']+'</b></td><td></td> <td>Status:</td></tr> <tr> <td>Service Type:</td> <td><b>'+arr["servicetype"]+'</b></td><td></td><td>CA Mode:</td><td><b>Not scambled</b></td></tr><tr><td>PMT PID:</td><td><b>'+arr['PMTpid']+'</b></td><td></td><td>EIT Present:</td><td><b>Not Present</b></td></tr><tr><td>PCR PID</td><td><b>'+arr['PCRpid']+'</b></td><td></td><td>EIT present following:</td><td><b>Not present</b></td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button></div></div></div>');
              }
              
          },
          type:'POST'
        });
     }
 
    $('#channel').ready(function(){
       $.ajax({
          url: 'index.php?route=common/dashboard/getActivatedChannels&token=<?php echo $token; ?>',
          error:function()
          {
            alert("invalid channel");
          },
          success: function(data)
          {  
              
      $("#channel").val("0");
      $("#inputchannels").empty();
      
     
        $("#inputchannels").append('<div> Input Services ');
          $("#inputchannels").append('<?php foreach($Selection_detail as $Selection_value ){ foreach($ip_input[$Selection_value['Selection_Id']-1] as $api ){ foreach($api['channels'] as $value1 ){?><table id="service_ch" class="panel1" style="background-color:#f2f2f2;width: 100%; min-height: 4vh; border: 1px solid Gainsboro; white-space:nowrap; table-layout:fixed;" onClick="Input_status_INPUT(<?php echo $value1['channelnumber']?>);Input_status_OUTPUT(<?php echo $value1['channelnumber']?>);"><col style="width: 30%" /><col style="width: 45%" /><col style="width: 10%" /><tr><td><span style="margin-left:10%"><font size="2"><?php echo $value1['channelnumber'];?></span></td><td style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden" ><?php echo $value1['channelname'];?></td><td><img src="view/image/sh1.gif"  style="cursor:pointer;width:70%;"  ></td></tr></table><?php } } }?>');
         $("#inputchannels").append('</div>');
         var list = JSON.parse(data);
          $("#inputchannels").append('<div> output services');
        
          <?php foreach($outputdata as $value ){ ?>
            var html=' <table class="panel1" style="background-color:#f2f2f2;width: 100%; min-height: 4vh; border: 1px solid Gainsboro;  white-space:nowrap; table-layout:fixed;'
             html+='"><col style="width:30%"/><col style="width:35%"/><col style="width:30%"/><tr>'
        
            <?php if($value['changed_ch_no'] == -1){ ?>
            html+='<td><span style="margin-left:10%"><?php echo $value['channelnumber'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_no'] != -1){ ?>
            html+='<td><span style="margin-left:10%"><?php echo $value['changed_ch_no'];?></span></td>'
             <?php } ?> 
             <?php if($value['changed_ch_name'] == '-1'){ ?>
             html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['channelname'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_name'] != '-1'){ ?>
            html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['changed_ch_name'];?></span></td>'
             <?php } ?>
             html+='<td></td></tr></table> '
             $("#inputchannels").append(html);
             <?php } ?>
                  
          $("#inputchannels").append('</div');

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
           $("table.panel1 tr:even").css("background-color","#E0FFFF").hover(function(){
            $(this).css('background-color','lightblue');
          },function(){
                  $(this).css('background-color','#E0FFFF');     
            });

          $("table.panel1 tr:even").css("background-color","#E0FFFF").click(function(){
            $(this).css('background-color','orange');
          });
           $('.modal').on('hidden.bs.modal',function(){
           $("table.panel1 tr:even").css("background-color","#E0FFFF").hover(function(){
            $(this).css('background-color','lightblue');
          },function(){
                  $(this).css('background-color','#E0FFFF');     
            });

          $("table.panel1 tr:even").css("background-color","#E0FFFF").click(function(){
            $(this).css('background-color','orange');
          }); 
        });    
      },
          type:'GET'
        });
    });

$('#channel').change(function(){ 
  var strUser = $(".channels option:selected").val();

  if ((strUser.localeCompare(1))==0) {
    $("#inputchannels").empty();
    var i;
    $("#inputchannels").append('<div> Input Services ');
      
        $("#inputchannels").append('<?php foreach($Selection_detail as $Selection_value ){ foreach($ip_input[$Selection_value['Selection_Id']-1] as $api ){ foreach($api['channels'] as $value1 ){?><table id="service_ch" class="panel2" style="background-color:#f2f2f2;width: 100%; min-height: 4vh; border: 1px solid Gainsboro; white-space:nowrap; table-layout:fixed;" onClick="Input_status_INPUT(<?php echo $value1['channelnumber']?>);Input_status_OUTPUT(<?php echo $value1['channelnumber']?>);"><col style="width: 30%" /><col style="width: 45%" /><col style="width: 10%" /><tr><td><span style="margin-left:10%"><font size="2"><?php echo $value1['channelnumber'];?></span></td><td style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden"><?php echo $value1['channelname'];?></td><td><img src="view/image/sh1.gif" style="height:20%;cursor:pointer"  ></td></tr></table><?php } } }?>');
       
        $("#inputchannels").append('</div>');
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
           $("table.panel2 tr:even").css("background-color","#E0FFFF").hover(function(){
            $(this).css('background-color','lightblue');
          },function(){
                  $(this).css('background-color','#E0FFFF');     
            });

          $("table.panel2 tr:even").css("background-color","#E0FFFF").click(function(){
            $(this).css('background-color','orange');
          });
           $('.modal').on('hidden.bs.modal',function(){
           $("table.panel2 tr:even").css("background-color","#E0FFFF").hover(function(){
            $(this).css('background-color','lightblue');
          },function(){
                  $(this).css('background-color','#E0FFFF');     
            });

          $("table.panel2 tr:even").css("background-color","#E0FFFF").click(function(){
            $(this).css('background-color','orange');
          }); 
        });
      }
      else if((strUser.localeCompare(2))==0)
        {
           $.ajax({
          url: 'index.php?route=common/dashboard/getActivatedChannels&token=<?php echo $token; ?>',
          error:function()
          {
            alert("invalid channel");
          },
          success: function(data)
          {
            $("#inputchannels").empty();
            var list = JSON.parse(data);
            $("#inputchannels").append('<div> output services');
           <?php foreach($outputdata as $value ){ ?>
            var html=' <table class="panel2" style="background-color:#f2f2f2;width: 100%; min-height: 4vh; border: 1px solid Gainsboro;  white-space:nowrap; table-layout:fixed;"><col style="width:30%" /> <col style="width:35%" /><col style="width:30%" /><tr>'
        
            <?php if($value['changed_ch_no'] == -1){ ?>
            html+='<td><span style="margin-left:10%"> <?php echo $value['channelnumber'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_no'] != -1){ ?>
            html+='<td><span style="margin-left:10%"> <?php echo $value['changed_ch_no'];?></span></td>'
             <?php } ?> 
             <?php if($value['changed_ch_name'] == '-1'){ ?>
             html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['channelname'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_name'] != '-1'){ ?>
            html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['changed_ch_name'];?></span></td>'
             <?php } ?>
             html+='<td></td></tr></table> '
             $("#inputchannels").append(html);
             <?php } ?>
          $("#inputchannels").append('</div');
          
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
           $("table.panel2 tr:even").css("background-color","#E0FFFF").hover(function(){
            $(this).css('background-color','lightblue');
          },function(){
                  $(this).css('background-color','#E0FFFF');     
            });

          $("table.panel2 tr:even").css("background-color","#E0FFFF").click(function(){
            $(this).css('background-color','orange');
          });
           $('.modal').on('hidden.bs.modal',function(){
           $("table.panel2 tr:even").css("background-color","#E0FFFF").hover(function(){
            $(this).css('background-color','lightblue');
          },function(){
                  $(this).css('background-color','#E0FFFF');     
            });

          $("table.panel2 tr:even").css("background-color","#E0FFFF").click(function(){
            $(this).css('background-color','orange');
          }); 
        });
          },
          type:'GET'
        });
        }
        else if((strUser.localeCompare(0))==0)
        {
           $.ajax({
          url: 'index.php?route=common/dashboard/getActivatedChannels&token=<?php echo $token; ?>',
          error:function()
          {
            alert("invalid channel");
          },
          success: function(data)
          {
            // alert(data);
      $("#inputchannels").empty();
        $("#inputchannels").append('<div> Input Services ');
          $("#inputchannels").append('<?php foreach($Selection_detail as $Selection_value ){ foreach($ip_input[$Selection_value['Selection_Id']-1] as $api ){ foreach($api['channels'] as $value1 ){?><table id="service_ch" class="panel1" style="background-color:#f2f2f2;width: 100%; min-height: 4vh; border: 1px solid Gainsboro; white-space:nowrap; table-layout:fixed;" onClick="Input_status_INPUT(<?php echo $value1['channelnumber']?>);Input_status_OUTPUT(<?php echo $value1['channelnumber']?>);"><col style="width: 30%" /><col style="width: 45%" /><col style="width: 10%" /><tr><td><span style="margin-left:10%"><font size="2"><?php echo $value1['channelnumber'];?></span></td><td style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden"><?php echo $value1['channelname'];?></td><td><img src="view/image/sh1.gif" style="height:20%;cursor:pointer"  ></td></tr></table> <?php } } }?>');
         $("#inputchannels").append('</div>');
         var list = JSON.parse(data);
          $("#inputchannels").append('<div> output services');
          
          <?php foreach($outputdata as $value ){ ?>
            var html=' <table class="panel1" style="background-color:#f2f2f2;width: 100%; min-height: 4vh; border: 1px solid Gainsboro;  white-space:nowrap; table-layout:fixed;"><col style="width:30%" /> <col style="width:35%" /><col style="width:30%" /><tr>'
        
            <?php if($value['changed_ch_no'] == -1){ ?>
            html+='<td><span style="margin-left:10%"> <?php echo $value['channelnumber'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_no'] != -1){ ?>
            html+='<td><span style="margin-left:10%"> <?php echo $value['changed_ch_no'];?></span></td>'
             <?php } ?> 
             <?php if($value['changed_ch_name'] == '-1'){ ?>
             html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['channelname'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_name'] != '-1'){ ?>
            html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['changed_ch_name'];?></span></td>'
             <?php } ?>
             html+='<td></td></tr></table> '
             $("#inputchannels").append(html);
             <?php } ?>
          $("#inputchannels").append('</div');
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
           $("table.panel1 tr:even").css("background-color","#E0FFFF").hover(function(){
            $(this).css('background-color','lightblue');
          },function(){
                  $(this).css('background-color','#E0FFFF');     
            });

          $("table.panel1 tr:even").css("background-color","#E0FFFF").click(function(){
            $(this).css('background-color','orange');
          });
           $('.modal').on('hidden.bs.modal',function(){
           $("table.panel1 tr:even").css("background-color","#E0FFFF").hover(function(){
            $(this).css('background-color','lightblue');
          },function(){
                  $(this).css('background-color','#E0FFFF');     
            });

          $("table.panel1 tr:even").css("background-color","#E0FFFF").click(function(){
            $(this).css('background-color','orange');
          }); 
        });
          },
          type:'GET'
        });
        }
});
$(document).on("click",'#ge1_apply',function(e){
  ge1_port = $("#ge1_port").val();
  ge1_alias = $("#ge1_alias").val();
  ge1_ip = $("#ge1_ip").val();
  payload_interface = "ge1";
  $.ajax({
    url:'index.php?route=common/dashboard/storeIPInput&token=<?php echo $token; ?>&ge1_port=' + ge1_port+'&ge1_alias='+ge1_alias+'&ge1_ip='+ge1_ip+'&payload_interface='+payload_interface,
    error:function(){
      alert('Error while creating Ip input');
    },
    success:function(data)
    {
      alert('New IP created succesfully');
      $('#ge2_collapse').append('  <div class="panel1" id="channel'+ge1_port+'" data-toggle="collapse"   data-target="#demo1'+ge1_port+'" style="margin-left: 15px; margin-bottom: 5px;" ><table><colgroup><col style="width: 45%" /><col style="width: 5%" /><col style="width: 5%" /></colgroup><tr><td><span>'+ge1_alias+'</span></td><td><span class="glyphicon glyphicon-cog" onclick="channel_setting('+ge1_port+')" data-toggle="modal" data-target="#channel_setting_modal"></span></td><td><span id="channel_delete"  class="glyphicon glyphicon-trash" onclick="delete_input('+ge1_port+');" ></span></td></tr></table></div>');

        location.reload();
    }
  });
});
function ecmgStream(ecmg_id,ecm_stream_streamid)
{
    ecm_stream_alias = $("#ecm_stream_alias").val();
    // ecm_stream_enable = $("#ecm_stream_enable").val();
    ecm_stream_access_criteria = $("#ecm_stream_access_criteria").val();
    ecm_stream_ecmId = $("#ecm_stream_ecmId").val();
    ecm_stream_CP_number = 0;
    ecm_stream_CW_group = $("#ecm_stream_CW_group").val();

   var result = confirm("Want to add new ECM Stream?");
   if(result)
   {
     $.ajax({
      url:'index.php?route=common/dashboard/addECMStream&token=<?php echo $token; ?>&ecm_stream_alias=' + ecm_stream_alias+'&ecm_stream_access_criteria='+ecm_stream_access_criteria+'&ecm_stream_ecmId='+ecm_stream_ecmId+'&ecm_stream_CW_group='+ecm_stream_CW_group+'&ecm_stream_CP_number='+ecm_stream_CP_number+'&ecm_stream_streamid='+ecm_stream_streamid+'&ecmg_id='+ecmg_id,
      error:function()
      {
        alert('Error while adding ECM Stream-1');
      },
      success:function(data)
      {
        if(data == -1)
        {
          alert("ECM Id should be unique");
        }
        else if(data == 0)
        {
          alert('Error while adding ecmg stream');
        }
        else
        {
           alert('ECMG stream added succesfully');
           location.reload();
        }
      }
    });
   }
    
}
function onclickECMG(ecmg_id)
{
  $.ajax({
    url:'index.php?route=common/dashboard/getLastStreamId&token=<?php echo $token; ?>&ecm_id='+ecmg_id,
    error:function()
    { 
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
      $("#ecmg-1plus").append('<div class="modal-dialog" role="document" style="width: 70%; align-self: center; "><div class="modal-content" style="background-color: #f2f2f2"><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h4 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" style="margin-left: 0px">New ECM Stream</h4></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_alias" name=""></td><td></td><td>Status:</td></tr><tr><td></td><td><span id="error_stream_alias" style="color: red"></span></td><td></td><td></td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;" checked id="ecm_stream_enable" name=""></td><td></td><td>Access criteria</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_access_criteria" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_access_criteria" style="color: red"></span></td></tr><tr><td>Stream ID:</td><td><b>'+stream_id+'</b></td><td></td><td>ECM ID</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_ecmId" value="'+stream_id+'" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_ecmid" style="color: red"></span></td></tr><tr><td>CP Number:</td><td>'+0+'</td><td></td><td>CW Group:</td><td><input type="text" class="form-control-default" style="margin-top: 4px;" id="ecm_stream_CW_group" value="'+stream_id+'"></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_cw_number" style="color: red"></span></td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" onClick="ecmgStream('+ecmg_id+','+stream_id+')" disabled="disabled" id="ecm_stream_save"  >APPLY & SAVE </button><button type="button" class="btn btn-default"  data-dismiss="modal" >Cancel </button></div></div></div>');

         $('#ecm_stream_alias, #ecm_stream_ecmId, #ecm_stream_access_criteria, #ecm_stream_CW_group').keyup(function() {
         
        var empty = false;
        $('#ecm_stream_alias, #ecm_stream_ecmId, #ecm_stream_access_criteria, #ecm_stream_CW_group').each(function() {
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
           if(check_ecm_stream_alias() && check_ecm_stream_ecmId() && check_ecm_stream_access_criteria() && check_ecm_cw_number())
            {
              $('#ecm_stream_save').removeAttr('disabled'); 
            }
            else
            {
              $('#ecm_stream_save').attr('disabled', 'disabled');
            }
        }
    });

    },
  });
}
function check_ecm_cw_number()
{
  var text1=$("#ecm_stream_CW_group").val().trim();

    if (text1=='') 
     {
        $("#error_stream_cw_number").html("should not be empty");
        return false;
        
     }
     else if(text1 > 0 && text1<1000)
     {
      $("#error_stream_cw_number").hide();
      return true;
     }
     else
     {
      $("#error_stream_cw_number").html("should be in range 1 to 999");
      $("#error_stream_cw_number").show();
      return false;
     }
}
 function check_ecm_stream_alias()
 { 
    var text=$("#ecm_stream_alias").val().trim();
    if(text=='')
    {
      $("#error_stream_alias").html("Alias should not be empty");
      $("#error_stream_alias").show();
      return false;
    }
    else
    {
      $("#error_stream_alias").hide();
       return true;
    }
    
 }

 function check_ecm_stream_ecmId ()
 {
  var text1=$("#ecm_stream_ecmId").val().trim();

    if (text1=='') 
     {
        $("#error_stream_ecmid").html("should not be empty");
        return false;
        
     }
     else if(text1 > 0 && text1<1000)
     {
      $("#error_stream_ecmid").hide();
      return true;
     }
     else
     {
      $("#error_stream_ecmid").html("should be in range 1 to 999");
      $("#error_stream_ecmid").show();
      return false;
     }
}
function check_ecm_stream_access_criteria()
{
   var text = $("#ecm_stream_access_criteria").val().trim();
      var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1,10}$/i);
      if(pattern.test(text))
      {
          if((text.length)%2)
          {
            $("#error_stream_access_criteria").html("Access criteria does not have an even number of digits");
          $("#error_stream_access_criteria").show();
          return false;
            
          }
          else
          {
            $("#error_stream_access_criteria").hide();
           return true;
          }
      }    
      else
      {
        $("#error_stream_access_criteria").html("Access criteria starts with 0x and should be hexadecimal");
          $("#error_stream_access_criteria").show();
           return false;
      }

}
function newECMG()
       {
          $.ajax({
              url:'index.php?route=common/dashboard/getLastECMGId&token=<?php echo $token; ?>',
              error:function()
              {
                //alert('error');
              },
              success:function(data)
              {
                var xx = JSON.parse(data);
                // alert(xx['id']);
                if(xx['0'] == '')
                {
                  xx['0'] = 0;
                }
                if(xx['0']>3)
                {
                  
                   $("#ECMGModal").empty();
                  $("#ECMGModal").append('<div class="modal-dialog" role="document"  style="width: 30%; align-self: center;"><div class="modal-content" style="background-color: #f2f2f2"><div class="modal-body"><h4>Cannot add more than 4 ECMGs </h4></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></div></div>');
                }
                else
                {
                
                  if(xx['id'] == 0)
                  {
                   var id = 1;
                   
                  }
                  else
                  {
                    var id = xx['id']+1;
                  }
                $("#ECMGModal").empty();
                $("#ECMGModal").append('<div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content" style="background-color: #f2f2f2"><form><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" style="margin-left: 0px">New ECMG</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default ecmg_modal" id="Alias" style="margin-top: 4px;" name=""></td><td></td><td>Status:</td></tr><tr><td>Enable:</td><td><input checked type="checkbox" class="form-control-default ecmg_modal" id="Enable" style="margin-top: 4px;" name=""></td><td></td><td>Super CAS ID:</td><td><input type="text" class="form-control-default ecmg_modal" onfocusout="supercas_id()" id="super_CAS_id" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td><span id="error_super_CAS_id" style="color: red"></span></td><td></td></tr><tr><td>Ip Address:</td><td><input type="text" class="form-control-default ecmg_modal" id="ipAddress" style="margin-top: 4px;" name=""></td><td></td><td>Channel ID:</td><td><input type="text" value='+id+' class="form-control-default ecmg_modal" id="Channel_id" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_ipaddress" style="color: red"></span></td><td><span id="error_channel_id" style="color: red"></td><td></td></tr><tr><td>Port</td><td><input type="text" class="form-control-default ecmg_modal" value="" id="Port" style="margin-top: 4px;" name=""></td><td></td><td>Scramble Mode:</td><td><select id="Scramble_mode"><option>DVB-CSA/TS</option></select></td></tr><td></td><td><span id="error_port" style="color: red"></span></td><td></td><td></td><tr><td>Cryptoperiod</td><td><input type="text" class="form-control-default ecmg_modal" value="10" id="Cryptoperiod" style="margin-top: 4px;" name=""> Sec</td><td></td><td>Simulcrypt version</td><td><select id="Simulcrypt_version" style="width: 100px;"><option>1</option><option>2</option><option>3</option><option>4</option></select></td></tr><td></td><td><span id="error_Cryptoperiod" style="color: red"></span></td><td></td><td></td></tbody></table>      </div><div class="modal-footer"><button type="button" class="btn btn-default" disabled="Disable" id ="ECMG_onclick" onclick="ecmg_onclick();">SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></form></div></div>');

                  $('#Alias, #Enable, #super_CAS_id, #ipAddress,#Port,#Channel_id,#Cryptoperiod').keyup(function() {

                    var empty = false;
                    $('#Alias, #Enable, #super_CAS_id,#Channel_id,#ipAddress,#Port,#Cryptoperiod').each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $('#ECMG_onclick').attr('disabled', 'disabled'); 
                      } else { 
                       if(check_ipAddress() && check_Port() && check_Cryptoperiod() && check_super_CAS_id() && check_channel_id())
                        {
                          $('#ECMG_onclick').removeAttr('disabled'); 
                        }
                        else
                        {
                          $('#ECMG_onclick').attr('disabled', 'disabled');
                        }
                      }
                  });
              }
            }
            });
        }
function check_channel_id()
{
  var text1 = $("#Channel_id").val().trim();
  if (text1=='') {
        $("#error_channel_id").html("Port Number should not be empty");
      $("#error_channel_id").show();
      return false;
     }
    else if (text1>0 && text1<1024 ) {
      $("#error_channel_id").hide();
      return true;
    }
    else
    {
      $("#error_channel_id").html("Invalid Channel id");
      $("#error_channel_id").show();
      return false;
    }
}
function check_super_CAS_id()
{
    var text = $("#super_CAS_id").val().trim();
    var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1}[0-9a-fA-F]{0,7}$/i);
    if(pattern.test(text))
    {
        
        $("#error_super_CAS_id").hide();
        return true;
    }    
    else
    {
      $("#error_super_CAS_id").html("Super Cas Id starts with 0x and should be heaxadecimal(<0xffffffff)");
        $("#error_super_CAS_id").show();
        return false;
    }
}
function supercas_id()
{

  var text = $("#super_CAS_id").val().trim();
    var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1}[0-9a-fA-F]{0,7}$/i);
    if(text == '')
    {
       $("#error_super_CAS_id").html("Should not be empty");
        $("#error_super_CAS_id").show();
        // return false;
    }
    else if(pattern.test(text))
    {
        $("#error_super_CAS_id").hide();
        if(text.length <10)
       {
          var sub_beg = text.substr(0,2);
          var sub_end = text.substr(2,text.length);
          while(sub_end.length <8)
          {
            sub_end = "0"+sub_end;
          }
         
          $("#super_CAS_id").val(sub_beg+sub_end) ;
         
       }
       
    }    
    else
    {
      $("#error_super_CAS_id").html("Super Cas Id starts with 0x and should be heaxadecimal(<0xffffffff)");
        $("#error_super_CAS_id").show();
    }
  
}
function check_ipAddress()  {
    var text=$("#ipAddress").val().trim();
    var pattern = new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);

if (text=='') {
$("#error_ipaddress").html("Ip address should not be empty");
      $("#error_ipaddress").show();
      return false;
}
   else if (pattern.test(text)) {
      $("#error_ipaddress").hide();
      return true;
    }
    else
    {
      $("#error_ipaddress").html("invalid Ip Address");
      $("#error_ipaddress").show();
      return false;
    }
    
  }

function check_Port()
{
   var text1=$("#Port").val().trim();
     if (text1=='') {
        $("#error_port").html("Port Number should not be empty");
      $("#error_port").show();
      return false;
     }
    else if (text1>1024 && text1<65537 ) {
      $("#error_port").hide();
      return true;
    }
    else
    {
      $("#error_port").html("Invalid Port Number(>1024 and <65536)");
      $("#error_port").show();
      return false;
    }
  
}
function check_Cryptoperiod ()
  {
  var text1=$("#Cryptoperiod").val().trim();
     if (text1=='') {
        $("#error_Cryptoperiod").html("should not be empty");
      $("#error_Cryptoperiod").show();
      return false;
     }
     else if ( text1>=0 && text1<=90) 
     {
      $("#error_Cryptoperiod").hide();
      return true;
      
    }
    else{
     $("#error_Cryptoperiod").html(" should be in the range of 0-90");
      $("#error_Cryptoperiod").show();
      return false;
    }
}

function ecmg_onclick()
{
          ip_Address = $('#ipAddress').val();
          port = $('#Port').val();
          super_CAS_Id = $('#super_CAS_id').val();
          ecmg_Channel_Id = $('#Channel_id').val();
          Alias = $('#Alias').val();
          Cryptoperiod = $('#Cryptoperiod').val();
          if($('#Enable').prop('checked') == true)
          {
           Enable = 1;
          }
          else
          {
             Enable = 0;
          }

          var result = confirm("Want to add new ECMG?");
          if(result)
          {
            $.ajax({
            url: 'index.php?route=common/dashboard/addECMGChannel&token=<?php echo $token; ?>&ip_Address=' + ip_Address+'&port=' +port+'&super_CAS_Id=' +super_CAS_Id + '&ecmg_Channel_Id='+ecmg_Channel_Id+ '&Alias=' + Alias+ '&Enable=' + Enable+ '&Cryptoperiod=' + Cryptoperiod,
            error:function()
            {
              alert("Error while adding ECMG");
            },
            success: function(data) 
            {
              if(data == 0)
              {
                alert("Error While adding ECMG channel");
              }
              else
              {
                 alert("ECMG added succesfully");
                 location.reload();
              }
            },
                type: 'POST'
          });
          }
            
}


function clickModal(ch_name,ch_number,input,rmx_no,targetid,qam_targetid,changed_number,changed_name,Enable_ch_name,changed_provider,Enable_ch_provider)
     {
        $.ajax({
          url: 'index.php?route=common/dashboard/getChannelInformation&token=<?php echo $token; ?>&channel_number=' + ch_number+'&input_id='+input+'&rmx_no='+rmx_no,
          error:function()
          {
            alert("invalid channel");
          },
          success: function(data)
          {
              var i=0;
              if(data)
              {
                $("#output_chModal").empty();
               
                var arr= JSON.parse(data);
                arr1 = arr['ecmg_channel'];
                arr2 = arr['stream'];
                arr3=arr['pmt_alarm'];
                arr4=arr['high_priority'];
                
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
                 if(changed_provider!= '-1')
                {
                  var channelprovider = changed_provider;
                }
                else
                {
                  var channelprovider = arr['serviceprovider'];
                }
                 
            
                 var video_bw=Math.floor(((arr['input_rate']/1000)*arr['video_per'])/1000);
                var audio_bw=Math.floor(((arr['input_rate']/1000)*arr['audio_per'])/1000);
                var html='<div class="modal-dialog modal-lg"  style=" align-self: center; width: 85%;"><div class="modal-content" style="background-color: #f2f2f2;"><h4 class="modal-title"><span class="glyphicon glyphicon-cog" style="margin-left:10px; margin-top: 5px;"></span><span style="margin-left: 3px;margin-top: 5px;"><font>'+channelname+','+channelnumber+'</font></span></h4><div class="modal-body"><div data-role="main" class="ui-content"><div class="container-default"><ul class="nav nav-tabs"><li class="active"><a data-toggle="tab" href="#Output_Services">Output Services</a></li><li><a data-toggle="tab" href="#Scrambling">Scrambling</a></li></ul><div class="tab-content"><div id="Output_Services" class="tab-pane fade in active"><table class="genral" style="width:100%; height: 45%; margin-top: 20px;"><tbody><tr><td>Enable</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;" name=""></td><td>Status</td><td></td></tr><tr><td><br/></td></tr><tr> <td>Passthrough any SID</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;" name=""></td> </tr> <tr><td>Input SID</td><td></td><td>Output SID</td><td><input id="text_SID" value="'+channelnumber+'" type="text" class="form-control-default" style="margin-top: 4px;" ></td></tr><tr><td></td><td></td><td></td><td><span id="error_outputSID" style="color:red;"></span></td></tr><tr><td>Input service</td> <td></td><td>Service name</td><td><b>'+channelname+'</b></td></tr> <tr><td>Critical service</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;" name=""></td><td>Service name override</td> <td><input id="checkbox_set_service"  type="checkbox" class="form-control-default"  style="margin-top: 4px; " ><input  id="set_service" type="textbox" class="form-control-default"  style="margin-top: 4px;margin-left:10px;" value="'+channelname+'" ></td><td></td></tr><tr><td></td><td></td><td></td><td><span id="error_set_service" style="color:red;"></span></td></tr> <tr><td><br/></td></tr><tr><td>Set High Priority</td><td><input id="checkbox_Priority" type="checkbox" class="form-control-default"  ></td></tr><tr><td><b>Output components</b></td></tr> <tr><td><br/></td></tr><tr><td><b>Type</b></td><td><b>Languages</b></td><td><b>In PID</b></td><td><b>Out PID</b></td><td><b> Current Bitrate</b></td></tr> <tr><td>video('+arr['videopid']+')</td><td></td><td>'+arr['videopid_no']+'</td><td></td><td>'+video_bw+' Kbps</td></tr> <tr><td>audio('+arr['audiopid']+')</td><td></td> <td>'+arr['audiopid_no']+'</td><td></td><td>'+audio_bw+' Kbps</td></tr></tbody></table><div align="right"><button class="accordion"  data-toggle="collapse" data-target="#advance_option">Advanced options</button></div><div id="advance_option" class="collapse out" ><table style="width:70%;"><colgroup><col style="width: 10%" /><col style="width: 30%" /><col style="width: 20%" /><col style="width:20%" /><col style="width:20%" /></colgroup><tr><td></td><td></td><td>Provider name</td><td><b>'+channelprovider+'</b></td></tr><tr><td>Service Type</td><td><b>'+arr['servicetype']+'</b></td><td>Provider name override</td> <td><input id="checkbox_set_provider"  type="checkbox" class="form-control-default"  style="margin-top: 4px;" ><input  id="set_provider" type="textbox" class="form-control-default" value="'+channelprovider+'"  style="margin-top: 4px;margin-left:10px;"></td></tr><tr><td></td><td></td><td></td><td><span id="error_set_provider" style="color:red;"></span></td></tr><tr><td>PMT Download</td><td><button type="button" class="glyphicon glyphicon-download" id="PMT_Download" style="background-color:white" onClick="downloadTables(1,'+channelnumber+','+rmx_no+')"></button></td><td>PMT Alarm</td><td><select id="PMT_Alarm" name="PMT_Alarms"><option value="1" selected="selected">Enable</option><option value="0" selected="selected">Disable</option></select></td></tr></table></div><div align="right" style="margin-top:10px;"> <button type="button" class="btn btn-default" onClick="set_priority('+channelnumber+','+ch_number+','+input+','+rmx_no+');change_outputSid('+ch_number+','+input+','+targetid+','+rmx_no+');Set_PMT_alarm('+input+','+channelnumber+','+rmx_no+');" id="save_output_sid" disabled="disabled">APPLY & SAVE</button><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div></div><div id="Scrambling" class="tab-pane fade fade"><table class="genral" style="width:70%; height: 25%;"><tbody> <tr><td>Scrambling</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;"></td></tr><tr><td><b>Scrambled components</b></td></tr><tr><td><input type="checkbox" class="form-control-default"><span style="margin-left: 7px;">All</span></td><td><input type="checkbox" class="form-control-default"><span style="margin-left: 7px;">video</span></td><td><input type="checkbox" class="form-control-default"><span style="margin-left: 7px;">subtitle</span></td><td><input type="checkbox" class="form-control-default"><span style="margin-left: 7px;">other</span><span><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></span></td></tr><tr><td></td><td><input type="checkbox" class="form-control-default"><span style="margin-left: 7px;">audio</span></td><td><input type="checkbox" class="form-control-default"><span style="margin-left: 7px;">Teletext</span></td><td><button type="button" class="btn btn-default" data-dismiss="" style="height:4%; font-size: 80%;margin-top: 5px;">USE CHASSIS PRESETS</button></td></tr><tr><td></td><td><input type="checkbox" class="form-control-default"   name=""><span style="margin-left: 7px;"> AC3-audio</span></td><td></td><td></td></tr><tr><td><br/></td></tr><tr> <td></td><td><b>ECM streams</b></td><td><b>Access criteria</b></td> <td><b>PID</b></td><td></td>';
                 for(var k in arr1){
                  html=html+'</tr><tr> <td>'+arr1[k].Alias+'</td><td><select id="'+targetid+'~'+ch_number+'"> <option>Not Selected</option>';
                
                   for(var l in arr2){

                    if(arr1[k].ecmg_channel_id == arr2[l].ecmg_id){
                    html=html+'<option value="">'+arr2[l].alias+' </option>';
                    
                  }

                  l++;}
                  html=html+'</select></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td> <td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td><td></td> </tr>';
                  k++;}
                  html=html+'</tbody></table><div align="right" style="margin-top:10px;"> <button type="button" class="btn btn-default" onClick="" id="" >APPLY & SAVE</button><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div> </div></div></div></div></div></div></div>';
                  $("#output_chModal").append(html);
                  
                  $("#checkbox_Priority").click(function() {
                  
                    $('#save_output_sid').removeAttr('disabled');
                  });
                   
                  $('#PMT_Alarm').change(function() {
                  
                    $('#save_output_sid').removeAttr('disabled');
                  });
                 
                  $('#checkbox_set_service').click(function()
                  {
                     $('#save_output_sid').removeAttr('disabled');
                  });
                  $('#checkbox_set_provider').click(function()
                  {
                     $('#save_output_sid').removeAttr('disabled');
                  });

                  $("#set_service").hide();
                  $("#set_provider").hide();
                  if(Enable_ch_name==1)
                  {
                     $("#set_service").show();
                     $("#checkbox_set_service").attr('checked','checked');
                  }
                 
                  if(Enable_ch_provider==1)
                  {
                     $("#set_provider").show();
                     $("#checkbox_set_provider").attr('checked','checked');
                  }
        // Priority and PMT alarm
                       if(arr3[0].alarm_enable==0)
                         { 
                             
                           $('select[name="PMT_Alarms"] option[value="1"]').removeAttr('selected'); 
                           $('select[name="PMT_Alarms"] option[value="0"]').attr('selected','selected'); 
                         }
                       else if(arr3[0].alarm_enable==1)
                        {
                           $('select[name="PMT_Alarms"] option[value="0"]').removeAttr('selected'); 
                           $('select[name="PMT_Alarms"] option[value="1"]').attr('selected','selected'); 
                        }
                       if(arr4[0].Priority_checkbox==0)
                        {                     
                           
                        }
                        else if(arr4[0].Priority_checkbox==1)
                        {     
                            $("#checkbox_Priority").attr('checked','checked');             
                        }
       // Priority and PMT alarm
      // set service name
                  $("#checkbox_set_service").click(function()
                  {
                        if(this.checked)
                        {

                        $("#set_service").show();
                        }
                        else{

                        $("#set_service").hide();
                        }
                  });
      // set service name
      //advance option
                  $("#checkbox_set_provider").click(function()
                  {
                        if(this.checked)
                        {

                        $("#set_provider").show();
                        }
                        else{

                        $("#set_provider").hide();
                        }
                  });
      //advance option

                $('#text_SID').keyup(function() {
                  
                    var empty = false;
                    $('#text_SID,#set_service').each(function() 
                    {
                          if ($(this).val() == '') 
                          {
                          empty = true;
                          }
                    });
                      if (empty) 
                      {
                        $('#save_output_sid').attr('disabled', 'disabled'); 
                      }
                      else 
                      {
                         if(check_outputsid())
                          {
                             $('#save_output_sid').removeAttr('disabled'); 
                          }
                         else
                          {
                             $('#save_output_sid').attr('disabled', 'disabled');
                          }
                      }
                  });
              }
          },
          type:'POST'
        });
     }
  function check_outputsid()
  {
    var text1=$("#text_SID").val().trim();
    
     if (text1=='') 
     {
        $("#error_outputSID").html("should not be empty");
        return false;
       
     }
     else if(text1 >0 && text1<10000)
     {
      $("#error_outputSID").hide();
      return true;
     }
     else
     {
      $("#error_outputSID").html("should be in range 1 to 9999");
      $("#error_outputSID").show();
      return false;
     }
  }
     function ECMGSettings(ecmg_channel_id)
     {
      
        $.ajax({
          url: 'index.php?route=common/dashboard/getECMG&token=<?php echo $token; ?>&channel_id=' + ecmg_channel_id,
          error:function()
          {
            alert("Error Occured");
          },
          success: function(data)
          {
            var ecmg_arr= JSON.parse(data);
           
            $("#ecmg-settings").empty();

      $("#ecmg-settings").append('  <div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content" style="background-color: #f2f2f2"><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><form><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " style="margin-left: 0px">'+ecmg_arr['Alias']+'</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default ecmg_modal" id="Alias_settings" value="'+ecmg_arr['Alias']+'" style="margin-top: 4px;" name=""></td><td></td><td>Status:</td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default ecmg_modal" id="Enable_settings" style="margin-top: 4px;" name=""></td><td></td><td>Super CAS ID:</td><td><input type="text" class="form-control-default ecmg_modal" onfocusout="supercas();" id="super_CAS_id_settings" value="'+ecmg_arr['Super_CAS_Id']+'" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td><span id="error_super_CAS_id_settings" style="color: red"></span></td></tr><tr><td>Ip Address:</td><td><input type="text" class="form-control-default ecmg_modal" id="ipAddress_settings" value="'+ecmg_arr['Ip_Address']+'" style="margin-top: 4px;" name=""></td><td></td><td>Channel ID:</td><td><input type="text" class="form-control-default ecmg_modal" id="Channel_id_settings" value="'+ecmg_arr['ecmg_channel_id']+'" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_ipaddress_settings" style="color: red"></span></td><td><span id="error_channel_id_settings" style="color: red"></td><td></td></tr><tr><td>Port</td><td><input type="text" class="form-control-default ecmg_modal" value="'+ecmg_arr['Port']+'" id="Port_settings" style="margin-top: 4px;" name=""></td><td></td><td>Scramble Mode:</td><td><select id="Scramble_mode_settings"><option>DVB-CSA/TS</option></select></td></tr><td></td><td><span id="error_port_settings" style="color: red"></span></td><td></td><td></td><tr><td>Cryptoperiod</td><td><input type="text" class="form-control-default ecmg_modal" id="Cryptoperiod_settings" value="'+ecmg_arr['Cryptoperiod']+'" style="margin-top: 4px;" name=""> Sec</td><td></td><td>Simulcrypt version</td><td><select id="Simulcrypt_version_settings" style="width: 100px;"><option>1</option><option>2</option><option>3</option><option>4</option></select></td></tr><td></td><td><span id="error_Cryptoperiod_settings" style="color: red"></span></td><td></td><td></td></tbody></table>      </div><div class="modal-footer"><button type="button" class="btn btn-default" disabled="Disable" onclick="updateECMG('+ecmg_channel_id+');" id = "ECMG_onclick_settings">APPLY&SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button>  </div></form></div></div>');
      if(ecmg_arr['Enable'])
      {
         $('#Enable_settings').attr('checked','checked');
      }
       
        $('#Alias_settings, #super_CAS_id_settings, #ipAddress_settings,#Port_settings,#Cryptoperiod_settings,#Channel_id_settings').keyup(function() {
         
        var empty = false;
         $('#Enable_settings').change(function(){
           
              empty = false;
            });
        $('#Alias_settings, #super_CAS_id_settings, #ipAddress_settings,#Enable_settings, #Port_settings,#Cryptoperiod_settings,#Channel_id_settings').each(function() {
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
     function checkEnable()
     {
        $('#Enable_settings').change(function(){
         
          return true;
        });
    
        return false;
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
        $("#error_super_CAS_id_settings").html("Super Cas Id starts with 0x and should be heaxadecimal(<0xffffffff)");
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
          $("#error_ipaddress_settings").html("Ip address should not be empty");
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
	      $("#error_ipaddress_settings").html("invalid Ip Address");
	      $("#error_ipaddress_settings").show();
	      return false;
       }
    
     }
    function check_Channel_id_settings()
     {
        var text1=$("#Channel_id_settings").val().trim();
    
       if (text1=='') 
       {
          $("#error_channel_id_settings").html("should not be empty");
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
        $("#error_channel_id_settings").html("Invalid channel id");
        $("#error_channel_id_settings").show();
        return false;
       }
     }
  function check_Port_settings()
     {
        var text1=$("#Port_settings").val().trim();
     if (text1=='') 
     {
        $("#error_port_settings").html("should not be empty");
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
      
      $("#error_port_settings").html("should be in range 1025 to 65536");
      $("#error_port_settings").show();
      return false;
     }
     }
  function check_Cryptoperiod_settings()
     {
       var text=$("#Cryptoperiod_settings").val().trim();
    
    if (text=='') {
        $("#error_Cryptoperiod_settings").html("should not be empty");
      $("#error_Cryptoperiod_settings").show();
      return false;
     }
     else if ( text==0) {
      $("#error_Cryptoperiod_settings").html(" it should not be zero");
      $("#error_Cryptoperiod_settings").show();
      return false;
    }
    else if (text<10000 && text>0 ) {
      // $("#error_Cryptoperiod").html("valid");
      $("#error_Cryptoperiod_settings").hide();
      return true;
    }
    else
    {
      $("#error_Cryptoperiod_settings").html("invalid Cryptoperiod (>0 and <9999)");
      $("#error_Cryptoperiod_settings").show();
      return false;
    }
     }


function updateECMG(original_id)
       {
       ip_Address = $('#ipAddress_settings').val();
       port = $('#Port_settings').val();
       super_CAS_Id = $('#super_CAS_id_settings').val();
       ecmg_Channel_Id = $('#Channel_id_settings').val();
       Alias = $('#Alias_settings').val();
          if($('#Enable_settings').prop('checked') == true)
          {
           Enable = 1;
          }
          else
          {
             Enable = 0;
          }
          var res = confirm("Want to update ECMG?");
          if(res)
          {
             $.ajax({
           url: 'index.php?route=common/dashboard/updateECMGChannel&token=<?php echo $token; ?>&ip_Address=' + ip_Address+'&port=' +port+'&super_CAS_Id=' +super_CAS_Id + '&ecmg_Channel_Id='+ecmg_Channel_Id+ '&Alias=' + Alias+ '&Enable=' + Enable+ '&original_id=' + original_id,
            error:function()
            {
              alert("is it wrong");
            },
            success: function(data) 
                {  
                  if(data == 0)
                  {
                    alert('Error while updating ECMG.');
                  }
                  else if(data == 1)
                  {
                    alert("ECMG Updated succesfully");
                    $('#ECMG_onclick_settings').attr('disabled', 'disabled');
                    location.reload();
                  }
                  
                },
            type: 'POST'
            });
          }
           
       }
       function ecmStreamModal(stream_id,channel_id)
       {
   
            $.ajax({
           url: 'index.php?route=common/dashboard/getECMStreamData&token=<?php echo $token; ?>&stream_id=' + stream_id+'&channel_id=' +channel_id,
            error:function()
            {
              alert("Error while opening modal");
            },
            success: function(data) 
                {
                  $("#stream_modal").empty();
              
                  var ecmg_stream_arr= JSON.parse(data);
                  $("#stream_modal").append('<div class="modal-dialog" role="document" style="width: 70%; align-self: center; "><div class="modal-content" style="background-color: #f2f2f2"><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h4 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" style="margin-left: 0px">'+ecmg_stream_arr['alias']+'</h4></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" value="'+ecmg_stream_arr['alias']+'" id="ecm_stream_alias_settings" name=""></td><td></td><td>Status:</td></tr><tr><td></td><td><span id="error_stream_alias_settings" style="color: red"></span></td><td></td><td></td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_enable_settings" name=""></td><td></td><td>Access criteria</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_access_criteria_settings" value="'+ecmg_stream_arr['access_criteria']+'" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_access_criteria_settings" style="color: red"></span></td></tr><tr><td>Stream ID:</td><td><b>'+stream_id+'</b></td><td></td><td>ECM ID</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_ecmId_settings" value="'+ecmg_stream_arr['ecm_id']+'" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_ecmid_settings" style="color:red"></span></td></tr><tr><td>CP Number:</td><td>'+ecmg_stream_arr['cp_number']+'</td><td></td><td>CW Group:</td><td><input type="text" class="form-control-default" style="margin-top: 4px;" id="ecm_stream_CW_group_settings" value="'+ecmg_stream_arr['cw_group']+'"></td></tr><tr><td></td><td><span id="error_stream_CP_number_settings" style="color:red"></span></td><td></td><td><span id="error_stream_CW_group_settings" style="color:red"></span></td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" onClick="updateECMStream('+stream_id+','+channel_id+','+ecmg_stream_arr['ecm_id']+','+ecmg_stream_arr['cp_number']+')" disabled="disabled" id="ecm_stream_save_settings"  >APPLY & SAVE </button><button type="button" class="btn btn-default"  data-dismiss="modal" >Cancel </button></div></div></div>');

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
      $("#error_stream_alias_settings").html("Alias should not be empty");
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
        $("#error_stream_ecmid_settings").html("should not be empty");
        return false;
        
     }
     else if(text1 > 0 && text1<1000)
     {
      $("#error_stream_ecmid_settings").hide();
      return true;
     }
     else
     {
      $("#error_stream_ecmid_settings").html("should be in range 1 to 999");
      $("#error_stream_ecmid_settings").show();
      return false;
     }
  }

  function check_cwgroup()
  {
    var text1=$("#ecm_stream_CW_group_settings").val().trim();
    
     if (text1=='') 
     {
        $("#error_stream_CW_group_settings").html("should not be empty");
        return false;
     }
     else if(text1 > 0 && text1<1000)
     {
      $("#error_stream_CW_group_settings").hide();
      return true;
     }
     else
     {
      $("#error_stream_CW_group_settings").html("should be in range 1 to 999");
      $("#error_stream_CW_group_settings").show();
      return false;
     }
  }
  function check_cp_number()
  {
    var text1=$("#ecm_stream_CP_number_settings").val().trim();
     if (text1=='') 
     {
        $("#error_stream_CP_number_settings").html("should not be empty");
        
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
      $("#error_stream_CP_number_settings").html("should be in range 1 to 999");
      $("#error_stream_CP_number_settings").show();
      return false;
     }
  }
  function acceess_criteria()
  {
    var text = $("#ecm_stream_access_criteria_settings").val().trim();
      var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{0,10}$/i);
      if(text == '')
      {
         $("#error_stream_access_criteria_settings").html("Should not be empty");
          $("#error_stream_access_criteria_settings").show();
          return false;
      }
      else if(pattern.test(text))
      {
          if((text.length%2))
          {
            $("#error_stream_access_criteria_settings").html("Access criteria should have even digits");
          $("#error_stream_access_criteria_settings").show();
          return false;
           
          }
          else
          {
             $("#error_stream_access_criteria_settings").hide();
            return true;
          }
          
      }    
      else
      {
        $("#error_stream_access_criteria_settings").html("Access criteria starts with 0x");
          $("#error_stream_access_criteria_settings").show();
          return false;
      }
  }


  function updateECMStream(stream_id,channel_id,old_ecmid,ecm_stream_CP_number)
{
    ecm_stream_alias = $("#ecm_stream_alias_settings").val();
    ecm_stream_access_criteria = $("#ecm_stream_access_criteria_settings").val();
    ecm_stream_ecmId = $("#ecm_stream_ecmId_settings").val();
    ecm_stream_CW_group = $("#ecm_stream_CW_group_settings").val();
    var res = confirm("Want to update ECMStream?");
    if(res)
    {
      $.ajax({
      url:'index.php?route=common/dashboard/updateECMStream&token=<?php echo $token; ?>&ecm_stream_alias=' + ecm_stream_alias+'&ecm_stream_access_criteria='+ecm_stream_access_criteria+'&ecm_stream_ecmId='+ecm_stream_ecmId+'&ecm_stream_CW_group='+ecm_stream_CW_group+'&ecm_stream_CP_number='+ecm_stream_CP_number+'&original_streamid='+stream_id+'&original_ecmg_id='+channel_id+'&old_ecmid='+old_ecmid,
      error:function()
      {
        alert('Error while updating ');
      },
      success:function(data)
      {
        if(data == -1)
        {
          alert('ECM id should be unique');
        }
        else if(data == 0)
        {

          alert('Error While updating ECM stream');
        }
        else if(data == 1)
        {
           alert("ECMStream updated successfully");
           $('#ecm_stream_save_settings').attr('disabled', 'disabled'); 
           location.reload();
        }
      }
    });
    }

    
}
function onclickDeleteECMG(ecmg_id)
{
  var result = confirm("Want to delete?");
  if(result)
  {
    $.ajax({
      url:'index.php?route=common/dashboard/deleteECMG&token=<?php echo $token; ?>&ecmg_id=' + ecmg_id,
      error:function()
      {
        alert('Error while deleting ECMG');
      },
      success:function(data)
      {
        if(data == 0)
        {
          alert('Error while deleting ECMG channel')
        }
        else
        {
          alert('ECMG channel deleted succesfully');
          location.reload();
        }
      },
      type: 'POST'
    });
  }
     
}
function ecmStreamDelete(stream_id,ecmg_id)
{
 
  var result = confirm("Want to delete?");
  if(result)
  {
    $.ajax({
      url:'index.php?route=common/dashboard/deleteECMStream&token=<?php echo $token; ?>&ecmg_id='+ ecmg_id+'&stream_id='+stream_id,
      error:function()
      {
        alert('Error while deleting ecmg stream');
      },
      success:function()
      {
        var ele = document.getElementById(stream_id+"~"+ecmg_id);
        ele.remove();
      },
      type: 'POST'
    });
  }
  
}

function channel_setting(port)
{   
  
       $.ajax({
       url: 'index.php?route=common/dashboard/getChannelData&token=<?php echo $token;?>&port='+ port,
        error:function()
        {
          alert("Error while opening modal");
        },
        success: function(data) 
        {
          var list = JSON.parse(data);
         if(data==1)
         {
          alert("error while loading priority");
         }
                $("#channel_setting_modal").empty();
             
              $("#channel_setting_modal").append('<div class="modal-dialog" style="width: 80%;  align-self:center; "><div class="modal-content" style="background-color: #f2f2f2"><div class="modal-body"><table class="genral" style="width: 100%; height: 50%;"><div class="modal-header" style="margin-bottom: 20px;"><h4 class=" glyphicon glyphicon-cog "><span>'+list['alias']+' '+list['ip_address']+':'+port+'</span></h4></div><tbody><col style="width: 30%" /><col style="width: 30%" /><tr><td >Alias</td><td><input id="alias_input_setting" value= "'+list['alias']+'" type="text"  name=""></td><td>Status</td><td></td></tr><tr><td></td><td><span id="error_alias_input_setting"></span></td><td></td><td></td></tr><tr><td>Enable</td><td><input type="checkbox" class="form-control-default" name=""></td><td>High Priority Services</td><td>'+list['priority']+'</td></tr><tr><td >Broadcaste Type</td><td><select><option>Unicast</option><option>Multicast</option></select></td><td></td><td></td></tr><tr><td>Ip Address</td><td><input type="text" id="ipaddress_input_setting" value="'+list['ip_address']+'"  name=""></td><td>Port</td><td><input id="port_input_setting" type="text"  value="'+port+'"></td></tr><tr><td></td><td><span id="error_ipaddress_input_setting"></span></td><td></td><td><span id="error_port_input_setting"></span></td></tr><tr><td></td></tr></tbody></table></div><div class="modal-footer"><button class="btn btn-default" id="ge1_apply_setting" onclick = "updateChanneldata('+port+')" disabled="disabled">APPLY</button><button class="btn btn-default" data-dismiss="modal">Cancel</button></div></div></div>');

                $('#alias_input_setting, #ipaddress_input_setting, #port_input_setting').
                      keyup(function() 
                      { 
                       
                      var empty = false;
                      $('#alias_input_setting, #ipaddress_input_setting, #port_input_setting').each(function() {
                        if ($(this).val() == '') 
                        {
                        empty = true;
                        }
                      });

                      if (empty) 
                      {
                       $('#ge1_apply_setting').attr('disabled', 'disabled'); 
                      } 
                      else  
                      {
                     
                        if(check_ip_address_setting() && check_port_setting())
                        {
                        $('#ge1_apply_setting').removeAttr('disabled'); 
                        }
                        else
                        {
                        $('#ge1_apply_setting').attr('disabled', 'disabled');
                        }
                      }
                });


        },
        type: 'POST'
        });
}

$(document).on('focusout','#alias_input_setting', function ()
  {
    var text=$("#alias_input_setting").val().trim();
    if(text=='')
    {
      $("#error_alias_input_setting").html("Alias should not be empty");
      $("#error_alias_input_setting").show();
    }
    else
    {
      $("#error_alias_input_setting").hide();
    }
    
  });

 function check_ip_address_setting()
 {
    var text=$("#ipaddress_input_setting").val().trim();
    var pattern = new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);

     if (text=='') {
      $("#error_ipaddress_input_setting").html("Ip address should not be empty");
      $("#error_ipaddress_input_setting").show();
      return false;
        }
       else if (pattern.test(text)) {
      $("#error_ipaddress_input_setting").hide();
      return true;
      }
      else
      {
      $("#error_ipaddress_input_setting").html("invalid Ip Address");
      $("#error_ipaddress_input_setting").show();
      return false;
      }
    
}

function check_port_setting()
{
   var text1=$("#port_input_setting").val().trim();
     if (text1=='') 
     {
        $("#error_port_input_setting").html("should not be empty");
      $("#error_port_input_setting").show();
      return false;
     }
     else
     {
      $("#error_port_input_setting").hide();
      return true;
     }
    
}

function delete_input(port)
{   

  var result = confirm("Want to delete");
  if(result)
  {
     $.ajax({
       url:'index.php?route=common/dashboard/delete_input&token=<?php echo $token;?>&port='+port,
        error:function()
        {
          alert("Error while opening modal");
        },
        success: function() 
        {
          var ele = document.getElementById("channel"+port);
          ele.remove();
        },
        type: 'POST'
        });
  }
      
}
  function updateChanneldata(port)
  {
    ge1_port = $("#port_input_setting").val();
    ge1_alias = $("#alias_input_setting").val();
    ge1_ip = $("#ipaddress_input_setting").val();
  var result = confirm("Want to update the Ip data");
    if(result)
    {
        $.ajax({
      url:'index.php?route=common/dashboard/updateInput&token=<?php echo $token; ?>&ge1_port=' + ge1_port+'&ge1_alias='+ge1_alias+'&ge1_ip='+ge1_ip+'&original_port='+port,
      error:function()
      {
        alert('Error while updating Ip input');
      },
      success:function(data)
      {
        if(data)
        {
          location.reload();
        }
        else
        {
          alert('Error while updating Ip input');
        }
      }
      });
    }
  
  }
   
// Validation for GE1 PLUS

function validate_GE()
{
  $('#ge1_alias, #ge1_ip, #ge1_port').
        keyup(function() 
        { 
          
        var empty = false;
        $('#ge1_alias, #ge1_ip, #ge1_port').each(function() {
          if ($(this).val() == '') 
          {
          empty = true;
          }
        });

        if (empty) 
        {
         $('#ge1_apply').attr('disabled', 'disabled'); 
        } 
        else  
        {
     
          if(check_ge1_alias() && check_ge1_ip() && check_ge1_port() )
          {
          $('#ge1_apply').removeAttr('disabled'); 
          }
          else
          {
          $('#ge1_apply').attr('disabled', 'disabled');
          }
        }
  }); 
}

 function check_ge1_ip()
 {
    var text=$("#ge1_ip").val().trim();
    var pattern = new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);
 
     if (text=='') {
      $("#error_ge1_ip").html("Ip address should not be empty");
      $("#error_ge1_ip").show();
      return false;
        }
       else if (pattern.test(text)) {
      $("#error_ge1_ip").hide();
      return true;
      }
      else
      {
      $("#error_ge1_ip").html("invalid Ip Address");
      $("#error_ge1_ip").show();
      return false;
      }
    
}
function check_ge1_alias()
{
    var text=$("#ge1_alias").val().trim();
    if(text=='')
    {
      $("#error_ge1_alias").html("Alias should not be empty");
      $("#error_ge1_alias").show();
      return false;
    }
    else
    {
      $("#error_ge1_alias").hide();
      return true;
    }
    
}
function check_ge1_port()
{
    var text=$("#ge1_port").val().trim();
    if(text=='')
    {
      $("#error_ge1_port").html("Port should not be empty");
      $("#error_ge1_port").show();
      return false;
    }
    else
    {
      $("#error_ge1_port").hide();
      return true;
    }
    
}
function discriptors()
{
   $("#discriptors").append('<table class="genral" style="width:100%;margin-top:10px;"><tr><td></td><td></td><td>Table selectors</td><td></td><td></td><td></td><td></td></tr><tr><th>Location ID</th><th>Descriptor</th><th>ONID</th><th>TSID</th><td>Descriptor location</td><td>Replace</td></tr><tr><td><select><option>CAT</option><option>BMT-1Loop</option></select></td><td><input type="text" class="form-control-default"></td><td><input type="text" class="form-control-default"></td><td><input type="text" class="form-control-default"></td><td></td><td><input type="checkbox" class="form-control-default"></td><td><span class="glyphicon glyphicon-trash" onClick="deleteDiscriptors()"></span></td></tr></table>'); 
}

function IRD1data()
{

port1_freq = $("#port1_freq").val();
port1_symbol = $("#port1_symbol").val();
port1_LNB = $("#port1_LNB option:selected").text();
port1_Band = $("#port1_Band option:selected").text();
port1_LowLNB = $("#port1_LowLNB").val();
port1_HighLNB = $("#port1_HighLNB").val();
port1_Blas = $("#port1_Blas option:selected").text();
port1_polarization = $("#port1_polarization option:selected").text();


 $.ajax({
    url:'index.php?route=common/dashboard/IRD1data&token=<?php echo $token; ?>&port1_freq='+port1_freq+'&port1_symbol='+port1_symbol+'&port1_LNB='+port1_LNB+'&port1_Band='+port1_Band+'&port1_LowLNB='+port1_LowLNB+'&port1_HighLNB='+port1_HighLNB+'&port1_Blas='+port1_Blas+'$port1_polarization='+port1_polarization,
    
    error:function()
    {
      alert('Error while Storeing IRD data');
    },
    success:function(data)
    {
      alert("You have succesfully Stored " );

    },
    type: 'POST'
  });
}
function set_priority(channelnumber,program_number,input,rmx_no)
  {
    var Priority_checkbox=0;

     if($("#checkbox_Priority").prop('checked') == true)
        {
          Priority_checkbox = 1;       
        }
      var result= confirm("want to set high priority?")
      if(result)
      {
        $.ajax({
            url:'index.php?route=common/dashboard/set_high_priority&token=<?php echo $token; ?>&program_number='+program_number+'&input='+input+'&Priority_checkbox='+Priority_checkbox+'&rmx_no='+rmx_no,
          error: function() 
          {
          alert('Error while setting priority');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Succesfully setted priority'); 
             location.reload();
            }
             else if(data==1)
            {
              alert('Error while setting priority');
            }
           
          },
           type: 'POST'
          });
      }
  }
function change_outputSid(Old_OutputSid,input,output,rmx_no)
{
 var new_OutputSid = $('#text_SID').val();
 var service_name = $('#set_service').val();
 var service_provider = $('#set_provider').val();
   

  if($('#checkbox_set_service').prop('checked') == true)
        {
          var Enable1 = 1;
        }
  else
        {
          var Enable1 = 0;
        }
  if($('#checkbox_set_provider').prop('checked') == true)
        {
          var Enable2 = 1;
        }
  else
        {
          var Enable2 = 0;
        }

   var result = confirm("Want to Update Channel Details?");
   if(result)
   {
      $.ajax({
    url:'index.php?route=common/dashboard/changeOutputSID&token=<?php echo $token; ?>&Old_OutputSid='+Old_OutputSid+'&new_OutputSid='+new_OutputSid+'&input='+input+'&output='+output+'&service_name='+service_name+'&Enable1='+Enable1+'&service_provider='+service_provider+'&Enable2='+Enable2+'&rmx_no='+rmx_no,
    
        error:function()
        {
          alert('Error while updating Output SID');
        },
        success:function(data)
        {
          if(data == -1 || data == 0)
          {
            alert('Error While updating ');
          }
          else
          {
            alert('Channel Details Updated succesfully');
            location.reload();
          }

        },
        type: 'POST'
      });
   }
   
}
function Set_PMT_alarm(input,progNum,rmx_no)
{
  Pmt_alarm = $("#PMT_Alarm option:selected").val();

   var result = confirm("Want to Set PMT Alarm?");
   if(result)
   {
      $.ajax({
            url:'index.php?route=common/dashboard/set_pmt_alarm&token=<?php echo $token; ?>&input='+input+'&progNum='+progNum+'&Pmt_alarm='+Pmt_alarm+'&rmx_no='+rmx_no,
          error: function() 
          {
          alert('Error while Updating PMT Alarm1');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Updated PMT Alarm successfully'); 
             location.reload();
            }
             else if(data==1)
            {
              alert('Error while Updating PMT Alarm');
            }
           
          },
          type: 'POST'
          });
   }
}

  function tables(output,rmx_no)
  {
    $.ajax({
          url: 'index.php?route=common/dashboard/GetTables&token=<?php echo $token;?>&output='+output+'&rmx_no='+rmx_no,
          error:function()
          {
            alert("Error while getting tables data");
          },
          success: function(data)
          {
            if(data == -1)
            {
                alert("Error while getting tables data");
            }
            else
            {
              var xx = JSON.parse(data);
              
             $("#Tables").empty();
             $("#Tables").append('<table class="genral" style="width:70%; height: 25%;"><tbody><tr><th>Table</th><th>Generate mode</th><th>Insertion[ms]</th></tr><tr><td><b>PAT</b></td><td><select id="PAT_dropdown" onChange="disabletextbox();" name="PAT_dropdown"><option value="1" selected="selected">Automatic</option><option value="2" selected="selected">Disable</option></select></td><td><input type="text" name="PAT_text" value='+xx['pat_int']+' class="form-control-default" style="margin-top: 4px;"  id="PAT" >&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="PAT_Download"  onClick="downloadTables(0,00,'+rmx_no+');" ></button></td></tr><tr><td></td><td></td><td><span id="error_PAT" style="color:red;"></span></td></tr><tr><td><b>CAT</b></td><td><select id="CAT_dropdown" name="CAT_dropdown" onChange="disabletextbox();"><option value="1" selected="selected">Automatic</option><option value="2" selected="selected">Disable</option></select></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" id="CAT">&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="CAT_Download" onClick="downloadTables(0,01,'+rmx_no+');" ></button></td></tr><tr><td><b>SDT</b></td><td><select id="SDT_dropdown" onChange="disabletextbox();" name="SDT_dropdown"><option value="1" selected="selected">Automatic</option><option value="2" selected="selected">Disable</option></select></td><td><input type="text" class="form-control-default" style="margin-top: 4px;"  id="SDT" value='+xx['sdt_int']+'>&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="SDT_Download" onClick="downloadTables(0,66,'+rmx_no+');"></button></td></tr><tr><td></td><td></td><td><span id="error_SDT" style="color:red;"></span></td></tr><tr><td><b>NIT</b></td><td><select id="NIT_dropdown" onChange="disabletextbox();" name="NIT_dropdown"><option value="1" selected="selected">Automatic</option><option value="2" selected="selected">Disable</option></select></td><td><input type="text" class="form-control-default" style="margin-top: 4px;"  id="NIT" value='+xx['nit_int']+'>&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="NIT_Download" onClick="downloadTables(0,64,'+rmx_no+');"></button></td></tr><tr><td></td><td></td><td><span id="error_NIT" style="color:red;"></span></td></tr><tr><td><b>Template</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr><tr><td><b>TDT & TOT</b> </td><td><select><option>Passthrough from input</option><option>Disable</option></select></td></tr><tr><td><b>TDT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr><tr><td><b>TOT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr><tr><td><b>Input</b></td><td><select><option>None</option></select></td></tr><tr><td><b>LTO</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr><tr><td><b>EIT</b></td><td><select><option>Disable</option></select></td></tr></tbody></table><br><div align="right"><button class="accordion"  data-toggle="collapse" data-target="#advance_option1">Advanced options</button></div><div id="advance_option1" class="collapse out" ><table style="width:80%;"><colgroup><col style="width: 20%" /><col style="width: 20%" /><col style="width: 20%" /><col style="width:20%" /><col style="width:10%" /></colgroup><tr><td></td><td><b>NIT</b></td><td><b>PAT</b></td><td><b>SDT</b></td><td></td></tr><tr><th>Set Version</th><td><input type="checkbox" class="form-control-default" checked="checked" id="nit_ver_checkbox">&nbsp;<input type="text" class="form-control-default"  value='+xx['nit_ver']+' style="width:30%;" id="nit_ver"></td><td><input type="checkbox" class="form-control-default" checked="checked" id="pat_ver_checkbox">&nbsp;<input type="text" class="form-control-default"  value='+xx['pat_ver']+' style="width:30%;" id="pat_ver"></td><td><input type="checkbox" class="form-control-default" checked="checked" id="sdt_ver_checkbox">&nbsp;<input type="text" class="form-control-default"  value='+xx['sdt_ver']+' style="width:30%;" id="sdt_ver"></td><td></td></tr><tr><td></td><td><span id="error_nit_ver" style="color:red"></span></td><td><span id="error_pat_ver" style="color:red"></span></td><td><span id="error_sdt_ver" style="color:red"></span></td><td></td></tr></table></div><br><div align="right"><button type="button" class="btn btn-default" onclick="set_table_ver('+xx['nit_ver']+','+xx['pat_ver']+','+xx['sdt_ver']+','+output+','+rmx_no+'); Set_PsiSiINT('+output+','+rmx_no+');" id="save_table" disabled="disabled">APPLY & SAVE</button><button type="button" class="btn btn-default" onClick="close1()">Close</button></div>');

                 $('#nit_ver_checkbox' || '#pat_ver_checkbox' || '#sdt_ver_checkbox').click(function()
                  {
                     $('#save_table').removeAttr('disabled');
                  });
                  if(xx['nit_isenable']==0)
                  {
                    $("#nit_ver_checkbox").removeAttr('checked');
                  }
                  if(xx['pat_isenable']==0)
                  {
                    $("#pat_ver_checkbox").removeAttr('checked');
                  }
                  if(xx['sdt_isenable']==0)
                  {
                    $("#sdt_ver_checkbox").removeAttr('checked');
                  }
                  if(xx['PAT_TEXT']=="Automatic")
                  {
                    $('select[name="PAT_dropdown"] option[value="2"]').removeAttr('selected'); 
                    $('select[name="PAT_dropdown"] option[value="1"]').attr('selected','selected'); 
                  }
                   if(xx['CAT_TEXT']=="Automatic")
                  {
                    $('select[name="CAT_dropdown"] option[value="2"]').removeAttr('selected'); 
                    $('select[name="CAT_dropdown"] option[value="1"]').attr('selected','selected');
                  }
                   if(xx['SDT_TEXT']=="Automatic")
                  {
                    $('select[name="SDT_dropdown"] option[value="2"]').removeAttr('selected'); 
                    $('select[name="SDT_dropdown"] option[value="1"]').attr('selected','selected');
                  }
                   if(xx['NIT_TEXT']=="Automatic")
                  {
                    $('select[name="NIT_dropdown"] option[value="2"]').removeAttr('selected'); 
                    $('select[name="NIT_dropdown"] option[value="1"]').attr('selected','selected');
                  }
                
                   if(xx['PAT_TEXT']=="Disable")
                    {
                      $('select[name="PAT_dropdown"] option[value="1"]').removeAttr('selected');
                      $('select[name="PAT_dropdown"] option[value="2"]').attr('selected','selected');

                        PAT_TEXT = $("#PAT_dropdown option:selected").text();
                        var input=document.getElementById('PAT');
                        input.disabled=PAT_TEXT=="Disable";
                        var patdownload=document.getElementById('PAT_Download');
                        patdownload.disabled=PAT_TEXT=="Disable";
                    }
                  if(xx['CAT_TEXT']=="Disable")
                    {
                      $('select[name="CAT_dropdown"] option[value="1"]').removeAttr('selected');
                      $('select[name="CAT_dropdown"] option[value="2"]').attr('selected','selected');               
                        CAT_TEXT = $("#CAT_dropdown option:selected").text();
                        var input1=document.getElementById('CAT');
                        input1.disabled=CAT_TEXT=="Disable";
                        var catdownload=document.getElementById('CAT_Download');
                        catdownload.disabled=CAT_TEXT=="Disable";
                    }
                  if(xx['SDT_TEXT']=="Disable")
                    {
                      $('select[name="SDT_dropdown"] option[value="1"]').removeAttr('selected');
                      $('select[name="SDT_dropdown"] option[value="2"]').attr('selected','selected');

                        SDT_TEXT = $("#SDT_dropdown option:selected").text();
                        var input2=document.getElementById('SDT');
                        input2.disabled=SDT_TEXT=="Disable";
                        var sdtdownload=document.getElementById('SDT_Download');
                        sdtdownload.disabled=SDT_TEXT=="Disable";
                    }
                 if(xx['NIT_TEXT']=="Disable")
                    {
                      $('select[name="NIT_dropdown"] option[value="1"]').removeAttr('selected');
                      $('select[name="NIT_dropdown"] option[value="2"]').attr('selected','selected');

                        NIT_TEXT = $("#NIT_dropdown option:selected").text();
                        var input3=document.getElementById('NIT');
                        input3.disabled=NIT_TEXT=="Disable";
                        var nitdownload=document.getElementById('NIT_Download');
                        nitdownload.disabled=NIT_TEXT=="Disable";
                                                
                    }             

              $("#PAT_dropdown,#CAT_dropdown,#SDT_dropdown,#NIT_dropdown").change(function()
              {
                $('#save_table').removeAttr('disabled'); 
              });
              
              $('#nit_ver,#pat_ver,#sdt_ver').keyup(function() {
                  
                    var empty = false;
                        if ($(this).val() == '') 
                          {
                          empty = true;
                          }
                    
                      if (empty) 
                      {
                        $('#save_table').attr('disabled', 'disabled'); 
                      }
                      else 
                      {
                         if(check_nit_ver() && check_pat_ver() && check_sdt_ver())
                          {
                             $('#save_table').removeAttr('disabled'); 
                          }
                         else
                          {
                             $('#save_table').attr('disabled', 'disabled');
                          }
                      }
                  });
                  function check_nit_ver()
                  {
                    nit_ver=$("#nit_ver").val();
                    if(nit_ver>=0 && nit_ver<=15)
                       {
                        $("#error_nit_ver").hide();
                        return true;
                       }
                    else
                       {
                        $("#error_nit_ver").html("should be in between 0-15");
                        $("#error_nit_ver").show();
                         return false;
                       }
                    
                  }
                  function check_pat_ver()
                  {
                    pat_ver=$("#pat_ver").val();
                    if(pat_ver>=0 && pat_ver<=15)
                       {
                        $("#error_pat_ver").hide();
                        return true;
                       }
                    else
                       {
                        $("#error_pat_ver").html("should be in between 0-15");
                        $("#error_pat_ver").show();
                         return false;
                       }
                    
                  }
                  function check_sdt_ver()
                  {
                    sdt_ver=$("#sdt_ver").val();
                    if(sdt_ver>=0 && sdt_ver<=15)
                       {
                        $("#error_sdt_ver").hide();
                        return true;
                       }
                    else
                       {
                        $("#error_sdt_ver").html("should be in between 0-15");
                        $("#error_sdt_ver").show();
                         return false;
                       }
                    
                  }
             $('#PAT, #SDT,#NIT').keyup(function() {

                    var empty = false;
                    $('#PAT, #SDT,#NIT').each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $('#save_table').attr('disabled', 'disabled'); 
                      } else {

                       if(check_PAT() && check_SDT() && check_NIT() )
                        {
                          $('#save_table').removeAttr('disabled'); 
                        }
                        else
                        {
                          $('#save_table').attr('disabled', 'disabled');
                        }
                      }
                  });
            }

          },

          type:'GET'
        });
  }


  function check_PAT()
  {
    var text1=$("#PAT").val().trim();
    
     if (text1=='') 
     {
        $("#error_PAT").html("should not be empty");
        return false;
     }
     else if(text1 > 99 && text1<60000)
     {
      $("#error_PAT").hide();
      return true;
     }
     else
     {
      $("#error_PAT").html("should be in range 100 to 60000");
      $("#error_PAT").show();
      return false;
     }
  }

  function check_SDT()
  {
    var text1=$("#SDT").val().trim();
    
     if (text1=='') 
     {
        $("#error_SDT").html("should not be empty");
        return false;
     }
     else if(text1 > 99 && text1<60000)
     {
      $("#error_SDT").hide();
      return true;
     }
     else
     {
      $("#error_SDT").html("should be in range 100 to 60000");
      $("#error_SDT").show();
      return false;
     }
  }

  function check_NIT()
  {
    var text1=$("#NIT").val().trim();
    
     if (text1=='') 
     {
        $("#error_NIT").html("should not be empty");
        return false;
     }
     else if(text1 > 99 && text1<60000)
     {
      $("#error_NIT").hide();
      return true;
     }
     else
     {
      $("#error_NIT").html("should be in range 100 to 60000");
      $("#error_NIT").show();
      return false;
     }
  }

  

function Set_PsiSiINT(output,rmx_no)
{
Set_PAT = $("#PAT").val();
Set_SDT = $("#SDT").val();
Set_NIT = $("#NIT").val();
var result = confirm("Want to update tables data?");
  if(result)
  {
    $.ajax({
      url:'index.php?route=common/dashboard/Set_PSISiINT&token=<?php echo $token;?>&Set_PAT='+Set_PAT+'&Set_SDT='+Set_SDT+'&Set_NIT='+Set_NIT+'&output='+output+'&rmx_no='+rmx_no,
      error:function()
      {
        alert('Error while updating Tables');
      },
      success:function(data)
      { 
        if(data)
        {
          rmx_no=rmx_no+1;
         alert("You have succesfully changed Tables");

          $.ajax({
              url: 'index.php?route=common/dashboard/generate_mode&token=<?php echo $token; ?>&PAT_TEXT=' + PAT_TEXT+'&CAT_TEXT='+CAT_TEXT+'&SDT_TEXT='+SDT_TEXT+'&NIT_TEXT='+NIT_TEXT+'&output='+output+'&rmx_no='+rmx_no,
              error:function()
              {
                alert("Error");
              },
              success: function(data) 
              {
              },
              type: 'POST'
              });
        }
        else
        {
           alert('Error while updating Tables');
        }
      },
      type: 'POST'
    });
  }
}
function set_table_ver(nit_ver,pat_ver,sdt_ver,output,rmx_no)
{ 
 
   changed_nit_ver=$("#nit_ver").val();
   changed_pat_ver=$("#pat_ver").val();
   changed_sdt_ver=$("#sdt_ver").val();

   var nit_isenable=0;
   var pat_isenable=0;
   var sdt_isenable=0;

   if($('#nit_ver_checkbox').prop('checked') == true)
      {
        nit_isenable = 1;       
      }
  if($('#pat_ver_checkbox').prop('checked') == true)
    {
      pat_isenable = 1;       
    }
  if($('#sdt_ver_checkbox').prop('checked') == true)
    {
      sdt_isenable = 1;       
    }
    var result = confirm("Want to Update Table Version?");
    if(result)
    {
   $.ajax({
          url:'index.php?route=common/dashboard/set_table_ver&token=<?php echo $token; ?>&changed_nit_ver='+changed_nit_ver+'&changed_pat_ver='+changed_pat_ver+'&changed_sdt_ver='+changed_sdt_ver+'&nit_isenable='+nit_isenable+'&pat_isenable='+pat_isenable+'&sdt_isenable='+sdt_isenable+'&output='+output+'&rmx_no='+rmx_no,
            error: function() 
            {
              alert('Error while Updating Table Version');
            },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Updated Table Version successfully'); 
             location.reload();
            }
             else if(data == 1)
            {
              alert('Error while Updating Table Version');
            }
           
          },
          type: 'POST'
          });   
  }
}
function close1()
{
  
  $("#Output_Modal").modal("toggle");
}
function ADD_NewInput()
{
 
  $("#New_Input").append('<div style="border: 1px solid Gainsboro; margin-bottom:10px; min-height:70px;"><table class="genral" style="width:70%;margin-top:10px;"><tr><td>Service timeout:</span></td><td><select class="form-control-default"><option>Never</option><option>Costom Value</option></select></td><td><input type="text" class="form-control-default"></td><td><button type="submit" class="btn btn-default">CLEAR VISITED SIDS</button></td><td><span class="glyphicon glyphicon-trash"></span></td></tr></table></div>');
}
function ADD_NewInput_PID()
{
  
    $("#New_Input_PID").append('<table class="genral" style="width:100%;margin-top:10px;"><colgroup><col style="width:20%"/><col style="width:20%"/><col style="width:20%"/><col style="width:20%"/><col style="width:10%"/></colgroup><tr><th>Input</th><th>Input PID</th><th>Manual PID</th><th>Output PID</th></tr><tr><td><input type="text" class="form-control-default"></td><td><input type="text" class="form-control-default"></td><td><input type="text" class="form-control-default"></td><td><input type="text" class="form-control-default"></td><td><span class="glyphicon glyphicon-trash"></span></td></tr></table>');
}
function get_TSDetails(output,frequency,rmx_no)
{
  $.ajax({
    url:'index.php?route=common/dashboard/get_TSDetails&token=<?php echo $token;?>&output='+output+'&rmx_no='+rmx_no,
    error:function()
    {
      alert('Error while updating OUTPUT');
    },
    success:function(data)
    {
          if(data==1)
          {
           alert("error");
          }
          var xx = JSON.parse(data); 
            $("#General").empty();
            var html = '<table class="genral" style="width:100%; height: 45%;"><tbody><tr><td>Operation mode</td><td><select><option>8MHz</option><option>7MHz</option><option>6MHz</option></select></td><td>Alias</td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr><tr><td>Enable</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;" name=""></td><td>Symbol rate</td></tr><tr><td>Transport stream ID</td><td><input id="TSID" type="text" class="form-control-default" style="margin-top: 4px;" value='+xx['uTS_Id']+'></td><td>Status </td></tr><tr><td></td><td><span id="error_TSID" style="color:red;"></span></td><td></td><td></td></tr><tr><td>Network ID</td><td> '+xx['uNet_Id']+'</td><td>Original network ID </td><td><input id="org_net_ID" type="text" class="form-control-default" style="margin-top: 4px;" value='+xx['uOrigNet_Id']+'></td></tr><tr><td></td><td></td><td></td><td><span id="error_org_net_ID" style="color:red;"></span></td></tr><tr><td>Frequency</td><td>'+frequency+'<b>MHz</b></td><td>Modulation</td><td><select style="margin-top: 4px;" ><option>Normal</option><option>Inverted</option></select></td></tr><tr class="blank_row"></tr><tr><td>NIT Mode</td><td><select id="nitMode">';
	            for(var i=0;i< xx.modes.length;i++){
	            	if(xx.modes[i].id == xx.nit_selected_id){
		            html +='<option name='+xx.modes[i].mode+' value='+xx.modes[i].id+' selected="selected">'+xx.modes[i].mode+'</option>';
			        }else{
			        	html +='<option name='+xx.modes[i].mode+' value='+xx.modes[i].id+'>'+xx.modes[i].mode+'</option>';
			        }
		        }
		        html +='</select></td></tr><tr class="blank_row"></tr></tbody></table><div align="right"><button type="button" class="btn btn-default" onclick="Set_TS_ID('+xx['uNet_Id']+','+output+','+xx['uTS_Id']+','+xx['uOrigNet_Id']+','+rmx_no+');NIT_Mode('+output+','+rmx_no+');" disabled="disabled" id="genral_save">APPLY & SAVE</button><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>';
            $("#General").append(html);

            $('#nitMode').change(function(){
            	
               $('#genral_save').removeAttr('disabled');
            
            });
                      
              $('#TSID, #org_net_ID').keyup(function() {

                    var empty = false;
                    $('#TSID, #org_net_ID').each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $('#genral_save').attr('disabled', 'disabled'); 
                      } else {
 
                       if(check_TSID() && check_originalID() )
                        {
                          $('#genral_save').removeAttr('disabled'); 
                        }
                        else
                        {
                          $('#genral_save').attr('disabled', 'disabled');
                        }
                      }
                  });

    },
    type: 'POST'
  });
}

function check_TSID()
{
   var text1=$("#TSID").val().trim();
     if (text1=='') {
        $("#error_TSID").html("TS ID should not be empty");
      $("#error_TSID").show();
      return false;
     }
    else if (text1>0 && text1<65537 ) {
            $("#error_TSID").hide();
      return true;
    }
    else
    {
      $("#error_TSID").html("Invalid TS ID(>0 and <65536)");
      $("#error_TSID").show();
      return false;
    }
  
}
function check_originalID ()
  {
 var text1=$("#org_net_ID").val().trim();
     if (text1=='') {
        $("#error_org_net_ID").html("Original Network Id should not be empty");
      $("#error_org_net_ID").show();
      return false;
     }
    else if (text1>0 && text1<65537 ) {
            $("#error_org_net_ID").hide();
      return true;
    }
    else
    {
      $("#error_org_net_ID").html("Invalid Original Network Id Number(>0 and <65536)");
      $("#error_org_net_ID").show();
      return false;
    }
}
function Set_TS_ID(Set_NetworkID,output,TS_ID,org_ID,rmx_no)
{

 Set_TSID = $("#TSID").val();
 Set_orgID = $("#org_net_ID").val();
 if((TS_ID!=Set_TSID) ||(org_ID!=Set_orgID))
 {
 var result = confirm("Want to update?");
 if(result)
 {
  $.ajax({
    url:'index.php?route=common/dashboard/Set_TS_ID&token=<?php echo $token;?>&Set_TSID='+Set_TSID+'&Set_orgID='+Set_orgID+'&Set_NetworkID='+Set_NetworkID+'&output='+output+'&rmx_no='+rmx_no,
    error:function()
    {
      alert('Error while updating TS ID');
    },
    success:function(data)
    {
      if(data==1)
      {
        alert("You have succesfully updated TS ID");
        $('#genral_save').attr('disabled', 'disabled');
        location.reload();

      }
      else
      {
        alert('Error while updating TS ID');
      }
    },
    type: 'POST'
  });
 }
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
            alert("invalid data");
          },
          success: function(data)
          {
          	if(data==0)
          	{
             alert('Table downloaded succesfully into tables folder');      
            }
            else
            {
            	alert("error while downloading Tables");
            }
          },
          type:'GET'
        });
   }
   
  }

 function disabletextbox()
  {
    
    PAT_TEXT = $("#PAT_dropdown option:selected").text();
    var input=document.getElementById('PAT');
    input.disabled=PAT_TEXT=="Disable";
    var patdownload=document.getElementById('PAT_Download');
    patdownload.disabled=PAT_TEXT=="Disable";

    CAT_TEXT = $("#CAT_dropdown option:selected").text();
    var input1=document.getElementById('CAT');
    input1.disabled=CAT_TEXT=="Disable";
    var catdownload=document.getElementById('CAT_Download');
    catdownload.disabled=CAT_TEXT=="Disable";

    SDT_TEXT = $("#SDT_dropdown option:selected").text();
    var input2=document.getElementById('SDT');
    input2.disabled=SDT_TEXT=="Disable";
    var sdtdownload=document.getElementById('SDT_Download');
    sdtdownload.disabled=SDT_TEXT=="Disable";

    NIT_TEXT = $("#NIT_dropdown option:selected").text();
    var input3=document.getElementById('NIT');
    input3.disabled=NIT_TEXT=="Disable";
    var nitdownload=document.getElementById('NIT_Download');
    nitdownload.disabled=NIT_TEXT=="Disable";
        
  }

function GetBaseFreq(rmx_no)
{
 $.ajax({
          url: 'index.php?route=common/dashboard/GetBaseFreq&token=<?php echo $token; ?>&rmx_no=' + rmx_no,
          error:function()
          {
            alert("invalid data");
          },
          success: function(data)
          {
          	if(data==1)
            {
               alert("Error");
            }
            
            var xx = JSON.parse(data);
             $("#quad_QAM"+rmx_no).empty();
            $("#quad_QAM"+rmx_no).append('<div class="modal-dialog" role="document" style="width: 80%; align-self: center;" ><div class="modal-content" style="background-color: #f2f2f2"><div class="modal-body"><table class="genral" style="width:100%; height: 25%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" style="margin-left: 0px">2:quad QAM</h3></td></tr><tr><td>Hw Major version:</td><?php if($maj_ver){?><td><b><?php echo $maj_ver; ?></b></td><?php } ?><?php if(!$maj_ver){?><td><b>NA</b></td><?php } ?><td>Base frequency:</td><td><input type="text" class="form-control-default" id="Base_Frequency'+rmx_no+'" style="margin-top: 4px;" name="" value='+xx['frequency in MHz']+'>MHz</td></tr><tr><td>Hw minimum version:</td><?php if($min_ver){?><td><b><?php echo $min_ver; ?></b></td><?php } ?><?php if(!$min_ver){?><td><b>NA</b></td><?php } ?><td>Channel bandwidth:</td><td>8Mhz</td></tr><tr><td>Standard:</td><td><select id="quad_Standard"><option>DVB-CSA/TS</option></select></td><td>Default symbol rate: </td><td><input type="text" class="form-control-default" id="Default_symbol_rate" style="margin-top: 4px;" name="" value="6.875">MBd</td></tr><tr><td>Default modulation:</td><td><select id="quad_Defaultmodulation"><option>16-QAM</option><option>32-QAM</option><option>64-QAM</option><option>128-QAM</option><option value="Default">256-QAM</option></select></td><td>Output spectrum:</td><td><select id="quad_Outputspectrum"><option>Normal</option><option>Inverted</option> </select></td></tr><tr><td>Payload RX bitrate:</td><td></td><td>Payload TX bitrate:</td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" id="QUAD_QAM'+rmx_no+'" onClick=AddBaseFreq(Base_Frequency'+rmx_no+','+rmx_no+',<?php echo $no_of_output;?>); disabled="disabled" >SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button></div></div></div>');

                $("#Base_Frequency"+rmx_no).keyup(function() {
                    var empty = false;
                    $("#Base_Frequency"+rmx_no).each(function() 
                    {
                      if ($(this).val() == '') 
                      {
                      empty = true;
                      }
                    });
                      if (empty) 
                      {
                      $("#QUAD_QAM"+rmx_no).attr('disabled', 'disabled'); 
                      } else {
                            $("#QUAD_QAM"+rmx_no).removeAttr('disabled');
                      
                      }
                  });
  
          },
          type:'GET'
        });  
}
       
function AddBaseFreq(basefrequency_name,Qam_ID,no_of_output)
{
  var con=confirm("Want to update?");
   
    var basefrequency = basefrequency_name.value; 
  if(con){
       if(basefrequency.trim() =='')
       {
        alert('enter base frequency');
       }
       else if(basefrequency%2 != 0)
       {
          alert('Base frequency should be even number');
       }
       else if(basefrequency.trim() == 0)
       {
          alert('Base frequency should not be 0');
       }
       else if(basefrequency<200 || basefrequency >500)
       {
        alert('Base frequency should be in the range of 200 and 500');
       }
       else
      {
        $.ajax({
        url:'index.php?route=common/dashboard/addBaseFrequency&token=<?php echo $token; ?>&basefrequency='+basefrequency+'&Qam_ID='+Qam_ID,
        error:function()
        {
          alert("Error While adding basefrequency");
        },
        success: function(data) 
        {
          if(data)
          {

             $.ajax({
                       url:'index.php?route=common/dashboard/getFrequencies&token=<?php echo $token; ?>&no_of_output='+no_of_output+'&basefrequency='+basefrequency+'&Qam_ID='+Qam_ID,
                      error:function()
                      {
                        alert("Error While Setting basefrequency");
                      },
                      success: function(data) 
                      {
                        if(data)
                        {
                      alert("Updated succesfully");
                          location.reload();
                        }
                        else
                        {
                          alert("Error While Setting");
                        }
                     
                      },
                      type: 'POST'
                  });  
          }
          else
          {
            alert("Error While Updating");
          }
        },
        type: 'POST'
        });
      }
    }
}
function admin()
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
              alert("Error While updating Password");
            },
            success: function(data) 
                {
                  alert("Password updated succesfully");
                  location.reload();
                },
            type: 'POST'
        });
      }
}
$(document).on("click",'#input_button',function (e){
  e.stopPropagation();
});
$(document).on("click",'#GE1_settings',function (e){
  e.stopPropagation();
});
$(document).on("click",'#ECMG_add',function (e){
  e.stopPropagation();
});
$(document).on("click",'#quad_qam',function (e){
  e.stopPropagation();
});
$(document).on("click",'#qam-1',function (e){
  e.stopPropagation();
});
$(document).on("click",'#qam-0',function (e){
  e.stopPropagation();
});
$(document).on("click",'#qam-2',function (e){
  e.stopPropagation();
});
$(document).on("click",'#qam-3',function (e){
  e.stopPropagation();
});
$(document).on("click",'#output_panel',function (e){
  e.stopPropagation();
});
$(document).on("click",'#GE1_plus',function (e){
  e.stopPropagation();
});
$(document).on("click",'#emmg_plus',function (e){
  e.stopPropagation();
});
$(document).on("click",'#ecm_channel_settings',function (e){
  e.stopPropagation();
});
$(document).on("click",'#stream_plus',function (e){
  e.stopPropagation();
});
$(document).on("click",'#stream_delete',function (e){
  e.stopPropagation();
});
$(document).on("click",'#channel_setting',function (e){
  e.stopPropagation();
});

  for(var 
    targets = document.querySelectorAll('[data-draggable="target"]'), 
    len = targets.length, 
    i = 0; i < len; i ++)
  {
    
    targets[i].setAttribute('aria-dropeffect', 'none');
  }
  //get the collection of draggable items and add their draggable attributes
  for(var 
    items = document.querySelectorAll('[data-draggable="item"]'), 
    len = items.length, 
    i = 0; i < len; i ++)
  {

    items[i].setAttribute('draggable', 'true');
    items[i].setAttribute('aria-grabbed', 'false');
    items[i].setAttribute('tabindex', '0');
  }
  //dictionary for storing the selections data 
  //comprising an array of the currently selected items 
  //a reference to the selected items' owning container
  //and a refernce to the current drop target container
  var selections = 
  {
    items      : [],
    owner      : null,
    droptarget : null
  };
  
  //function for selecting an item
  function addSelection(item)
  {

    //if the owner reference is still null, set it to this item's parent
    //so that further selection is only allowed within the same container
    if(!selections.owner)
    {
      selections.owner = item.parentNode;
    }
    
    //or if that's already happened then compare it with this item's parent
    //and if they're not the same container, return to prevent selection
    else if(selections.owner != item.parentNode)
    {
      return;
    }
        
    //set this item's grabbed state
    item.setAttribute('aria-grabbed', 'true');
    
    //add it to the items array
    selections.items.push(item);

  }
  
  //function for unselecting an item
  function removeSelection(item)
  {
    //reset this item's grabbed state
    item.setAttribute('aria-grabbed', 'false');
    
    //then find and remove this item from the existing items array
    for(var len = selections.items.length, i = 0; i < len; i ++)
    {
      if(selections.items[i] == item)
      {
        selections.items.splice(i, 1);
        break;
      }
    }
  }
  
  //function for resetting all selections
  function clearSelections()
  {
    //if we have any selected items
    if(selections.items.length)
    {
      //reset the owner reference
      selections.owner = null;

      //reset the grabbed state on every selected item
      for(var len = selections.items.length, i = 0; i < len; i ++)
      {
        selections.items[i].setAttribute('aria-grabbed', 'false');
      }

      //then reset the items array    
      selections.items = [];
    }
  }

  //shorctut function for testing whether a selection modifier is pressed
  function hasModifier(e)
  {
    return (e.ctrlKey || e.metaKey || e.shiftKey);
  }
  
   
  //function for applying dropeffect to the target containers
  function addDropeffects()
  {
    //apply aria-dropeffect and tabindex to all targets apart from the owner
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

    //remove aria-grabbed and tabindex from all items inside those containers
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
  
  //function for removing dropeffect from the target containers
  function clearDropeffects()
  {
    //if we have any selected items
    if(selections.items.length)
    {
      //reset aria-dropeffect and remove tabindex from all targets
      for(var len = targets.length, i = 0; i < len; i ++)
      {
        if(targets[i].getAttribute('aria-dropeffect') != 'none')
        {
          targets[i].setAttribute('aria-dropeffect', 'none');
          targets[i].removeAttribute('tabindex');
        }
      }

      //restore aria-grabbed and tabindex to all selectable items 
      //without changing the grabbed value of any existing selected items
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

  //shortcut function for identifying an event element's target container
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

  //mousedown event to implement single selection
  document.addEventListener('mousedown', function(e)
  {
    //if the element is a draggable item
    if(e.target.getAttribute('draggable'))
    {
      //clear dropeffect from the target containers
      clearDropeffects();

      //if the multiple selection modifier is not pressed 
      //and the item's grabbed state is currently false
      if
      (
        !hasModifier(e) 
        && 
        e.target.getAttribute('aria-grabbed') == 'false'
      )
      {
        //clear all existing selections
        clearSelections();
      
        //then add this new selection
        addSelection(e.target);
      }
      
    }
    
    //else [if the element is anything else]
    //and the selection modifier is not pressed 
    else if(!hasModifier(e))
    {
      //clear dropeffect from the target containers
      clearDropeffects();

      //clear all existing selections
      clearSelections();
    }
    
    //else [if the element is anything else and the modifier is pressed]
    else
    {
      //clear dropeffect from the target containers
      clearDropeffects();
    }

  }, false);
  
  //mouseup event to implement multiple selection
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

  //dragstart event to initiate mouse dragging
  document.addEventListener('dragstart', function(e)
  {
    //if the element's parent is not the owner, then block this event
    if(selections.owner != e.target.parentNode)
    {
      e.preventDefault();
      return;
    }
        
    //[else] if the multiple selection modifier is pressed 
    //and the item's grabbed state is currently false
    if
    (
      hasModifier(e) 
      && 
      e.target.getAttribute('aria-grabbed') == 'false'
    )
    {
      //add this additional selection
      addSelection(e.target);
    }
    
    //we don't need the transfer data, but we have to define something
    //otherwise the drop action won't work at all in firefox
    //most browsers support the proper mime-type syntax, eg. "text/plain"
    //but we have to use this incorrect syntax for the benefit of IE10+
    e.dataTransfer.setData('text', '');
    
    //apply dropeffect to the target containers
    addDropeffects();
  
  }, false);
  
  

  //keydown event to implement selection and abort
  document.addEventListener('keydown', function(e)
  {
    //if the element is a grabbable item 
    if(e.target.getAttribute('aria-grabbed'))
    {
      //Space is the selection or unselection keystroke
      if(e.keyCode == 32)
      {
        //if the multiple selection modifier is pressed 
        if(hasModifier(e))
        {
          //if the item's grabbed state is currently true
          if(e.target.getAttribute('aria-grabbed') == 'true')
          {
            //if this is the only selected item, clear dropeffect 
            //from the target containers, which we must do first
            //in case subsequent unselection sets owner to null
            if(selections.items.length == 1)
            {
              clearDropeffects();
            }

            //unselect this item
            removeSelection(e.target);

            //if we have any selections
            //apply dropeffect to the target containers, 
            //in case earlier selections were made by mouse
            if(selections.items.length)
            {
              addDropeffects();
            }
        
            //if that was the only selected item
            //then reset the owner container reference
            if(!selections.items.length)
            {
              selections.owner = null;
            }
          }
          
          //else [if its grabbed state is currently false]
          else
          {
            //add this additional selection
            addSelection(e.target);

            //apply dropeffect to the target containers 
            addDropeffects();
          }
        }

        //else [if the multiple selection modifier is not pressed]
        //and the item's grabbed state is currently false
        else if(e.target.getAttribute('aria-grabbed') == 'false')
        {
          //clear dropeffect from the target containers
          clearDropeffects();

          //clear all existing selections
          clearSelections();
      
          //add this new selection
          addSelection(e.target);

          //apply dropeffect to the target containers
          addDropeffects();
        }
        
        //else [if modifier is not pressed and grabbed is already true]
        else
        {
          //apply dropeffect to the target containers 
          addDropeffects();
        }
      
        //then prevent default to avoid any conflict with native actions
        e.preventDefault();
      }

      //Modifier + M is the end-of-selection keystroke
      if(e.keyCode == 77 && hasModifier(e))
      {
        //if we have any selected items
        if(selections.items.length)
        {
          //apply dropeffect to the target containers 
          //in case earlier selections were made by mouse
          addDropeffects();

          //if the owner container is the last one, focus the first one
          if(selections.owner == targets[targets.length - 1])
          {
            targets[0].focus();
          }
          
          //else [if it's not the last one], find and focus the next one
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
    
        //then prevent default to avoid any conflict with native actions
        e.preventDefault();
      }
    }
    
    //Escape is the abort keystroke (for any target element)
    if(e.keyCode == 27)
    {
      //if we have any selected items
      if(selections.items.length)
      {
        //clear dropeffect from the target containers
        clearDropeffects();
        
        //then set focus back on the last item that was selected, which is 
        //necessary because we've removed tabindex from the current focus
        selections.items[selections.items.length - 1].focus();

        //clear all existing selections
        clearSelections();
        
        //but don't prevent default so that native actions can still occur
      }
    }
      
  }, false);


   
  //related variable is needed to maintain a reference to the 
  //dragleave's relatedTarget, since it doesn't have e.relatedTarget
  var related = null;

  //dragenter event to set that variable
  document.addEventListener('dragenter', function(e)
  {
    related = e.target;

  }, false);
  
  //dragleave event to maintain target highlighting using that variable
  document.addEventListener('dragleave', function(e)
  {
    //get a drop target reference from the relatedTarget
    var droptarget = getContainer(related);
    
    //if the target is the owner then it's not a valid drop target
    if(droptarget == selections.owner)
    {
      droptarget = null;
    }

    //if the drop target is different from the last stored reference
    //(or we have one of those references but not the other one)
    if(droptarget != selections.droptarget)
    {
      //if we have a saved reference, clear its existing dragover class
      if(selections.droptarget)
      {
        selections.droptarget.className = 
          selections.droptarget.className.replace(/ dragover/g, '');
      }
      
      //apply the dragover class to the new drop target reference
      if(droptarget)
      {
        droptarget.className += ' dragover';
      }
          
      //then save that reference for next time
      selections.droptarget = droptarget;
    }

  }, false);  

  //dragover event to allow the drag by preventing its default
  document.addEventListener('dragover', function(e)
  {
    //if we have any selected items, allow them to be dragged
    
    if(selections.items.length)
    {
      e.preventDefault();
    }
  
  }, false);  
document.addEventListener('drop',function(e)
{  
   for(var len = selections.items.length, i = 0; i < len; i ++)
      {
        
      doTest(selections.items[i].id,selections.droptarget.id);
      }
      
      clearSelections();
},false);

function doTest(outputdata,target_id)
{
  var targetid = outputdata.split('~');

  var target_id = target_id.split('_');

  var freq_id=target_id[0];
  var qam_id=target_id[1];

  var channelnumber = targetid[1];
  var re_value = targetid[3];
  var output_channelname = targetid[2];
  var input= targetid[0];
  var includeFlag=1;            
     $.ajax({
          url: 'index.php?route=common/dashboard/addToOutput&token=<?php echo $token; ?>&channelNumber=' + channelnumber+'&outputQAMid='+qam_id+'&outputfreqId='+freq_id+'&re_value='+re_value+'&channelname='+output_channelname+'&includeFlag='+includeFlag+'&input='+input,
          error: function() 
          {
          alert('Error while adding channel');
          },
          success: function(data) 
          {         
            if(data==1)
            {
               location.reload();              
            }
             else if(data == 0)
            {
              alert('Error while adding channel');
            }
            else if(data == -1)
            {
              alert('You Should Drop in Proper RMX');
            }
            else 
            {
              alert(output_channelname+' Channel already exist');
            }  
          },
          type: 'POST'
    });       
}

$("#qam-0,#qam-1,#qam-2,#qam-3").click(function(){
  $("#tab1").tab('show');
});
$("#input_button").click(function(){
  $("#tab1_input").tab('show');
});




  tday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
  tmonth=new Array("January","February","March","April","May","June","July","August","September","October","November","December");

function GetClockData()
{
    var d=new Date();
    var nday=d.getDay(),nmonth=d.getMonth(),ndate=d.getDate(),nyear=d.getYear();
    if(nyear<1000) nyear+=1900;
    var nhour=d.getHours(),nmin=d.getMinutes(),nsec=d.getSeconds(),ap;

    if(nhour==0){ap=" AM";nhour=12;}
    else if(nhour<12){ap=" AM";}
    else if(nhour==12){ap=" PM";}
    else if(nhour>12){ap=" PM";nhour-=12;}

    if(nmin<=9) nmin="0"+nmin;
    if(nsec<=9) nsec="0"+nsec;

    document.getElementById('localtime').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+ap+"";
}

function getDeviceTime()
{
    GetClockData();
    setInterval(GetClockData,1000);
}

$("#Payload1").click(function(){
 
   if($('#show_netmask').prop('checked') == true)
      {
       var show_netmask = 1;
       $('#netmask,#gateway,#mac').removeAttr('hidden'); 
       
      }
   else
      {
       var  show_netmask = 0;
       $('#netmask,#gateway,#mac').attr('hidden', 'hidden'); 
      }
      
});
function NIT_Mode(output,rmx_no)
{
	nit_mode = $("#nitMode option:selected").val();
    $.ajax({
          url: 'index.php?route=common/dashboard/set_nit_mode&token=<?php echo $token; ?>&output='+output+'&nit_mode='+nit_mode+'&rmx_no='+rmx_no,
          error: function() 
          {
          alert('Error while Updating NIT MODE');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Mode Updated successfully'); 
             location.reload();
            }
             else
            {
              alert('Error while Updating Mode');
            }
           
          },
          type: 'GET'
          });
}
function Input_status_INPUT(b)
{ 
<?php $RE_NO=0; foreach($Selection_detail as $Selection_value) { ?>
  <?php    foreach($ip_input[$Selection_value['Selection_Id']-1] as $RE_value ){ ?>
   $('#channel_<?php echo $RE_NO;?>').removeClass("hover2");
  <?php  foreach($RE_value['channels'] as $value1 ){ ?>
   
     if(b == <?php echo $value1['channelnumber'];?>)
     { 
        if($('#sel_<?php echo $Selection_value['Selection_Id']?>').attr('aria-expanded')=="true")
        {
           if($('#channel_<?php echo $RE_NO;?>').attr('aria-expanded')=="true")
           {

           }
           else
           {
             $('#channel_<?php echo $RE_NO;?>').addClass("hover2"); 
             $('#channel_<?php echo $RE_NO;?>').click();
           } 
           $('#channel_<?php echo $RE_NO;?>').addClass("hover2");
        }
        else 
        {
           $("#sel_<?php echo $Selection_value['Selection_Id']?>").click();
           if($('#channel_<?php echo $RE_NO;?>').attr('aria-expanded')=="true")
           {

           }
           else
           {
             $('#channel_<?php echo $RE_NO;?>').addClass("hover2"); 
             $('#channel_<?php echo $RE_NO;?>').click();
           }
           $('#channel_<?php echo $RE_NO;?>').addClass("hover2");
        }
     }
    <?php  } ?>
    <?php $RE_NO++;  } ?>
    <?php  } ?>
                    
}
function Input_status_OUTPUT(a)
{
  <?php foreach($Qam_detail as $Qam_value ){ ?>
    <?php foreach($QamFreq_detail as $QamFreq_value ){ ?>
      $('#<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>').removeClass("hover2");
      <?php foreach($outputdata as $value ){ ?>                        
                    if(a==<?php echo $value['channelnumber'];?> || a== <?php echo $value['changed_ch_no'];?>)
                       {
                         if($('#qam_name<?php echo $Qam_value['Qam_ID'];?>').attr('aria-expanded')=="true")
                         {
                          if($('#<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>').attr('aria-expanded')=="true")
                             {
                              
                             }
                          else
                             {  
                               $('#<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>').addClass("hover2"); 
                               $('#<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>').click();
                             } 
                          $('#<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>').addClass("hover2");
                        }
                        else
                        {
                           $('#qam_name<?php echo $Qam_value['Qam_ID'];?>').click();
                           if($('#<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>').attr('aria-expanded')=="true")
                             {
                                
                             }
                          else
                             {
                               $('#<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>').addClass("hover2"); 
                               $('#<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>').click();
                             } 
                          $('#<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>').addClass("hover2"); 
                        }
                       }
              <?php } ?>
            <?php } ?>
          <?php } ?>  
}
// Search functionality
/*$("#search_1").keyup(function(){
  var search_text=$("#search_1").val().toLowerCase();

  $("#inputchannels").each(function(){
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
    
  if(text_one.indexof(text_two)  == -1)
 {
  alert("true");
    return true;
 }
 else
 {
  alert("false");
   return false;
 }
  
}*/
// Search functionality

  // Automatic Refresh
 $(document.body).bind("mousemove click scroll keypress",function(e){
  stopFunction();
 });
 var myVar;
 function Reload()
 {
  location.reload();
 }
 function stopFunction(){
  clearInterval(myVar);
  myVar= setInterval("Reload()",10000);
 }
 $(document).ready(function(){
  myVar=setInterval("Reload()",10000);
 });
// Automatic Refresh

<!-- color changeing -->

    $('.modal').on('show.bs.modal',function(){
      $("tr").unbind();
    });
    $('.modal').on('hidden.bs.modal',function(){
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
    });


  $("table.panel1 tr:even").css("background-color","#E0FFFF").hover(function(){
    $(this).css('background-color','lightblue');
  },function(){
          $(this).css('background-color','#E0FFFF');     
    });

  $("table.panel1 tr:even").css("background-color","#E0FFFF").click(function(){
    $(this).css('background-color','orange');
  });
$('.modal').on('hidden.bs.modal',function(){
   $("table.panel1 tr:even").css("background-color","#E0FFFF").hover(function(){
    $(this).css('background-color','lightblue');
  },function(){
          $(this).css('background-color','#E0FFFF');     
    });

  $("table.panel1 tr:even").css("background-color","#E0FFFF").click(function(){
    $(this).css('background-color','orange');
  }); 
});


<!-- color changing -->