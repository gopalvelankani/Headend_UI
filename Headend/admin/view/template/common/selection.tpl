<?php echo $header; ?>
<script type="text/javascript">
    $(document).ready(function(){
    $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
        localStorage.setItem('activeTab', $(e.target).attr('href'));
    });
    var activeTab = localStorage.getItem('activeTab');
   
    if(activeTab){
        $('#myTab a[href="' + activeTab + '"]').tab('show');
    }
});
</script>

    <div class="container" style="width: 90%; margin-top: 3%">
    
      <ul class="nav nav-tabs" id="myTab">
        <li class="active" id="ETHERNET1"><a data-toggle="tab" href="#section1" >Mux-1</a></li>
        <li id="ETHERNET2"><a data-toggle="tab" href="#section2" >Mux-2</a></li>
        <li id="ETHERNET3"><a data-toggle="tab" href="#section3" >Mux-3</a></li>
        <span id="message" style="margin-left: 20%;"></span>
      </ul>
      <div class="tab-content">
        <div id="section1" class="tab-pane fade in active">
          <h3>MXL-1</h3>
       <select id="tuner1" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER" > 
       <option value="-1">Select Input</option>
       <option value="0" channel="1" >IP MPTS</option>
       <option value="2" channel="1" >IP SPTS</option>
       <option value="1" data-id="1" class="updateModel">RF</option>
       </select>
       <select id="tuner2" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">Select Input</option> 
       <option value="0" channel="2">IP MPTS</option>
       <option value="1" data-id="2" class="updateModel">RF</option>
       </select>
       <select id="tuner3" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">Select Input</option> 
       <option value="0" channel="3">IP MPTS</option>
       <option value="1" data-id="3" class="updateModel">RF</option>
       </select>
       <select id="tuner4" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">Select Input</option> 
       <option value="0" channel="4">IP MPTS</option>
       <option value="1" data-id="4" class="updateModel">RF</option>
       </select>
       <select id="tuner5" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">Select Input</option> 
       <option value="0" channel="5">IP MPTS</option>
       <option value="1" data-id="5" class="updateModel">RF</option>
       </select>
       <select id="tuner6" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">Select Input</option> 
       <option value="0" channel="6">IP MPTS</option>
       <option value="1" data-id="6" class="updateModel">RF</option>
       </select>
       <select id="tuner7" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">Select Input</option> 
       <option value="0" channel="7">IP MPTS</option>
       <option value="1" data-id="7" class="updateModel">RF</option>
       </select>
       <select id="tuner8" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">Select Input</option> 
       <option value="0" channel="8">IP MPTS</option>
       <option value="1" data-id="8" class="updateModel">RF</option>
       </select>

          <h3>MXL-2</h3>
          <select id="tuner9" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
           <option value="-1">Select Input</option>
           <option value="0" channel="9">IP MPTS</option>
           <option value="1" data-id="9" class="updateModel">RF</option>
           </select>
           <select id="tuner10" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="10">IP MPTS</option>
           <option value="1" data-id="10" class="updateModel">RF</option>
           </select>
           <select id="tuner11" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="11">IP MPTS</option>
           <option value="1" data-id="11" class="updateModel">RF</option>
           </select>
           <select id="tuner12" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="12">IP MPTS</option>
           <option value="1" data-id="12" class="updateModel">RF</option>
           </select>
           <select id="tuner13" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="13">IP MPTS</option>
           <option value="1" data-id="13" class="updateModel">RF</option>
           </select>
           <select id="tuner14" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="14">IP MPTS</option>
           <option value="1" data-id="14" class="updateModel">RF</option>
           </select>
           <select id="tuner15" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="15">IP MPTS</option>
           <option value="1" data-id="15" class="updateModel">RF</option>
           </select>
           <select id="tuner16" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="16">IP MPTS</option>
           <option value="1" data-id="16" class="updateModel">RF</option>
           </select>

        </div>
        <div id="section2" class="tab-pane fade">
          <h3>MXL-3</h3>

            <select id="tuner17" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
             <option value="-1">Select Input</option>
             <option value="0" channel="17">IP MPTS</option>
              <option value="2" channel="2" >IP SPTS</option>
             <option value="1" data-id="17" class="updateModel">RF</option>
             </select>
             <select id="tuner18" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">Select Input</option> 
             <option value="0" channel="18">IP MPTS</option>
             <option value="1" data-id="18" class="updateModel">RF</option>
             </select>
             <select id="tuner19" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">Select Input</option> 
             <option value="0" channel="19">IP MPTS</option>
             <option value="1" data-id="19" class="updateModel">RF</option>
             </select>
             <select id="tuner20" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">Select Input</option>
             <option value="0" channel="20">IP MPTS</option>
             <option value="1" data-id="20" class="updateModel">RF</option>
             </select>
             <select id="tuner21" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">Select Input</option> 
             <option value="0" channel="21">IP MPTS</option>
             <option value="1" data-id="21" class="updateModel">RF</option>
             </select>
             <select id="tuner22" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">Select Input</option> 
             <option value="0" channel="22">IP MPTS</option>
             <option value="1" data-id="22" class="updateModel">RF</option>
             </select>
             <select id="tuner23" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">Select Input</option> 
             <option value="0" channel="23">IP MPTS</option>
             <option value="1" data-id="23" class="updateModel">RF</option>
             </select>
             <select id="tuner24" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">Select Input</option> 
             <option value="0" channel="24">IP MPTS</option>
             <option value="1" data-id="24" class="updateModel">RF</option>
             </select>

          <h3>MXL-4</h3>
         <select id="tuner25" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
           <option value="-1">Select Input</option>
           <option value="0" channel="25">IP MPTS</option>
           <option value="1" data-id="25" class="updateModel">RF</option>
           </select>
           <select id="tuner26" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="26">IP MPTS</option>
           <option value="1" data-id="26" class="updateModel">RF</option>
           </select>
           <select id="tuner27" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="27">IP MPTS</option>
           <option value="1" data-id="27" class="updateModel">RF</option>
           </select>
           <select id="tuner28" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option>
           <option value="0" channel="28">IP MPTS</option>
           <option value="1" data-id="28" class="updateModel">RF</option>
           </select>
           <select id="tuner29" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="29">IP MPTS</option>
           <option value="1" data-id="29" class="updateModel">RF</option>
           </select>
           <select id="tuner30" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="30">IP MPTS</option>
           <option value="1" data-id="30" class="updateModel">RF</option>
           </select>
           <select id="tuner31" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="31">IP MPTS</option>
           <option value="1" data-id="31" class="updateModel">RF</option>
           </select>
           <select id="tuner32" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">Select Input</option> 
           <option value="0" channel="32">IP MPTS</option>
           <option value="1" data-id="32" class="updateModel">RF</option>
           </select>
       

        </div>
        <div id="section3" class="tab-pane fade">
          <h3>MXL-5</h3>
              <select id="tuner33" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
               <option value="-1">Select Input</option>
               <option value="0" channel="33">IP MPTS</option>
                <option value="2" channel="3" >IP SPTS</option>
               <option value="1" data-id="33" class="updateModel">RF</option>
               </select>
               <select id="tuner34" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">Select Input</option> 
               <option value="0" channel=34>IP MPTS</option>
               <option value="1" data-id="34" class="updateModel">RF</option>
               </select>
               <select id="tuner35" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">Select Input</option> 
               <option value="0" channel="35">IP MPTS</option>
               <option value="1" data-id="35" class="updateModel">RF</option>
               </select>
               <select id="tuner36" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">Select Input</option>
               <option value="0" channel="36">IP MPTS</option>
               <option value="1" data-id="36" class="updateModel">RF</option>
               </select>
               <select id="tuner37" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">Select Input</option> 
               <option value="0" channel="37">IP MPTS</option>
               <option value="1" data-id="37" class="updateModel">RF</option>
               </select>
               <select id="tuner38" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">Select Input</option> 
               <option value="0" channel="38">IP MPTS</option>
               <option value="1" data-id="38" class="updateModel">RF</option>
               </select>
               <select id="tuner39" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">Select Input</option> 
               <option value="0" channel="39">IP MPTS</option>
               <option value="1" data-id="39" class="updateModel">RF</option>
               </select>
               <select id="tuner40" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">Select Input</option> 
               <option value="0" channel="40">IP MPTS</option>
               <option value="1" data-id="40" class="updateModel">RF</option>
               </select>
       

          <h3>MXL-6</h3>
                <select id="tuner41" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
                 <option value="-1">Select Input</option>
                 <option value="0" channel="41">IP MPTS</option>
                 <option value="1" data-id="41" class="updateModel">RF</option>
                 </select>
                 <select id="tuner42" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">Select Input</option> 
                 <option value="0" channel="42">IP MPTS</option>
                 <option value="1" data-id="42" class="updateModel">RF</option>
                 </select>
                 <select id="tuner43" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">Select Input</option> 
                 <option value="0" channel="43">IP MPTS</option>
                 <option value="1" data-id="43" class="updateModel">RF</option>
                 </select>
                 <select id="tuner44" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">Select Input</option>
                 <option value="0" channel="44">IP MPTS</option>
                 <option value="1" data-id="44" class="updateModel">RF</option>
                 </select>
                 <select id="tuner45" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">Select Input</option> 
                 <option value="0" channel="45">IP MPTS</option>
                 <option value="1" data-id="45" class="updateModel">RF</option>
                 </select>
                 <select id="tuner46" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">Select Input</option> 
                 <option value="0" channel="46">IP MPTS</option>
                 <option value="1" data-id="46" class="updateModel">RF</option>
                 </select>
                 <select id="tuner47" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">Select Input</option> 
                 <option value="0" channel="47">IP MPTS</option>
                 <option value="1" data-id="47" class="updateModel">RF</option>
                 </select>
                 <select id="tuner48" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">Select Input</option> 
                 <option value="0" channel="48">IP MPTS</option>
                 <option value="1" data-id="48" class="updateModel">RF</option>
                 </select>
            
    </div>
    <!-- CAS -->  
   
  <table class="collapse-panel"  data-toggle="collapse" data-target="#CAS" id="cas_pannel" style="background-color: Gainsboro;margin-top: 5%;width: 50%;">
          <colgroup>
            <col style="width: 5%"/>
            <col style="width: 15%"/>
            <col style="width: 30%"/>
            <col style="width: 20%"/> 
          </colgroup>
        <tr>
          <td></td>
          <td><span >CAS</span></td>
          <td></td>
          <td></td>   
        </tr>
 </table>  
 
<div class="collapse in" id="CAS" style="background-color: Gainsboro;width: 50%;">
               
            <table class="collapse-panel" data-toggle="collapse" data-target="#ECMG" >
              <colgroup>
                <col style="width: 6%"/>
                <col style="width: 15%"/>
                <col style="width: 30%"/>
                <col style="width: 20%"/> 
              </colgroup>
            <tr>
              <td></td>
              <td><span >ECMG</span></td>
              <td></td>
              <td><span id="ECMG_add" onclick="newECMG();" class="glyphicon glyphicon-plus"  data-toggle="modal" data-target="#ECMGModal"></span></td> 
            </tr>
            </table>
            <div class="collapse in" id="ECMG" >
                 <?php foreach($ecmg_channel as $ecmg_value ){ ?>
            <table class="panel2" data-toggle="collapse" id="ECMG<?php echo $ecmg_value['ecmg_channel_id'];?>" data-target="#<?php echo $ecmg_value['ecmg_channel_id'];?>">
                <colgroup>
                  <col style="width: 4%;" />
                  <col style="width: 33%;" />
                  <col style="width: 5%;" />
                 <col style="width: 5%;" />
                  <col style="width: 5%;" />
               </colgroup>
               <tr>
                 <td></td>
                <td style="text-overflow:ellipsis; overflow:hidden;"><span><b><?php echo $ecmg_value['Alias'];?></b></td>
                  <td></td>
                  <td></td>
                  <td></td>
               </tr>
              </table> 
                 <?php } ?>
            </div>
          
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
             <td><span >EMMG</span></td>
             <td></td>
             <td><span id="emmg_plus" class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#EMMG_modal" onclick="EMMGModal()" ></span></td>
          </tr>
        </table>
        <div class="collapse in" id="EMMG" >
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
            <td style="text-overflow:ellipsis; overflow:hidden;"><span><b><?php echo $emmg_value['alias'];?></b></span></td>
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
    <!-- modal for ip mpts -->
     <div class="modal modal-wide fade" id="ipModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" >
        <div class="modal-content" style="width: 50%;margin-top:5%;margin-left:20%;">
          <div class="modal-header">
            <h5 class="modal-title" >IP MPTS</h5>
           
          </div>
           <div class="modal-body" >
           <input type="hidden" name="hiddenValueIP" id="hiddenValueIP" value="" />
            <div class="row">
              <div class="container col-xs-12">
                <table class="genral"  id="table" style="width: 100%">
                      <tr>
                      	<td><b>IP Address</b></td>
                      	<td><b>PORT</b></td>
                      	<td><b>TYPE</b></td>
                      </tr>
                      <tr class="blank_row"></tr>
                    <tr>
                      <td><input type="text" class="ip" name="stuff[]" value="" id="IP"></td>
                      <td><input type="text" class="port" name="stuff[]" value="" id="PORT"></td>
                    <td><select class="btn btn-secondary" name="Type" id="Type">
                                <option value="0">Unicast</option>
                                <option value="1" selected="selected">Multicast</option>        
                    </select></td>
                     
                    </tr>
                    <tr>
                    	<td id="error_ip" style="color: red"></td>
                    	<td id="error_port" style="color: red"></td>
                    	<td></td>
                    </tr>
                  </table>
                
             
               
              </div>
             
            </div>
           </div>
            <div class="modal-footer">
            <span id="error_ipModal" style="color: red"></span>
            <input type="button" class="btn btn-secondary" id="add_ip" value="Add IP" onclick="addIPInput()" data-dismiss="modal"></input>
            <button type="button" class="btn btn-secondary" onclick="deleteIPIN()" data-dismiss="modal">Delete IP</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="previousStage()">Cancel</button>
           

          </div>
        </div>
      </div>
    </div>

    <!-- modal for ip mpts -->
     <!-- modal for ip spts -->
     <div class="modal modal-wide fade" id="SPTSipModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
      
    </div>

    <!-- modal for ip spts -->
    <div class="modal modal-wide fade" id="tunerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 50%;margin-left: 25%;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="loginModalTitle" ></h5>
            
          </div>
          <div class="modal-body" >
            <form id="loginForm" method="post" class="form-horizontal">
             <input type="hidden" name="hiddenValue" id="hiddenValue" value="" />
             <div class="row">

                  <div class="col-xs-6 col-sm-3">
                    
                     <div class="pad">FREQUENCY</div>
                    <br>
                     <div class="pad">RATE</div>
                    <br>
                    <div class="pad">STANDARD</div>
                    <br>
                    <div class="pad">Polarization</div>
                    <br>
                    <div class="pad">LO Frequency</div>
                    <br>
                    <!-- <div class="pad">Voltage</div> -->
                    

                  </div>
                  <div class="col-xs-6 col-sm-3">
                    
                   
                       <div><input type="text"  name="frequency" id="frequency"></div>
                       <div id="frequency_error" style="color: red"></div>
                       
                    <br>
                    
                   <div><input type="text"  name="rate" id="rate"></div>
                    
                    <br>

                    <div><select id="standerd" name="standerd">
                  
                      <option value="1">DVB-S</option>
                      <option value="2">DVB-S2</option>
                    </select></div>
                    
                    <br>

                
                      <div><select id="Polarization" name="Polarization">
                      <option value="0">V</option>
                      <option value="1">H</option>
                     
                    </select></div>
                    <br>

                    
                    <div><input type="text"  name="LOFrequency" id="LOFrequency"></div>
                    
                    <br>
                      <!-- <div><select id="Voltage" name="Voltage">
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                    
                    </select></div> -->
                  </div>
                  <!-- <div class="col-xs-6 col-sm-3"> -->
                    
                   <!--  <div class="pad">FEC</div>
                    <br>
                    <div class="pad">ROLLOFF</div>
                    <br>            
                    <div class="pad">PILOTS</div>
                    <br>
                    <div class="pad">SPECTRUM INVERTED</div>
                    <br>
                    <div class="pad">MODULATION</div>
                    <br>
                  </div> -->
                  <!-- <div class="col-xs-6 col-sm-3"> -->
                    
                 <!--    <div><select id="fec" name="fec">
                      <option value="0">AUTO</option>
                      <option value="1">1/2</option>
                      <option value="2">3/5</option>
                      <option value="3">2/3</option>
                      <option value="4">3/4</option>
                      <option value="5">4/5</option>
                      <option value="6">5/6</option>
                      <option value="7">6/7</option>
                      <option value="8">7/8</option>
                      <option value="9">8/9</option>
                      <option value="10">9/10</option>
                    </select></div>

                    <br>
                    <div>
                    <select id="rolloff" name="rolloff">
                      <option value="0">AUTO</option>
                      <option value="1">0.20</option>
                      <option value="2">0.25</option>
                      <option value="3">0.35</option>                    
                    </select>
                    </div>
                    <br>
                    <div>
                    <select id="pilots" name="pilots_name">
                      <option value="0">OFF</option>
                      <option value="1">ON</option>
                      <option value="2">AUTO</option>           
                    </select>
                    </div> 
                    <br>
                    <div>
                    <select id="spectrumInverted" name="spectrumInverted">
                      <option value="0">AUTO</option>
                      <option value="1">INVERTED</option>
                      <option value="2">NORMAL</option>           
                    </select>
                    </div>
                    <br>
                    <div>
                     <select id="modulation" name="modulation">
                      <option value="0">AUTO</option>
                      <option value="1">QPSK</option>
                      <option value="2">8PSK</option>
                    </select>
                    </div>
                    <br>
                    <div>
                    </div>
                    <br> -->

                  <!-- </div> -->
            </div>
            </form>
          </div>
          <div class="modal-footer">
            <span id="error_RFDATA" style="color: red"></span>
            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="previousStage()">Cancel</button>
            <button type="button" class="btn btn-primary"  id="deleteTuner" data-dismiss="modal">Delete</button>
            <button type="button" class="btn btn-primary"  id="tuneButton" data-dismiss="modal">Set Tuner</button>

          </div>
          
        </div>
      </div>
    </div>


    <div id="loading-img"></div>
    <div class="overlay"></div>
    <script type="text/javascript">
    $('.ip').mask('0ZZ.0ZZ.0ZZ.0ZZ', { translation: { 'Z': { pattern: /[0-9]/, optional: true } } });
    function previousStage(){
       var check=$("#hiddenValue").val();
       if(check== 0)
       {
         var check=$("#hiddenValueIP").val();
       }
       
       switch(true){
                  case (check>=1 && check <=8):
                      mxl_id=1;
                      rmx_id=1;
                      break;
                  case (check>=9 && check <=16):
                      mxl_id=2;
                      rmx_id=2;
                      break;
                  case (check>=17 && check <=24):
                      mxl_id=3;
                      rmx_id=3;
                      break;
                  case (check>=25 && check <=32):
                      mxl_id=4;
                      rmx_id=4;
                      break;
                  case (check>=33 && check <=40):
                      mxl_id=5;
                      rmx_id=5;
                      break;
                  case (check>=41 && check <=48):
                      mxl_id=6;
                      rmx_id=6;
                      break;
              }
            
          var tuner_id = (check-1)%8;

        $.ajax({
              url:'index.php?route=common/dashboard/getTunerType&token=<?php echo $token; ?>&tuner_id='+tuner_id+'&mxl_id='+mxl_id,
              error:function()
              {
               var html='<b>Invalid Data</b>';
               $("#message").empty();
               $("#message").append(html).css("color","red").fadeIn('slow');
               $('#message').delay(1000).fadeOut('slow');
              },
              success:function(data)
              {
                 if(data)
                    data = data;
                  else
                    data = 0;
              /* $("#message").empty();
               $("#message").append(data).css("color","green").fadeIn('slow');
               $('#message').delay(1000).fadeOut('slow');*/
               $("#tuner"+check).find('option[value='+ data +']').prop('selected',true);
               // $("#tuner"+check).prop('selectedIndex', data);
               // $('select[name="TUNER"] option[value='+data+']').attr('selected','selected');
               // $("#tuner"+check).css("background-color",'#d9534f');  

              },
              type: 'POST'
    });
       
    }
    	function change()
			 {
			  value = $("#add_ip").val();
			  if(value == "Add IP") $("#add_ip").val("Update IP");
			  else  $("#add_ip").val("Add IP");

			 }
       function changeIPSPTS(channel_no,rmx_no)
       {
        value = $("#add_IPSPTS"+channel_no+rmx_no).val();
        if(value == "Add IP") $("#add_IPSPTS"+channel_no+rmx_no).val("Update IP");
        else  $("#add_IPSPTS"+channel_no+rmx_no).val("Add IP");

       }
    
    </script>
    <script type="text/javascript">
    var tuners = <?php echo json_encode($status); ?>;
    $(document).ready(function() {

        $('#loginForm').validate({
            rules: {
                frequency: {
                    minlength: 3,
                    maxlength: 15,
                    required: true
                },
                rate: {
                    minlength: 3,
                    maxlength: 15,
                    required: true
                }
            },
            highlight: function(element) {
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight: function(element) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorElement: 'span',
            errorClass: 'help-block',
            errorPlacement: function(error, element) {
                if (element.parent('.input-group').length) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });

        
    });
  
    var tuner_id="";

    $(document).on("click",'#GE1_plus',function (e){
      e.stopPropagation();
    });

    $(".modal-wide").on("show.bs.modal", function() {
      var height = $(window).height() - 200;
      $(this).find(".modal-body").css("max-height", height);
    });

    $(document).on("click", ".sendData", function () {
         var tunerId = $(this).data('id');
         $(".modal-body #tunerId").val( tunerId );
    });

    $(".mxl_drop_down").on("click",function(){
         var tuner_id = $('option:selected', this).attr('data-id');
         $(".modal-body #hiddenValue").val(tuner_id);
         $("#loginModalTitle").empty();  
          $("#loginModalTitle").append("Tuner Setting-"+tuner_id);
    });
    $(".mxl_drop_down").on("click",function(){
         var channel = $('option:selected', this).attr('channel');
         $(".modal-body #hiddenValueIP").val(channel);   
    });
$("#frequency").focusout(function()
{
  var frequency=$("#frequency").val();
   switch(true){
          case (frequency>=2500 && frequency <=2700):
              $("#LOFrequency").value(3.65);
              break;
          case (frequency>=3400 && frequency <=4200):
             $("#LOFrequency").value(5.15);
              break;
          case (frequency>=4500 && frequency <=4800):
              $("#LOFrequency").value(5.95);
              break;
          case (frequency>=10700 && frequency <=11700):
             $("#LOFrequency").value(9.75);
              break;
          case (frequency>=11800 && frequency <=12750):
              $("#LOFrequency").value(10.60);
              break;
          default :
              break;
              }
});
$("#tuneButton").click(function(){
   var check=$("#hiddenValue").val();
	        var mxl_id="";
	        var rmx_id="";
	        switch(true){
	                case (check>=1 && check <=8):
	                    mxl_id=1;
	                    rmx_id=1;
	                    break;
	                case (check>=9 && check <=16):
	                    mxl_id=2;
	                    rmx_id=2;
	                    break;
	                case (check>=17 && check <=24):
	                    mxl_id=3;
	                    rmx_id=3;
	                    break;
	                case (check>=25 && check <=32):
	                    mxl_id=4;
	                    rmx_id=4;
	                    break;
	                case (check>=33 && check <=40):
	                    mxl_id=5;
	                    rmx_id=5;
	                    break;
	                case (check>=41 && check <=48):
	                    mxl_id=6;
	                    rmx_id=6;
	                    break;
	            }
	            
	    	  var demodId = (check-1)%8;
		      var lnbId = (demodId >= 0 && demodId <=1)? 0 : ((demodId >= 2 && demodId <=3)?1:((demodId >= 4 && demodId <=5)?2:3));
	        var polarization  =$("#Polarization").prop('selectedIndex');
          // var Voltage  =$("#Voltage").prop('selectedIndex');
	        var lo_frequency =$("#LOFrequency").val();
	        var standerd =$("#standerd").val();
	        // var modulation =$("#modulation").prop('selectedIndex');
	        // var fec =$("#fec").prop('selectedIndex');
	        // var rolloff =$("#rolloff").prop('selectedIndex');
	        // var pilots =$("#pilots").prop('selectedIndex');
	        // var spectrumInverted =$("#spectrumInverted").prop('selectedIndex');
          var frequency=$("#frequency").val();
          var rate=$("#rate").val();
	        var auth_bit=rmx_id;
          var modulation =0;
           var fec =0;
           var rolloff =0;
           var pilots =2;
          var spectrumInverted =0;
          if(polarization== 0)
          {
            var Voltage=0;

          }
          else
          {
            var Voltage=5;
          }

          if (lo_frequency=='' || frequency=='' || rate=='') {
                $("#error_RFDATA").html("Please!Fill All the Required Parameters");
                $("#error_RFDATA").show();
               
            }
          else
          {
          	$("#error_RFDATA").hide();
            var result = confirm("Want to set Tuner?");
          	     if(result)
          	       {
          	        $.ajax({

          	            url:'index.php?route=common/dashboard/tuneToFrequency&token=<?php echo $token; ?>&tunerId='+check+'&mxl_id='+mxl_id+'&auth_bit='+auth_bit+'&rmx_id='+rmx_id+'&demodId='+demodId+'&lnbId='+lnbId+'&standerd='+standerd+'&frequency='+frequency+'&rate='+rate+'&modulation='+modulation+'&fec='+fec+'&rolloff='+rolloff+'&pilots='+pilots+'&spectrumInverted='+spectrumInverted+'&polarization='+polarization+'&lo_frequency='+lo_frequency+'&Voltage='+Voltage,
          	            beforeSend: function(){
          	                $("#loading-img").css({"display": "block"});
          	                $(".overlay").show();
          	            },
          	            error:function()
          	            {
          	              var html='<b>Error While Tuning</b>';
                          $("#message").empty();
                          $("#message").append(html).css("color","red").fadeIn('slow');
                          $('#message').delay(1000).fadeOut('slow');        
          	              $("#loading-img").css({"display": "none"});
          	              $(".overlay").hide(); 
          	            },
          	            success:function(data)
          	            {
          	               $("#loading-img").css({"display": "none"});
          	               $(".overlay").hide();
                           if(data==1)
                           {
                                  var html='<b>RF Input Tunned Successfully</b>';
                                    $("#message").empty();
                                   $("#message").append(html).css("color","green").fadeIn('slow');
                                   $('#message').delay(1000).fadeOut('slow');
                                   $("#tuner"+check).css("background-color","green");
                                    $('.tuner').each(function(index) {
                                        if($(this).attr('data-id') == check){
                                            $(this).removeClass("btn-danger").addClass("btn-success");
                                        }
                                    });
                                     
                                    
                           }
                           else if(data==0)
                           {
                                   var html='<b>Sorry Unable To Tune</b>';
                                   $("#message").empty();
                                   $("#message").append(html).css("color","red").fadeIn('slow');
                                   $('#message').delay(1000).fadeOut('slow');
                                   $("#tuner"+check).css("background-color","orange");
                            // location.reload();
                           }
                           else if(data==2)
                           {
                          
                                  var html='<b>Cannot Tune ! Exceeded Max Input Rate</b>';
                                   $("#message").empty();
                                   $("#message").append(html).css("color","red").fadeIn('slow');
                                   $('#message').delay(1000).fadeOut('slow');
                           }
                           else
                           {
                            
                                   var html='<b>Error while Setting Tuner</b>';
                                   $("#message").empty();
                                   $("#message").append(html).css("color","red").fadeIn('slow');
                                   $('#message').delay(1000).fadeOut('slow');
                                   $("#tuner"+check).css("background-color","orange");
                           }
          	            },
          	            type: 'POST'
          	        });
          	      }
          	  }
 });
$("#deleteTuner").click(function()
{
  var check=$("#hiddenValue").val();
          var rmx_id="";
          switch(true){
                  case (check>=1 && check <=8):
                      rmx_id=1;
                      break;
                  case (check>=9 && check <=16):
                      rmx_id=2;
                      break;
                  case (check>=17 && check <=24):
                      rmx_id=3;
                      break;
                  case (check>=25 && check <=32):
                      rmx_id=4;
                      break;
                  case (check>=33 && check <=40):
                      rmx_id=5;
                      break;
                  case (check>=41 && check <=48):
                      rmx_id=6;
                      break;
              }
  var demodId = (check-1)%8;
   $.ajax({
        url:'index.php?route=common/dashboard/setTunerOff&token=<?php echo $token; ?>&demodId='+demodId+'&rmx_no='+rmx_id,
        error:function()
        {
         var html='<b>Invalid Data</b>';
         $("#message").empty();
         $("#message").append(html).css("color","red").fadeIn('slow');
         $('#message').delay(1000).fadeOut('slow');
        },
        success:function(data)
        {
         $("#message").empty();
         $("#message").append(data).css("color","green").fadeIn('slow');
         $('#message').delay(1000).fadeOut('slow');
         $("#tuner"+check).find('option[value='+ -1 +']').attr('selected','selected');
         $("#tuner"+check).css("background-color",'#d9534f');  

        },
        type: 'POST'
    });
});
$("#Polarization").on("click",function(){
 var opval = $(this).val();
 if(opval==1)
  {
    $('select[name="Voltage"] option[value='+5+']').attr('selected','selected');
  }
  else
  {
    $('select[name="Voltage"] option[value='+0+']').attr('selected','selected');
  }

});
$(".mxl_drop_down").on("click",function(){
 var opval = $(this).val();
  var check = $('option:selected', this).attr('data-id');
  var ip_data_id = $('option:selected', this).attr('channel');
  if(opval==1)
  {
       $.ajax({
        url:'index.php?route=common/dashboard/getTunerDetails&token=<?php echo $token; ?>&tuner_id='+check,
        error:function()
        {
          var html='<b>Invalid Data</b>';
         $("#message").empty();
         $("#message").append(html).css("color","red").fadeIn('slow');
         $('#message').delay(1000).fadeOut('slow');
        },
        success:function(data)
        {
          var tunerData = new Array();
          tunerData = JSON.parse(data);
          if(tunerData["size"] == 1){  
            $("#frequency").val(tunerData["frequency"]);
            $("#rate").val(tunerData["rate"]);
            $('select[name="Polarization"] option[value='+tunerData["polarization"]+']').attr('selected','selected');
            $("#LOFrequency").val(tunerData["lo_frequency"]);
            $('select[name="pilots_name"] option[value='+tunerData["pilots"]+']').attr('selected','selected');
            $('select[name="demodId"] option[value='+tunerData["demodId"]+']').attr('selected','selected');
            $('select[name="lnbId"] option[value='+tunerData["lnbId"]+']').attr('selected','selected');
            $('select[name="standerd"] option[value='+tunerData["standard"]+']').attr('selected','selected');
            $('select[name="modulation"] option[value='+tunerData["modulation"]+']').attr('selected','selected');
            $('select[name="fec"] option[value='+tunerData["fec"]+']').attr('selected','selected');
            $('select[name="rolloff"] option[value='+tunerData["rolloff"]+']').attr('selected','selected');
            $('select[name="spectrumInverted"] option[value='+tunerData["spectrumInverted"]+']').attr('selected','selected');
            $('select[name="Voltage"] option[value='+tunerData["Voltage"]+']').attr('selected','selected');
          }else{
            $("#frequency").val("");
            $("#rate").val("");
            $('select[name="pilots_name"] option[value='+2+']').attr('selected','selected');
            $('select[name="demodId"] option[value='+0+']').attr('selected','selected');
            $('select[name="lnbId"] option[value='+0+']').attr('selected','selected');
            $('select[name="standerd"] option[value='+0+']').attr('selected','selected');
            $('select[name="modulation"] option[value='+0+']').attr('selected','selected');
            $('select[name="fec"] option[value='+0+']').attr('selected','selected');
            $('select[name="rolloff"] option[value='+0+']').attr('selected','selected');
            $('select[name="spectrumInverted"] option[value='+0+']').attr('selected','selected');
            $("#LOFrequency").val(5150);
          }
        },
        type: 'POST'
    });
   }
   else if(opval== 0)
   {
       switch(true){
                  case (ip_data_id>=1 && ip_data_id <=8):
                      rmx_no=1;
                      channel=ip_data_id-0;
                      break;
                  case (ip_data_id>=9 && ip_data_id <=16):
                      rmx_no=2;
                      channel=ip_data_id-8;
                      break;
                  case (ip_data_id>=17 && ip_data_id <=24):
                      rmx_no=3;
                      channel=ip_data_id-16;
                      break;
                  case (ip_data_id>=25 && ip_data_id <=32):
                      rmx_no=4;
                      channel=ip_data_id-24;
                      break;
                  case (ip_data_id>=33 && ip_data_id <=40):
                      rmx_no=5;
                      channel=ip_data_id-32;
                      break;
                  case (ip_data_id>=41 && ip_data_id <=48):
                      rmx_no=6;
                      channel=ip_data_id-40;
                      break;
              }
     $.ajax({
        url:'index.php?route=common/dashboard/getIPInput&token=<?php echo $token; ?>&channel='+channel+'&rmx_no='+rmx_no,
        error:function()
        {
          var html='<b>Invalid Data</b>';
         $("#message").empty();
         $("#message").append(html).css("color","red").fadeIn('slow');
         $('#message').delay(1000).fadeOut('slow');
        },
        success:function(data)
        {
          ipData =JSON.parse(data);
          if(ipData["error"]==0)
          {
            $("#add_ip").val("Update IP");
            $("#IP").val(ipData[0]["ip"]);
            $("#PORT").val(ipData[0]["port"]);
            $('select[name="Type"] option[value='+ipData[0]["type"]+']').attr('selected','selected');
          }
          else{
            $("#add_ip").val("Add IP");
            $("#IP").val('');
            $("#PORT").val(''); 
            $('select[name="Type"] option[value='+0+']').attr('selected','selected');
          }     
        },
        type: 'POST'
    }); 
   }
   else if(opval== 2)
   {
      var rmx_no = $('option:selected', this).attr('channel');
       $.ajax({
        url:'index.php?route=common/dashboard/getSPTSIP&token=<?php echo $token; ?>&rmx_no='+rmx_no,
        error:function()
        {
          var html='<b>Invalid Data</b>';
         $("#message").empty();
         $("#message").append(html).css("color","red").fadeIn('slow');
         $('#message').delay(1000).fadeOut('slow');
        },
        success:function(data)
        {
          var ipData = new Array();
          ipData =JSON.parse(data);
           if(ipData["error"]==0)
          {
             for (var i = 0; i < ipData["list"].length; i++) {

                $("#add_IPSPTS"+ipData["list"][i]["channel_no"]+ipData["list"][i]["rmx_no"]).val("Update IP");
                $("#IPSPTS"+ipData["list"][i]["channel_no"]+ipData["list"][i]["rmx_no"]).val(ipData["list"][i]["ip_address"]);
                $("#PORTSPTS"+ipData["list"][i]["channel_no"]+ipData["list"][i]["rmx_no"]).val(ipData["list"][i]["port"]);
                $('select[name="Type"] option[value='+ipData["list"][i]["type"]+']').attr('selected','selected');
            
               }
           
          }
          else{
             for (var i = 0; i < ipData["list"].length; i++) {
             $("#add_IPSPTS"+ipData["list"][i]["channel_no"]+ipData["list"][i]["rmx_no"]).val("Add IP");
            $("#IPSPTS"+ipData["list"][i]["channel_no"]+ipData["list"][i]["rmx_no"]).val('');
            $("#PORTSPTS"+ipData["list"][i]["channel_no"]+ipData["list"][i]["rmx_no"]).val(''); 
            $('select[name="Type"] option[value='+0+']').attr('selected','selected');
          } 
        }
        
             
        },
        type: 'POST'
    }); 

     
      
   }
});
$("#frequency").keyup(function()
{
  var frequency=$("#frequency").val();
  var value=Number(frequency);

  if (Math.floor(value) == value) {
    $("#error_RFDATA").hide();
  } else {
      $("#error_RFDATA").html("Required Integer Value");
      $("#error_RFDATA").show();
  }
});
$("#LOFrequency").keyup(function()
{
  var lo_frequency=$("#LOFrequency").val();
  var value=Number(lo_frequency);

  if (Math.floor(value) == value) {
    $("#error_RFDATA").hide();
  } else {
      $("#error_RFDATA").html("Required Integer Value");
      $("#error_RFDATA").show();
  }
});
$("#rate").keyup(function()
{
  var rate=$("#rate").val();
  var value=Number(rate);

  if (Math.floor(value) == value) {
    $("#error_RFDATA").hide();
  } else {
      $("#error_RFDATA").html("Required Integer Value");
      $("#error_RFDATA").show();
  }
});
function addIPInput()
{
	var ip_data_id = $("#hiddenValueIP").val();
	 
	var ip= $("#IP").val();
	var ippattern=new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);
	var port= $("#PORT").val();
	var type=$("#Type").prop('selectedIndex');
	switch(true){
                  case (ip_data_id>=1 && ip_data_id <=8):
                      rmx_no=1;
                      channel=ip_data_id-0;
                      tab=1;
                      break;
                  case (ip_data_id>=9 && ip_data_id <=16):
                      rmx_no=2;
                      channel=ip_data_id-8;
                      tab=1;
                      break;
                  case (ip_data_id>=17 && ip_data_id <=24):
                      rmx_no=3;
                      channel=ip_data_id-16;
                      tab=2;
                      break;
                  case (ip_data_id>=25 && ip_data_id <=32):
                      rmx_no=4;
                      channel=ip_data_id-24;
                      tab=2;
                      break;
                  case (ip_data_id>=33 && ip_data_id <=40):
                      rmx_no=5;
                      channel=ip_data_id-32;
                      tab=3;
                      break;
                  case (ip_data_id>=41 && ip_data_id <=48):
                      rmx_no=6;
                      channel=ip_data_id-40;
                      tab=3;
                      break;
              }
      var lnbId = (channel >= 1 && channel <=2)? 0 : ((channel >= 3 && channel <=4)?1:((channel >= 5 && channel <=6)?2:3));
var input=channel-1;
              
if(ip != '' || port != '')
 {
 $("#error_ipModal").hide(); 
  if(ippattern.test(ip))
  {
    $("#error_ip").hide();
    if(port>1024 && port<65536)
    {
      $("#error_port").hide();
 var value=$("#add_ip").val();

  if(value.localeCompare("Add IP")==0)
  {
    var result=confirm("want to add?");
    if(result)
     {
      $.ajax({
         url:'index.php?route=common/dashboard/addIPInput&token=<?php echo $token; ?>&ip='+ip+'&port='+port+'&channel='+channel+'&rmx_no='+rmx_no+'&type='+type+'&ip_data_id='+ip_data_id+'&lnbId='+lnbId,
         beforeSend: function(){
          $("#loading-img").css({"display": "block"});
          $(".overlay").show();
        },

        error:function(){
          var html='<b>Invalid Data</b>';
         $("#message").empty();
         $("#message").append(html).css("color","red").fadeIn('slow');
         $('#message').delay(1000).fadeOut('slow');
         $("#loading-img").css({"display": "none"});
         $(".overlay").hide();
        },
        success:function(data){ 
                  $("#loading-img").css({"display": "none"});
                  $(".overlay").hide();          
            if (data==0) {

             
                  getTunerstatus(rmx_no,input,ip_data_id,0);
                 change(); 
            }
            else if(data==1){
              var html='<b>Error</b>';
                     $("#message").empty();
                     $("#message").append(html).css("color","red").fadeIn('slow');
                     $('#message').delay(1000).fadeOut('slow');
            }
            else if(data== -1)
            {
              var html='<b>Data Already Exist</b>';
                     $("#message").empty();
                     $("#message").append(html).css("color","red").fadeIn('slow');
                     $('#message').delay(1000).fadeOut('slow');
            }
            else if(data== -2)
            {
              var html='<b>Sorry Unable To Tune</b>';
                     $("#message").empty();
                     $("#message").append(html).css("color","red").fadeIn('slow');
                     $('#message').delay(1000).fadeOut('slow');
                     $("#tuner"+ip_data_id).css("background-color","orange");
              
            }
            else if(data==2)
            {
             var html='<b>Cannot Tune!Exceeded Max Input Rate</b>';
                     $("#message").empty();
                     $("#message").append(html).css("color","red").fadeIn('slow');
                     $('#message').delay(1000).fadeOut('slow');
            }
            else
            {
              var html='<b>Invalid Responce</b>';
                     $("#message").empty();
                     $("#message").append(html).css("color","red").fadeIn('slow');
                     $('#message').delay(1000).fadeOut('slow');
            }
        },
    type: 'POST'
  });
 }
}
else if(value.localeCompare("Update IP")==0)
{ 
    var result = confirm("do you want to update");
    if(result)
    {
       $.ajax({
             url:'index.php?route=common/dashboard/updateIPInput&token=<?php echo $token; ?>&ip='+ip+'&port='+port+'&channel='+channel+'&rmx_no='+rmx_no+'&type='+type+'&ip_data_id='+ip_data_id+'&lnbId='+lnbId,
               beforeSend: function(){
                $("#loading-img").css({"display": "block"});
                $(".overlay").show();
              },
                error:function(){

                  var html='<b>Invalid Data</b>';
                   $("#message").empty();
                   $("#message").append(html).css("color","red").fadeIn('slow');
                   $('#message').delay(1000).fadeOut('slow');
                   $("#loading-img").css({"display": "none"});
                   $(".overlay").hide();
                },
                success:function(data){ 
                    $("#loading-img").css({"display": "none"});
                    $(".overlay").hide();
                    if(data==0) {

                              getTunerstatus(rmx_no,input,ip_data_id,0);        
                      
                    }
                    else if(data==-2){
                      
                     var html='<b>Sorry Unable To Tune</b>';
                     $("#message").empty();
                     $("#message").append(html).css("color","red").fadeIn('slow');
                     $('#message').delay(1000).fadeOut('slow');
                     $("#tuner"+ip_data_id).css("background-color","orange");
                    }
                    else if(data==1)
                    {
                      var html='<b>Sorry Unable To Update In Database</b>';
                     $("#message").empty();
                     $("#message").append(html).css("color","red").fadeIn('slow');
                     $('#message').delay(1000).fadeOut('slow');
                    }
                    else if(data==2)
                    {
                      
                      var html='<b>Cannot Tune!Exceeded Max Input Rate</b>';
                     $("#message").empty();
                     $("#message").append(html).css("color","red").fadeIn('slow');
                     $('#message').delay(1000).fadeOut('slow');
                    }
                    else
                    {
                      var html='<b>Invalid Responce</b>';
                     $("#message").empty();
                     $("#message").append(html).css("color","red").fadeIn('slow');
                     $('#message').delay(1000).fadeOut('slow');
                    }
                },
                type: 'POST'
             }); 
    } 	
}
}
else
{
      $("#error_port").html("Invalid Port Number");
      $("#error_port").show();
}
}
else
{
     $("#error_ip").html("Invalid IP Address");
     $("#error_ip").show();
}
}
else{
	$("#error_ipModal").html("Please Fill All The Required Parameters");
     $("#error_ipModal").show();
}
}

function deleteIPIN()
{
var ip_data_id = $("#hiddenValueIP").val();
var ip= $("#IP").val();
var port= $("#PORT").val();
var type=$("#Type").prop('selectedIndex');
switch(true){
                  case (ip_data_id>=1 && ip_data_id <=8):
                      rmx_no=1;
                      channel=ip_data_id-0;
                      break;
                  case (ip_data_id>=9 && ip_data_id <=16):
                      rmx_no=2;
                      channel=ip_data_id-8;
                      break;
                  case (ip_data_id>=17 && ip_data_id <=24):
                      rmx_no=3;
                      channel=ip_data_id-16;
                      break;
                  case (ip_data_id>=25 && ip_data_id <=32):
                      rmx_no=4;
                      channel=ip_data_id-24;
                      break;
                  case (ip_data_id>=33 && ip_data_id <=40):
                      rmx_no=5;
                      channel=ip_data_id-32;
                      break;
                  case (ip_data_id>=41 && ip_data_id <=48):
                      rmx_no=6;
                      channel=ip_data_id-40;
                      break;
              }
             
  var result = confirm("do you want to delete");
    if(result)
    {
       $.ajax({
             url:'index.php?route=common/dashboard/deleteIPInput&token=<?php echo $token; ?>&ip='+ip+'&port='+port+'&channel='+channel+'&rmx_no='+rmx_no+'&type='+type,
                error:function(){
                  var html='<b>Invalid Data</b>';
                   $("#message").empty();
                   $("#message").append(html).css("color","red").fadeIn('slow');
                   $('#message').delay(1000).fadeOut('slow');
                },
                success:function(data){ 
                
                    if (data==0) {
                       var html='<b>IP Input Deleted Successfully</b>';
                       $("#message").empty();
                       $("#message").append(html).css("color","green").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
                       $("#tuner"+ip_data_id).find('option[value='+ -1 +']').attr('selected','selected');
                       $("#tuner"+ip_data_id).css("background-color",'#d9534f');
                      
                    }
                    else if(data== -2){
                      
                       var html='<b>Unable to Delete From Server</b>';
                       $("#message").empty();
                       $("#message").append(html).css("color","red").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
                       
                      
                    }
                    else if(data==1)
                    {
                       var html='<b>Unable to Delete From Database</b>';
                       $("#message").empty();
                       $("#message").append(html).css("color","red").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
                    }
                    else
                    {
                       var html='<b>Invalid Responce</b>';
                       $("#message").empty();
                       $("#message").append(html).css("color","red").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
                    }
                },
                type: 'POST'
             }); 
    }
}
$(document).ready(function(){
<?php foreach($IpInput as $IpIn) {  ?>
   <?php if($IpIn['rmx_no']==1){ ?>
    $('select[name="R1CH<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["channel"] ?>]').attr('selected','selected');
    $('select[name="R1type<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["type"] ?>]').attr('selected','selected');
   <?php }?>
    <?php if($IpIn['rmx_no']==2) {?>
     $('select[name="R2CH<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["channel"] ?>]').attr('selected','selected');
    $('select[name="R2type<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["type"] ?>]').attr('selected','selected');
   <?php }?> 
   <?php if($IpIn['rmx_no']==3){ ?>
    $('select[name="R3CH<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["channel"] ?>]').attr('selected','selected');
    $('select[name="R3type<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["type"] ?>]').attr('selected','selected');
   <?php }?>
   <?php if($IpIn['rmx_no']==4){ ?>
    $('select[name="R4CH<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["channel"] ?>]').attr('selected','selected');
    $('select[name="R4type<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["type"] ?>]').attr('selected','selected');
   <?php }?>
   <?php if($IpIn['rmx_no']==5){?>
    $('select[name="R5CH<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["channel"] ?>]').attr('selected','selected');
    $('select[name="R5type<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["type"] ?>]').attr('selected','selected');
   <?php }?> 
   <?php if($IpIn['rmx_no']==6) {?>
   $('select[name="R6CH<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["channel"] ?>]').attr('selected','selected');
    $('select[name="R6type<?php echo $IpIn['channel'];?>"] option[value=<?php echo $IpIn["type"] ?>]').attr('selected','selected');
   <?php }?>
<?php }?>
});
function removefield(count,rmx_no){
  var ele = document.getElementById("remove"+count+"_"+rmx_no);
  ele.remove();
  
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

$(document).ready(function(){
	$('.mxl_drop_down').on("click",function(){
		var opval = $(this).val();
        var id = $(this).attr("id");
        if(opval=="1"){ 
            $('#tunerModal').modal("show"); 
        }
        if(opval=="0")
        {
        	 $('#ipModal').modal("show");
        	 
        }
        if(opval=="2")
        { 
           sptsIP(id);
           
        }
	});
   
});
function sptsIP(tunerid)
{
  var rmx_no = (tunerid == "tuner1" )? 1 : ((tunerid == "tuner17" )?2:((tunerid >= "tuner33" )?3:4));
  $("#SPTSipModal").empty();
   var html='<div class="class="modal-dialog" role="document" style="width:70%;margin-top:2%;margin-left:10%;">'
        html+='<div class="modal-content" >'
          html+='<div class="modal-header">'
            html+='<h5 class="modal-title" >IP SPTS <span id="message_spts" style="margin-left:40%"></span></h5>'

          
             
          html+='</div>'
          html+=' <div class="modal-body" >'
            html+='<div class="row">'
              html+='<div class="container col-xs-12">'
            
               html+='<table class="genral" style="width: 100%">'
                      html+='<tr>'

                        html+='<td><b>IP Address</b></td>'
                        html+='<td><b>PORT</b></td>'
                        html+='<td><b>TYPE</b></td>'
                      html+='</tr>'
                      for(var channel_no=17;channel_no<=31;channel_no++)
                      {
                        html+='<tr class="blank_row" style="background-color:black"></tr>'
                        html+='<tr >'
                        
                         html+=' <td><input type="text" class="ip" name="stuff[]" value="" id="IPSPTS'+channel_no+''+rmx_no+'"></td>'
                          html+='<td><input type="text" class="port" name="stuff[]" value="" id="PORTSPTS'+channel_no+''+rmx_no+'"></td>'
                        html+='<td><select class="btn btn-secondary" name="Type" id="TypeSPTS'+channel_no+''+rmx_no+'">'
                                    html+='<option value="0">Unicast</option>'
                                    html+='<option value="1" selected="selected">Multicast</option>'
                        html+='</select></td>'                                              

                         html+='<td><input type="button" class="btn btn-secondary" id="add_IPSPTS'+channel_no+''+rmx_no+'" value="Add IP"  onclick="addSptsIP('+channel_no+','+"'"+tunerid+"'"+')" ></input></td>'
                         html+='<td><button type="button" class="btn btn-secondary" onclick="deleteSptsIP('+channel_no+','+"'"+tunerid+"'"+')" >Delete IP</button></td>'
                       html+=' </tr>'
                        html+='<tr>'
                          html+='<td id="error_ipSPTS" style="color: red"></td>'
                          html+='<td id="error_portSPTS" style="color: red"></td>'
                          html+='<td></td>'
                      html+='</tr>'

                  }
                  html+='</table>'
             
               
             html+=' </div>'
             
            html+='</div>'
           html+='</div>'
            html+='<div class="modal-footer">'
            html+='<span id="error_ipSPTSModal" style="color: red"></span>'
            
            
            html+='<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="previousStage()">Cancel</button>'
           

          html+='</div>'
        html+='</div>'
     html+= '</div>'

  $("#SPTSipModal").append(html);
  $("#SPTSipModal").modal("show");
}
function addSptsIP(channel_no,tunerid)
{
  var rmx_no = (tunerid == "tuner1" )? 1 : ((tunerid == "tuner17" )?2:((tunerid >= "tuner33" )?3:4));
  var check = (tunerid == "tuner1" )? 1 : ((tunerid == "tuner17" )?17:((tunerid >= "tuner33" )?33:0));
  var SPTS_IP=$("#IPSPTS"+channel_no+rmx_no).val();
  var SPTS_PORT=$("#PORTSPTS"+channel_no+rmx_no).val();
  var SPTS_type=$("#TypeSPTS"+channel_no+rmx_no).prop('selectedIndex');
  var value=$("#add_IPSPTS"+channel_no+rmx_no).val();
  var ippattern=new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);
  if(SPTS_IP != '' || SPTS_PORT != '')
   {
   $("#error_ipSPTSModal").hide(); 
  if(ippattern.test(SPTS_IP))
  {
    $("#error_ipSPTS").hide();
    if(SPTS_PORT>1024 && SPTS_PORT<65536)
    {

  
if(value.localeCompare("Add IP")==0)
  {
    $.ajax({
             url:'index.php?route=common/dashboard/addSPTSIP&token=<?php echo $token; ?>&SPTS_IP='+SPTS_IP+'&SPTS_PORT='+SPTS_PORT+'&SPTS_type='+SPTS_type+'&rmx_no='+rmx_no+'&channel_no='+channel_no,
                error:function(){
                   var html='<b>Invalid Data</b>';
                   $("#message_spts").empty();
                   $("#message_spts").append(html).css("color","red").fadeIn('slow');
                   $('#message_spts').delay(1000).fadeOut('slow');
                },
                success:function(data){ 
                
                    if (data==0) {
                      getTunerstatus(rmx_no,0,check,1);
                      /*var html='<b>Success</b>';
                       $("#message_spts").empty();
                       $("#message_spts").append(html).css("color","green").fadeIn('slow');
                       $('#message_spts').delay(1000).fadeOut('slow');*/
                       changeIPSPTS(channel_no,rmx_no);

                    }
                   
                    else
                    {
                      
                     var html='<b>Sorry!Not Able to add</b>';
                     $("#message_spts").empty();
                     $("#message_spts").append(html).css("color","red").fadeIn('slow');
                     $('#message_spts').delay(1000).fadeOut('slow');
                    }
                },
                type: 'POST'
             });
}
if(value.localeCompare("Update IP")==0)
  {
    $.ajax({
             url:'index.php?route=common/dashboard/addSPTSIP&token=<?php echo $token; ?>&SPTS_IP='+SPTS_IP+'&SPTS_PORT='+SPTS_PORT+'&SPTS_type='+SPTS_type+'&rmx_no='+rmx_no+'&channel_no='+channel_no,
                error:function(){
                  var html='<b>Invalid Data</b>';
                   $("#message_spts").empty();
                   $("#message_spts").append(html).css("color","red").fadeIn('slow');
                   $('#message_spts').delay(1000).fadeOut('slow');
                },
                success:function(data){ 
                
                    if (data==0) {
                               getTunerstatus(rmx_no,0,check,1);
                     /*var html='<b>Success</b>';
                       $("#message_spts").empty();
                       $("#message_spts").append(html).css("color","green").fadeIn('slow');
                       $('#message_spts').delay(1000).fadeOut('slow');*/
                     
                     
                    }
                   
                    else
                    {
                      var html='<b>Sorry!Not Able to Update</b>';
                     $("#message_spts").empty();
                     $("#message_spts").append(html).css("color","red").fadeIn('slow');
                     $('#message_spts').delay(1000).fadeOut('slow');
                    }
                },
                type: 'POST'
             });
} 
}
else
{
      $("#error_portSPTS").html("Invalid Port Number");
      $("#error_portSPTS").show();
}
}
else
{
     $("#error_ipSPTS").html("Invalid Ip Address");
     $("#error_ipSPTS").show();
}
}
else{
  $("#error_ipSPTSModal").html("Please Fill All The Required Parameters");
     $("#error_ipSPTSModal").show();
}
}
function deleteSptsIP(channel_no,tunerid)
{
  var check= (tunerid == "tuner1" )? 1 : ((tunerid == "tuner17" )?17:((tunerid >= "tuner33" )?33:0));
  var rmx_no = (tunerid == "tuner1" )? 1 : ((tunerid == "tuner17" )?2:((tunerid >= "tuner33" )?3:4)); 
  var SPTS_IP=$("#IPSPTS"+channel_no+rmx_no).val();
  var SPTS_PORT=$("#PORTSPTS"+channel_no+rmx_no).val();
  if(SPTS_IP!="" || SPTS_PORT!="")
  {
   $.ajax({
             url:'index.php?route=common/dashboard/deleteSPTSIP&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&channel_no='+channel_no,
                error:function(){
                 var html='<b>Invalid Data</b>';
                   $("#message_spts").empty();
                   $("#message_spts").append(html).css("color","red").fadeIn('slow');
                   $('#message_spts').delay(1000).fadeOut('slow');
                },
                success:function(data){ 
                
                    if (data==0) {
                     var html='<b>Success</b>';
                       $("#message_spts").empty();
                       $("#message_spts").append(html).css("color","green").fadeIn('slow');
                       $('#message_spts').delay(1000).fadeOut('slow');
                      changeIPSPTS(channel_no,rmx_no);
                     
                      $("#IPSPTS"+channel_no+rmx_no).val("");
                      $("#PORTSPTS"+channel_no+rmx_no).val("");
                     
                    }
                   
                    else
                    {
                      var html='<b>Sorry!Not Able to Delete</b>';
                     $("#message_spts").empty();
                     $("#message_spts").append(html).css("color","red").fadeIn('slow');
                     $('#message_spts').delay(1000).fadeOut('slow');
                    }
                },
                type: 'POST'
             });
  }
}
$(document).ready(function(){
  var tuner_details = <?php echo json_encode($Tuner_details); ?>;

  $('.tuner').each(function(index) {
  var RF_data_id = $(this).find('option[value='+1+']').attr('data-id');
  var ip_data_id = $(this).find('option[value='+0+']').attr('channel');
  var tuner_id=$(this).attr('id');

switch(true){
                  case (ip_data_id>=1 && ip_data_id <=8):
                      rmx_no=1;
                      mxl_id=1;
                      channel=ip_data_id-0;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=9 && ip_data_id <=16):
                      rmx_no=2;
                      mxl_id=2;
                      channel=ip_data_id-8;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=17 && ip_data_id <=24):
                      rmx_no=3;
                      mxl_id=3;
                      channel=ip_data_id-16;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=25 && ip_data_id <=32):
                      rmx_no=4;
                      mxl_id=4;
                      channel=ip_data_id-24;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=33 && ip_data_id <=40):
                      rmx_no=5;
                      mxl_id=5;
                      channel=ip_data_id-32;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=41 && ip_data_id <=48):
                      rmx_no=6;
                      mxl_id=6;
                      channel=ip_data_id-40;
                      demod_id=channel-1;
                      break;
              }
              
        
              if(tuner_details[RF_data_id-1].Tuner_type == 1)
              {
              $(this).find('option[value='+1+']').attr('selected','selected');
             var color='';
             var control_fpga=(rmx_no == 1 || rmx_no == 2)?0:((rmx_no == 3 || rmx_no == 4)?1:2);
                $.ajax({
                  url:'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input_id='+demod_id+'&control_fpga='+control_fpga,
                   async:false,
                  error:function(){
                    

                  },
                  success:function(data){
                  
                       // var list =JSON.parse(data);
                  //         data=JSON.parse(data);
                  // alert(data);
                          if(data == 0 )
                          {
                            color='orange';  
                          }
                         
                          else if(data != 0 )
                          {
                            color='Green';
                          }
                           else 
                          {
                            color='#d9534f';
                          }
                      /*if(list['locked']==0)
                      {
                       color='orange';
                      }
                      else if(list['locked']==1 )
                      {
                       color='Green';
                      }
                      else
                      {
                      	color='#d9534f';
                      }*/
                       
                  },
                  type: 'POST'
              });
                $(this).css("background-color",color);
              }
              else if(tuner_details[RF_data_id-1].Tuner_type == 0){
                $(this).find('option[value='+0+']').attr('selected','selected');
                 var control_fpga=(rmx_no == 1 || rmx_no == 2)?0:((rmx_no == 3 || rmx_no == 4)?1:2);
                $.ajax({
                  url:'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input_id='+demod_id+'&control_fpga='+control_fpga,
                   async:false,
                  error:function(){
                   

                  },
                  success:function(data){
               
                         // data=JSON.parse(data);
                  
                          if(data == 0 )
                          {
                            color='orange';  
                          }
                         
                          else if(data != 0)
                          {
                            color='Green';
                          }
                           else 
                          {
                            color='#d9534f';
                          }
                        
                       
                  },
                  type: 'POST'
              });
            $(this).css("background-color",color);
              }
             else if(tuner_details[RF_data_id-1].Tuner_type == 2){
                $(this).find('option[value='+2+']').attr('selected','selected');
                var control_fpga=(rmx_no == 1 || rmx_no == 2)?0:((rmx_no == 3 || rmx_no == 4)?1:2);
                $.ajax({
                  url:'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input_id='+demod_id+'&control_fpga='+control_fpga,
                   async:false,
                  error:function(){
                   

                  },
                  success:function(data){
                     // data=JSON.parse(data);
                   
                          if(data == 0 )
                          {
                            color='orange';  
                          }
                          else if(data!= 0)
                          {
                             color='Green';
                          }
                          else
                          {
                            var html='<b>Unable to tune</b>';
                            $("#message").empty();
                           $("#message").append(html).css("color","red").fadeIn('slow');
                           $('#message').delay(1000).fadeOut('slow');
                           $("#tuner"+ip_data_id).css("background-color","#d9534f");
                          }
                        
                       
                  },
                  type: 'POST'
              });
            $(this).css("background-color",color);
              }
              else
              {
                $(this).find('option[value='+ -1 +']').attr('selected','selected');
                $(this).css("background-color","#d9534f");
              }
       
  });
  });
function getTunerstatus(rmx_no,input,ip_data_id,ip_type)
{
  var control_fpga=(rmx_no == 1 || rmx_no == 2)?0:((rmx_no == 3 || rmx_no == 4)?1:2);
                $.ajax({
                  url:'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input_id='+input+'&control_fpga='+control_fpga,
                    
                  error:function(){
                   

                  },
                  success:function(data){
                 
                    if(ip_type==0)
                    {

                     if(data == 0 )
                          {
                           
                            var html='<b>Sorry Unable To Tune</b>';
                           $("#message").empty();
                           $("#message").append(html).css("color","red").fadeIn('slow');
                           $('#message').delay(1000).fadeOut('slow');
                           $("#tuner"+ip_data_id).css("background-color","orange");  
                          }
                          
                          else if(data != 0 )
                          {
                           var html='<b>IP Input Tunned Successfully</b>';
                            $("#message").empty();
                           $("#message").append(html).css("color","green").fadeIn('slow');
                           $('#message').delay(1000).fadeOut('slow');
                           $("#tuner"+ip_data_id).css("background-color","green");
                            
                          }
                          else 
                          {
                            var html='<b>Unable to tune</b>';
                            $("#message").empty();
                           $("#message").append(html).css("color","red").fadeIn('slow');
                           $('#message').delay(1000).fadeOut('slow');
                           $("#tuner"+ip_data_id).css("background-color","#d9534f");
                            
                          }
                    }
                    else{

                          if(data == 0 )
                          {
                           
                            var html='<b>Sorry Unable To Tune</b>';
                           $("#message_spts").empty();
                           $("#message_spts").append(html).css("color","green").fadeIn('slow');
                           $('#message_spts').delay(1000).fadeOut('slow');
                           $("#tuner"+ip_data_id).css("background-color","orange");  
                          }
                          
                          else if(data != 0 )
                          {
                           var html='<b>Success</b>';
                           $("#message_spts").empty();
                           $("#message_spts").append(html).css("color","green").fadeIn('slow');
                           $('#message_spts').delay(1000).fadeOut('slow');
                           $("#tuner"+ip_data_id).css("background-color","green");
                            
                          }
                          else 
                          {
                            var html='<b>Unable to tune</b>';
                            $("#message_spts").empty();
                           $("#message_spts").append(html).css("color","green").fadeIn('slow');
                           $('#message_spts').delay(1000).fadeOut('slow');
                           $("#tuner"+ip_data_id).css("background-color","#d9534f");
                            
                          }

                          



                    }    
                       
                       
                  },
                  type: 'POST'
              });

}
$('.mxl_drop_down').on("click",function(){
  var RF_data_id = $(this).find('option[value='+1+']').attr('data-id');
  var ip_data_id = $(this).find('option[value='+0+']').attr('channel');
  var tuner_id=$(this).attr('id');
  var tuner_details = <?php echo json_encode($Tuner_details); ?>;

 

switch(true){
                  case (ip_data_id>=1 && ip_data_id <=8):
                      rmx_no=1;
                      mxl_id=1;
                      channel=ip_data_id-0;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=9 && ip_data_id <=16):
                      rmx_no=2;
                      mxl_id=2;
                      channel=ip_data_id-8;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=17 && ip_data_id <=24):
                      rmx_no=3;
                      mxl_id=3;
                      channel=ip_data_id-16;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=25 && ip_data_id <=32):
                      rmx_no=4;
                      mxl_id=4;
                      channel=ip_data_id-24;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=33 && ip_data_id <=40):
                      rmx_no=5;
                      mxl_id=5;
                      channel=ip_data_id-32;
                      demod_id=channel-1;
                      break;
                  case (ip_data_id>=41 && ip_data_id <=48):
                      rmx_no=6;
                      mxl_id=6;
                      channel=ip_data_id-40;
                      demod_id=channel-1;
                      break;
              }
              
        
              if(tuner_details[RF_data_id-1].Tuner_type == 1)
              {
              $(this).find('option[value='+1+']').attr('selected','selected');
             var color='';
                $.ajax({
                  url:'index.php?route=common/dashboard/getMxlstatus&token=<?php echo $token; ?>&mxl_id='+mxl_id+'&rmx_id='+rmx_no+'&demodId='+demod_id,
                   async:false,
                  error:function(){
                   

                  },
                  success:function(data){
                      var list =JSON.parse(data);

                      if(list['locked']==0)
                      {
                       
                      }
                      else if(list['locked']==1)
                      {
                       
                       alert("RF Input is Already Tuned");
                       /*var result = confirm("RF Input is Already Tuned");
                         if(result)
                         {

                         }
                         else
                         {
                          $('.ipM').modal("hide");
                       
                         }*/
                      }
                      else
                      {
                        
                      }
                       
                  },
                  type: 'POST'
              });
                // $(this).css("background-color",color);
              }
              else if(tuner_details[RF_data_id-1].Tuner_type == 0){
                $(this).find('option[value='+0+']').attr('selected','selected');
                  var control_fpga=(rmx_no == 1 || rmx_no == 2)?0:((rmx_no == 3 || rmx_no == 4)?1:2);
                $.ajax({
                  url:'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input_id='+demod_id+'&control_fpga='+control_fpga,
                   async:false,
                  error:function(){
                   

                  },
                  success:function(data){
                       // data=JSON.parse(data);
                    
                          if(data == 0 )
                          {
                            
                          }
                          
                          else if(data != 0 )
                          {
                            
                            alert("MPTS IP Input is Already Tuned");

                          }
                          else 
                          {
                            
                          }
                        
                        
                       
                  },
                  type: 'POST'
              });
            
              }
             else if(tuner_details[RF_data_id-1].Tuner_type == 2){
                $(this).find('option[value='+2+']').attr('selected','selected');
                var control_fpga=(rmx_no == 1 || rmx_no == 2)?0:((rmx_no == 3 || rmx_no == 4)?1:2);
                $.ajax({
                  url:'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input_id='+demod_id+'&control_fpga='+control_fpga,
                   async:false,
                  error:function(){
                    

                  },
                  success:function(data)
                  {
                          if(data == 0  )
                          {
                              
                          }
                          else if(data!= 0 )
                          {
                            
                             alert("SPTS IP Input is Already Tuned");
                          }
                          else
                          {

                          }
                        
                       
                  },
                  type: 'POST'
              });
            
              }
              else
              {
                $(this).find('option[value='+ -1 +']').attr('selected','selected');
                $(this).css("background-color","#d9534f");
              }
       

  });
/***********************CAS**************************/
function EMMGModal()
{
  $.ajax({
      url: 'index.php?route=common/dashboard/getEMMid&token=<?php echo $token; ?>',
      error:function()
      {
        var html='<b>Invalid Data</b>';
         $("#message").empty();
         $("#message").append(html).css("color","red").fadeIn('slow');
         $('#message').delay(1000).fadeOut('slow');
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
        $("#EMMG_modal").append('<div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content"><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " id="EMMGModalLabel" style="margin-left: 0px">NEW EMMG</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_alias"  style="margin-top: 4px;" name=""></td><td></td><td>Bandwidth:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_bw" style="margin-top: 4px;" name="">Kbps</td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_bw" style="color: red"></span></td></tr><tr><td>Channel ID:</td><td><b>'+id+'</b></td><td></td><td style="margin-top: 4px;">Stream_id:</td><td style="margin-top: 4px;"><input type="text" class="form-control-default emmg_modal" id="emm_streamid" style="margin-top: 4px;" value='+id+'></td></tr><tr><td>Client ID:(Hex)</td><td><input type="text" class="form-control-default emmg_modal" id="emm_clientid" onfocusout="emmClientValidation()" style="margin-top: 4px;" name=""></td><td></td><td>Data ID:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_dataid" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_emm_clientid" style="color: red"></span></td><td></td><td></td><td><span id="error_emm_dataid" style="color: red"></span></td></tr><tr><td>EMM PID:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_pid" style="margin-top: 4px;" name=""></td><td></td><td>Port:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_port" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_port" style="color: red"></span></td></tr><tr></tbody></table> </div><div class="modal-footer"><button type="button" class="btn btn-default" Disabled="Disabled" id ="EMMG_onclick" onclick="addEMMG('+id+');" data-dismiss="modal">SAVE</button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></div></div>');
            $('#emm_alias, #emm_bw, #emm_channelid,#emm_clientid,#emm_port,#emm_dataid,#emm_streamid').keyup(function() 
               {
                 var empty = false;
            $('#emm_alias, #emm_bw, #emm_channelid,#emm_clientid,#emm_port,#emm_dataid,#emm_streamid').each(function() 
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
    $("#error_emm_bw").html("Bandwidth Should be in The Range of 0-65535");
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
  var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1,10}$/i);
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
    $("#error_emm_clientid").html("Client Id Should Start With 0x and Should be Heaxadecimal(<0xffffffff)");
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
    $("#error_emm_dataid").html("Data Id Should be in The Range of 0-65535");
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
    $("#error_emm_port").html("Port Number Should be in The Range of 0-65535");
     $("#error_emm_port").show();
    return false;
  }
}
    /*EMMG validation*/
    /*EMMG Plus Script*/
function addEMMG(channel_id)
 {
    var emm_alias = $('#emm_alias').val();
    var emm_bw = $('#emm_bw').val();
    var emm_clientid = $('#emm_clientid').val();
    var emm_port = $('#emm_port').val();
    var emm_dataid = $('#emm_dataid').val();
    var emm_pid = $('#emm_pid').val();
    var emm_streamid=$("#emm_streamid").val();
   var res = confirm("want to add new EMMG?");
   if(res)
   {
    $.ajax({
    url: 'index.php?route=common/dashboard/addEMMGChannel&token=<?php echo $token; ?>&emm_alias='+ emm_alias+'&emm_bw=' +emm_bw+'&emm_channelid='+channel_id + '&emm_streamid='+emm_streamid+ '&emm_clientid=' + emm_clientid+ '&emm_port=' + emm_port+ '&emm_dataid=' + emm_dataid+'&emm_pid=' + emm_pid,
    error:function()
      {
                       var html='<b>Error While Adding EMMG</b>';
                       $("#message").empty();
                       $("#message").append(html).css("color","red").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
      },
    success: function(data) 
    {
      // alert(data['error']);

      data=JSON.parse(data);
      if(data['error']==false)
      {
         var html='<b>EMMG added succesfully</b>';
                       $("#message").empty();
                       $("#message").append(html).css("color","green").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
         
          var html='<table  class="panel2" id="EMMG'+channel_id+'">'
            html+='<colgroup>'
              html+='<col style="width: 4%;" />'
              html+='<col style="width: 33%;" />'
              html+='<col style="width: 5%;" />'
              html+='<col style="width: 5%;" />'
              html+='<col style="width: 5%;" />'
            html+='</colgroup>'
          html+='<tr>'
            html+='<td></td>'
            html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><b>'+emm_alias+'</b></span></td>'
            html+='<td></td>'
            html+='<td><span class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#emmg_settings_modal" onclick="EMMG_settings('+channel_id+');" " ></span></td>'
            html+='<td><span class="glyphicon glyphicon-trash" onclick="deleteEMMG('+channel_id+')"></span></td>'
          html+='</tr>'
        html+='</table>'
        $("#EMMG").append(html);
      }
      else
      {
         $("#message").empty();
         $("#message").append(data['message']).css("color","red").fadeIn('slow');
         $('#message').delay(10000).fadeOut('slow');
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
         var html='<b>Invalid Data</b>';
         $("#message").empty();
         $("#message").append(html).css("color","red").fadeIn('slow');
         $('#message').delay(1000).fadeOut('slow');
    },
    success: function(data) 
    { 
      if (data==1) 
      {
          var html='<b>Connection Error</b>';
           $("#message").empty();
           $("#message").append(html).css("color","orange").fadeIn('slow');
           $('#message').delay(1000).fadeOut('slow');
      }
     var emmdata = JSON.parse(data);
     $("#emmg_settings_modal").empty();
     $("#emmg_settings_modal").append('<div class="modal-dialog" role="document"  style="width: 70%; align-self: center;"><div class="modal-content" ><div class="modal-body"><table class="genral" style="width:100%; height: 20%;"><tbody><tr><td ><h3 class=" glyphicon glyphicon-cog " id="EMMGModalLabel" style="margin-left: 0px">'+emmdata['alias']+'</h3></td></tr><tr><td>Alias:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_settings_alias" value="'+emmdata['alias']+'"  style="margin-top: 4px;" name=""></td><td></td><td>Bandwidth:</td><td><input type="text" class="form-control-default emmg_modal" id="emm_settings_bw" value="'+emmdata['bandwidth']+'" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_settings_bw" style="color: red"></span></td></tr><tr><td>Channel ID:</td><td><b>'+emmdata['channel_id']+'</b></td><td></td><td style="margin-top: 4px;">Stream_id:</td><td style="margin-top: 4px;"><input type="text" class="form-control-default emmg_modal" id="emm_settings_streamid" value="'+emmdata['stream_id']+'" style="margin-top: 4px;" name=""></td></tr><tr><td>Client ID:(Hex)</td><td><input type="text" class="form-control-default emmg_modal" id="emm_settings_clientid"  value="'+emmdata['client_id']+'" style="margin-top: 4px;" name=""></td><td></td><td>Data ID:</td><td><input type="text" class="form-control-default emmg_modal" value="'+emmdata['data_id']+'" id="emm_settings_dataid" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td><span id="error_emm_settings_clientid" style="color: red"></span></td><td></td><td></td><td><span id="error_emm_dataid" style="color: red"></span></td></tr><tr><td>EMM PID:</td><td><input value="'+emmdata['emm_pid']+'" type="text" class="form-control-default emmg_modal" id="emm_settings_pid" style="margin-top: 4px;" name=""></td><td></td><td>Port:</td><td><input value="'+emmdata['port']+'" type="text" class="form-control-default emmg_modal" id="emm_settings_port" style="margin-top: 4px;" name=""></td></tr><tr><td></td><td></td><td></td><td></td><td><span id="error_emm_settings_port" style="color: red"></span></td></tr><tr></tbody></table> </div><div class="modal-footer"><button type="button" class="btn btn-default" Disabled="Disabled" id ="EMMG_Settings" data-dismiss="modal" onclick="updateEMMG('+emmdata['channel_id']+');">APPLY & SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></div></div>');
        $('#emm_settings_pid').keyup(function(){
           $('#EMMG_Settings').removeAttr('disabled');  
        });
        $('#emm_settings_alias, #emm_settings_bw,#emm_settings_clientid,#emm_settings_port,#emm_settings_dataid,#emm_settings_streamid').keyup(function() 
           {
             var empty = false;
        $('#emm_settings_alias, #emm_settings_bw,#emm_settings_clientid,#emm_settings_port,#emm_settings_dataid,#emm_settings_streamid').each(function() 
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
function updateEMMG(channel_id)
{
  emm_alias = $('#emm_settings_alias').val();
  emm_bw = $('#emm_settings_bw').val();
  emm_clientid = $('#emm_settings_clientid').val();
  emm_port = $('#emm_settings_port').val();
  emm_dataid = $('#emm_settings_dataid').val();
  emm_pid = $('#emm_settings_pid').val();
  emm_streamid=$('#emm_settings_streamid').val();
    var result = confirm("Want to update EMM data?");
    if(result)
    {
       $.ajax({
        url: 'index.php?route=common/dashboard/updateEMMG&token=<?php echo $token; ?>&emm_alias='+ emm_alias+'&emm_bw=' +emm_bw+'&emm_channelid='+channel_id+ '&emm_streamid='+emm_streamid+ '&emm_clientid=' + emm_clientid+ '&emm_port=' + emm_port+ '&emm_dataid=' + emm_dataid+'&emm_pid=' + emm_pid,
        error:function()
        {
                      var html='<b>Error While Updating EMMG</b>';
                       $("#message").empty();
                       $("#message").append(html).css("color","red").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
        },
        success: function(data) 
        {
           data=JSON.parse(data);
          if(data['error']==false)
          {
            
          var html='<b>EMMG updated succesfully</b>';
           $("#message").empty();
           $("#message").append(html).css("color","green").fadeIn('slow');
             $('#message').delay(1000).fadeOut('slow');
         $('#EMMG_Settings').attr('disabled', 'disabled');
             $("#EMMG"+channel_id).remove();
             var html='<table  class="panel2" id="EMMG'+channel_id+'">'
            html+='<colgroup>'
              html+='<col style="width: 4%;" />'
              html+='<col style="width: 33%;" />'
              html+='<col style="width: 5%;" />'
              html+='<col style="width: 5%;" />'
              html+='<col style="width: 5%;" />'
            html+='</colgroup>'
          html+='<tr>'
            html+='<td></td>'
            html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><b>'+emm_alias+'</b></span></td>'
            html+='<td></td>'
            html+='<td><span class="glyphicon glyphicon-cog" data-toggle="modal" data-target="#emmg_settings_modal" onclick="EMMG_settings('+channel_id+');" " ></span></td>'
            html+='<td><span class="glyphicon glyphicon-trash" onclick="deleteEMMG('+channel_id+')"></span></td>'
              html+='</tr>'
            html+='</table>'
            $("#EMMG").append(html); 


          }
          else
          {
                       var html='<b>'+data['message']+'</b>';
                       $("#message").empty();
                       $("#message").append(html).css("color","red").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
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
    $("#error_emm_settings_bw").html("Bandwidth Should be in The Range of 0-65535");
     $("#error_emm_settings_bw").show();
    return false;
  }
}
function emmsettingsClientValidation()
{
  $("#error_emm_settings_clientid").hide();
  var text = $("#emm_settings_clientid").val().trim();
  var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1,10}$/i);
  if(pattern.test(text))
  {
      $("#error_emm_settings_clientid").hide();
      return true;
  }    
  else
  {
    $("#error_emm_settings_clientid").html("Client Id Starts with 0x and Should be Hexadecimal");
      $("#error_emm_settings_clientid").show();
       return false;
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
    $("#error_emm_settings_dataid").html("Dataid Should be in The Range of 0-65535");
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
    $("#error_emm_settings_port").html("Port Number Should be in The Range of 0-65535");
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
          
                       var html='<b>Error While Deleting EMMG</b>';
                       $("#message").empty();
                       $("#message").append(html).css("color","red").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
          },
          success: function(data) 
          {
            if(data == 1)
            { 
              var ele = document.getElementById("EMMG"+channel_id);
              ele.remove();
              
                      var html='<b>EMMG deleted succesfully</b>';
                      $("#message").empty();
                       $("#message").append(html).css("color","green").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
              
            }
            else
            {
               
                     var html='<b>Unable To Delete</b>';
                      $("#message").empty();
                       $("#message").append(html).css("color","red").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
            }
          },
          type: 'POST'
          });
    }  
}


function newECMG()
 {
    $.ajax({
        url:'index.php?route=common/dashboard/getLastECMGId&token=<?php echo $token; ?>',
        error:function()
        {
           var html='<b>Error While Adding ECMG</b>';
           $("#message").empty();
           $("#message").append(html).css("color","red").fadeIn('slow');
           $('#message').delay(1000).fadeOut('slow');
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
            
             var html='<b>Cannot add more than 4 ECMGs</b>';
             $("#message").empty();
             $("#message").append(html).css("color","red").fadeIn('slow');
             $('#message').delay(1000).fadeOut('slow');
             $('.modal-backdrop').remove();
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

            var html='<div class="modal-dialog" role="document"  style=" align-self: center;width:70%;">'
            html+='<div class="modal-content" >'
            html+='<form><div class="modal-body">'
            html+='<table class="genral" style="width:100%;"><tbody>'
            html+='<colgroup><col style="width:22%;"/><col style="width:22%;"/><col style="width:22%;"/><col style="width:22%;"/> </colgroup>'
            html+='<tr><td><h3 class=" glyphicon glyphicon-cog " id="ECMGModalLabel" >New ECMG</h3></td></tr>'
            html+='<tr>'
            html+='<td>Alias:</td>'
            html+='<td ><input type="text" class="form-control-default ecmg_modal" id="Alias"  style="margin-bottom:2%;"></td>'
            html+='<td>Cryptoperiod</td>'
            html+='<td><input type="text" class="form-control-default ecmg_modal"  id="Cryptoperiod"  style="margin-bottom:2%;"> Sec</td>'
            html+='</tr>'
            html+='<tr>'
            html+='<td></td><td></td>'
            html+='<td></td><td><span id="error_Cryptoperiod" style="color: red"></span></td>'
            html+='</tr>'
            html+='<tr>'
            html+='<td>Super CAS ID:(Hex)</td>'
            html+='<td><input type="text" class="form-control-default ecmg_modal"  id="super_CAS_id"   style="margin-bottom:2%;" ></td>'
            html+='<td>Ip Address:</td>'
            html+='<td><input type="text" class="form-control-default ecmg_modal" id="ipAddress"   style="margin-bottom:2%;"></td>'
            html+='</tr>'
            html+='<tr>'
            html+='<td></td><td><span id="error_super_CAS_id" style="color: red"></span></td><td></td><td><span id="error_ipaddress" style="color: red"></span></td></tr>'
            html+='<tr>'
            html+='<td>Port:</td>'
            html+='<td><input type="text" class="form-control-default ecmg_modal" value="" id="Port"   style="margin-bottom:2%;"></td>'
            html+='<td>Channel ID:</td>'
            html+='<td><input type="text" value='+id+' class="form-control-default ecmg_modal" id="Channel_id"   style="margin-bottom:2%;"></td>'
            html+='</tr>'
           
          
            html+='<tr>'
            html+='<td></td>'
            html+='<td><span id="error_port" style="color: red"></span></td>'
            html+='<td></td>'
            html+='<td></td>'
            html+='</tr>'
            
            html+='</tbody></table>'
            html+='</div>'
            html+='<div class="modal-footer"><button type="button" class="btn btn-default" disabled="Disable" id ="ECMG_onclick" onclick="ecmg_onclick();" data-dismiss="modal">SAVE </button><button type="button" class="btn btn-default" data-dismiss="modal" >Cancel</button></div></form></div></div>'

            $("#ECMGModal").append(html);

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
      $("#error_channel_id").html("Channel Id Should not be Empty");
      $("#error_channel_id").show();
      return false;
     }
    else if (text1>0 && text1<1024 ) {
      $("#error_channel_id").hide();
      return true;
    }
    else
    {
      $("#error_channel_id").html("Invalid Channel Id");
      $("#error_channel_id").show();
      return false;
    }
}
function check_super_CAS_id()
{
    var text = $("#super_CAS_id").val().trim();
    var pattern = new RegExp(/^[0]{1}[x]{1}[0-9a-fA-F]{1,10}$/i);
    if(pattern.test(text))
    {  
        $("#error_super_CAS_id").hide();
        return true;
    }    
    else
    {
      $("#error_super_CAS_id").html("Invalid Super Cas Id ");
      $("#error_super_CAS_id").show();
      return false;
    }
}
function check_ipAddress()  
{
   $("#error_ipaddress").hide();
  var text=$("#ipAddress").val().trim();
  var pattern=new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);
  if (text=='') {
      $("#error_ipaddress").html("Ip address Should Not be Empty");
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
  $("#error_port").hide();
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
      $("#error_port").html("Invalid Port Number");
      $("#error_port").show();
      return false;
   }
}
function check_Cryptoperiod ()
{
  $("#error_Cryptoperiod").hide();
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
     $("#error_Cryptoperiod").html("should be in the range of 0-90");
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
  
    var result = confirm("Want to add new ECMG?");
    if(result)
    {
      $.ajax({
      url: 'index.php?route=common/dashboard/addECMGChannel&token=<?php echo $token; ?>&ip_Address=' + ip_Address+'&port=' +port+'&super_CAS_Id=' +super_CAS_Id + '&ecmg_Channel_Id='+ecmg_Channel_Id+ '&Alias=' + Alias+  '&Cryptoperiod=' + Cryptoperiod,
      error:function()
      {
                     var html='<b>Error While adding ECMG channel</b>';
                      $("#message").empty();
                       $("#message").append(html).css("color","red").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
      },
      success: function(data) 
      {
        
        if(data==1)
        {
                     var html='<b>ECMG Added Successfully</b>';
                      $("#message").empty();
                       $("#message").append(html).css("color","green").fadeIn('slow');
                       $('#message').delay(1000).fadeOut('slow');
          
            
            var html='<table class="panel2" data-toggle="collapse" >'
                html+='<colgroup>'
                  html+='<col style="width: 4%;" />'
                  html+='<col style="width: 33%;" />'
                  html+='<col style="width: 5%;" />'
                 html+='<col style="width: 5%;" />'
                  html+='<col style="width: 5%;" />'
               html+='</colgroup>'
               html+='<tr>'
                 html+='<td></td>'
                html+='<td style="text-overflow:ellipsis; overflow:hidden;"><span><b>'+Alias+'</b></td>'
                  html+='<td></td>'
                  html+='<td></td>'
                  html+='<td></td>'
               html+='</tr>'
              html+='</table>'
              $("#ECMG").append(html);
        }
        else
        {      
           $("#message").empty();
           $("#message").append(data).css("color","red").fadeIn('slow');
           $('#message').delay(1000).fadeOut('slow');
        }
      },
    type: 'POST'
    });
    }           
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


/***********************CAS**************************/

$(document).on("click",'#emmg_plus',function (e){
  e.stopPropagation();
});
$(document).on("click",'#ECMG_add',function (e){
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
                 $("table.panel1 tr:even").css("background-color","#E0FFFF").hover(function(){
                  $(this).css('background-color','lightblue');
                },function(){
                        $(this).css('background-color','#E0FFFF');     
                  });

                $("table.panel1 tr:even").css("background-color","#E0FFFF").click(function(){
                  $(this).css('background-color','orange');
                });
});

/*$("#cas_pannel").click(function()
{
  var aria_expanded=$("#cas_pannel").attr("aria-expanded");
  
  if(aria_expanded=="true")
  {
 
    $("#cas_pannel").collapse('hide');
  }
  else
  {
   $("#cas_pannel").attr('aria-expanded','true');
  }
});*/
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
              $("#message").empty();
             $("#message").append(html).css("color","red").fadeIn('slow');
             $('#message').delay(1000).fadeOut('slow');
            },
            success: function(data) 
                {
                  var html="<b>Password Updated Succesfully</b>";
                 $("#message").empty();
                 $("#message").append(html).css("color","red").fadeIn('slow');
                 $('#message').delay(1000).fadeOut('slow');
                },
            type: 'POST'
        });
      }
}


</script>
