<?php echo $header; ?>
<div class="container-fluid" id="headend" >
    <!-- *************Services Column Begin**************** -->
<div class="col-md-4" >
    <div class="form-search">
       SERVICES <input type="text" class="input-medium search-query" name="s" placeholder="Search"  id="search_1" >
    </div>  
    <table class="panel" >
    <colgroup>
      <col style="width: 65%" />
      <col style="width: 10%" />
      <col style="width: 20%" />
    </colgroup>
    <tr>
      <td>
        <select id="channel" class="channels" >
          <option name="All" value="0">All</option>
          <option name="Input" value="1">Input</option>
          <option name="Output" value="2">Output</option>
        </select>
      </td>
    </tr>
    </table>
    <div id="inputchannels" ></div>
</div>
<!-- *************Services Column End**************** -->      
<!-- *************Input Column Begin**************** -->
  <div id="Input_Column" class="col-md-4" >
    <div class="form-search">
       INPUTS <input type="text" class="input-medium search-query" name="s" placeholder="Search" id="search_2" >
    </div>
    <table class="panel" data-toggle="collapse" data-target="#content-areas">
      <colgroup>
        <col style="width: 75%" />
        <col style="width: 10%" />
        <col style="width: 10%" /> 
      </colgroup>
    <tr>
	    <td><span class="Rmx_ip">Velankani@<?php echo $RMX_ip;?></span></td>
	   <!--  <td class="panelSetting"><span id="input_button" onclick="getDeviceTime()" data-toggle="modal" data-target="#panelsetting" class="glyphicon glyphicon-cog" ></span></td> -->
	    <td></td>
    </tr>
    </table>
  <!-- Model for panel setting -->
 <div class="modal fade" id="panelsetting" role="dialog" data-backdrop="static" tabindex="-1">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" >
      <h4 class="modal-title"><span class="glyphicon glyphicon-cog"></span><span>Chassis</span></h4>
    <div class="modal-body">
       <div data-role="main" class="ui-content">
         <div class="container-default">
            <ul class="nav nav-tabs">
              <li class="active"><a data-toggle="tab" id="tab1_input" href="#General1">General</a></li>
              <li><a data-toggle="tab" href="#Descriptors1">Descriptors</a></li>
              <li><a data-toggle="tab" href="#Payload1">Payload</a></li>
              <li><a data-toggle="tab" href="#PSIG-MUX1">PSIG-MUX</a></li>
              <li><a data-toggle="tab" href="#SAP1">SAP</a></li>
            </ul>
          <div class="tab-content">
          <div id="General1" class="tab-pane fade in active">
          <div class="container-default">
      
          <table class="genral" style="width: 100%;height: 40%;">
          <tbody>
          <br>
          <tr>
            <td>hostName</td>
            <td><input class="form-control-default" type="text" value="Headend"></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>Hw type</td>
            <td></td>
            <td>Device local time</td>
            <td><div id="localtime"></div></td>
          </tr>
          <tr>
            <td>Hw version</td>
            <td></td>
            <td>Uptime</td>
            <td></td>
          </tr>
          <tr>
            <td>Serial number</td>
            <td></td>
            <td>Sw version</td>
            <td></td>
          </tr>
          <tr>
            <td>Front panel</td>
            <td><button class="btn-btn-default">Lights off</button></td>
            <td>Silent mode</td>
            <td><button class="btn-btn-default">OFF</button></td>
          </tr>
          <tr class="blank_row"></tr>
          <tr>
           <td></td>
           <td><button class="submit" >Identify me</button></td>
          </tr>
          </tbody>
          </table>
          <div align="right">
               <button type="button" class="btn btn-default">APPLY</button>
               <button type="button" class="btn btn-default">SAVE</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
         </div>
          </div>
      <div id="Descriptors1" class="tab-pane fade" style="margin-top: 2%;">
        <h4>Descriptor insertion</h4>
        <p></p>
        <span id="discriptors"></span>
        <button type="button" class="btn btn-default"  style="height:4%; font-size: 80%;" onclick="discriptors()">ADD NEW DESCRIPTOR</button>
        <div align="right">
               <button type="button" class="btn btn-default">APPLY</button>
               <button type="button" class="btn btn-default">SAVE</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       </div>
      </div>
    <div id="SAP1" class="tab-pane fade" style="margin-top: 2%;">
         <h4>Session announcement protocol</h4>
       <table style="width: 100%;">
          <colgroup>
            <col style="width: 30%" />
            <col style="width: 50%" />
          </colgroup>
          <tr>
            <td>Enable SAP announcement</td>
            <td><input type="checkbox" value="" ></td>
          </tr>
          <tr class="blank_row"></tr>
          <tr>
            <td>SAP multicast address</td>
            <td><input type="text" ></td>
          </tr>
          <tr class="blank_row"></tr>
          <tr>
            <td>SAP announcement interval</td>
            <td><input type="text" style="width:20%;" name=""></td>
          </tr>
          <tr class="blank_row"></tr>
          <tr>
            <td>SDP additional fileds</td>
            <td><textarea rows="3"></textarea></td>
          </tr>
          <tr class="blank_row"></tr>
          <tr>
            <td>Enable SAP reception</td>
            <td><input type="checkbox"></td>
          </tr>
       </table>
       <div align="right">
               <button type="button" class="btn btn-default">APPLY</button>
               <button type="button" class="btn btn-default">SAVE</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       </div>
    </div>
    <div id="Payload1" class="tab-pane fade" style="margin-top: 2%;">
      <table style="width:100%">
        <colgroup>
          <col style="width: 10%" />
          <col style="width: 65%" />
          <col style="width: 25%" />
        </colgroup>
        <tr>
         <td>Port mode</span></td>
         <td><select><option>Separate</option><option>Common</option></select></td>
         <td> Show netmask,gw&MAC<input type="checkbox" id="show_netmask"></td>
        </tr>
      </table>
      <table style="width: auto;">
        <tr>
          <th> </th>
          <th>GE-1</th> 
          <th>Source port</th> 
          <th>Virtual Source IP</th>
          <th>:Enable</th>
        </tr>
        <tr>
          <td width="20%"><b>Module 1</b> No module</td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td> </td>
        </tr>
        <tr>
          <td><b>Module 2</b> LQM-C</td>
          <td><input type="text" style="width:70%;"></td>
          <td><input type="text" style="width:70%;"></td>
          <td><input type="text" value="" id="myText" name="0.0.0.0"  style="width:70%;"/></td>
          <td><input type="checkbox" id="checkMe" name="checkMe"  onclick="disableMyText()" /></td>
        </tr>
        <tr class="blank_row"></tr>
        <tr id="netmask" hidden="hidden">
          <td>Netmask</td>
          <td><input type="text" style="width:70%;"></td>
          <td><input type="text" style="width:70%;"></td>
        </tr>
        <tr class="blank_row"></tr>
        <tr id="gateway" hidden="hidden">
          <td>Gateway</td>
          <td><input type="text" style="width:70%;"></td>
          <td><input type="text" style="width:70%;"></td>
        </tr>
        <tr class="blank_row"></tr>
        <tr id="mac" hidden="hidden">
          <td>MAC</td>
          <td><span>00:90:50:06:AA:D5</span></td>
          <td><span>00:90:50:06:AA:D5</span></td>
        </tr>
        <tr>
          <td><b>Module 3</b> No module</td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td> </td>
        </tr>
        <tr>
          <td><b>Module 4</b> No module</td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td> </td>
        </tr>
        <tr>
          <td><b>Module 5</b> No module</td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td> </td>
        </tr>
        <tr>
          <td><b>Module 6</b> No module</td>
          <td> </td>
          <td> </td>
          <td> </td>
          <td> </td>
        </tr>
      </table><br>
      <button class="accordion"  data-toggle="collapse" data-target="#advanceoption">Advanced options</button>
      <div class="collapse" id="advanceoption" >
      <table  style="width: 50%;"  >
        <colgroup>
          <col style="width: 25%" />
          <col style="width: 25%" />
        </colgroup>
        <tr>
          <td>Enable strict CBR output</td>
          <td><input type="checkbox" ></td>
        </tr>
        <tr>
          <td>Primary redundant Stream</td>
          <td><button class="btn btn-default">ACTIVATE</button></td>
        </tr>
      </table>
      </div>
      <div align="right">
               <button type="button" class="btn btn-default">APPLY</button>
               <button type="button" class="btn btn-default">SAVE</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     </div>
    </div>
    <div id="PSIG-MUX1" class="tab-pane fade" style="margin-top:1%;">
    <b>Status</b>  
    <table style="width:100%;margin-top: 2%;">
      <tr>
        <th> </th>
        <th> </th> 
        <th> </th>
        <th> </th> 
      </tr>
      <tr>
        <td>Latest Connected client</td>
        <td></td>
        <td>Channel Error </td>
        <td></td>       
      </tr>
      <tr>
        <td>Latest Connection time</td>
        <td></td>
        <td>Stream Error </td>
        <td></td> 
      </tr>
    </table><br>
    <h4>Clients</h4>
    <table style="width: 80%;height: 60%;">
      <colgroup>
        <col style="width: 20%"/>
        <col style="width: 20%"/>
        <col style="width: 20%"/>
      </colgroup>
      <tr>
        <th>Alias</th>
        <th>IP Address</th>
        <th>Port</th>
      </tr>
      <tr>
        <td><input type="text" name="" style="width:auto;"></td>
        <td><input type="text" name="" style="width:auto;"></td>
        <td><input type="text" name="" style="width:auto;"></td>
      </tr>
      <tr class="blank_row"></tr>
      <tr>
        <td><input type="text" name="" style="width:auto;"></td>
        <td><input type="text" name="" style="width:auto;"></td>
        <td><input type="text" name="" style="width:auto;"></td>
      </tr>
      <tr class="blank_row"></tr>
      <tr>
        <td><input type="text" name="" style="width:auto;"></td>
        <td><input type="text" name="" style="width:auto;"></td>
        <td><input type="text" name="" style="width:auto;"></td>
      </tr>
      <tr class="blank_row"></tr>
      <tr>
        <td><input type="text" name="" style="width:auto;"></td>
        <td><input type="text" name="" style="width:auto;"></td>
        <td><input type="text" name="" style="width:auto;"></td>
      </tr>
      <tr class="blank_row"></tr>
    </table>
     <div align="right">
       <button type="button" class="btn btn-default">APPLY</button>
       <button type="button" class="btn btn-default">SAVE</button>
       <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     </div>
    </div>
   </div>
</div>
</div>
</div>  
</div>
</div>
</div>
<script>
var acc = document.getElementsByClassName("accordion");
var i;
for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
  }
}
</script>
<!--End Model for panel setting -->  
   <ul class="nav nav-list collapse in" id="content-areas" >
      <li>         
<!-- CAS -->         
        <table class="collapse-panel"  data-toggle="collapse" data-target="#CAS" id="cas_pannel">
          <colgroup>
            <col style="width: 5%"/>
            <col style="width: 15%"/>
            <col style="width: 30%"/>
            <col style="width: 20%"/> 
          </colgroup>
	    <tr>
	        <td></td>
	        <td><span data-toggle="collapse" data-target="#CAS">CAS</span></td>
	        <td></td>
	        <td></td>   
	    </tr>
        </table>   
        <div class="collapse" id="CAS">      
            <table class="collapse-panel"  data-toggle="collapse" data-target="#ECMG1">
              <colgroup>
                <col style="width: 6%"/>
                <col style="width: 15%" />
                <col style="width: 30%" />
                <col style="width: 20%" /> 
              </colgroup>
            <tr>
	            <td></td>
	            <td><span data-toggle="collapse" data-target="#ECMG1">ECMG</span></td>
	            <td></td>
	            <td><span id="ECMG_add" onclick="newECMG();" class="glyphicon glyphicon-plus"  data-toggle="modal" data-target="#ECMGModal"></span></td> 
            </tr>
            </table>
            <div class="collapse " id="ECMG1" >
              <?php foreach($ecmg_channel as $ecmg_value ){ ?>
              <table class="panel-ecmg" data-toggle="collapse" id="ECMG<?php echo $ecmg_value['ecmg_channel_id'];?>" data-target="#<?php echo $ecmg_value['ecmg_channel_id'];?>">
                <colgroup>
                  <col style="width: 4%;" />
                  <col style="width: 33%;" />
                  <col style="width: 5%;" />
                  <col style="width: 5%;" />
                  <col style="width: 5%;" />
                </colgroup>
                <tr>
                  <td></td>
                  <td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $ecmg_value['Alias'];?></td>
                  <td><span class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#ecmg-1plus" id="stream_plus" onclick="onclickECMG('<?php echo $ecmg_value['ecmg_channel_id'];?>')" ></span></td>
                  <td><span class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#ecmg-settings" id="ecm_channel_settings" onclick="ECMGSettings('<?php echo $ecmg_value['ecmg_channel_id'];?>')"></span></td>
                  <td><span id="stream_delete" class="glyphicon glyphicon-trash"  onclick="onclickDeleteECMG('<?php echo $ecmg_value['ecmg_channel_id'];?>')" ></span></td>
                </tr>
              </table>
              <!-- Ecmg settings modal -->
              <div class="modal fade" id="ecmg-settings"  role="dialog" data-backdrop="static">
              </div>
              <!-- settings modal end -->
              <div class="collapse" id="<?php echo $ecmg_value['ecmg_channel_id'];?>" >
               <?php foreach($ecm_stream as $data ){ ?>
                  <?php if($data['ecmg_id'] == $ecmg_value['ecmg_channel_id']){ ?>
              <table class="panel2" id="<?php echo $data['ecm_stream_streamid'].'~'.$ecmg_value['ecmg_channel_id'];?>" >
                <colgroup>
                  <col style="width: 4%;"/>
                  <col style="width: 33%;"/>
                  <col style="width: 5%;"/>
                  <col style="width: 5%;"/>
                  <col style="width: 5%;"/>
                </colgroup>
                <tr>
                  <td></td>
                  <td style="text-overflow:ellipsis; overflow:hidden;"><span><b><font size="1">ECM</font></b> <?php echo $data['ecm_stream_streamid'];?>:<?php echo $data['alias'];?></span></td>
                  <td></td>
                  <td><span class="glyphicon glyphicon-cog" onclick="ecmStreamModal('<?php echo $data['ecm_stream_streamid'];?>','<?php echo $ecmg_value['ecmg_channel_id'];?>');"  style="margin-top: 4%;" data-toggle="modal" data-target="#stream_modal"></span></td>
                  <td><span class="glyphicon glyphicon-trash" onclick="ecmStreamDelete('<?php echo $data['ecm_stream_streamid'];?>','<?php echo $ecmg_value['ecmg_channel_id'];?>');" style="margin-top: 4%;" ></span></td>
                </tr>
              </table>
                <?php } ?>
              <?php } ?>
              </div>
              <?php } ?>
            </div>
         <!-- modal for ecm_stream_modal -->
        <div class="modal fade" id="stream_modal"  role="dialog" data-backdrop="static" >
        </div>
        <!-- modal for ecm_stream_modal -->   
        <!-- modal for ecmg-1plus -->
        <div class="modal fade" id="ecmg-1plus"  role="dialog" aria-labelledby="ECMGModalLabel" data-backdrop="static" >
        </div>
        <!-- modal for ecmg-1plus -->        
        <div class="modal fade" id="ECMGModal" role="dialog" data-backdrop="static" >
        </div>
        <table class="collapse-panel"  data-toggle="collapse" data-target="#EMMG">
          <colgroup>
            <col style="width: 6%"/>
            <col style="width: 15%" />
            <col style="width: 30%" />
            <col style="width: 20%" />
          </colgroup>
        <tr>
           <td></td>
           <td><span data-toggle="collapse"  >EMMG</span></td>
           <td></td>
           <td><span id="emmg_plus" class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#EMMG_modal" onclick="EMMGModal()" ></span></td>
        </tr>
        </table>
        <div class="collapse " id="EMMG" >
          <?php foreach($emmg_channel as $emmg_value ){ ?>
          <table  class="panel2" id="EMMG<?php echo $emmg_value['channel_id'];?>">
	          <colgroup>
	            <col style="width: 4%;" />
	            <col style="width: 33%;" />
	            <col style="width: 5%;" />
	            <col style="width: 5%;" />
	            <col style="width: 5%;" />
	          </colgroup>
          <tr>
            <td></td>
            <td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $emmg_value['alias'];?></span></td>
            <td></td>
            <td><span class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#emmg_settings_modal" onclick="EMMG_settings('<?php echo $emmg_value['channel_id'];?>');" " ></span></td>
            <td><span class="glyphicon glyphicon-trash" onclick="deleteEMMG('<?php echo $emmg_value['channel_id'];?>')"></span></td>
          </tr>
          </table>
       <?php } ?>
      </div>
</div>
<div class="modal fade" id="EMMG_modal"  role="dialog" data-backdrop="static">
</div>
<div class="modal fade" id="emmg_settings_modal"  role="dialog" data-backdrop="static">
</div>
<!-- CAS END -->    
 <?php $RE_NO=0; foreach($Selection_detail as $Selection_value) { ?>
    <table id="sel_<?php echo $Selection_value['Selection_Id']?>" data-toggle="collapse" data-target="#RE_collapse<?php echo $Selection_value['Selection_Id']?>" style=" width: 100%; min-height: 3vh;">
      <colgroup>
        <col style="width:1.4%;"/>
        <col style="width:2%;" />
        <col style="width:15%;"/>
        <col style="width:5%;"/>
        <col style="width:5%;"/>
      </colgroup>
   <tr>
    <td></td>
    <td><span><?php echo $Selection_value['Selection_name'];?></span></td>
    <!-- <td><span id="GE1_plus" data-toggle="modal" data-target="#GE1_modal" class="glyphicon glyphicon-plus" onclick="validate_GE()" ></span></td>
    <td><span id="GE1_settings"  class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#GE1Setting"></span></td> -->
    <td></td>
    </tr>
    </table>
    <div class="collapse" id="RE_collapse<?php echo $Selection_value['Selection_Id']?>">
        <?php foreach($ip_input[$Selection_value['Selection_Id']-1] as $RE_value ){ ?>
        <table class="genral" id="channel_<?php echo $RE_NO;?>" data-toggle="collapse"   data-target="#demo1<?php echo $RE_NO;?>" style="white-space:nowrap; table-layout:fixed; width: 100%; min-height: 3vh;margin-bottom: 1%;">
            <colgroup>
              <col style="width: 4%;" />
              <col style="width: 33%;" />
              <col style="width: 5%;" />
              <col style="width: 5%;" />
              <col style="width: 5%;" />
            </colgroup>
        <tr>
              <td></td>
              <td style="text-overflow:ellipsis; overflow:hidden;" ><span><?php echo $RE_value['RE_name'];?></span></td>
              <td></td>
              <!-- <td><span class="glyphicon glyphicon-cog" onclick="channel_setting('<?php echo $value['Id'];?>')" data-toggle="modal" id="channel_setting" data-target="#channel_setting_modal"></span></td>
              <td><span id="channel_delete"  class="glyphicon glyphicon-trash" onclick="delete_input('<?php echo $value['Id'];?>')" ></span></td> -->
        </tr>
        </table>
        <div id="demo1<?php echo $RE_NO;?>" class="collapse" >
            <?php foreach($RE_value['channels'] as $value1 ){ ?>
            <table class="panel1" id="<?php echo $RE_value['Id'].'~'.$value1['channelnumber'].'~'.$value1['channelname'].'~'.$RE_NO;?>"  data-draggable="item">
              <colgroup>
                <col style="width: 2%" />
                <col style="width: 15%"/>
                <col style="width: 47%"/>
                <col style="width: 2%" />
                <col style="width: 13%"/>
              </colgroup>          
            <tr>
                <td style="pointer-events: none;"></td>
                <td style="pointer-events: none;"><span><?php echo $value1['channelnumber'];?></span></td>
                <td style="pointer-events: none;"><?php echo $value1['channelname'];?></td>
                <td><span data-toggle="modal" data-target="#channel_modal" onclick ="inputChinfo('<?php echo $value1['channelname'];?>','<?php echo $value1['channelnumber'];?>','<?php echo $RE_value['Id'];?>','<?php echo $RE_NO;?>','<?php echo $no_of_input;?>')" class="glyphicon glyphicon-cog"  ></span></td>
                <td style="pointer-events: none;"></td>
            </tr>
            </table>
            <?php } ?>
          </div>
        <?php $RE_NO++;
        } ?>
        </div>
     <?php }?>
      </li>
   </ul>
</div>

<div class="modal" id="channel_modal" data-backdrop="static">
</div>
<!-- <div class="modal fade" id="channel_setting_modal" data-backdrop="static">
</div> -->
<!-- END OF INPUT COLUMN -->
<!-- OUTPUT COLUMN START -->
<div id="Output_div" class="col-md-4" >
    <div class="form-search">
       OUTPUTS <input type="text" class="input-medium search-query"  placeholder="Search"  >
    </div>
   
       <table class="panel" data-toggle="collapse"   data-target="#output-collapse" >
          <colgroup>
            <col style="width: 1%" />
            <col style="width: 35%" />
            <col style="width: 22%" />
            <col style="width: 15%" />
          </colgroup>
        <tr>
            <td></td>
            <td><span class="Rmx_ip">Velankani@<?php echo $RMX_ip;?></span></td>
            <td></td>
           <!--  <td class="panelSetting"><span id="output_panel" data-toggle="modal" data-target="#panelsetting" class="glyphicon glyphicon-cog" ></span></td> -->
        </tr>
       </table>
   
    <div class="collapse in" id="output-collapse" style="background-color: silver;">
      <?php foreach($Qam_detail as $Qam_value ){ ?>
    <table class="collapse-panel" id="qam_name<?php echo $Qam_value['Qam_ID'];?>" data-toggle="collapse" data-target="#output-qam<?php echo $Qam_value['Qam_ID'];?>" >
      <colgroup>
        <col style="width: 1%"  />
        <col style="width: 35%" />
        <col style="width: 15%" />
        <col style="width: 10%" />
      </colgroup>
    <tr>
	    <td></td>
	    <td><span><?php echo $Qam_value['Qam_name']?></span></td>
	    <td></td>
	    <td><span id="quad_qam<?php echo $Qam_value['Qam_ID'];?>" data-toggle="modal" data-target="#quad_QAM<?php echo $Qam_value['Qam_ID'];?>" class="glyphicon glyphicon-cog"  onClick="getBaseFreq(<?php echo $Qam_value['Qam_ID'];?>,<?php echo $no_of_output;?>)"></span></td>
    </tr> 
    </table>
    <div class="modal fade" id="quad_QAM<?php echo $Qam_value['Qam_ID'];?>" tabindex="-1" role="dialog" data-backdrop="static">
    </div>
    <div class="collapse" id="output-qam<?php echo $Qam_value['Qam_ID'];?>" >
    <?php foreach($QamFreq_detail as $QamFreq_value ){ ?>
    <?php if( $Qam_value['Qam_ID'] == $QamFreq_value['qam_id'] ) { ?>
    <table class="freq-table"  data-toggle="collapse" data-target="#channel11<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" >
      <colgroup>
       <col style="width: 3%"  />
        <col style="width: 33%" />
        <col style="width: 15%" />
        <col style="width: 10%" />
      </colgroup>
     <tr id="freq_out_<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>"  data-draggable="target" >
        <td></td>
        <td><span> <?php echo $QamFreq_value['freq_name'] ?>  </span></td>
        <td><b><?php echo $QamFreq_value['frequency']?></b>MHz</td>
        <td id="Output_Modal_button<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" data-toggle="modal" data-target="#Output_Modal<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>"  class="glyphicon glyphicon-cog" onclick="get_TSDetails(<?php echo $QamFreq_value['freq_ID']?>,'<?php echo $QamFreq_value['frequency']?>',<?php echo $Qam_value['Qam_ID'];?>); tables(<?php echo $QamFreq_value['freq_ID']?>,<?php echo $Qam_value['Qam_ID'];?>);emmTab(<?php echo $QamFreq_value['freq_ID']?>,<?php echo $Qam_value['Qam_ID'];?>);"></td>
     </tr>
    </table>
    <div class="collapse" id="channel11<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">
        <?php foreach($outputdata as $value ){ ?>

          <?php if($value['targetid'] == $QamFreq_value['freq_ID'] &&  $value['qam_targetid'] == $Qam_value['Qam_ID']){ ?>
          <div id="output_chModal_<?php echo $value['channelnumber'].''.$value['targetid'].''.$value['rmx_no'];?>" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
          </div>
        <table class="panel1" id="output<?php echo $value['channelnumber'].'_'.$value['targetid'].'_'.$value['qam_targetid'];?>">
          <colgroup>
           <col style="width: 7%"  />
          <col style="width: 15%" />
          <col style="width: 62%" />
          <col style="width: 7%" />
          </colgroup>
          <tr>
            <td></td>
            <?php if($value['changed_ch_no'] == -1){ ?>
            <td><span> <font size="2"><?php echo $value['channelnumber'];?></font> </span></td>
             <?php } ?>
             <?php if($value['changed_ch_no'] != -1){ ?>
            <td><span> <font size="2"><?php echo $value['changed_ch_no'];?></font> </span></td>
             <?php } ?> 
             <?php if($value['changed_ch_name'] == '-1'){ ?>
             <td style="text-overflow:ellipsis; overflow:hidden;"><span><font size="2"><?php echo $value['channelname'];?></font></span></td>
             <?php } ?>
             <?php if($value['changed_ch_name'] != '-1'){ ?>
            <td style="text-overflow:ellipsis; overflow:hidden;"><span><font size="2"><?php echo $value['changed_ch_name'];?></font></span></td>
             <?php } ?> 
            <td><span onclick="outputChinfo('<?php echo $value['channelname'];?>','<?php echo $value['channelnumber'];?>','<?php echo $value['inputid'];?>','<?php echo $value['rmx_no'];?>','<?php echo $value['targetid'];?>','<?php echo $value['qam_targetid'];?>','<?php echo $value['changed_ch_no'];?>','<?php echo $value['changed_ch_name'];?>','<?php echo $value['Enable_ch_name'];?>','<?php echo $value['changed_ch_provider'];?>','<?php echo $value['Enable_ch_provider'];?>');"  class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#output_chModal_<?php echo $value['channelnumber'].''. $value['targetid'].''.$value['rmx_no'];?>"></span> </td>
            <td><span onclick="myfunction('<?php echo $value['channelnumber'];?>','<?php echo $value['targetid'];?>','<?php echo $value['inputid'];?>','<?php echo $value['rmx_no'];?>');" class="glyphicon glyphicon-trash"></span> </td>
          </tr>
        </table>
          <?php } ?> 
         
        <?php } ?>  

      </div>
     <?php } ?>
     <?php } ?>
</div>
<?php } ?>   
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
                      <li><a data-toggle="tab" href="#Tables<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">PSI/SI Tables</a></li>
                      <li><a data-toggle="tab" href="#Descriptors<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">Passthrough</a></li>
                      <li><a data-toggle="tab" href="#Payload<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">PID filters</a></li>
                      <li><a data-toggle="tab" href="#EMM<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>">EMM</a></li>
                  </ul>
          <div class="tab-content">
              <div id="General<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" class="tab-pane fade in active">
                
              </div>

              <div id="Tables<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" class="tab-pane fade">
                
              </div>
              <div id="Descriptors<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" class="tab-pane fade" style="margin-top: 10px;">
              <span style="margin-left: 10px;font-size:20px;">Service passthrough</span>
              <p></p>
              <span id="New_Input"></span>
             <button type="button" class="btn btn-default"  style="height:4%; font-size: 80%;" onClick="add_NewInput()">ADD NEW INPUT</button>
             <div align="right">
               
               <button type="button" class="btn btn-default">APPLY&SAVE</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
             </div>
              </div>
              <div id="Payload<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" class="tab-pane fade" style="margin-top: 10px;">
               <span style="margin-left: 10px;font-size:20px;">PID filters</span>
               <table style="width: 100%;">
                  <tr>
                    <td>Mode</td>
                    <td><select><option>include</option></select></td>
                  </tr>
               </table>
              <table class="genral" style="width: 50%;">
                <tbody>
                  
                  <tr class="blank_row"></tr>
                 <tr>
                   <td>
                     <span id="New_Input_PID"></span>
                   </td>
                 </tr>
                 <tr class="blank_row"></tr>
                  <tr>
                    <td><button type="button" class="btn btn-default" style="height:4%; font-size: 80%;" onClick="add_NewInput_PID()" >ADD NEW INPUT</button></td>
                  </tr>
                </tbody>
              </table>
              <table style="width: 100%">
                <tr>
                    <td>Common PID exclude  </td>
                    <td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td>
                  </tr>
              </table>
              <div align="right">
            
               <button type="button" class="btn btn-default">APPLY&SAVE</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
             </div>
              </div>
            <div id="EMM<?php echo $QamFreq_value['freq_ID'].'_'.$Qam_value['Qam_ID']?>" class="tab-pane fade" style="margin-top: 10px; min-height: 100px;">
            <!-- <span style="margin-left: 10px;font-size:20px;">EMM configuration</span>
              <table class="genral" style="width: 50%;">
               <tbody>
                 <tr>
                    <td>Common PID exclude  </td>
                    <td><select><option>include</option></select></td>
                  </tr>
                  <tr>
                    <td>No EMMs included</td>
                  </tr>
                  <tr>
                  <td><select ><option value="0">EMM generator reference</option><option value="1">EMM from input</option></select></td>
                    <td><button type="button" class="btn btn-default" data-dismiss="" style="height:4%; font-size: 80%;">ADD NEW INPUT</button></td>
                  </tr>
               </tbody>
              </table>
              <div align="right">
              
               <button type="button" class="btn btn-default">APPLY&SAVE</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div> -->
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
 </div>
<!-- ipStreaming -->  
<table class="Ip-panel" data-toggle="collapse"   data-target="#ip_stream" >
          <colgroup>
            <col style="width: 1%" />
            <col style="width: 35%" />
            <col style="width: 22%" />
            <col style="width: 15%" />
          </colgroup>
          <tr>
            <td></td>
            <td><span>IP OUT</span></td>
            <td></td>
            <td></td>
          </tr>
  </table>
<div class="collapse out" style="background-color: silver;" id="ip_stream" >
 <?php foreach($GE_data as $GE_name ){ ?>
  <table class="collapse-panel" id="IP_streaming<?php echo $GE_name['GEName'];?>" data-toggle="collapse" data-target="#IP_Qam<?php echo $GE_name['GEName'];?>" >
      <colgroup>
        <col style="width: 1%"/>
        <col style="width: 35%"/>
        <col style="width: 15%"/>
        <col style="width: 10%"/>
      </colgroup>
   <tr>
    <td></td>
    <td><span><?php echo $GE_name['GEName'];?></span></td>
    <td></td>
    <td></td>
   </tr> 
  </table>
<div class="collapse out" id="IP_Qam<?php echo $GE_name['GEName'];?>">
<?php if($GE_name['GEName'] == 'GE1') { ?>
  <?php $i=1; foreach($Qam_detail as $Qam_value ){ ?>
    <table class="collapse-panel" data-toggle="collapse" data-target="#stream<?php echo $Qam_value['Qam_name'] ?>" >
      <colgroup>
        <col style="width: 2%"/>
        <col style="width: 25%"/>
      </colgroup>
    <tr>
        <td></td>
        <td><span>Remux-<?php echo $i ?></span></td>
    </tr> 
    </table>
    <div class="collapse out" id="stream<?php echo $Qam_value['Qam_name'] ?>">
      <?php foreach($Ipstream as $Stream) { ?>
        <?php if($Qam_value['Qam_ID'] == $Stream['Qam_id']) { ?>
         <table class="ip-panel" >
            <colgroup>
              <col style="width: 2%"/>
              <col style="width: 5%"/>
              <col style="width: 5%"/>
            </colgroup>
        <tr>
           <td></td>
           <td><?php echo $Stream['Ip_Address'] ?></td>
           <td><?php echo $Stream['Port'] ?></td>
        </tr>
        </table>
       <?php } ?>
      <?php } ?>
    </div> 
    <?php if( $i == 2) { break; } ?> 
  <?php $i++; } ?>    
<?php } ?>
<?php if($GE_name['GEName'] == 'GE2') { ?>
  <?php $i=1; foreach($Qam_detail as $Qam_value ){ ?>
    <?php if($i >2){ ?>
      <table class="collapse-panel" data-toggle="collapse" data-target="#stream<?php echo $Qam_value['Qam_name'] ?>">
        <colgroup>
          <col style="width: 2%"/>
          <col style="width: 25%"/>
        </colgroup>
       <tr>
          <td></td>
          <td><span>Remux-<?php echo $i ?></span></td>
       </tr> 
      </table> 
      <div class="collapse out" id="stream<?php echo $Qam_value['Qam_name'] ?>">
        <?php foreach($Ipstream as $Stream) { ?>
          <?php if($Qam_value['Qam_ID'] == $Stream['Qam_id']) { ?>      
             <table class="ip-panel" >
                <colgroup>
                  <col style="width: 2%"/>
                  <col style="width: 5%"/>
                  <col style="width: 5%"/>
                </colgroup>
             <tr>
               <td></td>
               <td><?php echo $Stream['Ip_Address'] ?></td>
               <td><?php echo $Stream['Port'] ?></td>
            </tr>
        </table>          
          <?php } ?>
        <?php } ?> 
      </div>
    <?php if( $i == 4) { break; } ?> 
    <?php } ?>
  <?php $i++; } ?> 
<?php } ?>
<?php if($GE_name['GEName'] == 'GE3') { ?>
  <?php $i=1; foreach($Qam_detail as $Qam_value ){ ?>
    <?php if($i >4){ ?>
      <table class="collapse-panel" data-toggle="collapse" data-target="#stream<?php echo $Qam_value['Qam_name'] ?>" >
        <colgroup>
          <col style="width: 2%"/>
          <col style="width: 25%"/>
        </colgroup>
        <tr>
          <td></td>
          <td><span>Remux-<?php echo $i ?></span></td>
        </tr> 
      </table>  
      <div class="collapse out" id="stream<?php echo $Qam_value['Qam_name'] ?>">
        <?php foreach($Ipstream as $Stream) { ?>
          <?php if($Qam_value['Qam_ID'] == $Stream['Qam_id']) { ?> 
            <table class="ip-panel" >
                <colgroup>
                  <col style="width: 2%"/>
                  <col style="width: 5%"/>
                  <col style="width: 5%"/>
                </colgroup>
              <tr>
               <td></td>
               <td><?php echo $Stream['Ip_Address'] ?></td>
               <td><?php echo $Stream['Port'] ?></td>
              </tr>
        </table>
          <?php } ?>
        <?php } ?>
      </div>
    <?php } ?>
  <?php $i++; } ?>     
<?php } ?>
</div>
<?php }?>
</div> 
<!-- ipStreaming --> 
</div>
</div>
<script type="text/javascript">
$('#channel').ready(function(){
            $("#channel").val("0");
            $("#inputchannels").empty();
            var html='Input Services<br>'
            <?php foreach($Selection_detail as $Selection_value ){ foreach($ip_input[$Selection_value['Selection_Id']-1] as $api ){ foreach($api['channels'] as $value1 ){?>
            html+= '<table id="servicech_<?php echo $value1['channelnumber'].'_'.$value1['rmx_no'].'_'.$value1['input']?>" class="panel1" onClick="input_status_INPUT(<?php echo $value1['channelnumber']?>);input_status_OUTPUT(<?php echo $value1['channelnumber']?>);">'
            html+='<colgroup>'
            html+='<col style="width: 30%"/>'
            html+='<col style="width: 45%"/>'
            html+='<col style="width: 10%"/>'
            html+='<col style="width: 15%"/>'
            html+='<colgroup>'
            html+='<tr>'
            html+='<td><span class="ch-number" ><font size="2"><?php echo $value1['channelnumber'];?></span></td>'
            html+='<td class="ch-name" ><?php echo $value1['channelname'];?></td>'
            html+='<td></td>'
            html+='<td id="image<?php echo $value1['channelnumber'].''.$value1['rmx_no'].''.$value1['input']?>"><img class="img-active" src="view/image/sh1.gif" id="image_active<?php echo $value1['channelnumber'].''.$value1['rmx_no'].''.$value1['input']?>"></td>'
            html+='</tr>'
            html+='</table>'
            <?php } } }?>
            html+='Output Services'
          <?php foreach($outputdata as $value ){ ?>
             html+='<table id="outch_<?php echo $value['channelnumber'].'_'.$value['targetid'].'_'.$value['qam_targetid'];?>" class="panel1" ><col style="width:30%"/><col style="width:35%"/><col style="width:30%"/><tr>'
            <?php if($value['changed_ch_no'] == -1){ ?>
            html+='<td><span class="ch-number" ><?php echo $value['channelnumber'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_no'] != -1){ ?>
            html+='<td><span class="ch-number" ><?php echo $value['changed_ch_no'];?></span></td>'
             <?php } ?> 
             <?php if($value['changed_ch_name'] == '-1'){ ?>
             html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['channelname'];?></span></td>'
             <?php } ?>
             <?php if($value['changed_ch_name'] != '-1'){ ?>
            html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['changed_ch_name'];?></span></td>'
             <?php } ?>
             html+='<td></td></tr></table> '
             <?php } ?>
             $("#inputchannels").append(html);
             
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
        
        updatechannelstatus();    
 });
$('#channel').change(function(){ 
  var strUser = $(".channels option:selected").val();
  if ((strUser.localeCompare(1))==0) 
  {
    $("#inputchannels").empty();
    var i;
    var html='Input Services<br>'
    <?php foreach($Selection_detail as $Selection_value ){ foreach($ip_input[$Selection_value['Selection_Id']-1] as $api ){ foreach($api['channels'] as $value1 ){?>
    html+= '<table id="servicech_<?php echo $value1['channelnumber'].'_'.$value1['rmx_no'].'_'.$value1['input']?>" class="panel2"  onClick="input_status_INPUT(<?php echo $value1['channelnumber']?>);input_status_OUTPUT(<?php echo $value1['channelnumber']?>);">'
    html+='<colgroup>'
    html+='<col style="width: 30%"/>'
    html+='<col style="width: 45%"/>'
    html+='<col style="width: 10%"/>'
    html+='<col style="width: 15%"/>'
    html+='<colgroup>'
    html+='<tr>'
    html+='<td><span class="ch-number" ><font size="2"><?php echo $value1['channelnumber'];?></span></td>'
    html+='<td class="ch-name"><?php echo $value1['channelname'];?></td>'
    html+='<td></td>'
    html+='<td ><img class="img-active" src="view/image/sh1.gif" id="image_active<?php echo $value1['channelnumber'].''.$value1['rmx_no'].''.$value1['input']?>"></td>'
    html+='</tr>'
    html+='</table>'
    <?php } } }?>
   $("#inputchannels").append(html);
  }
  else if((strUser.localeCompare(2))==0)
  {
      $("#inputchannels").empty();
     var html='Output Channels'
     <?php foreach($outputdata as $value ){ ?>
      html+=' <table id="outch_<?php echo $value['channelnumber'].'_'.$value['targetid'].'_'.$value['qam_targetid'];?>" class="panel2" ><col style="width:30%" /> <col style="width:35%" /><col style="width:30%" /><tr>'
      <?php if($value['changed_ch_no'] == -1){ ?>
      html+='<td><span class="ch-number" > <?php echo $value['channelnumber'];?></span></td>'
       <?php } ?>
       <?php if($value['changed_ch_no'] != -1){ ?>
      html+='<td><span class="ch-number" > <?php echo $value['changed_ch_no'];?></span></td>'
       <?php } ?> 
       <?php if($value['changed_ch_name'] == '-1'){ ?>
       html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['channelname'];?></span></td>'
       <?php } ?>
       <?php if($value['changed_ch_name'] != '-1'){ ?>
      html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['changed_ch_name'];?></span></td>'
       <?php } ?>
       html+='<td></td></tr></table> '
       <?php } ?>   
       $("#inputchannels").append(html);
  }
  else if((strUser.localeCompare(0))==0)
  {
    $("#inputchannels").empty();
    var html='Input Services<br>'
    <?php foreach($Selection_detail as $Selection_value ){ foreach($ip_input[$Selection_value['Selection_Id']-1] as $api ){ foreach($api['channels'] as $value1 ){?>
    html+= '<table id="servicech_<?php echo $value1['channelnumber'].'_'.$value1['rmx_no'].'_'.$value1['input']?>" class="panel2"  onClick="input_status_INPUT(<?php echo $value1['channelnumber']?>);input_status_OUTPUT(<?php echo $value1['channelnumber']?>);">'
    html+='<colgroup>'
    html+='<col style="width: 30%"/>'
    html+='<col style="width: 45%"/>'
    html+='<col style="width: 10%"/>'
    html+='<col style="width: 15%"/>'
    html+='<colgroup>'
    html+='<tr>'
    html+='<td><span class="ch-number"><font size="2"><?php echo $value1['channelnumber'];?></span></td>'
    html+='<td class="ch-name" ><?php echo $value1['channelname'];?></td>'
    html+='<td></td>'
    html+='<td ><img class="img-active" src="view/image/sh1.gif" id="image_active<?php echo $value1['channelnumber'].''.$value1['rmx_no'].''.$value1['input']?>"></td>'
    html+='</tr>'
    html+='</table>'
    <?php } } }?>
   
    html+='Output Services'
  <?php foreach($outputdata as $value ){ ?>
     html+=' <table id="outch_<?php echo $value['channelnumber'].'_'.$value['targetid'].'_'.$value['qam_targetid'];?>" class="panel2" ><col style="width:30%"/><col style="width:35%"/><col style="width:30%"/><tr>'
    <?php if($value['changed_ch_no'] == -1){ ?>
    html+='<td><span class="ch-number"><?php echo $value['channelnumber'];?></span></td>'
     <?php } ?>
     <?php if($value['changed_ch_no'] != -1){ ?>
    html+='<td><span class="ch-number"><?php echo $value['changed_ch_no'];?></span></td>'
     <?php } ?> 
     <?php if($value['changed_ch_name'] == '-1'){ ?>
     html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['channelname'];?></span></td>'
     <?php } ?>
     <?php if($value['changed_ch_name'] != '-1'){ ?>
    html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><?php echo $value['changed_ch_name'];?></span></td>'
     <?php } ?>
     html+='<td></td></tr></table> '
     <?php } ?>
     $("#inputchannels").append(html);
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
         $("table.panel2 tr:even").css("background-color","#E0FFFF").hover(function(){
          $(this).css('background-color','lightblue');
        },function(){
                $(this).css('background-color','#E0FFFF');     
          });

        $("table.panel2 tr:even").css("background-color","#E0FFFF").click(function(){
          $(this).css('background-color','orange');
        }); 
         updatechannelstatus();
});
function myfunction(ch_number,target_id,inputid,rmx_no)
{
    var result = confirm("Want to delete?");
    var includeFlag=0;
    var qam_id=rmx_no-1;

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
	      var data= Number(data);
	      switch(data)
	      {
	        case 0:
	                alert("Sorry! unable to delete from server");
	        break;
	        case 1:
	                var ele = document.getElementById("output"+ch_number+"_"+target_id+"_"+qam_id);
	                var ele1 = document.getElementById("outch_"+ch_number+"_"+target_id+"_"+qam_id);
	                ele.remove();
	                ele1.remove();
	                alert('channel deleted succesfully');
	        break;
	        case 2:
	                alert("Sorry! unable to delete from database");
	        break;  
	        default:alert("Invalid response!");               
	      } 
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
        alert("ERROR");
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
        $("#EMMG_modal").append('<div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content"><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " id="EMMGModalLabel" style="margin-left: 0px">NEW EMMG</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_alias"  style="margin-top: 4px;" name=""></td><td></td><td>Status:</td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default emmg_modal" id="emm_enable" style="margin-top: 4px;" checked name=""></td><td></td><td>Bandwidth:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_bw" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_bw" style="color: red"></span></td></tr><tr><td>Channel ID:</td><td><b>'+id+'</b></td><td></td><td style="margin-top: 4px;">Stream_id:</td><td style="margin-top: 4px;"><b>'+id+'</b></td></tr><tr><td>Client ID:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_clientid" onfocusout="emmClientValidation()" style="margin-top: 4px;" name=""></td><td></td><td>Data ID:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_dataid" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_emm_clientid" style="color: red"></span></td><td></td><td></td><td><span id="error_emm_dataid" style="color: red"></span></td></tr><tr><td>Current Bitrate:</td><td></td><td></td><td>Port:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_port" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_port" style="color: red"></span></td></tr><tr></tbody></table> </div><div class="modal-footer"><button type="button" class="btn btn-default" Disabled="Disabled" id ="EMMG_onclick" onclick="addEMMG('+id+');">SAVE</button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></div></div>');
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
      $("#error_emm_clientid").html("Client ID should have even digits");
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
        alert("Error");
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
     $("#emmg_settings_modal").append('<div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content" ><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " id="EMMGModalLabel" style="margin-left: 0px">'+emmdata['alias']+'</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_settings_alias" value="'+emmdata['alias']+'"  style="margin-top: 4px;" name=""></td><td></td><td>Status:</td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default emmg_modal" id="emm_settings_enable" style="margin-top: 4px;" checked name=""></td><td></td><td>Bandwidth:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_settings_bw" value="'+emmdata['bandwidth']+'" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_settings_bw" style="color: red"></span></td></tr><tr><td>Channel ID:</td><td><b>'+emmdata['channel_id']+'</b></td><td></td><td style="margin-top: 4px;">Stream_id:</td><td style="margin-top: 4px;"><b>'+emmdata['stream_id']+'</b></td></tr><tr><td>Client ID:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_settings_clientid" onfocusout="emm_settings_clientid()" value="'+emmdata['client_id']+'" style="margin-top: 4px;" name=""></td><td></td><td>Data ID:</td><td><input type="text" class="form-control-default emmg_modal" value="'+emmdata['data_id']+'" id="emm_settings_dataid" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_emm_settings_clientid" style="color: red"></span></td><td></td><td></td><td><span id="error_emm_dataid" style="color: red"></span></td></tr><tr><td>Current Bitrate:</td><td></td><td></td><td>Port:</td><td><input value="'+emmdata['port']+'" type="text" class="form-control-default emmg_modal" id="emm_settings_port" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_settings_port" style="color: red"></span></td></tr><tr></tbody></table> </div><div class="modal-footer"><button type="button" class="btn btn-default" Disabled="Disabled" id ="EMMG_Settings" onclick="updateEMMG('+emmdata['channel_id']+');">APPLY & SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></div></div>');
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
	   }
	}    
	else
	{
	  $("#error_emm_clientid").html("Client id starts with 0x and should be heaxadecimal(<0xffffffff)");
	    $("#error_emm_settings_clientid").show();
	} 
}
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
          alert("Error");
          },
          success: function(data) 
          {
            if(data == 1)
            { 
              var ele = document.getElementById("EMMG"+channel_id);
              ele.remove();
              alert('EMMG deleted succesfully');
              
            }
            else
            {
              alert("Error while Deleting");
            }
          },
          type: 'POST'
          });
    }  
}
function inputChinfo(ch_name,ch_number,input,RE_NO,no_of_input)
{
   rmx_no=Math.floor((RE_NO/no_of_input))+1;
   input = input%no_of_input;
   $.ajax({
      url: 'index.php?route=common/dashboard/getChannelInformation&token=<?php echo $token; ?>&channel_number='+ch_number+'&input_id='+input+'&rmx_no='+rmx_no+'&targetid=0',
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
            $("#channel_modal").append('<div class="modal-dialog"  style="width: 70%; align-self: center; " ><div class="modal-content" ><div class="modal-body" > <table class="genral" style="width:100%; height:20%;"><div class="modal-header"><h4 class=" glyphicon glyphicon-cog " id="name" style="margin-left: 0px" "><font>'+ch_name+','+ch_number+'</font></h4></div><tbody><tr><td>serviceprovider Name:</td> <td><b>'+arr['serviceprovider']+'</b></td><td></td> <td>Status:</td></tr> <tr> <td>Service Type:</td> <td><b>'+arr["servicetype"]+'</b></td><td></td><td>CA Mode:</td><td><b>Not scambled</b></td></tr><tr><td>PMT PID:</td><td><b>'+arr['PMTpid']+'</b></td><td></td><td>EIT Present:</td><td><b>Not Present</b></td></tr><tr><td>PCR PID</td><td><b>'+arr['PCRpid']+'</b></td><td></td><td>EIT present following:</td><td><b>Not present</b></td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button></div></div></div>');
          }  
      },
      type:'POST'
    });
}
/*$(document).on("click",'#ge1_apply',function(e){
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
      $('#ge2_collapse').append('<div class="panel1" id="channel'+ge1_port+'" data-toggle="collapse"   data-target="#demo1'+ge1_port+'" style="margin-left: 15px; margin-bottom: 5px;" ><table><colgroup><col style="width: 45%" /><col style="width: 5%" /><col style="width: 5%" /></colgroup><tr><td><span>'+ge1_alias+'</span></td><td><span class="glyphicon glyphicon-cog" onclick="channel_setting('+ge1_port+')" data-toggle="modal" data-target="#channel_setting_modal"></span></td><td><span id="channel_delete"  class="glyphicon glyphicon-trash" onclick="delete_input('+ge1_port+');" ></span></td></tr></table></div>');
    },
    type:'POST'
  });
});*/
function ecmgStream(ecmg_id,ecm_stream_streamid)
{
   ecm_stream_alias = $("#ecm_stream_alias").val();
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
        alert('Error');
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
        type:'POST'
      },
    });
   }  
}
function onclickECMG(ecmg_id)
{
  $.ajax({
    url:'index.php?route=common/dashboard/getLastStreamId&token=<?php echo $token; ?>&ecm_id='+ecmg_id,
    error:function()
    { 
    	alert("ERROR");
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
       $("#ecmg-1plus").append('<div class="modal-dialog" role="document" style="width: 70%; align-self: center; "><div class="modal-content" ><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h4 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" style="margin-left: 0px">New ECM Stream</h4></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_alias" name=""></td><td></td><td>Status:</td></tr><tr><td></td><td><span id="error_stream_alias" style="color: red"></span></td><td></td><td></td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;" checked id="ecm_stream_enable" name=""></td><td></td><td>Access criteria</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_access_criteria" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_access_criteria" style="color: red"></span></td></tr><tr><td>Stream ID:</td><td><b>'+stream_id+'</b></td><td></td><td>ECM ID</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_ecmId" value="'+stream_id+'" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_ecmid" style="color: red"></span></td></tr><tr><td>CP Number:</td><td>'+0+'</td><td></td><td>CW Group:</td><td><input type="text" class="form-control-default" style="margin-top: 4px;" id="ecm_stream_CW_group" value="'+stream_id+'"></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_cw_number" style="color: red"></span></td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" onClick="ecmgStream('+ecmg_id+','+stream_id+')" disabled="disabled" id="ecm_stream_save"  >APPLY & SAVE </button><button type="button" class="btn btn-default"  data-dismiss="modal" >Cancel </button></div></div></div>');
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
    type:'POST'
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
          alert("ERROR");
        },
        success:function(data)
        {
          var data = JSON.parse(data);
          if(data['0'] == '')
          {
            data['0'] = 0;
          }
          if(data['0']>3)
          {
            alert("Cannot add more than 4 ECMGs");
          }
          else
          {
            if(data['id'] == 0)
            {
             var id = 1;
            }
            else
            {
              var id = data['id']+1;
            }
          $("#ECMGModal").empty();
          $("#ECMGModal").append('<div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content" ><form><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" style="margin-left: 0px">New ECMG</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default ecmg_modal" id="Alias" style="margin-top: 4px;" name=""></td><td></td><td>Status:</td></tr><tr><td>Enable:</td><td><input checked type="checkbox" class="form-control-default ecmg_modal" id="Enable" style="margin-top: 4px;" name=""></td><td></td><td>Super CAS ID:</td><td><input type="text" class="form-control-default ecmg_modal" onfocusout="supercas_id()" id="super_CAS_id" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td><span id="error_super_CAS_id" style="color: red"></span></td><td></td></tr><tr><td>Ip Address:</td><td><input type="text" class="form-control-default ecmg_modal" id="ipAddress" style="margin-top: 4px;" name=""></td><td></td><td>Channel ID:</td><td><input type="text" value='+id+' class="form-control-default ecmg_modal" id="Channel_id" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_ipaddress" style="color: red"></span></td><td><span id="error_channel_id" style="color: red"></td><td></td></tr><tr><td>Port</td><td><input type="text" class="form-control-default ecmg_modal" value="" id="Port" style="margin-top: 4px;" name=""></td><td></td><td>Scramble Mode:</td><td><select id="Scramble_mode"><option>DVB-CSA/TS</option></select></td></tr><td></td><td><span id="error_port" style="color: red"></span></td><td></td><td></td><tr><td>Cryptoperiod</td><td><input type="text" class="form-control-default ecmg_modal" value="10" id="Cryptoperiod" style="margin-top: 4px;" name=""> Sec</td><td></td><td>Simulcrypt version</td><td><select id="Simulcrypt_version" style="width: 100px;"><option>1</option><option>2</option><option>3</option><option>4</option></select></td></tr><td></td><td><span id="error_Cryptoperiod" style="color: red"></span></td><td></td><td></td></tbody></table>      </div><div class="modal-footer"><button type="button" class="btn btn-default" disabled="Disable" id ="ECMG_onclick" onclick="ecmg_onclick();">SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></form></div></div>');
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
        type:'GET'
      },
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
function check_ipAddress()  
{
  var text=$("#ipAddress").val().trim();
  var pattern=new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);
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
     else if (text1>=0 && text1<=90) 
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
        alert("Error");
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
function outputChinfo(ch_name,ch_number,input,rmx_no,targetid,qam_targetid,changed_number,changed_name,Enable_ch_name,changed_provider,Enable_ch_provider)
{ 

        $.ajax({
          url: 'index.php?route=common/dashboard/getChannelInformation&token=<?php echo $token; ?>&channel_number='+ch_number+'&input_id='+input+'&rmx_no='+rmx_no+'&targetid='+targetid,
          error:function()
          {
            alert("invalid channel");
          },
          success: function(data)
          {
          	
            if(data==1)
            {
            }
            else
            {
                var i=0;
                var arr= JSON.parse(data);
                arr1 = arr['ecmg_channel'];
                arr2 = arr['stream'];
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
                 if(changed_provider!= '-1')
                {
                  var channelprovider = changed_provider;
                }
                else
                {
                  var channelprovider = arr['serviceprovider'];
                }
                 if(Enable_ch_name==0)
                  {
                    var channelname = ch_name; 
                  }
                  var org_chname = "'"+channelname+"'";
                  var org_providername="'"+channelprovider+"'";
                   
                var video_bw=Math.floor(((arr['input_rate']/1000)*arr['video_per'])/1000);
                var audio_bw=Math.floor(((arr['input_rate']/1000)*arr['audio_per'])/1000);
                $("#output_chModal_"+ch_number+targetid+rmx_no).empty();
                var html='<div class="modal-dialog modal-lg"  style=" align-self: center; width: 85%;">'
                html+='<div class="modal-content">'
                html+='<h4 class="modal-title"><span class="glyphicon glyphicon-cog" style="margin-left:10px; margin-top: 5px;"></span>'
                html+='<span style="margin-left: 3px;margin-top: 5px;"><font>'+channelname+','+channelnumber+'</font></span></h4>'
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
                html+='<td>Enable</td><td><input type="checkbox" class="form-control-default" style="margin-top: 4px;" name=""></td>'
                html+='<td>Status</td><td></td></tr>'
                html+='<tr><td><br/></td></tr><tr><td>Passthrough any SID</td>'
                html+='<td><input type="checkbox" class="form-control-default" style="margin-top:4px;" name=""></td></tr>'
                html+='<tr><td>Input SID</td><td></td><td>Output SID</td>'
                html+='<td><input id="text_SID'+channelnumber+''+targetid+''+rmx_no+'" value="'+channelnumber+'" type="text" class="form-control-default" style="margin-top: 4px;"></td></tr>'
                html+='<tr><td></td><td></td><td></td><td><span id="error_outputSID'+channelnumber+''+targetid+''+rmx_no+'" style="color:red;"></span></td></tr>'
                html+='<tr><td>Input service</td><td></td><td>Service name</td>'
                html+='<td><b>'+channelname+'</b></td></tr>' 
                html+='<tr><td>Critical service</td>'
                html+='<td><input type="checkbox" class="form-control-default" style="margin-top: 4px;" name=""></td>'
                html+='<td>Service name override</td>'
                html+='<td><input id="checkbox_set_service'+channelnumber+''+targetid+''+rmx_no+'" type="checkbox" class="form-control-default" style="margin-top: 4px;">'
                html+='<input id="set_service'+channelnumber+''+targetid+''+rmx_no+'" type="textbox" class="form-control-default" style="margin-top:4px;margin-left:10px;" value="'+channelname+'" ></td>'
                html+='<td></td></tr><tr><td></td><td></td><td></td><td><span id="error_set_service'+channelnumber+''+targetid+''+rmx_no+'" style="color:red;"></span></td></tr>' 
                html+='<tr><td><br/></td></tr><tr><td>Set High Priority</td>'
                html+='<td><input id="checkbox_Priority'+channelnumber+''+targetid+''+rmx_no+'" type="checkbox" class="form-control-default"></td></tr>'
                html+='<tr><td><b>Output components</b></td></tr>'
                html+='<tr><td><br/></td>'
                html+='</tr><tr><td><b>Type</b></td>'
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
                html+='<td><b>'+arr['servicetype']+'</b></td>'
                html+='<td>Provider name override</td>'
                html+='<td><input id="checkbox_set_provider'+channelnumber+''+targetid+''+rmx_no+'" type="checkbox" class="form-control-default"  style="margin-top: 4px;">'
                html+='<input id="set_provider'+channelnumber+''+targetid+''+rmx_no+'" type="textbox" class="form-control-default" value="'+channelprovider+'" style="margin-top:4px;margin-left:10px;"></td></tr>'
                html+='<tr><td></td><td></td><td></td>'
                html+='<td><span id="error_set_provider'+channelnumber+''+targetid+''+rmx_no+'" style="color:red;"></span></td></tr>'
                html+='<tr><td>PMT Download</td>'
                html+='<td><button type="button" class="glyphicon glyphicon-download" id="PMT_Download'+channelnumber+''+targetid+''+rmx_no+'" style="background-color:white" onClick="downloadTables(1,'+channelnumber+','+rmx_no+')"></button></td>'
                html+='<td>PMT Alarm</td><td>'
                html+='<select id="PMT_Alarm'+channelnumber+''+targetid+''+rmx_no+'" name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'">'
                html+='<option value="1" selected="selected">Enable</option><option value="0" selected="selected">Disable</option></select></td></tr>'
                html+='</table></div>'
                html+='<div align="right" style="margin-top:10px;">' 
                html+='<button type="button" class="btn btn-default" onClick="set_priority('+channelnumber+','+ch_number+','+input+','+rmx_no+','+targetid+','+arr4[0].Priority_checkbox+');change_outputSid('+input+','+targetid+','+rmx_no+','+channelnumber+','+ch_number+','+org_chname+','+org_providername+','+Enable_ch_provider+','+Enable_ch_name+');set_PMT_alarm('+input+','+channelnumber+','+rmx_no+','+targetid+','+arr3[0].alarm_enable+');" id="save_output_sid'+channelnumber+''+targetid+''+rmx_no+'" disabled="disabled">APPLY & SAVE</button>'
                html+='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div></div>'
                html+='<div id="Scrambling'+channelnumber+''+targetid+''+rmx_no+'" class="tab-pane fade fade">'
                html+='<table class="genral" style="width:70%; height: 25%;">'
                html+='<tbody><tr><td>Scrambling</td>'
                html+='<td><input type="checkbox" class="form-control-default" style="margin-top: 4px;" id="scramble'+channelnumber+''+targetid+''+rmx_no+'"></td></tr>'
                html+='<tr><td><b>Scrambled components</b></td></tr>'
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
                html+='</td><td></td><td></td></tr><tr><td><br/></td></tr><tr> <td></td><td><b>ECM streams</b></td>'
                html+='<td><b>Access criteria</b></td>' 
                html+='<td><b>PID</b></td><td></td>';
                  for(var k in arr1){
                  html+='</tr><tr> <td>'+arr1[k].Alias+'</td><td><select id="'+targetid+'~'+ch_number+'"> <option>Not Selected</option>';
                  for(var l in arr2){
                  if(arr1[k].ecmg_channel_id == arr2[l].ecmg_id){
                  html+='<option value="">'+arr2[l].alias+' </option>'; 
                   }
                  l++;}
                  html+='</select></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td> <td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td><td></td> </tr>';
                  k++;}
                  html+='</tbody></table><div align="right" style="margin-top:10px;"> <button type="button" class="btn btn-default" onClick="scrambling('+channelnumber+','+targetid+','+rmx_no+','+input+')" id="applyScrambling'+channelnumber+''+targetid+''+rmx_no+'" >APPLY & SAVE</button><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div> </div></div></div></div></div></div></div>';
                  $("#output_chModal_"+ch_number+targetid+rmx_no).append(html);


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
                  $("#checkbox_set_provider"+channelnumber+targetid+rmx_no).click(function()
                  {
                     $("#save_output_sid"+channelnumber+targetid+rmx_no).removeAttr('disabled');
                  });
                  $("#set_service"+channelnumber+targetid+rmx_no).hide();
                  $("#set_provider"+channelnumber+targetid+rmx_no).hide();
                  if(Enable_ch_name==1)
                  {
                     $("#set_service"+channelnumber+targetid+rmx_no).show();
                     $("#checkbox_set_service"+channelnumber+targetid+rmx_no).attr('checked','checked');
                  }
                  if(Enable_ch_provider==1)
                  {
                     $("#set_provider"+channelnumber+targetid+rmx_no).show();
                     $("#checkbox_set_provider"+channelnumber+targetid+rmx_no).attr('checked','checked');
                  }
        // Priority and PMT alarm
                   if(arr3[0].alarm_enable==0)
                     {   
                       $('select[name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'"] option[value="1"]').removeAttr('selected'); 
                       $('select[name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'"] option[value="0"]').attr('selected','selected'); 
                     }
                   else if(arr3[0].alarm_enable==1)
                    {
                       $('select[name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'"] option[value="0"]').removeAttr('selected'); 
                       $('select[name="PMT_Alarms'+channelnumber+''+targetid+''+rmx_no+'"] option[value="1"]').attr('selected','selected'); 
                    }
                   if(arr4[0].Priority_checkbox==0)
                    {                     
                       
                    }
                    else if(arr4[0].Priority_checkbox==1)
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
                         if(check_outputsid(channelnumber,targetid,rmx_no))
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
                   if(arr5[0].scramble==1 && arr5[0].rmx_no == rmx_no && arr5[0].output == targetid && arr5[0].programNumbers == channelnumber)
                   {
                      $("#scramble"+channelnumber+targetid+rmx_no).attr('checked','checked');
                   }
                   else
                   {
                   	$("#scramble"+channelnumber+targetid+rmx_no).removeAttr('checked');
                   }
                //scrambling.................
              }
          },
       type:'POST'
    });
}
function check_outputsid(channelnumber,targetid,rmx_no)
{
    var text1=$("#text_SID"+channelnumber+targetid+rmx_no).val().trim();
     if (text1=='') 
     {
        $("#error_outputSID"+channelnumber+targetid+rmx_no).html("should not be empty");
        return false; 
     }
     else if(text1 >0 && text1<10000)
     {
      $("#error_outputSID"+channelnumber+targetid+rmx_no).hide();
      return true;
     }
     else
     {
      $("#error_outputSID"+channelnumber+targetid+rmx_no).html("should be in range 1 to 9999");
      $("#error_outputSID"+channelnumber+targetid+rmx_no).show();
      return false;
     }
}
function set_priority(channelnumber,program_number,input,rmx_no,targetid,old_Prioritycheckbox)
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
          alert('Error while setting priority');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Success'); 
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
function change_outputSid(input,output,rmx_no,old_channelnumber,original_chNumber,org_chname,org_chprovider,old_enablechProv,old_enablechname)
{
 var new_channelnumbar = $("#text_SID"+old_channelnumber+output+rmx_no).val();
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
   if(new_channelnumbar!=old_channelnumber || new_service_name!=org_chname || org_chprovider!=service_provider || old_enablechProv !=Enable_serviceProvider || old_enablechname!= Enable_serviceName)
   {
      $.ajax({
          url:'index.php?route=common/dashboard/changeOutputSID&token=<?php echo $token; ?>&original_chNumber='+original_chNumber+'&new_channelnumbar='+new_channelnumbar+'&input='+input+'&output='+output+'&new_service_name='+new_service_name+'&Enable_serviceName='+Enable_serviceName+'&service_provider='+service_provider+'&Enable_serviceProvider='+Enable_serviceProvider+'&rmx_no='+rmx_no+'&old_channelnumber='+old_channelnumber+'&org_chname='+org_chname+'&org_chprovider='+org_chprovider+'&old_enablechProv='+old_enablechProv+'&old_enablechname='+old_enablechname,
        error:function()
        {
          alert('Error while updating Output SID');
        },
        success:function(data)
        {
          var resp = parseInt(data);
          switch(resp)
          {
            case 0: alert('Error While updating service id');
            break;
            case 1:alert('service updated successfully');
            break;
            case 2:alert('error while updating service name');
            break;
            case 3:alert('service updated successfully');
            break;
            case 4:alert('error while updating service provider');
            break;
            case 5:alert('service updated successfully');
            break;
            default:alert('Invalid Responce');
          }
           location.reload();
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
          alert('Error');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Updated PMT Alarm successfully'); 
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
        $("#ecmg-settings").append('  <div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content" ><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><form><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " style="margin-left: 0px">'+ecmg_arr['Alias']+'</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default ecmg_modal" id="Alias_settings" value="'+ecmg_arr['Alias']+'" style="margin-top: 4px;" name=""></td><td></td><td>Status:</td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default ecmg_modal" id="Enable_settings" style="margin-top: 4px;" name=""></td><td></td><td>Super CAS ID:</td><td><input type="text" class="form-control-default ecmg_modal" onfocusout="supercas();" id="super_CAS_id_settings" value="'+ecmg_arr['Super_CAS_Id']+'" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td><span id="error_super_CAS_id_settings" style="color: red"></span></td></tr><tr><td>Ip Address:</td><td><input type="text" class="form-control-default ecmg_modal" id="ipAddress_settings" value="'+ecmg_arr['Ip_Address']+'" style="margin-top: 4px;" name=""></td><td></td><td>Channel ID:</td><td><input type="text" class="form-control-default ecmg_modal" id="Channel_id_settings" value="'+ecmg_arr['ecmg_channel_id']+'" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_ipaddress_settings" style="color: red"></span></td><td><span id="error_channel_id_settings" style="color: red"></td><td></td></tr><tr><td>Port</td><td><input type="text" class="form-control-default ecmg_modal" value="'+ecmg_arr['Port']+'" id="Port_settings" style="margin-top: 4px;" name=""></td><td></td><td>Scramble Mode:</td><td><select id="Scramble_mode_settings"><option>DVB-CSA/TS</option></select></td></tr><td></td><td><span id="error_port_settings" style="color: red"></span></td><td></td><td></td><tr><td>Cryptoperiod</td><td><input type="text" class="form-control-default ecmg_modal" id="Cryptoperiod_settings" value="'+ecmg_arr['Cryptoperiod']+'" style="margin-top: 4px;" name=""> Sec</td><td></td><td>Simulcrypt version</td><td><select id="Simulcrypt_version_settings" style="width: 100px;"><option>1</option><option>2</option><option>3</option><option>4</option></select></td></tr><td></td><td><span id="error_Cryptoperiod_settings" style="color: red"></span></td><td></td><td></td></tbody></table>      </div><div class="modal-footer"><button type="button" class="btn btn-default" disabled="Disable" onclick="updateECMG('+ecmg_channel_id+');" id = "ECMG_onclick_settings">APPLY&SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button>  </div></form></div></div>');
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
              url:'index.php?route=common/dashboard/updateECMGChannel&token=<?php echo $token; ?>&ip_Address=' + ip_Address+'&port=' +port+'&super_CAS_Id=' +super_CAS_Id + '&ecmg_Channel_Id='+ecmg_Channel_Id+ '&Alias=' + Alias+ '&Enable=' + Enable+ '&original_id=' + original_id,
      error:function()
      {
        alert("Error");
      },
      success: function(data) 
      {  
        if(data == 0)
        {
          alert('Error while updating ECMG');
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
          $("#stream_modal").append('<div class="modal-dialog" role="document" style="width: 70%; align-self: center; "><div class="modal-content" ><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h4 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" style="margin-left: 0px">'+ecmg_stream_arr['alias']+'</h4></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" value="'+ecmg_stream_arr['alias']+'" id="ecm_stream_alias_settings" name=""></td><td></td><td>Status:</td></tr><tr><td></td><td><span id="error_stream_alias_settings" style="color: red"></span></td><td></td><td></td></tr><tr><td>Enable:</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_enable_settings" name=""></td><td></td><td>Access criteria</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_access_criteria_settings" value="'+ecmg_stream_arr['access_criteria']+'" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_access_criteria_settings" style="color: red"></span></td></tr><tr><td>Stream ID:</td><td><b>'+stream_id+'</b></td><td></td><td>ECM ID</td><td><input type="text" class="form-control-default"  style="margin-top: 4px;" id="ecm_stream_ecmId_settings" value="'+ecmg_stream_arr['ecm_id']+'" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_stream_ecmid_settings" style="color:red"></span></td></tr><tr><td>CP Number:</td><td>'+ecmg_stream_arr['cp_number']+'</td><td></td><td>CW Group:</td><td><input type="text" class="form-control-default" style="margin-top: 4px;" id="ecm_stream_CW_group_settings" value="'+ecmg_stream_arr['cw_group']+'"></td></tr><tr><td></td><td><span id="error_stream_CP_number_settings" style="color:red"></span></td><td></td><td><span id="error_stream_CW_group_settings" style="color:red"></span></td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" onClick="updateECMStream('+stream_id+','+channel_id+','+ecmg_stream_arr['ecm_id']+','+ecmg_stream_arr['cp_number']+')" disabled="disabled" id="ecm_stream_save_settings"  >APPLY & SAVE </button><button type="button" class="btn btn-default"  data-dismiss="modal" >Cancel </button></div></div></div>');
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
      },
      type:'POST'
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
        alert('Error');
      },
      success:function(data)
      {
        if(data == 1)
        {
          alert('ECMG channel deleted succesfully');
          location.reload(); 
        }
        else
        {
         alert('Error while deleting ECMG channel'); 
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
/*function channel_setting(port)
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
             
              $("#channel_setting_modal").append('<div class="modal-dialog" style="width: 80%;  align-self:center; "><div class="modal-content" ><div class="modal-body"><table class="genral" style="width: 100%; height: 50%;"><div class="modal-header" style="margin-bottom: 20px;"><h4 class=" glyphicon glyphicon-cog "><span>'+list['alias']+' '+list['ip_address']+':'+port+'</span></h4></div><tbody><col style="width: 30%" /><col style="width: 30%" /><tr><td >Alias</td><td><input id="alias_input_setting" value= "'+list['alias']+'" type="text"  name=""></td><td>Status</td><td></td></tr><tr><td></td><td><span id="error_alias_input_setting"></span></td><td></td><td></td></tr><tr><td>Enable</td><td><input type="checkbox" class="form-control-default" name=""></td><td>High Priority Services</td><td>'+list['priority']+'</td></tr><tr><td >Broadcaste Type</td><td><select><option>Unicast</option><option>Multicast</option></select></td><td></td><td></td></tr><tr><td>Ip Address</td><td><input type="text" id="ipaddress_input_setting" value="'+list['ip_address']+'"  name=""></td><td>Port</td><td><input id="port_input_setting" type="text"  value="'+port+'"></td></tr><tr><td></td><td><span id="error_ipaddress_input_setting"></span></td><td></td><td><span id="error_port_input_setting"></span></td></tr><tr><td></td></tr></tbody></table></div><div class="modal-footer"><button class="btn btn-default" id="ge1_apply_setting" onclick = "updateChanneldata('+port+')" disabled="disabled">APPLY</button><button class="btn btn-default" data-dismiss="modal">Cancel</button></div></div></div>');
                $('#alias_input_setting, #ipaddress_input_setting, #port_input_setting').
                      keyup(function() { 
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
}*/
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
/*function delete_input(port)
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
}*/
/*function updateChanneldata(port)
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
          // $( "#content-areas" ).load(window.location.href + " #content-areas" );
          location.reload();
        }
        else
        {
          alert('Error while updating Ip input');
        }
      },
      type:'POST'
      });
    }
}*/   
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
function tables(output,qam_id)
{
    rmx_no=qam_id+1;
    $.ajax({
          url:'index.php?route=common/dashboard/GetTables&token=<?php echo $token;?>&output='+output+'&rmx_no='+rmx_no,
          error:function()
          {
            alert("Error");
          },
          success: function(data)
          {
            if(data == -1)
            {
            $("#Tables"+output+'_'+qam_id).empty();
              var html='<table class="genral" style="width:70%; height: 25%;">'
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
              html+='<td><input type="text" class="form-control-default" style="margin-top: 4px;" id="CAT_'+output+'_'+qam_id+'">&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="CAT_Download_'+output+'_'+qam_id+'" onClick="downloadTables(0,01,'+rmx_no+');" ></button></td>'
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
              html+='<tr><td><b>Template</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>TDT & TOT</b> </td><td><select>'
              html+='<option>Passthrough from input</option>'
              html+='<option>Disable</option>'
              html+='</select></td></tr>'
              html+='<tr><td><b>TDT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>TOT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>Input</b></td><td><select><option>None</option></select></td></tr>'
              html+='<tr><td><b>LTO</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>EIT</b></td><td><select><option>Disable</option></select></td></tr>'
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
              html+='<div align="right"><button type="button" class="btn btn-default" onclick="set_table_ver("NULL","NULL","NULL",'+output+','+rmx_no+','+qam_id+'); set_PsiSiINT('+output+','+rmx_no+','+qam_id+');updateGenratemode('+output+','+rmx_no+','+qam_id+');" id="save_table_'+output+'_'+qam_id+'" disabled="disabled">APPLY & SAVE</button>'
              html+='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>'
             $("#Tables"+output+'_'+qam_id).append(html);
            }
            else
            {
            var data = JSON.parse(data);
             $("#Tables"+output+'_'+qam_id).empty();
             var html='<table class="genral" style="width:70%; height: 25%;">'
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
              html+='<td><input type="text" class="form-control-default" style="margin-top: 4px;" id="CAT_'+output+'_'+qam_id+'">&nbsp;&nbsp;&nbsp;<button class="glyphicon glyphicon-download" id="CAT_Download_'+output+'_'+qam_id+'" onClick="downloadTables(0,01,'+rmx_no+');" ></button></td>'
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
              html+='<tr><td><b>Template</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>TDT & TOT</b> </td><td><select>'
              html+='<option>Passthrough from input</option>'
              html+='<option>Disable</option>'
              html+='</select></td></tr>'
              html+='<tr><td><b>TDT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>TOT</b></td><td></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>Input</b></td><td><select><option>None</option></select></td></tr>'
              html+='<tr><td><b>LTO</b></td><td><input type="text" class="form-control-default" style="margin-top: 4px;" name=""></td></tr>'
              html+='<tr><td><b>EIT</b></td><td><select><option>Disable</option></select></td></tr>'
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
              html+='<td></td></tr></table></div><br>'
              html+='<div align="right"><button type="button" class="btn btn-default" onclick="set_table_ver('+data['nit_ver']+','+data['pat_ver']+','+data['sdt_ver']+','+output+','+rmx_no+','+qam_id+'); set_PsiSiINT('+output+','+rmx_no+','+qam_id+');updateGenratemode('+output+','+rmx_no+','+qam_id+');" id="save_table_'+output+'_'+qam_id+'" disabled="disabled">APPLY & SAVE</button>'
              html+='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>'

              $("#Tables"+output+'_'+qam_id).append(html);
             
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
                    if(nit_ver>=0 && nit_ver<=15)
                       {
                        $("#error_nit_ver_"+output+'_'+qam_id).hide();
                        return true;
                       }
                    else
                       {
                        $("#error_nit_ver_"+output+'_'+qam_id).html("should be in between 0-15");
                        $("#error_nit_ver_"+output+'_'+qam_id).show();
                         return false;
                       }                   
                  }
                  function check_pat_ver(output,qam_id)
                  {
                    pat_ver=$("#pat_ver_"+output+'_'+qam_id).val();
                    if(pat_ver>=0 && pat_ver<=15)
                       {
                        $("#error_pat_ver_"+output+'_'+qam_id).hide();
                        return true;
                       }
                    else
                       {
                        $("#error_pat_ver_"+output+'_'+qam_id).html("should be in between 0-15");
                        $("#error_pat_ver_"+output+'_'+qam_id).show();
                         return false;
                       }                  
                  }
                  function check_sdt_ver(output,qam_id)
                  {
                    sdt_ver=$("#sdt_ver_"+output+'_'+qam_id).val();
                    if(sdt_ver>=0 && sdt_ver<=15)
                       {
                        $("#error_sdt_ver_"+output+'_'+qam_id).hide();
                        return true;
                       }
                    else
                       {
                        $("#error_sdt_ver_"+output+'_'+qam_id).html("should be in between 0-15");
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
  }
function check_PAT(output,qam_id)
{
    var text1=$("#PAT_"+output+'_'+qam_id).val().trim();
     if (text1=='') 
     {
        $("#error_PAT_"+output+'_'+qam_id).html("should not be empty");
        return false;
     }
     else if(text1 > 99 && text1<60000)
     {
      $("#error_PAT_"+output+'_'+qam_id).hide();
      return true;
     }
     else
     {
      $("#error_PAT_"+output+'_'+qam_id).html("should be in range 100 to 60000");
      $("#error_PAT_"+output+'_'+qam_id).show();
      return false;
     }
  }
function check_SDT(output,qam_id)
{
    var text1=$("#SDT_"+output+'_'+qam_id).val().trim();    
     if (text1=='') 
     {
        $("#error_SDT_"+output+'_'+qam_id).html("should not be empty");
        return false;
     }
     else if(text1 > 99 && text1<60000)
     {
      $("#error_SDT_"+output+'_'+qam_id).hide();
      return true;
     }
     else
     {
      $("#error_SDT_"+output+'_'+qam_id).html("should be in range 100 to 60000");
      $("#error_SDT_"+output+'_'+qam_id).show();
      return false;
     }
  }
function check_NIT(output,qam_id)
{
    var text1=$("#NIT_"+output+'_'+qam_id).val().trim();
     if (text1=='') 
     {
        $("#error_NIT_"+output+'_'+qam_id).html("should not be empty");
        return false;
     }
     else if(text1 > 99 && text1<60000)
     {
      $("#error_NIT_"+output+'_'+qam_id).hide();
      return true;
     }
     else
     {
      $("#error_NIT_"+output+'_'+qam_id).html("should be in range 100 to 60000");
      $("#error_NIT_"+output+'_'+qam_id).show();
      return false;
     }
  }
function set_PsiSiINT(output,rmx_no,qam_id)
{
Set_PAT = $("#PAT_"+output+'_'+qam_id).val();
Set_SDT = $("#SDT_"+output+'_'+qam_id).val();
Set_NIT = $("#NIT_"+output+'_'+qam_id).val();

var result = confirm("Want to update tables data?");
  if(result)
  {
    $.ajax({
      url:'index.php?route=common/dashboard/set_PSISiINT&token=<?php echo $token;?>&Set_PAT='+Set_PAT+'&Set_SDT='+Set_SDT+'&Set_NIT='+Set_NIT+'&output='+output+'&rmx_no='+rmx_no,
      error:function()
      {
        alert('Error while Changing Tables Insertion');
      },
      success:function(data)
      { 
        alert("You have succesfully changed Tables Insertion");
      },
      type: 'POST'
    });
  }
}
function updateGenratemode(output,rmx_no,qam_id)
{
var result = confirm("Want to update Generate Mode?");
 PAT_TEXT = $("#PAT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
 CAT_TEXT = $("#CAT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
 SDT_TEXT = $("#SDT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
 NIT_TEXT = $("#NIT_dropdown_"+output+'_'+qam_id).find('option:selected').text();
  if(result)
        {
          $.ajax({
              url: 'index.php?route=common/dashboard/generate_mode&token=<?php echo $token; ?>&PAT_TEXT=' + PAT_TEXT+'&CAT_TEXT='+CAT_TEXT+'&SDT_TEXT='+SDT_TEXT+'&NIT_TEXT='+NIT_TEXT+'&output='+output+'&rmx_no='+rmx_no,
              error:function()
              {
                alert("Error while Changing Generate Mode");
              },
              success: function(data) 
              {
                alert("You have succesfully Changed Generate Mode");
              },
              type: 'POST'
              });
        }
}
function set_table_ver(nit_ver,pat_ver,sdt_ver,output,rmx_no,qam_id)
{ 
   changed_nit_ver=$("#nit_ver_"+output+'_'+qam_id).val();
   changed_pat_ver=$("#pat_ver_"+output+'_'+qam_id).val();
   changed_sdt_ver=$("#sdt_ver_"+output+'_'+qam_id).val();
   var nit_isenable=0;
   var pat_isenable=0;
   var sdt_isenable=0;
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
function add_NewInput()
{
  $("#New_Input").append('<div style="border: 1px solid Gainsboro; margin-bottom:10px; min-height:70px;"><table class="genral" style="width:70%;margin-top:10px;"><tr><td>Service timeout:</span></td><td><select class="form-control-default"><option>Never</option><option>Costom Value</option></select></td><td><input type="text" class="form-control-default"></td><td><button type="submit" class="btn btn-default">CLEAR VISITED SIDS</button></td><td><span class="glyphicon glyphicon-trash"></span></td></tr></table></div>');
}
function add_NewInput_PID()
{
    $("#New_Input_PID").append('<table class="genral" style="width:100%;margin-top:10px;"><colgroup><col style="width:20%"/><col style="width:20%"/><col style="width:20%"/><col style="width:20%"/><col style="width:10%"/></colgroup><tr><th>Input</th><th>Input PID</th><th>Manual PID</th><th>Output PID</th></tr><tr><td><input type="text" class="form-control-default"></td><td><input type="text" class="form-control-default"></td><td><input type="text" class="form-control-default"></td><td><input type="text" class="form-control-default"></td><td><span class="glyphicon glyphicon-trash"></span></td></tr></table>');
}
function get_TSDetails(output,frequency,qam_id)
{
  rmx_no=qam_id+1;
  channel_number=output+1;
  $.ajax({
    url:'index.php?route=common/dashboard/get_TSDetails&token=<?php echo $token;?>&output='+output+'&rmx_no='+rmx_no,
    error:function()
    {
      alert('Error while updating OUTPUT');
    },
    success:function(data)
    {
          switch(data)
          {
            case 1: alert("Error while getting TS details");
            break;
            case -1: alert("Error while getting Modulation");
            break;
            case -2:alert("Error while getting Gain");
            break;
            case -3:alert("Error while getting Symbol Rate");
            break;
            case -4:alert("Error while getting Bit Stream");
            break;
            case -5:alert("Error while getting NIT Mode");
            break;
            default:;
          }
          var data = JSON.parse(data);
          var nitMode=data['nitMode'];
          var symbolRate=data['FsymbolRate']/1000;
          symbolRate=symbolRate/1000; 
          symbolRate=symbolRate.toFixed(3);
            $("#General"+output+'_'+qam_id).empty();
            var html = '<table class="genral" style="width:100%; height: 45%;"><tbody><tr><td>Gain</td><td><select name="Gain" id="Gain_'+qam_id+'_'+output+'"><option value="255">1.99</option><option value="128">1.00</option><option value="64">0.50</option></select></td><td>Roll Off</td><td><select id="Roll_Off_'+qam_id+'_'+output+'" name="Roll_Off"><option value="0">0.12</option><option value="1">0.18</option><option value="2">0.15</option><option value="3">0.13</option></select></td></tr><tr><td>Enable</td><td><input type="checkbox" class="form-control-default"  style="margin-top: 4px;" name=""></td><td>Symbol rate</td><td><input type="text" class="form-control-default" style="margin-top: 4px;" value='+symbolRate+' id="symbolRate_'+qam_id+'_'+output+'">MBD</td></tr><tr><td></td><td></td><td></td><td><span id="error_symbolRate_'+qam_id+'_'+output+'" style="color:red;"></span></td></tr><tr><td>Transport stream ID</td><td><input id="TSID_'+qam_id+'_'+output+'" type="text" class="form-control-default" style="margin-top: 4px;" value='+data['uTS_Id']+'></td><td>Bit Stream </td><td><b>'+data['bitStream']+'</b></td></tr><tr><td></td><td><span id="error_TSID_'+qam_id+'_'+output+'" style="color:red;"></span></td><td></td><td></td></tr><tr><td>Network ID</td><td> '+data['uNet_Id']+'</td><td>Original network ID </td><td><input id="org_net_ID_'+qam_id+'_'+output+'" type="text" class="form-control-default" style="margin-top: 4px;" value='+data['uOrigNet_Id']+'></td></tr><tr><td></td><td></td><td></td><td><span id="error_org_net_ID_'+qam_id+'_'+output+'" style="color:red;"></span></td></tr><tr><td>Frequency</td><td>'+frequency+'<b>MHz</b></td><td>Output Spectrum</td><td><select style="margin-top: 4px;" name="invert_IQ" id="Invert_IQ_'+qam_id+'_'+output+'"><option value="0">Normal</option><option value="1">Inverted</option></select></td></tr><tr class="blank_row"></tr><tr><td>NIT Mode</td><td><select id="nitMode_'+qam_id+'_'+output+'" name="modes"><option value="0">Passthrough</option><option value="1">Channel Naming</option><option value="2">Host Provided</option><option value="3">No NIT</option>'
             /* for(var i=0;i< data.modes.length;i++){
                if(data.modes[i].id == data.nit_selected_id){
                html +='<option name='+data.modes[i].mode+' value='+data.modes[i].id+' selected="selected">'+data.modes[i].mode+'</option>';
              }else{
                html +='<option name='+data.modes[i].mode+' value='+data.modes[i].id+'>'+data.modes[i].mode+'</option>';
              }
            }*/
            html +='</select></td><td>Modulation:</td><td><select name="Modulation" id="quad_modulation_'+qam_id+'_'+output+'"><option value="0">16-QAM</option><option value="1">32-QAM</option><option value="2">64-QAM</option><option value="3">128-QAM</option><option value="4" >256-QAM</option></select></td></tr><tr class="blank_row"></tr></tbody></table>'
         
         if(data['IpOutputChannel'].length==0)
         {
           html+='<div class="blank_row"></div><div align="left">IP streaming<input id="streaming_cheackbox'+qam_id+''+channel_number+'" type="checkbox" class="accordion"  data-toggle="collapse" data-target="#IP_streaming'+qam_id+''+channel_number+'"/></div><div class="blank_row"></div><div class="collapse out" id="IP_streaming'+qam_id+''+channel_number+'"><table class="genral" style="width:80%;"><colgroup><col style="width: 15%"/><col style="width: 15%"/><col style="width: 5%"/><col style="width: 10%"/><col style="width: 10%"/></colgroup>'
              
                html+='<tr class="blank_row"></tr><tr class="" id=""><td><span>IP</span><input id="ipAddress_streaming'+rmx_no+channel_number+'" type="text" class="ip" style="margin-left:2%" ></td><td><span>PORT</span><input id="ip_port'+rmx_no+channel_number+'" type="text" class="port"  style="margin-left:2%;" ></td>'

               html+='<td><button type="button" class="add_ip" onClick="addIP('+qam_id+','+channel_number+');" id="addIP'+qam_id+'_'+channel_number+'">Add</button></td></tr>'
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
                html+='<div class="blank_row"></div><div align="left">IP streaming<input id="streaming_cheackbox'+qam_id+''+channel_number+'" type="checkbox" class="accordion"  data-toggle="collapse" data-target="#IP_streaming'+qam_id+''+channel_number+'"/></div><div class="blank_row"></div><div class="collapse in" id="IP_streaming'+qam_id+''+channel_number+'"><table class="genral" style="width:80%;"><colgroup><col style="width: 15%"/><col style="width: 15%"/><col style="width: 5%"/><col style="width: 10%"/><col style="width: 10%"/></colgroup>'

               html+='<tr class="blank_row"></tr><tr class="IP_row" id="IP_row'+rmx_no+'_'+ip_with_unders+'_'+channel_number+'"><td><span>IP</span><input id="ipAddress_streaming'+rmx_no+'_'+ip_with_unders+'_'+channel_number+'" type="text" class="ip" value='+ip+' style="margin-left:2%" ></td><td><span>PORT</span><input id="ip_port'+rmx_no+''+port+''+channel_number+'" type="text" class="port"  style="margin-left:2%;" value='+port+' ></td>'


               html+='<td><button type="button" class="" onClick="deleteIP('+channel_number+','+rmx_no+','+port+','+ip+')">Delete</button></td><td><button type="button" id="ip_save'+rmx_no+'~'+channel_number+'~'+port+'~'+ip+'" onclick="updateipStream('+rmx_no+','+port+','+channel_no+','+id+','+ip+');">Update</button></td></tr></table></div>' 
         }
          nitMode = "'"+nitMode+"'";
            html+='<div align="right"><button type="button" class="btn btn-default" onclick="set_TS_ID('+data['uNet_Id']+','+output+','+data['uTS_Id']+','+data['uOrigNet_Id']+','+rmx_no+','+qam_id+');nit_Mode('+output+','+rmx_no+','+qam_id+','+nitMode+');changeModulation('+qam_id+','+output+','+data['Qam_no']+');setSymbolRate('+rmx_no+','+output+','+data['FsymbolRate']+','+data['Rolloff']+');confGain('+rmx_no+','+output+','+data['Gain']+','+data['invert_IQ']+')" disabled="disabled"  id="genral_save_'+qam_id+'_'+output+'">APPLY & SAVE</button><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>'

            $("#General"+output+'_'+qam_id).append(html);

            $('select[name="Modulation"] option[value='+data['Qam_no']+']').attr('selected','selected');
            $('select[name="invert_IQ"] option[value='+data['invert_IQ']+']').attr('selected','selected');
            $('select[name="modes"] option[value='+data['nitCode']+']').attr('selected','selected');
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
                $("#org_net_ID_"+qam_id+"_"+output).keyup(function() {
                    var empty = false;
                    $("#org_net_ID_"+qam_id+"_"+output).each(function() 
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
 
                       if(check_originalID(qam_id,output) )
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
                $("#streaming_cheackbox"+qam_id+channel_number).attr('checked','checked');
                $("#IP_streaming"+qam_id+channel_number).removeClass("collapse out");
              }
           
    },
    type: 'POST'
  });
}
function check_TSID(qam_id,output)
{
   var text1=$("#TSID_"+qam_id+"_"+output).val().trim();
     if (text1=='') {
        $("#error_TSID_"+qam_id+"_"+output).html("TS ID should not be empty");
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
function check_originalID (qam_id,output)
 {
   var text1=$("#org_net_ID_"+qam_id+"_"+output).val().trim();
     if (text1=='') {
        $("#error_org_net_ID_"+qam_id+"_"+output).html("Original Network Id should not be empty");
      $("#error_org_net_ID_"+qam_id+"_"+output).show();
      return false;
     }
    else if (text1>0 && text1<65536 ) {
            $("#error_org_net_ID_"+qam_id+"_"+output).hide();
      return true;
    }
    else
    {
      $("#error_org_net_ID_"+qam_id+"_"+output).html("Invalid Original Network Id Number(>0 and <65536)");
      $("#error_org_net_ID_"+qam_id+"_"+output).show();
      return false;
    }
}
function check_IPout(rmx_no,channel_number)
{
var qam_id=rmx_no-1;
var ippattern=new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);
var ip=$("#ipAddress_streaming"+rmx_no+channel_number).val();
     if (ip=='') {
        $("#ip_error"+qam_id+"_"+channel_number).html("IP should not be empty");
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
      $("#port_error"+qam_id+"_"+channel_number).html("Port Number should not be empty");
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
function set_TS_ID(Set_NetworkID,output,TS_ID,org_ID,rmx_no,qam_id)
{
 Set_TSID = $("#TSID_"+qam_id+"_"+output).val();
 Set_orgID = $("#org_net_ID_"+qam_id+"_"+output).val();
  if((TS_ID!=Set_TSID) ||(org_ID!=Set_orgID))
 {
  $.ajax({
    url:'index.php?route=common/dashboard/set_TS_ID&token=<?php echo $token;?>&Set_TSID='+Set_TSID+'&Set_orgID='+Set_orgID+'&Set_NetworkID='+Set_NetworkID+'&output='+output+'&rmx_no='+rmx_no,
    error:function()
    {
      alert('Error while setting TSID');
    },
    success:function(data)
    {
      if(data==1)
      {
        alert("You have succesfully updated TS ID");
        $('#genral_save').attr('disabled', 'disabled');
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
          alert("Error");
        },
        success: function(data)
        {
          if(data==0)
          {
           alert('Modulation Changed Succesfully ');      
          }
          else
          {
            alert("error while Changing Modulation");
          }
        },
        type:'POST'
      });
   }
}
function nit_Mode(output,rmx_no,qam_id,nitMode)
{
  var nit_mode = $("#nitMode_"+qam_id+"_"+output).val();
  var nit_text=$("#nitMode_"+qam_id+"_"+output).find('option:selected').text();
 
  if(nit_text!=nitMode)
  {
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
          }
           else
          {
            alert('Error while Updating Mode');
          }
        },
        type: 'POST'
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
          alert('Error');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Symbol Rate Changed successfully'); 
            }
             else
            {
              alert('Error while Changing Symbol Rate');
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
          alert('Error');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Gain Changed successfully'); 
            }
             else
            {
              alert('Error while Changing Gain');
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
          type:'POST'
        });
   } 
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
    html+='<td><input type="checkbox" id="EnableEMM'+output+'_'+qam_id+'_<?php echo $emmg_value['channel_id'];?>" onChange="enableEMM('+output+','+qam_id+',<?php echo $emmg_value['channel_id'];?>)"></td>'
   html+='</tr>'
  <?php } ?>
  html+='</tbody></table><br>'
  html+='<div align="right"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>'
 $("#EMM"+output+'_'+qam_id).append(html);

 <?php foreach($enableEMM_data as $enableData ){ ?>

  var enable='<?php echo $enableData['enable'] ?>';
  var channel_id='<?php echo $enableData['channel_id'] ?>';
 
   if(enable == 1)
   {
      $("#EnableEMM"+output+"_"+qam_id+"_"+channel_id).attr('checked','checked');
   }

  <?php } ?>


}
function enableEMM(output,qam_id,channel_id)
{

 if($("#EnableEMM"+output+"_"+qam_id+"_"+channel_id).prop('checked') == true)
 {
  var EnableEMM=1;
 }
 else
 {
  var EnableEMM=0;
 }

   var result = confirm("Want to Enable EMM ?");
       if(result)
       {
       $.ajax({
          url: 'index.php?route=common/dashboard/enableEMM&token=<?php echo $token; ?>&output='+output+'&qam_id='+qam_id+'&EnableEMM='+EnableEMM+'&channel_id='+channel_id,
          error: function() 
          {
          alert('Error while Enable EMM');
          },
          success: function(data) 
          {

            if(data == 0)
            {
             alert('EMM Enabled'); 
             // location.reload();
            }
           
            else
            {
              alert('Opss,sry cant Enable!');
            }
          },
          type: 'POST'
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
function getBaseFreq(qam_id,no_of_output)
{
   rmx_no=qam_id+1;
      $.ajax({
          url: 'index.php?route=common/dashboard/getBaseFreq&token=<?php echo $token; ?>&rmx_no='+rmx_no,
          error:function()
          {
            alert("invalid data");
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
                 var html='<div class="modal-dialog" role="document" style="width: 80%; align-self: center;" ><div class="modal-content"><div class="modal-body"><table class="genral" style="width:100%; height: 25%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " style="margin-left: 0px">2:quad QAM</h3></td></tr><tr><td>Hw Major version:</td><?php if($maj_ver){?><td><b><?php echo $maj_ver;?></b></td><?php } ?><?php if(!$maj_ver){?><td><b>NA</b></td><?php } ?><td>Base frequency:</td><td><input type="text" class="form-control-default" id="Base_Frequency'+qam_id+'" style="margin-top: 4px;" name="" value='+data['center_frequency']+'>MHz</td></tr><tr><td></td><td></td><td></td><td id="error_baseFreq'+qam_id+'" style="color:red"></td></tr><tr><td>Hw minimum version:</td><?php if($min_ver){?><td><b><?php echo $min_ver; ?></b></td><?php } ?><?php if(!$min_ver){?><td><b>NA</b></td><?php } ?><td>Channel bandwidth:</td><td>8Mhz</td></tr><tr><td>Standard:</td><td><select id="quad_Standard"><option>DVB-CSA/TS</option></select></td><td>Default symbol rate: </td><td><input type="text" class="form-control-default" id="Default_symbol_rate" style="margin-top: 4px;" name="" value="6.875">MBd</td></tr><tr><td>Payload RX bitrate:</td><td></td><td>Payload TX bitrate:</td></tr></tbody></table></div><div class="modal-footer"><button type="button" class="btn btn-default" id="QUAD_QAM'+qam_id+'" onClick="addBaseFreq(Base_Frequency'+qam_id+','+qam_id+',<?php echo $no_of_output;?>,'+data['center_frequency']+'); " disabled="disabled" >SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel </button></div></div></div>'
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
          alert('Error while updating Stream');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Stream Updated'); 
             location.reload();
            } 
            else if(data== 1)
            {
              alert('Sorry! not able to update in database');
            }  
            else{
              alert('Sorry! not able to update in database');
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
          alert('Error while Deleting');
          },
          success: function(data) 
          {
            if(data == 0)
            {
             alert('Stream Deleted'); 
             delIp.remove();
             $("#streaming_cheackbox"+qam_id+channel_number).removeAttr('checked');
        
            }
            else if(data == -1)
            {
              alert('Opss,sry cant delete from server !');
            }
            else
            {
              alert('Opss,sry cant delete from database!');
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
            alert('Error while Adding');
            },
            success: function(data) 
            {
              if(data == 0)
              {
               alert('Stream Added'); 
              }
               else if(data==1)
              {
                alert('Opss,sry cant Add to database!');
              }
              else
              {
                alert("Opss,sry cant Add to server!")
              }
            },
            type: 'POST'
            });
    }
 
  
}
else
     {
      alert("Please Fill The Required Fields !")
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
        $("#error_baseFreq"+Qam_ID).html("Base frequency should be even number");
        $("#error_baseFreq"+Qam_ID).show();
       }
       else if(basefrequency.trim() == 0)
       {
          $("#error_baseFreq"+Qam_ID).html("Base frequency should not be 0");
          $("#error_baseFreq"+Qam_ID).show();
          
       }
       else if(basefrequency<50 || basefrequency >872)
       {
        $("#error_baseFreq"+Qam_ID).html("Base frequency should be in the range of 50 and 872");
        $("#error_baseFreq"+Qam_ID).show();
       }
       else
        {
          $("#error_baseFreq"+Qam_ID).hide();
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
                           window.location.reload();
                        }
                        else
                        {
                          alert("Error While Changing Base Frequency");
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
document.addEventListener('drop',function(e)
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
      	addToQam(prog_list,target);
},false);
function addToQam(prog_list,target_id)
{
  var target_id = target_id.split('_');
  var channel_details,channelnumber=[],re_value,output_channelname=[],input;
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
        alert('Error while adding channel');
      },
      success: function(data) 
      {
          var duplicate_msg="";
          var is_duplicate=0; 
          var added_channels="";
          console.log(data);
        switch(data['error']){
          case 1:
            for(var i = 0;i<channelnumber.length;i++)
            {
              if(data['status_array'][i]==0){
                minus_one=-1;
                zero=0;
                RMX_NUM=parseInt(qam_id)+1;
                var html = '<table  class="panel1" id="output'+channelnumber[i]+'_'+freq_id+'_'+qam_id+'">'
                html = html +'<colgroup>'
                html = html +'<col style="width: 7%"  />'
                html = html +'<col style="width: 15%" />'
                html = html +'<col style="width: 62%" />'
                html = html +'<col style="width: 7%" />'
                html = html +'</colgroup>'
                html = html +'<tr>'
                html = html +'<td></td>'
                html = html +'<td><span> <font size="2">'+channelnumber[i]+'</font> </span></td>'
                html = html +'<td><span> <font size="2">'+output_channelname[i]+'</font> </span></td>'
                html = html +'<td><span onclick="outputChinfo('+"'"+output_channelname[i]+"'"+','+"'"+channelnumber[i]+"'"+','+"'"+input+"'"+','+"'"+RMX_NUM+"'"+','+"'"+freq_id+"'"+','+"'"+qam_id+"'"+','+"'"+ (minus_one) +"'"+','+"'"+ (-1) +"'"+','+"'"+0+"'"+','+"'"+ (-1) +"'"+','+"'"+0+"'"+');"  class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#output_chModal_'+channelnumber[i]+''+freq_id+''+RMX_NUM+'"></span> </td>'
                html = html +'<td><span onclick="myfunction('+"'"+channelnumber[i]+"'"+','+"'"+freq_id+"'"+','+"'"+input+"'"+','+"'"+RMX_NUM+"'"+');" class="glyphicon glyphicon-trash"></span> </td>'
                html = html +'</tr>'
                html = html +'</table>'
                $("#channel11"+freq_id+"_"+qam_id).append(html);
                added_channels=added_channels+","+channelnumber[i];
                //serviceoutput
                var html1='<table class="panel1" id="outch_'+channelnumber[i]+'_'+freq_id+'_'+qam_id+'"><col style="width:22%" /> <col style="width:30%" /><col style="width:30%" /><tr>'
                    html1+='<td><span class="ch-number">'+channelnumber[i]+'</span></td>'
                    html1+='<td style="text-overflow:ellipsis; overflow:hidden;">'+output_channelname[i]+'</span></td>'
                    html1+='<td></td></tr></table> '
                $("#inputchannels").append(html1);
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
                 $("table.panel1 tr:even").css("background-color","#E0FFFF").hover(function(){
                  $(this).css('background-color','lightblue');
                },function(){
                        $(this).css('background-color','#E0FFFF');     
                  });

                $("table.panel1 tr:even").css("background-color","#E0FFFF").click(function(){
                  $(this).css('background-color','orange');
                });   
              }else{
                is_duplicate = 1;
                duplicate_msg=duplicate_msg+output_channelname[i]+',';
              }
            }
            if(is_duplicate)
              alert("Warning:Duplicate channels ["+duplicate_msg+"]!");
            alert("Channel's ["+added_channels+"] activated successfully!"); 
            break;
          case -1:
            alert("Please drop channel to valid RMX no!");
            break;
          case 2:
            alert("Channel already exist!");
            break;
          case 0:
            alert("Error!");
            break;
          default:alert("Invalid response!");
        }
       }, 
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
function getClockData()
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
    getClockData();
    setInterval(getClockData,1000);
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

function input_status_INPUT(b)
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
function input_status_OUTPUT(a)
{
    <?php foreach($QamFreq_detail as $QamFreq_value ){ ?>
      $('#freq_out_<?php echo $QamFreq_value['freq_ID'].'_'.$QamFreq_value['qam_id']?>').removeClass("hover2");   
      $('#channel11<?php echo $QamFreq_value['freq_ID'].'_'.$QamFreq_value['qam_id']?>').find('table').each(function() {
          var channel_id=($(this).attr('id')).substr(6);
                if(a == channel_id)
                {
                  if($('#qam_name<?php echo $QamFreq_value['qam_id'];?>').attr('aria-expanded')!="true"){
                    $('#qam_name<?php echo $QamFreq_value['qam_id'];?>').click();
                  }
                  if($('#channel11<?php echo $QamFreq_value['freq_ID'].'_'.$QamFreq_value['qam_id']?>').attr('aria-expanded')!="true"){
                    $('#freq_out_<?php echo $QamFreq_value['freq_ID'].'_'.$QamFreq_value['qam_id']?>').click();
                  }
                  $('#freq_out_<?php echo $QamFreq_value['freq_ID'].'_'.$QamFreq_value['qam_id']?>').addClass("hover2"); 
                } 
        }); 
    <?php } ?>
}

$('#Output_div').ready(function(){
var no_of_output= <?php echo $no_of_output;?>;

 for(var i=0;i<6;i++)
 {
  var Qam_ID=i;
  var rmx_no=Qam_ID+1;
  $.ajax({
          url: 'index.php?route=common/dashboard/getBaseFreq&token=<?php echo $token; ?>&rmx_no='+rmx_no,
          async:false,
          error:function()
          {
            alert("invalid data");
          },
          success: function(data)
          {
           var data = JSON.parse(data);
           var basefrequency=data['center_frequency'];
           $.ajax({
           url:'index.php?route=common/dashboard/getFrequencies&token=<?php echo $token; ?>&no_of_output='+no_of_output+'&basefrequency='+basefrequency+'&Qam_ID='+Qam_ID,
              error:function()
                {
                  alert("Error While Setting center frequency");
                },
                success: function(data) 
                {
                },
                type: 'POST'
            });
         }
       });
  }
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

function updatechannelstatus()
{
  $('#inputchannels table').each(function() {
    var table_channel = $(this);
    var channel_id = table_channel.attr('id');
    var channel_rmx_no_input = channel_id.split('_');
    var rmx_no = channel_rmx_no_input[2];
    var channel_no = channel_rmx_no_input[1];
    var input = channel_rmx_no_input[3];
    $.ajax({
          url: 'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&input_id='+input+'&rmx_no='+rmx_no+'&targetid=0',
          error:function()
          {
            alert("invalid channel");
          },
          success: function(data)
          {
            if(data!=1)
            {
              if(data== 0 )
              {
                 $("#image_active"+channel_no+rmx_no+input).attr('src','view/image/inactive1.jpeg');
              }
            }
          },
        });
    
  });
}

 function scrambling(channelnumber,targetid,rmx_no,input)
 {
  alert("Functionality not implemented")
   // var scramble= 0;
   // var includeFlag=0;
   // var keyids=0;
   // var parity=0;
   // if($("#scramble"+channelnumber+targetid+rmx_no).prop('checked') == true)
   // {
   // 	var scramble= 1;
   // 	var includeFlag=1;
   // }
   // $.ajax({
   //        url:'index.php?route=common/dashboard/scrambleService&token=<?php echo $token; ?>&programNumbers='+channelnumber+'&output='+targetid+'&rmx_no='+rmx_no+'&scramble='+scramble+'&input='+input+'&includeFlag='+includeFlag+'&keyids='+keyids+'&parity='+parity,
   //        error:function()
   //        {
   //          alert("Error");
   //        },
   //        success:function(data)
   //        {
   //            if(data== 0 )
   //            {
   //             alert("success");  
   //            }
   //            else
   //            {
   //            	alert("opsssss,errorCode"+data);
   //            }
            
   //        },
   //      });
 }
                                                                                                                                                                                                                                                                                                                                                                            
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
  myVar= setInterval("Reload()",100000);
 }
 $(document).ready(function(){
  myVar=setInterval("Reload()",100000);
 });
// Automatic Refresh

</script>
<?php?>
