<?php echo $header; ?>
<!DOCTYPE html>
<html >
<head>
    <title>SELECT INPUTS</title>
    <meta charset="UTF-8" />
      
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
        <script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
         <link rel="stylesheet" type="text/css" href="view/javascript/bootstrap/css/bootstrap1.min.css">
        <link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
        <link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
        <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
        <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
        <script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
        <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
        <link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />

        <script src="view/javascript/common.js" type="text/javascript"></script>
        <script src="view/javascript/selection.js" type="text/javascript"></script>
        <script src="view/javascript/jquery.validate.min.js" type="text/javascript"></script>
        

        <script src="view/javascript/headend.js" type="text/javascript"></script>
        <script src="view/javascript/date.js" type="text/javascript"></script>
         <link rel="stylesheet" type="text/css" href="view/javascript/bootstrap/css/bootstrap1.min.css">

         <style type="text/css">
            #loading-img {
                background: url("view/image/loading.gif") center center no-repeat;
                display: none;
                height: 176px;
                width: 308px;
                position: absolute;
                top: 33%;
                left: 1%;
                right: 1%;
                margin: auto;
            }
            
            .button{
                padding: 10px 25px;
            }

            .stream{
                font-size: 15px;
                padding-left: 40px;
                padding-right: 60px;
            }
            .ip{
                width:150px;
                
            }
            .port{
                width:100px;
                
            }
            .overlay {
                background: #e9e9e9;  
                display: none;        
                position: absolute;  
                top: 0;                  
                right: 0;               
                bottom: 0;
                left: 0;
                opacity: 0.5;
            }
            .modalText{

                background-color: #004466; 
                color: white; 
                min-height: 30px; 
                text-align: center;
                padding-top: 5px; 
                min-width: 20px;
            }
            .td{
                padding:0 0px 0 5px; padding-top: 10px;
            }
            .pad{
                margin-top: 1.9px;
            }
            .modal.modal-wide .modal-dialog {
              width: 90%;
            }
            .modal-wide .modal-body {
              overflow-y: auto;
            }
            .blank_row{
              background-color: white;
            }
            
        </style>  
        
</head>
<body>
    
    <div class="container">
      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#section1" >ETHERNET1</a></li>
        <li><a data-toggle="tab" href="#section2" >ETHERNET2</a></li>
        <li><a data-toggle="tab" href="#section3" >ETHERNET3</a></li>
      </ul>
      <div class="tab-content">
        <div id="section1" class="tab-pane fade in active">
          <h3>MXL1</h3>
       <select id="tuner1" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER" > 
       <option value="-1">TUNER1</option>
       <option value="0" channel="1" >IP</option>
       <option value="1" data-id="1" class="updateModel">RF</option>
       </select>
       <select id="tuner2" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">TUNER2</option> 
       <option value="0" channel="2">IP</option>
       <option value="1" data-id="2" class="updateModel">RF</option>
       </select>
       <select id="tuner3" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">TUNER3</option> 
       <option value="0" channel="3">IP</option>
       <option value="1" data-id="3" class="updateModel">RF</option>
       </select>
       <select id="tuner4" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">TUNER4</option> 
       <option value="0" channel="4">IP</option>
       <option value="1" data-id="4" class="updateModel">RF</option>
       </select>
       <select id="tuner5" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">TUNER5</option> 
       <option value="0" channel="5">IP</option>
       <option value="1" data-id="5" class="updateModel">RF</option>
       </select>
       <select id="tuner6" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">TUNER6</option> 
       <option value="0" channel="6">IP</option>
       <option value="1" data-id="6" class="updateModel">RF</option>
       </select>
       <select id="tuner7" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">TUNER7</option> 
       <option value="0" channel="7">IP</option>
       <option value="1" data-id="7" class="updateModel">RF</option>
       </select>
       <select id="tuner8" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
       <option value="-1">TUNER8</option> 
       <option value="0" channel="8">IP</option>
       <option value="1" data-id="8" class="updateModel">RF</option>
       </select>

          <h3>MXL2</h3>
          <select id="tuner9" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
           <option value="-1">TUNER1</option>
           <option value="0" channel="9">IP</option>
           <option value="1" data-id="9" class="updateModel">RF</option>
           </select>
           <select id="tuner10" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER2</option> 
           <option value="0" channel="10">IP</option>
           <option value="1" data-id="10" class="updateModel">RF</option>
           </select>
           <select id="tuner11" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER3</option> 
           <option value="0" channel="11">IP</option>
           <option value="1" data-id="11" class="updateModel">RF</option>
           </select>
           <select id="tuner12" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER4</option> 
           <option value="0" channel="12">IP</option>
           <option value="1" data-id="12" class="updateModel">RF</option>
           </select>
           <select id="tuner13" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER5</option> 
           <option value="0" channel="13">IP</option>
           <option value="1" data-id="13" class="updateModel">RF</option>
           </select>
           <select id="tuner14" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER6</option> 
           <option value="0" channel="14">IP</option>
           <option value="1" data-id="14" class="updateModel">RF</option>
           </select>
           <select id="tuner15" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER7</option> 
           <option value="0" channel="15">IP</option>
           <option value="1" data-id="15" class="updateModel">RF</option>
           </select>
           <select id="tuner16" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER8</option> 
           <option value="0" channel="16">IP</option>
           <option value="1" data-id="16" class="updateModel">RF</option>
           </select>

        </div>
        <div id="section2" class="tab-pane fade">
          <h3>MXL1</h3>

            <select id="tuner17" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
             <option value="-1">TUNER1</option>
             <option value="0" channel="17">IP</option>
             <option value="1" data-id="17" class="updateModel">RF</option>
             </select>
             <select id="tuner18" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">TUNER2</option> 
             <option value="0" channel="18">IP</option>
             <option value="1" data-id="18" class="updateModel">RF</option>
             </select>
             <select id="tuner19" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">TUNER3</option> 
             <option value="0" channel="19">IP</option>
             <option value="1" data-id="19" class="updateModel">RF</option>
             </select>
             <select id="tuner20" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">TUNER4</option>
             <option value="0" channel="20">IP</option>
             <option value="1" data-id="20" class="updateModel">RF</option>
             </select>
             <select id="tuner21" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">TUNER5</option> 
             <option value="0" channel="21">IP</option>
             <option value="1" data-id="21" class="updateModel">RF</option>
             </select>
             <select id="tuner22" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">TUNER6</option> 
             <option value="0" channel="22">IP</option>
             <option value="1" data-id="22" class="updateModel">RF</option>
             </select>
             <select id="tuner23" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">TUNER7</option> 
             <option value="0" channel="23">IP</option>
             <option value="1" data-id="23" class="updateModel">RF</option>
             </select>
             <select id="tuner24" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
             <option value="-1">TUNER8</option> 
             <option value="0" channel="24">IP</option>
             <option value="1" data-id="24" class="updateModel">RF</option>
             </select>

          <h3>MXL2</h3>
         <select id="tuner25" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
           <option value="-1">TUNER1</option>
           <option value="0" channel="25">IP</option>
           <option value="1" data-id="25" class="updateModel">RF</option>
           </select>
           <select id="tuner26" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER2</option> 
           <option value="0" channel="26">IP</option>
           <option value="1" data-id="26" class="updateModel">RF</option>
           </select>
           <select id="tuner27" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER3</option> 
           <option value="0" channel="27">IP</option>
           <option value="1" data-id="27" class="updateModel">RF</option>
           </select>
           <select id="tuner28" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER4</option>
           <option value="0" channel="28">IP</option>
           <option value="1" data-id="28" class="updateModel">RF</option>
           </select>
           <select id="tuner29" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER5</option> 
           <option value="0" channel="29">IP</option>
           <option value="1" data-id="29" class="updateModel">RF</option>
           </select>
           <select id="tuner30" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER6</option> 
           <option value="0" channel="30">IP</option>
           <option value="1" data-id="30" class="updateModel">RF</option>
           </select>
           <select id="tuner31" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER7</option> 
           <option value="0" channel="31">IP</option>
           <option value="1" data-id="31" class="updateModel">RF</option>
           </select>
           <select id="tuner32" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
           <option value="-1">TUNER8</option> 
           <option value="0" channel="32">IP</option>
           <option value="1" data-id="32" class="updateModel">RF</option>
           </select>
       

        </div>
        <div id="section3" class="tab-pane fade">
          <h3>MXL1</h3>
              <select id="tuner33" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
               <option value="-1">TUNER1</option>
               <option value="0" channel="33">IP</option>
               <option value="1" data-id="33" class="updateModel">RF</option>
               </select>
               <select id="tuner34" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">TUNER2</option> 
               <option value="0" channel=34>IP</option>
               <option value="1" data-id="34" class="updateModel">RF</option>
               </select>
               <select id="tuner35" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">TUNER3</option> 
               <option value="0" channel="35">IP</option>
               <option value="1" data-id="35" class="updateModel">RF</option>
               </select>
               <select id="tuner36" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">TUNER4</option>
               <option value="0" channel="36">IP</option>
               <option value="1" data-id="36" class="updateModel">RF</option>
               </select>
               <select id="tuner37" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">TUNER5</option> 
               <option value="0" channel="37">IP</option>
               <option value="1" data-id="37" class="updateModel">RF</option>
               </select>
               <select id="tuner38" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">TUNER6</option> 
               <option value="0" channel="38">IP</option>
               <option value="1" data-id="38" class="updateModel">RF</option>
               </select>
               <select id="tuner39" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">TUNER7</option> 
               <option value="0" channel="39">IP</option>
               <option value="1" data-id="39" class="updateModel">RF</option>
               </select>
               <select id="tuner40" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
               <option value="-1">TUNER8</option> 
               <option value="0" channel="40">IP</option>
               <option value="1" data-id="40" class="updateModel">RF</option>
               </select>
       

          <h3>MXL2</h3>
                <select id="tuner41" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER"> 
                 <option value="-1">TUNER1</option>
                 <option value="0" channel="41">IP</option>
                 <option value="1" data-id="41" class="updateModel">RF</option>
                 </select>
                 <select id="tuner42" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">TUNER2</option> 
                 <option value="0" channel="42">IP</option>
                 <option value="1" data-id="42" class="updateModel">RF</option>
                 </select>
                 <select id="tuner43" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">TUNER3</option> 
                 <option value="0" channel="43">IP</option>
                 <option value="1" data-id="43" class="updateModel">RF</option>
                 </select>
                 <select id="tuner44" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">TUNER4</option>
                 <option value="0" channel="44">IP</option>
                 <option value="1" data-id="44" class="updateModel">RF</option>
                 </select>
                 <select id="tuner45" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">TUNER5</option> 
                 <option value="0" channel="45">IP</option>
                 <option value="1" data-id="45" class="updateModel">RF</option>
                 </select>
                 <select id="tuner46" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">TUNER6</option> 
                 <option value="0" channel="46">IP</option>
                 <option value="1" data-id="46" class="updateModel">RF</option>
                 </select>
                 <select id="tuner47" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">TUNER7</option> 
                 <option value="0" channel="47">IP</option>
                 <option value="1" data-id="47" class="updateModel">RF</option>
                 </select>
                 <select id="tuner48" class="btn btn-primary btn-danger dropdown-toggle mxl_drop_down tuner" name="TUNER">
                 <option value="-1">TUNER8</option> 
                 <option value="0" channel="48">IP</option>
                 <option value="1" data-id="48" class="updateModel">RF</option>
                 </select>
            
    </div>
    <!-- modal for ip -->
     <div class="modal modal-wide fade" id="ipModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" >
        <div class="modal-content" style="width: 50%">
          <div class="modal-header">
            <h5 class="modal-title" >IP Settings</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
           <div class="modal-body" >
            <div class="row">
              <div class="container col-xs-12">
                <table class="genral"  id="table<?php echo $IpIn['rmx_no']?>" style="width: 100%">
                      <tr>
                      	<td><b>IP Address</b></td>
                      	<td><b>PORT</b></td>
                      	<td><b>TYPE</b></td>
                      </tr>
                      <tr class="blank_row"></tr>
                    <tr>
                      <td><input type="text" class="ip" name="stuff[]" value="" id="IP"></td>
                      <td><input type="text" class="port" name="stuff[]" value="" id="PORT"></td>
                    <td><select class="type" name="Type" id="Type">
                                <option value="0">Unicast</option>
                                <option value="1">Multicast</option>        
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
            <input type="button" class="btn btn-secondary" id="add_ip" value="Add IP" onclick="addIPInput()"></input>
            <button type="button" class="btn btn-secondary" onclick="deleteIPIN()">Delete IP</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
           

          </div>
        </div>
      </div>
    </div>

    <!-- modal for ip -->
    <div class="modal modal-wide fade" id="tunerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="loginModalTitle">Tunner Settings</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="loginForm" method="post" class="form-horizontal">
             <input type="hidden" name="hiddenValue" id="hiddenValue" value="" />
             <div class="row">

                  <div class="col-xs-6 col-sm-3">
                    
                     <div class="pad">FREQUENCY</div>
                    <br>
                     <div class="pad">RATE</div>
                    <br>
                    <div class="pad">STANDERD</div>
                    <br>
                    <div class="pad">Polarization</div>
                    <br>
                    <div class="pad">LO Frequency</div>
                    <br>
                    <div class="pad">Voltage</div>
                    

                  </div>
                  <div class="col-xs-6 col-sm-3">
                    
                   
                       <div><input type="text"  name="frequency" id="frequency"></div>
                       
                    <br>
                    
                   <div><input type="text"  name="rate" id="rate"></div>
                    
                    <br>

                    <div><select id="standerd" name="standerd">
                      <option value="0">DSS</option>
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
                      <div><select id="Voltage" name="Voltage">
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                    
                    </select></div>
                  </div>
                  <div class="col-xs-6 col-sm-3">
                    
                    <div class="pad">FEC</div>
                    <br>
                    <div class="pad">ROLLOFF</div>
                    <br>            
                    <div class="pad">PILOTS</div>
                    <br>
                    <div class="pad">SPECTRUM INVERTED</div>
                    <br>
                    <div class="pad">MODULATION</div>
                    <br>
                  </div>
                  <div class="col-xs-6 col-sm-3">
                    
                    <div><select id="fec" name="fec">
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
                    <br>

                  </div>
            </div>
            </form>
          </div>
          <div class="modal-footer">
            <span id="error_RFDATA" style="color: red"></span>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary"  id="tuneButton" data-dismiss="modal">Set Tuner</button>

          </div>
          
        </div>
      </div>
    </div>


    <div id="loading-img"></div>
    <div class="overlay"></div>
    <script type="text/javascript">
    	function change()
			 {
			  value = $("#add_ip").val();
			  if(value == "Add IP") $("#add_ip").val("Update IP");
			  else  $("#add_ip").val("Add IP");

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

        /*$('.tuner').each(function(index) {
            
            var check = $('select[name="TUNER"]').find('option[value='+1+']').attr('data-id');
            
            var temp;
            var status="";
            var rmx_id="";
            var mxl_id="";
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
            tuners.forEach(function(eachTuner) {
                if(check==eachTuner['tunerId']){
                    status=eachTuner['status'];
                    demodId=eachTuner['demodId'];
                    console.log(check+" "+eachTuner['tunerId']+" "+status+" "+demodId);

                    if(status==1){

                            $.ajax({

                                url:'index.php?route=common/dashboard/updateMxlstatus&token=<?php echo $token; ?>&tunerId='+check+'&mxl_id='+mxl_id+'&rmx_id='+rmx_id+'&demodId='+demodId,
                                error:function()
                                {

                                  alert('Error while Tuning');


                                },
                                success:function(data)
                                {
                                    var list =JSON.parse(data);
                                    $('.tuner').each(function(index) {
                               
                                    if($(this).find('option[value='+1+']').attr('data-id') == check){
                                       
                                        if(list['locked']==1){
                                            $(this).removeClass("btn-danger").addClass("btn-success");
                                     ;
                                        }else{
                                            $(this).removeClass("btn-danger").addClass("btn-warning");
                                            
                                        }
                                    }
                                        
                                    });
                                  

                                },
                                type: 'POST'
                            });
                        
                }else if(status==0){
                        
                        $.ajax({

                            url:'index.php?route=common/dashboard/updateMxlstatus&token=<?php echo $token; ?>&tunerId='+check+'&mxl_id='+mxl_id+'&rmx_id='+rmx_id+'&demodId='+demodId,
                            error:function()
                            {   
                              alert('Error while Tuning');
                            },
                            success:function(data)
                            {
                                var list = JSON.parse(data);
                                 
                                $('.tuner').each(function(index) {
                               
                                if($(this).find('option[value='+1+']').attr('data-id') == check){
                                   var tunerid=$(this).attr('id');

                                    if(list['locked']==1){

                                         $(this).removeClass("btn-danger").addClass("btn-success");
                                      

                                    }else{
                                          $(this).removeClass("btn-danger").addClass("btn-warning");
                                         
                                        

                                    }
                                } 
                                else
                                {
                                	$(this).removeClass("btn-danger").addClass("btn-danger");
                                }
                                });
                            },
                            type: 'POST'
                        }); 

                    }
                }
                
            });   
        });*/
    });
    /**On hover of each tuner****/
   /* $(".tuner").mouseover(function(){   
        var check=$('select[name="TUNER"]').find('option[value='+1+']').attr('data-id');
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
        tuners.forEach(function(eachTuner) {
            if(check==eachTuner['tunerId']){
                result=eachTuner['demodId'];
                $.ajax({

                    url:'index.php?route=common/dashboard/getMxlstatus&token=<?php echo $token; ?>&tunerId='+check+'&mxl_id='+mxl_id+'&rmx_id='+rmx_id+'&demodId='+result,
                    error:function(){
                      alert('Error while Tuning');

                    },
                    success:function(data){
                        var list =JSON.parse(data);
                        $('.tuner').each(function(index) {
                            
                        if($(this).find('option[value='+1+']').attr('data-id') == check){
                            // alert(check);
                            $(this).find('option[value='+1+']').attr('title','frequency: '+list['frequency']+' rate: '+list['rate']+' '+' status: '+list['locked']);
                          
                            }
                        });  
                    },
                    type: 'POST'
                });
            }
        });
    });*/
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
          var Voltage  =$("#Voltage").prop('selectedIndex');
	        var lo_frequency =$("#LOFrequency").val();
	        var standerd =$("#standerd").prop('selectedIndex');
	        var modulation =$("#modulation").prop('selectedIndex');
	        var fec =$("#fec").prop('selectedIndex');
	        var rolloff =$("#rolloff").prop('selectedIndex');
	        var pilots =$("#pilots").prop('selectedIndex');
	        var spectrumInverted =$("#spectrumInverted").prop('selectedIndex');
          var frequency=$("#frequency").val();
          var rate=$("#rate").val();
	        var auth_bit=rmx_id;

          if (lo_frequency=='' || frequency=='' || rate=='') {
                $("#error_RFDATA").html("Please!Fill all the required parameters");
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
          	              alert('Error while Tuning');
          	              $("#loading-img").css({"display": "none"});
          	              $(".overlay").hide();
          	              location.reload();
          	            },
          	            success:function(data)
          	            {
          	              
          	               $("#loading-img").css({"display": "none"});
          	               $(".overlay").hide();
                           if(data==1)
                           {
                                  alert("Congrats, Successfully Tuned");
                                    $('.tuner').each(function(index) {
                                        if($(this).attr('data-id') == check){
                                            $(this).removeClass("btn-danger").addClass("btn-success");
                                        }
                                    });
                                    location.reload();
                           }
                           else if(data==0)
                           {
                            alert("Sorry, Unable to Tune!");
                           }
                           else
                           {
                            alert("Error while Setting Tuner");
                           }
          	            },
          	            type: 'POST'
          	        });
          	      }
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
          alert('Error');
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
            $('select[name="pilots_name"] option[value='+0+']').attr('selected','selected');
            $('select[name="demodId"] option[value='+0+']').attr('selected','selected');
            $('select[name="lnbId"] option[value='+0+']').attr('selected','selected');
            $('select[name="standerd"] option[value='+0+']').attr('selected','selected');
            $('select[name="modulation"] option[value='+0+']').attr('selected','selected');
            $('select[name="fec"] option[value='+0+']').attr('selected','selected');
            $('select[name="rolloff"] option[value='+0+']').attr('selected','selected');
            $('select[name="spectrumInverted"] option[value='+0+']').attr('selected','selected');
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
          alert('Error');
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
});
function addIPInput()
{
	var ip_data_id = $('option:selected', this).attr('channel');
	
	var ip= $("#IP").val();
	var ippattern=new RegExp(/^^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/);
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
         url:'index.php?route=common/dashboard/addIPInput&token=<?php echo $token; ?>&ip='+ip+'&port='+port+'&channel='+channel+'&rmx_no='+rmx_no+'&type='+type,
        error:function(){
          alert('Error while Adding');
        },
        success:function(data){ 
            if (data==0) {
                  $.ajax({
                  url:'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input_id='+input,
              
                  error:function(){
                    alert('Error');
                  },
                  success:function(data){
                    if(data!=1)
                        {
                          if(data== 0 )
                          {
                            alert("sorry! Input Rate is 0");
                             location.reload();  
                          }
                          else
                          {
                             alert("success");
                             change();
                             location.reload();
                          }
                        }    
                  },
                  type: 'POST'
              });
            
            }
            else if(data==1){
              alert("sorry");
            }
            else if(data== -1)
            {
              alert("Data already exist for same channel");
            }
            else if(data== -2)
            {
              alert("Not able to add on server");
              
            }
            else
            {
              alert("Invalid responce");
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
             url:'index.php?route=common/dashboard/updateIPInput&token=<?php echo $token; ?>&ip='+ip+'&port='+port+'&channel='+channel+'&rmx_no='+rmx_no+'&type='+type,
                error:function(){
                  alert('Error while Updateing');
                 
                },
                success:function(data){ 
                    if (data==0) {
                  $.ajax({
                  url:'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input_id='+input,
                  
                  error:function(){
                    alert('Error');
                  },
                  success:function(data){
                    if(data!=1)
                        {
                          if(data== 0 )
                          {
                              alert("sorry! Input Rate is 0");
                             location.reload();  
                          }
                          else
                          {
                             alert("success");
                             location.reload();
                          }
                        } 
                       
                  },
                  type: 'POST'
              });
                      
                    }
                    else if(data==-2){
                      alert("Sorry ! not able to update on server");
                    }
                    else if(data==1)
                    {
                      alert("Sorry ! not able to update in database");
                    }
                    else
                    {
                      alert("Invalid responce");
                    }
                },
                type: 'POST'
             }); 
    } 	
}
}
else
{
      $("#error_port").html("invalid Port Number");
      $("#error_port").show();
}
}
else
{
     $("#error_ip").html("invalid Ip Address");
     $("#error_ip").show();
}
}
else{
	$("#error_ipModal").html("Please fill all the required parameters");
     $("#error_ipModal").show();
}
}

function deleteIPIN()
{
var ip_data_id = $('option:selected', this).attr('channel');
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
                  alert('Error while Deleting');
                },
                success:function(data){ 
                    if (data==0) {
                      alert("success");
                      location.reload();
                    }
                    else if(data== -2){
                      alert("sorry!not able to delete from server");
                    }
                    else if(data==1)
                    {
                      alert("sorry!not able to delete from database");
                    }
                    else
                    {
                      alert("Invalid responce");
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
	});
   
});
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
                $.ajax({
                  url:'index.php?route=common/dashboard/getMxlstatus&token=<?php echo $token; ?>&mxl_id='+mxl_id+'&rmx_id='+rmx_no+'&demodId='+demod_id,
                   async:false,
                  error:function(){
                    alert('Error while Tuning');

                  },
                  success:function(data){
                      var list =JSON.parse(data);

                      if(list['locked']==0)
                      {
                       color='orange';
                      }
                      else if(list['locked']==1)
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
              else if(tuner_details[RF_data_id-1].Tuner_type == 0){
                $(this).find('option[value='+0+']').attr('selected','selected');

                $.ajax({
                  url:'index.php?route=common/dashboard/getchannelstatus&token=<?php echo $token; ?>&rmx_no='+rmx_no+'&input_id='+demod_id,
                   async:false,
                  error:function(){
                    alert('Error');

                  },
                  success:function(data){
                    if(data!=1)
                        {
                          if(data== 0 )
                          {
                            color='orange';  
                          }
                          else
                          {
                             color='Green';
                          }
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
              else
              {
                $(this).find('option[value='+ -1 +']').attr('selected','selected');
                $(this).css("background-color","#d9534f");
              }

  });
  });

       

	
</script>
