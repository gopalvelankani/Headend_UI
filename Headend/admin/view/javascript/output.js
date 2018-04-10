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