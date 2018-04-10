<?php echo $header; ?>

<!DOCTYPE html>
<html >
<head>
	<title>OUTPUTS</title>
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

        <link href="view/javascript/jquery.dataTables.min.css" type="text/css" rel="stylesheet"/>

        <script src="view/javascript/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="view/javascript/output.js" type="text/javascript"></script>

        <script src="view/javascript/headend.js" type="text/javascript"></script>
        <script src="view/javascript/date.js" type="text/javascript"></script>
         <link rel="stylesheet" type="text/css" href="view/javascript/bootstrap/css/bootstrap1.min.css">

         <style type="text/css">
			.nav-tabs{
				margin-bottom: 20px;
			}	
        </style>  
        
</head>
	
<body>	
	
	<div class="container">

	  <ul class="nav nav-tabs">

	    <li class="active"><a data-toggle="tab" href="#section1" >MXLOUT</a></li>
	    <li><a data-toggle="tab" href="#section2" >IPOUT</a></li>
	    <li><a data-toggle="tab" href="#section3" >CHANNELS</a></li>
	    

	  </ul>

		<div class="tab-content">

		    <div id="section1" class="tab-pane fade in active">
		    	<div id="mxl">
		    		
		    	</div>
		    </div>
		    <div id="section2" class="tab-pane fade">
		    	<div id="ip">
		    		
		    	</div>
		    </div>
		    <div id="section3" class="tab-pane fade">
		    	<div id="channel">
		    		
		    	</div>
		    </div>
		</div>

	</div>
	<!-- <div><?php  var_dump($mxldata); ?></div> -->
	<script type="text/javascript">

	var mxls = <?php echo json_encode($mxldata); ?>;
	var ips = <?php echo json_encode($ipoutdata); ?>;
	var channels = <?php echo json_encode($datachannels); ?>;
	call(mxls,ips,channels);
	function htmlbodyHeightUpdate(){
    var height3 = $( window ).height()
    var height1 = $('.nav').height()+50
    height2 = $('.main').height()
    if(height2 > height3){
        $('html').height(Math.max(height1,height3,height2)+10);
        $('body').height(Math.max(height1,height3,height2)+10);
    }
    else
    {
        $('html').height(Math.max(height1,height3,height2));
        $('body').height(Math.max(height1,height3,height2));
    }

    }
    $(document).ready(function () {
    htmlbodyHeightUpdate()
    $( window ).resize(function() {
        htmlbodyHeightUpdate()
    });
    $( window ).scroll(function() {
        height2 = $('.main').height()
            htmlbodyHeightUpdate()
    });
    });

    function call(mxls,ips,channels){
    /*************************mxl output**********************************/

    var bitrates=[];
    var count=0;
    var parse=false;
    mxls.forEach(function(mxl) {
         console.log(mxl['tunerId'],mxl['mxl_id'],mxl['rmx_id'],mxl['frequency'],mxl['rate'],mxl['demodId'],mxl['signalstrength'],mxl['locked']);

    });

     var html = "<table border='1|1' class='table' id='mymxl' >";   

     html+="<thead>";
     html+="<th>TUNER ID</th>";
     html+="<th>MXL ID</th>";
     html+="<th>RMX ID</th>";
     html+="<th>FREQUENCY</th>";
     html+="<th>RATE</th>";
     html+="<th>DEMOD ID</th>";
     html+="<th>STATUS</th>";
     html+="<th>SIGNAL STRENGTH</th>";
     html+="</thead>";
     html+="<tbody>";

     
    mxls.forEach(function(mxl) {
        html+="<tr class='active'>";
        html+="<td>"+mxl['tunerId']+"</td>";
        html+="<td>"+mxl['mxl_id']+"</td>";
        html+="<td>"+mxl['rmx_id']+"</td>";
        html+="<td>"+mxl['frequency']+"</td>";
        html+="<td>"+mxl['rate']+"</td>";
        html+="<td>"+mxl['demodId']+"</td>";
        
        if(mxl['locked']==0){
            html+="<td><button type='button' class='channel btn btn-danger' data-toggle='modal' data-target='#tunerModal'></button></td>";
            html+="<td>0.00</td>";
        }else{
            html+="<td><button type='button' class='channel btn btn-success' data-toggle='modal' data-target='#tunerModal'></button></td>";
            html+="<td>"+mxl['signalstrength']+".00</td>";
        }
        
        html+="</tr>";

    });
    html+="</tbody>";
    html+="</table>";
    document.getElementById("mxl").innerHTML = html;
    $('#mymxl').dataTable();
    /******************iptable*******************/


    var bitrates=[];
    var count=0;
    var parse=false;
    // 'ip_address'=>$ip['ip_address'],'port'=>$ip['port'],'payload_interface'=>$ip['payload_interface']);
    ips.forEach(function(ip) {
        console.log(ip['ip_address'],ip['port'],ip['payload_interface'])

    });

     var html = "<table border='1|1' class='table' id='myip'>"; 

     html+="<thead>";
     html+="<th>IP ADDRESS</th>";
     html+="<th>PORT</th>";
     html+="<th>PAYLOAD INTERFACE</th>";
     html+="<th>STATUS</th>";
     html+="<th>RATE</th>";
     html+="</thead>";
     html+="<tbody>";

     
    ips.forEach(function(ip) {
        html+="<tr class='active'>";
        html+="<td>"+ip['ip_address']+"</td>";
        html+="<td>"+ip['port']+"</td>";
        html+="<td>"+ip['payload_interface']+"</td>";
        
        if(ip['signalstrength']==0){
            html+="<td><button type='button' class='channel btn btn-danger' data-toggle='modal' data-target='#tunerModal'></button></td>";
            html+="<td>0.00</td>";
        }else{
            html+="<td><button type='button' class='channel btn btn-success' data-toggle='modal' data-target='#tunerModal'></button></td>";
            html+="<td>"+ip['signalstrength']+".00</td>";
        }
        
        html+="</tr>";

    });
    html+="</tbody>";
    html+="</table>";
    document.getElementById("ip").innerHTML = html;
    $('#myip').dataTable();

    /***********************channel*******************/


    var bitrates=[];
    var count=0;
    var parse=false;
    channels.forEach(function(eachChannel) {
        console.log(eachChannel['channelnumber'],eachChannel['output_channelname'],eachChannel['inputid'],eachChannel['targetid'],eachChannel['changed_ch_number'],eachChannel['changed_ch_name'],eachChannel['Qam_Freq'],eachChannel['rmx_no'])

    });


     var html = "<table border='1|1' class='table' id='mychannel' >";   
     html+="<thead>";
     // html+="<tr>";
     html+="<th>CHANNEL NUMBER</th>";
     html+="<th>CHANNEL NAME</th>";
     html+="<th>FREQUENCY</th>";
     html+="<th>STATUS</th>";
     html+="<th>BITRATE</th>";
     // html+="</tr>";
     html+="</thead>";
     html+="<tbody>";
     
    channels.forEach(function(eachChannel) {
        html+="<tr class='active'>";
        html+="<td>"+eachChannel['channelnumber']+"</td>";
        html+="<td>"+eachChannel['output_channelname']+"</td>";
        html+="<td>"+eachChannel['Qam_Freq']+"</td>";
        
        if(eachChannel['bitrate']==null){
            html+="<td><button type='button' class='channel btn btn-danger' data-toggle='modal' data-target='#tunerModal'></button></td>";
            html+="<td>0.00</td>";
        }else{
            html+="<td><button type='button' class='channel btn btn-success' data-toggle='modal' data-target='#tunerModal'></button></td>";
            html+="<td>"+eachChannel['bitrate']+".00</td>";
        }
        
        html+="</tr>";

    });
    html+="</tbody>";
    html+="</table>";
    document.getElementById("channel").innerHTML = html;
    $('#mychannel').dataTable();
}
	</script>


</body>

</html>