<?php
class ModelCommonDashboardchannels extends Model {
public function addOutputChannels($targetid,$channelnumber=array(),$inputid,$output_channelName=array(),$rmx_no,$Qam_Freq)
{
    $query= "INSERT INTO outputchannels(channelnumber,targetid,inputid,output_channelname,rmx_no,Qam_Freq) values ";
    $para =array();
    $type = '';
    for ($i=0; $i < sizeof($channelnumber); $i++) { 
        $query= $query."($channelnumber[$i],$targetid,$inputid,'$output_channelName[$i]',$rmx_no,$Qam_Freq),";    
    }
    $query =trim($query,',');
     $query = $query." ON DUPLICATE KEY UPDATE Qam_Freq = Qam_Freq;";
    if($stmt = $this->db->query($query))
        $id = 1;
    else
        $id = 0;
    return $id;
}
public function isDuplicate($channlNum,$input,$output,$rmx_no){
    $stmt = $this->db->prepare("SELECT * FROM outputchannels where inputid = ? AND targetid = ? AND rmx_no = ? AND channelnumber = ?");
    $stmt->bind_param("iiii",$input,$output,$rmx_no,$channlNum);
    $stmt->execute();
    $outputchanneldata = array(); 
    $is_exist=0;
    while($stmt->fetch())
    {
        $is_exist = 1;
    }
    $stmt->close();
    return $is_exist;
}
/*public function getOutputChannels($input,$output,$rmx_no)
{
    $stmt = $this->db->prepare("SELECT channelnumber,targetid,inputid,output_channelname FROM outputchannels where inputid = ? AND targetid = ? AND rmx_no = ?");
    $stmt->bind_param("iii",$input,$output,$rmx_no);
    $stmt->execute();

    $stmt->bind_result($ch_number,$output_id,$input_id,$ch_name);
    $outputchanneldata = array(); 
    while($stmt->fetch())
    {
        $tmp = array();
        $tmp["channelnumber"] = $ch_number;
        $tmp["targetid"] = $output_id;
        $tmp["inputid"] = $input_id;
        $tmp["output_channelname"] = $ch_name;
        array_push($outputchanneldata, $tmp);
    }
    $stmt->close();
    return $outputchanneldata;
}*/
public function getOutputActivatedChannels()
{
    $stmt = $this->db->query("SELECT * FROM outputchannels");
    return $stmt->rows;
}
public function getInputOutput()
{
    $stmt = $this->db->query("SELECT * FROM Input_Output");
    return $stmt->rows;
}
public function getOutput()
{
    $stmt = $this->db->query("SELECT DISTINCT(Output) FROM Input_Output");
    return $stmt->rows;
}
public function deleteChannel($channelnumber,$target_id,$inputid,$rmx_no)
{
    $stmt = $this->db->prepare("DELETE FROM outputchannels where channelnumber = ? AND targetid = ? AND inputid = ? AND rmx_no = ?");
    $stmt->bind_param("iiii",$channelnumber,$target_id,$inputid,$rmx_no);
     if($stmt->execute())
        $id = 1;
    else
        $id = 0;
    $stmt->close();
    return $id;
}
public function deleteOutputChannels($input,$output,$rmx,$listPnumbers=array())
{
    $list = array();
    if(sizeof($listPnumbers)== 0){
        $sql="DELETE  FROM outputchannels where inputid = ? AND  targetid = ? AND rmx_no = ? ";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("iii",$input,$output,$rmx);
        $stmt->execute();
    }
   else
   {
     foreach ($listPnumbers as $row) 
        {
            array_push($list,$row["original_service_id"]);
        }
        $plist = implode(',',$list);
        $sql="DELETE  FROM outputchannels where inputid = ? AND  targetid = ? AND rmx_no = ? AND channelnumber NOT IN (".$plist.")";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("iii",$input,$output,$rmx);
        $stmt->execute();   
   }
    foreach ($listPnumbers as $row) {
        $stmt = $this->db->prepare("INSERT INTO outputchannels(channelnumber,targetid,inputid,rmx_no,output_channelname,changed_ch_number,changed_ch_name) values(?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE changed_ch_number = ?, changed_ch_name = ?");
        $stmt->bind_param("iiiisisis",$row["original_service_id"],$output,$input,$rmx,$row["original_name"],$row["new_service_id"], $row["new_name"],$row["new_service_id"], $row["new_name"]);
         $result =$stmt->execute();
    }
    
    $stmt->close();
} 
public function updateOutputChannel($Qam_Freq,$rmx_no,$targetid)
{
    $stmt = $this->db->prepare("UPDATE outputchannels SET Qam_Freq = ? WHERE rmx_no = ? AND targetid = ? ");
    $stmt->bind_param("iii",$Qam_Freq,$rmx_no,$targetid);
    $stmt->execute();
    $stmt->close();  
}   
public function addECMGChannel($ecmg_Channel_Id,$Alias,$Enable,$ip_Address,$port,$super_CAS_Id,$Cryptoperiod)
{
    $stmt = $this->db->prepare("INSERT INTO ecmg_channel(ecmg_channel_id,Alias,Enable,Ip_Address,Port,Super_CAS_Id, Cryptoperiod) values(?,?,?,?,?,?,?)");
    $stmt->bind_param("isisssi",$ecmg_Channel_Id,$Alias,$Enable,$ip_Address,$port,$super_CAS_Id,$Cryptoperiod);
    $result = $stmt->execute();
    $stmt->close();
    return $result;
}
public function getECMGChannel()
{
    $stmt = $this->db->prepare("SELECT ecmg_channel_id,Alias,Enable,Ip_Address,Port,Super_CAS_Id FROM ecmg_channel");
    $ecmg_channeldata = array();
    if($stmt->execute())
    {
        $stmt->bind_result($ecmg_Channel_Id,$Alias,$Enable,$ip_Address,$port,$super_CAS_Id);
        while($stmt->fetch())
        {
            array_push($ecmg_channeldata,array('ecmg_channel_id'=>$ecmg_Channel_Id,'Alias'=>$Alias,'Enable'=>$Enable,'Ip_Address'=>$ip_Address,'Port'=>$port,'Super_CAS_Id'=>$super_CAS_Id));
        }
        $stmt->close();
    }
    return $ecmg_channeldata;
}
public function addEMMGChannel($emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_enable)
{   
    $stmt = $this->db->prepare("INSERT INTO emmg_channel(alias,bandwidth,channel_id,stream_id,client_id,port,data_id,enable) values(?,?,?,?,?,?,?,?)");
    $stmt->bind_param("siiisiii",$emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_enable);
    $result = $stmt->execute();
    $stmt->close();
}
public function getEMMGChannel()
{
    $stmt = $this->db->prepare("SELECT channel_id,alias,client_id,data_id,bandwidth,port,stream_id FROM emmg_channel");
    $emmg_channeldata = array();
    if($stmt->execute())
    {
        $stmt->bind_result($emm_channelid,$emm_alias,$emm_clientid,$emm_dataid,$emm_bw,$emm_port,$emm_streamid);
        while($stmt->fetch())
        {
        array_push($emmg_channeldata,array('channel_id'=>$emm_channelid,'alias'=>$emm_alias,'client_id'=>$emm_clientid,'data_id'=>$emm_dataid,'bandwidth'=>$emm_bw,'port'=>$emm_port,'stream_id'=>$emm_streamid));
        }
            $stmt->close();
    }
    return $emmg_channeldata;
}
/*public function storeIpInput($alias,$ip,$port,$payload_interface)
{
    $stmt = $this->db->prepare("INSERT INTO IP_input(alias,ip_address,port,payload_interface) value(?,?,?,?)");
    $stmt->bind_param("ssis",$alias,$ip,$port,$payload_interface);
    $result = $stmt->execute();
    $stmt->close();
    return $result;
}
public function getIpInputData()
{
    $stmt = $this->db->prepare("SELECT alias,port FROM IP_input");
    $IP_input_data = array();
    if($stmt->execute())
    {
        $stmt->bind_result($alias,$port);
        while($stmt->fetch())
        {
            array_push($IP_input_data,array('alias'=>$alias,'port'=>$port));
        }
        $stmt->close();
    }
    return $IP_input_data;
}*/
public function storeECMStream($ecm_stream_streamid,$ecmg_id,$ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number)
{
    $stmt = $this->db->prepare("INSERT INTO ECMStream(stream_id,ECMGid,alias,access_criteria,ecm_id,cw_group,cp_number) values(?,?,?,?,?,?,?)");
    $stmt->bind_param("iisissi",$ecm_stream_streamid,$ecmg_id,$ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number);
    $result = $stmt->execute();
    $stmt->close();
}
public function getECMStream()
{
    $stmt = $this->db->prepare("SELECT alias,access_criteria,ecm_id,cw_group,stream_id,cp_number,ECMGid FROM ECMStream");
    $ECMStream = array();
    if($stmt->execute())
    {
        $stmt->bind_result($ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_streamid,$ecm_stream_CP_number,$ecmg_id);
        while ( $stmt->fetch())
        {
            array_push($ECMStream,array('ecm_stream_alias'=>$ecm_stream_alias,'ecm_stream_access_criteria'=>$ecm_stream_access_criteria,'ecm_stream_ecmid'=>$ecm_stream_ecmId,'ecm_stream_CW_group'=>$ecm_stream_CW_group,'ecm_stream_streamid'=>$ecm_stream_streamid,'ecm_stream_CP_number'=>$ecm_stream_CP_number,'ecmg_id'=>$ecmg_id));
        }
    }
    $stmt->close();
    return $ECMStream;
}
public function getECMG($channel_id)
{
    $stmt = $this->db->prepare("SELECT ecmg_channel_id,Alias,Enable,Ip_Address,Port,Cryptoperiod,Super_CAS_Id FROM ecmg_channel where ecmg_channel_id = ?");
    $stmt->bind_param("i",$channel_id);
    $stmt->execute();
    $stmt->bind_result($ecmg_channel_id,$alias,$enable,$ip,$port,$cryptoperiod,$super_cas_id);
    $ECMGdata = array(); 
    while($stmt->fetch())
    {
        $ECMGdata = array('ecmg_channel_id'=>$ecmg_channel_id,'Alias'=>$alias,'Enable'=>$enable,'Ip_Address'=>$ip,'Port'=>$port,'Cryptoperiod'=>$cryptoperiod,'Super_CAS_Id'=>$super_cas_id);
    }
    $stmt->close();
    return $ECMGdata;
}
public function updateECMGChannel($ecmg_Channel_Id,$Alias,$Enable,$ip_Address,$port,$super_CAS_Id,$original_id)
{
    $stmt = $this->db->prepare("UPDATE  ecmg_channel SET ecmg_channel_id = ?,Alias = ?,Enable = ?,Ip_Address= ?,Port = ?,Super_CAS_Id = ? WHERE ecmg_channel_id = ?");
    $stmt->bind_param("isisssi",$ecmg_Channel_Id,$Alias,$Enable,$ip_Address,$port,$super_CAS_Id,$original_id);
    $stmt->execute();
    if($ecmg_Channel_Id != $original_id)
    {
            $stmt1 = $this->db->prepare("UPDATE  ECMStream SET ECMGid = ? WHERE ECMGid = ?");
            $stmt1->bind_param("ii",$ecmg_Channel_Id,$original_id);
            $result1 = $stmt1->execute();
            $stmt1->close();
        
    }
    $stmt->close();
}
public function getLastStreamId($ecm_id)
{
    $stmt = $this->db->prepare("SELECT stream_id FROM ECMStream WHERE ECMGid = ?");
    $stmt->bind_param("i",$ecm_id);
    $stmt->execute();
    $stmt->bind_result($stream_id);
    $streamid = '';
    while($stmt->fetch())
    {
        $streamid = $stream_id;
    }
    $stmt->close();
    return $streamid;
}
public function getStreamData($stream_id,$channel_id)
{
    $stmt = $this->db->prepare("SELECT alias,access_criteria,ecm_id,cw_group,cp_number FROM ECMStream where stream_id = ? AND ECMGid = ?");
    $stmt->bind_param("ii",$stream_id,$channel_id);
    $stmt->execute();
    $stmt->bind_result($alias,$access_criteria,$ecm_id,$cw_group,$cp_number);
    $ECMG_stream_data = array(); 
    while($stmt->fetch())
    {
        $ECMG_stream_data = array('alias'=>$alias,'access_criteria'=>$access_criteria,'ecm_id'=>$ecm_id,'cw_group'=>$cw_group,'cp_number'=>$cp_number);
    }
    $stmt->close();
    return $ECMG_stream_data; 
}
public function updateECMStream($ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$original_streamid,$original_ecmg_id)
{
    $stmt = $this->db->prepare("UPDATE  ECMStream SET alias = ?,access_criteria = ?,ecm_id = ?,cw_group= ?,cp_number = ? WHERE stream_id = ? AND ECMGid = ?");
    $stmt->bind_param("ssssiii",$ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$original_streamid,$original_ecmg_id);
    $result = $stmt->execute();
    $stmt->close();    
}
public function deleteECMG($ecmg_id)
{
    $stmt = $this->db->prepare("DELETE FROM ECMStream where ECMGid = ?");
    $stmt->bind_param("i",$ecmg_id);
    if($stmt->execute())
    {
        $stmt1 = $this->db->prepare("DELETE FROM ecmg_channel where ecmg_channel_id = ?");
        $stmt1->bind_param("i",$ecmg_id);
        $stmt1->execute();
        $stmt1->close(); 
    }
    $stmt->close(); 
}
public function deleteECMStream($ecmg_id,$stream_id)
{
    $stmt = $this->db->prepare("DELETE FROM ECMStream where stream_id = ? AND ECMGid = ?");
    $stmt->bind_param("ii",$stream_id,$ecmg_id);
    $stmt->execute();
    $stmt->close();
}
/*public function getChannelData($port)
{
    $stmt = $this->db->prepare("SELECT alias,ip_address FROM IP_input where port = ?");
    $stmt->bind_param("i",$port);
    $stmt->execute();
    $stmt->bind_result($alias,$ip_address);
    $Channel_data = array(); 
    while($stmt->fetch())
    {
        $Channel_data = array('alias'=>$alias,'ip_address'=>$ip_address);
    }
    $stmt->close();
    return $Channel_data; 
}
public function delete_input($port)
{
    $stmt = $this->db->prepare("DELETE FROM IP_input WHERE port = ? ");
    $stmt->bind_param("i",$port);
    if($stmt->execute())
    {
        $stmt1 = $this->db->prepare("DELETE FROM outputchannels WHERE inputid = ?");
        $stmt1->bind_param("i",$port);
        $stmt1->execute();
        $stmt1->close();
    }
    $stmt->close();
}
public function updateInput($alias,$ip,$port,$original_port)
{
    $stmt = $this->db->prepare("UPDATE IP_input SET alias = ?,ip_address =?,port = ? WHERE port = ?");

    $stmt->bind_param("ssii",$alias,$ip,$port,$original_port);
    $result = $stmt->execute();
    $stmt->close();
    return $result;
}*/
public function checkECMID_Duplicate($channelid,$ecmid)
{
    $stmt = $this->db->prepare("SELECT stream_id FROM ECMStream WHERE ECMGid = ? AND ecm_id = ?");
    $stmt->bind_param("ii",$channelid,$ecmid);
    $stmt->execute();
    $stmt->bind_result($check);
    $duplicatedata = array();
    while($stmt->fetch())
    {
        $duplicatedata = array("check"=>$check);
    }
    $stmt->close();
    return $duplicatedata;
}
public function checkValidECMG($ecmg_id)
{
    $stmt = $this->db->prepare("SELECT  ecmg_channel_id FROM ecmg_channel WHERE ecmg_channel_id = ?");
    $stmt->bind_param("i",$ecmg_id);
    $stmt->execute();
    $stmt->bind_result($check);
    $duplicateECMdata = array();
    while($stmt->fetch())
    {
        $duplicateECMdata = array("check"=>$check);
    }
    $stmt->close();
    return $duplicateECMdata;
}
public function getEMMid()
{
    $stmt = $this->db->prepare("SELECT  channel_id FROM emmg_channel");
    $stmt->execute();
    $stmt->bind_result($emm_id);
    $emmid = 0;
    while($stmt->fetch())
    {
        $emmid = $emm_id;
    }
    $stmt->close();
    return $emm_id;
}
public function getEMMGData($channel_id)
{
    $stmt = $this->db->prepare("SELECT channel_id,alias,client_id,data_id,bandwidth,port,stream_id FROM emmg_channel WHERE channel_id = ?");
    $stmt->bind_param("i",$channel_id);
    $emmg_channeldata = array();
    if($stmt->execute())
    {
        $stmt->bind_result($emm_channelid,$emm_alias,$emm_clientid,$emm_dataid,$emm_bw,$emm_port,$emm_streamid);
        while($stmt->fetch())
        {
        $emmg_channeldata = array('channel_id'=>$emm_channelid,'alias'=>$emm_alias,'client_id'=>$emm_clientid,'data_id'=>$emm_dataid,'bandwidth'=>$emm_bw,'port'=>$emm_port,'stream_id'=>$emm_streamid);
        }
            $stmt->close();
    }
    return $emmg_channeldata;
}
public function updateEMMG($emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_enable)
{
     $stmt = $this->db->prepare("UPDATE emmg_channel SET channel_id = ?,port =?,client_id = ?,data_id = ?,alias = ?,enable = ?,bandwidth = ?,stream_id = ? WHERE channel_id = ?");

    $stmt->bind_param("iisisiiii",$emm_channelid,$emm_port,$emm_clientid,$emm_dataid,$emm_alias,$emm_enable,$emm_bw,$emm_streamid,$emm_channelid);
     $stmt->execute();
    $stmt->close();
}
public function enableEMM($output,$rmx_no,$enable,$channel_id)
{
   $stmt = $this->db->prepare("INSERT INTO EMM_descriptor(output,rmx_no,enable,channel_id) values(?,?,?,?)");
    $stmt->bind_param("iiii",$output,$rmx_no,$enable,$channel_id);
    $result = $stmt->execute();
    $stmt->close();   
}
public function getEnableEMM()
{
   
   $stmt = $this->db->prepare("SELECT * FROM EMM_descriptor");      
   $enableEMM = array();
   if($stmt->execute())
    {
        $stmt->bind_result($channel_id,$rmx_no,$output,$enable);
        while ( $stmt->fetch())
        {
            array_push($enableEMM,array('channel_id'=>$channel_id,'rmx_no'=>$rmx_no,'output'=>$output,'enable'=>$enable));
        }
    }
    $stmt->close();
    return $enableEMM;  
}
public function deleteEMMG($channel_id)
{
    $stmt = $this->db->prepare("DELETE FROM emmg_channel WHERE channel_id = ?");
    $stmt->bind_param("i",$channel_id);
    $stmt->execute();
    $stmt->close();
}
public function deleteEMMenable($channel_id)
{
    $stmt = $this->db->prepare("DELETE FROM EMM_descriptor WHERE channel_id = ?");
    $stmt->bind_param("i",$channel_id);
    $stmt->execute();
    $stmt->close();
}
public function changeOutputPid($Old_OutputSid,$new_OutputSid,$input,$output,$rmx_no)
{
    $stmt = $this->db->prepare("UPDATE outputchannels SET changed_ch_number = ? WHERE channelnumber = ? AND inputid = ? AND targetid = ? AND rmx_no = ?");
    $stmt->bind_param("iiiii",$new_OutputSid,$Old_OutputSid,$input,$output,$rmx_no);
    $stmt->execute();
    $stmt->close();
}
public function changechannelname($service_name,$Old_OutputSid,$Enable,$input,$output,$rmx_no)
{
    $stmt = $this->db->prepare("UPDATE outputchannels SET changed_ch_name = ?,Enable_ch_name = ? WHERE channelnumber = ? AND inputid = ? AND targetid = ? AND rmx_no = ?");
    $stmt->bind_param("siiiii",$service_name,$Enable,$Old_OutputSid,$input,$output,$rmx_no);
    if($stmt->execute()){
        return 1;
    }else{
        return 0;
    }
    $stmt->close();
}
public function changechannelprovider($service_provider,$Old_OutputSid,$Enable,$input,$output,$rmx_no)
{
    $stmt = $this->db->prepare("UPDATE outputchannels SET changed_ch_provider = ?,Enable_ch_provider = ? WHERE channelnumber = ? AND inputid = ? AND targetid = ? AND rmx_no = ?");
    $stmt->bind_param("siiiii",$service_provider,$Enable,$Old_OutputSid,$input,$output,$rmx_no);
    $stmt->execute();
    $stmt->close();
}
public function update_password($password,$id)
{   
    $stmt = $this->db->prepare("UPDATE logindetails SET password = ? WHERE id = ?");
    $stmt->bind_param("si",$password,$id);
    $stmt->execute();
    $stmt->close();
}
public function generate_mode($PAT_TEXT,$CAT_TEXT,$SDT_TEXT,$NIT_TEXT,$output,$rmx_no)
{
    $stmt = $this->db->prepare("UPDATE GenerateMode SET Update_PAT = ?,Update_CAT = ?,Update_SDT = ?,Update_NIT = ? WHERE output = ? AND rmx_no = ?");
    $stmt->bind_param("ssssii",$PAT_TEXT,$CAT_TEXT,$SDT_TEXT,$NIT_TEXT,$output,$rmx_no);
    $stmt->execute();
    $stmt->close();  
}
public function get_generate_mode($output,$rmx_no)
{
    $stmt = $this->db->prepare("SELECT Update_PAT,Update_CAT,Update_SDT,Update_NIT FROM GenerateMode WHERE output = ? AND rmx_no = ?");
    $stmt->bind_param("ii",$output,$rmx_no);
    $generateData = array();
    if($stmt->execute())
    {
        $stmt->bind_result($PAT,$CAT,$SDT,$NIT);
        while ( $stmt->fetch())
        {
            array_push($generateData,array('Update_PAT'=>$PAT,'Update_CAT'=>$CAT,'Update_SDT'=>$SDT,'Update_NIT'=>$NIT));
        }
    }
    $stmt->close();
    return $generateData;  
}
/*public function get_NIT_mode()
{
   $stmt = $this->db->prepare("SELECT * FROM nit_modes");      
   $nit_mode = array();
   if($stmt->execute())
    {
        $stmt->bind_result($id,$mode,$is_enable);
        while ( $stmt->fetch())
        {
            array_push($nit_mode,array('id'=>$id,'mode'=>$mode,'is_enable'=>$is_enable));
        }
    }
    $stmt->close();
    return $nit_mode;
}*/
public function pmt_alarm($program_number,$input,$alarm_enable)
{
   $stmt = $this->db->prepare("UPDATE outputchannels SET alarm_enable = ? WHERE channelnumber = ? AND inputid = ?");
   $stmt->bind_param("iii",$alarm_enable,$program_number,$input);
   $stmt->execute();
   $stmt->close();
}
public function get_pmt_alarm($program_number,$input)
{
   $stmt = $this->db->prepare("SELECT alarm_enable FROM outputchannels WHERE channelnumber = ? AND inputid = ?");
   $stmt->bind_param("ii",$program_number,$input);
   $pmt_alarm = array();
    if($stmt->execute())
    {
        $stmt->bind_result($alarm_enable);
        while ( $stmt->fetch())
        {
            array_push($pmt_alarm,array('alarm_enable'=>$alarm_enable));
        }
    }
    $stmt->close();
    return $pmt_alarm; 
}
public function high_priority($Priority_checkbox,$input,$program_number)
{
   $stmt = $this->db->prepare("UPDATE outputchannels SET Priority_checkbox = ? WHERE channelnumber = ? AND inputid = ?");
    $stmt->bind_param("iii",$Priority_checkbox,$program_number,$input);
    $stmt->execute();
    $stmt->close();
}
public function get_high_priority($program_number,$input)
{
   $stmt = $this->db->prepare("SELECT Priority_checkbox FROM outputchannels WHERE channelnumber = ? AND inputid = ?");
    $stmt->bind_param("ii",$program_number,$input);
    $high_priority = array();
    if($stmt->execute())
    {
        $stmt->bind_result($Priority_checkbox);
        while ( $stmt->fetch())
        {
            array_push($high_priority,array('Priority_checkbox'=>$Priority_checkbox));
        }
    }
    $stmt->close();
    return $high_priority; 
}
public function get_RE()
{   
   $rmx=$this->rmx_config()*2;
   $stmt = $this->db->prepare("SELECT Id,RE_name,RE_UniqueID FROM RE_selection limit $rmx");
    $RE_data = array();
    if($stmt->execute())
    {
        $stmt->bind_result($Id,$RE_name,$RE_UniqueID);
        while ( $stmt->fetch())
        {
            array_push($RE_data,array('Id'=>$Id,'RE_name'=>$RE_name,'RE_UniqueID'=>$RE_UniqueID));
        }
    }
    $stmt->close();
    return $RE_data; 
}
public function rmx_config()
{
    $stmt = $this->db->prepare("SELECT no_of_input FROM rmx_config");
    $rmx_data=array();
    if($stmt->execute())
        {
            $stmt->bind_result($no_of_input);
            $stmt->fetch();   
        }
    $stmt->close();
   return $no_of_input;  
}
public function get_Selection()
{
   $stmt = $this->db->prepare("SELECT Selection_name,Selection_Id FROM Selection");
    $Selection_data = array();
    if($stmt->execute())
    {
        $stmt->bind_result($Selection_name,$Selection_Id);
        while ( $stmt->fetch())
        {
            array_push($Selection_data,array('Selection_name'=>$Selection_name,'Selection_Id'=>$Selection_Id));
        }
    }
    $stmt->close();
    return $Selection_data; 
}
public function Qam()
{
   $stmt = $this->db->prepare("SELECT Qam_ID,Qam_name,Ifreq FROM Qam");
    $Qam_data = array();
    if($stmt->execute())
    {
        $stmt->bind_result($Qam_ID,$Qam_name,$Ifreq);
        while ( $stmt->fetch())
        {
            array_push($Qam_data,array('Qam_ID'=>$Qam_ID,'Qam_name'=>$Qam_name,'Ifreq'=>$Ifreq));
        }
    }
    $stmt->close();
    return $Qam_data; 
} 
public function rmx_no()
{
  $stmt = $this->db->prepare("SELECT Qam_ID FROM Qam");  
  $rmx_no=array();
  if($stmt->execute())
    {
        $stmt->bind_result($Qam_ID);
       while($stmt->fetch())
       {
         array_push($rmx_no,array('Qam_ID'=>$Qam_ID));
       }    
    }
 $stmt->close();
 return $rmx_no;
}
public function Qam_freq()
{
   $stmt = $this->db->prepare("SELECT freq_ID,freq_name,qam_id,frequency FROM Qam_freq ");
    $QamFreq_data = array();
    if($stmt->execute())
    {
        $stmt->bind_result($freq_ID,$freq_name,$qam_id,$frequency);
        while ( $stmt->fetch())
        {
            array_push($QamFreq_data,array('freq_ID'=>$freq_ID,'freq_name'=>$freq_name,'qam_id'=>$qam_id,'frequency'=>$frequency));
        }
    }
    $stmt->close();
    return $QamFreq_data; 
}
public function channelFreq($qam_id,$freq_ID)
{
    $stmt = $this->db->prepare("SELECT frequency FROM Qam_freq WHERE qam_id = ? AND freq_ID = ?");
    $stmt->bind_param("ii",$qam_id,$freq_ID);
    if($stmt->execute())
    {
       $stmt->bind_result($frequency);
       $stmt->fetch();
    }
    $stmt->close();
     return $frequency; 
}
public function output_selection()
{
$stmt = $this->db->prepare("SELECT no_of_output FROM rmx_config");
if($stmt->execute())
    {
        $stmt->bind_result($no_of_output);
        $stmt->fetch();   
    }
$stmt->close();
return $no_of_output;
}
public function QamFreqUpdate($Ifreq,$Qam_ID)
{
    $stmt = $this->db->prepare("UPDATE Qam SET Ifreq = ? WHERE Qam_ID = ?");
    $stmt->bind_param("ii",$Ifreq,$Qam_ID);
    $stmt->execute();
    $stmt->close(); 
}
public function FreqUpdate($frequency,$qam_id,$freq_ID)
{
    $stmt = $this->db->prepare("UPDATE Qam_freq SET frequency = ? WHERE qam_id = ? AND freq_ID=? ");
    $stmt->bind_param("iii",$frequency,$qam_id,$freq_ID);
    $stmt->execute();
    $stmt->close(); 
}
public function GEInput()
 {
   $stmt = $this->db->prepare("SELECT GEName FROM GEinput ");
    $GE = array();
    if($stmt->execute())
    {
        $stmt->bind_result($GEName);
        while ( $stmt->fetch())
        {
            array_push($GE,array('GEName'=>$GEName));
        }
    }
    $stmt->close();
    return $GE;   
}
public function addIpStream($Port,$rmx_no,$ip_address,$Qam_id,$payload_interface,$channel_no)
{
 $stmt = $this->db->prepare("INSERT INTO IP_stream(Port,rmx_no,ip_address,Qam_id,payload_interface,channel_no) values(?,?,?,?,?,?)");
    $stmt->bind_param("iisisi",$Port,$rmx_no,$ip_address,$Qam_id,$payload_interface,$channel_no);
    if($stmt->execute())
        $id = 1;
    else
        $id = 0;
    $stmt->close();
    return $id;
}
public function getIpStream($rmx_no =-1,$output=-1)
{
    if($rmx_no==-1){
         $stmt = $this->db->prepare("SELECT ip_address,port,payload_interface,rmx_no,Qam_id,channel_no,id FROM IP_stream ");
            $IP_data = array();
            if($stmt->execute())
            {
                $stmt->bind_result($Ip_Address,$Port,$payload_interface,$rmx_no,$Qam_id,$channel_no,$id);
                while ($stmt->fetch())
                {
                    array_push($IP_data,array('Ip_Address'=>$Ip_Address,'Port'=>$Port,'payload_interface'=>$payload_interface,'rmx_no'=>$rmx_no,'Qam_id'=>$Qam_id,'channel_no'=>$channel_no,'id'=>$id));
                }
            }
            $stmt->close();
            return $IP_data;
        }else{
            $stmt = $this->db->prepare("SELECT ip_address,port,payload_interface,rmx_no,Qam_id,channel_no,id FROM IP_stream WHERE rmx_no= ? AND channel_no = ?");
            $stmt->bind_param("ii",$rmx_no,$output);
            $IP_data = array();
            if($stmt->execute())
            {
                $stmt->bind_result($Ip_Address,$Port,$payload_interface,$rmx_no,$Qam_id,$channel_no,$id);
                if($stmt->fetch())
                {
                    $IP_data = array('Ip_Address'=>$Ip_Address,'Port'=>$Port,'payload_interface'=>$payload_interface,'rmx_no'=>$rmx_no,'Qam_id'=>$Qam_id,'channel_no'=>$channel_no,'id'=>$id);
                }
            }
            $stmt->close();
            return $IP_data;
        }
}

public function deleteIP($port,$rmx_no,$ip_address,$channel_no)
{
    $stmt = $this->db->prepare("DELETE FROM IP_stream WHERE port = ? AND rmx_no = ? AND ip_address = ? AND channel_no = ?");
    $stmt->bind_param("iisi",$port,$rmx_no,$ip_address,$channel_no);
    if($stmt->execute())
        $id = 1;
    else
        $id = 0;
    $stmt->close();
    return $id;
}
public function updateIpStream($port,$ip_address,$channel_no,$id)
{
    $stmt = $this->db->prepare("UPDATE IP_stream SET port = ?,ip_address = ?,channel_no = ? WHERE id = ? ");
    $stmt->bind_param("isii",$port,$ip_address,$channel_no,$id);
    if($stmt->execute())
        $id = 1;
    else
        $id = 0;
    $stmt->close();
    return $id;
}
public function addIPInput($ip,$port,$channel,$rmx_no,$type)
{
    $stmt = $this->db->prepare("SELECT * FROM IP_input WHERE channel = ? AND rmx_no = ?");
    $stmt->bind_param("ii",$channel,$rmx_no);
    $stmt->execute();
    if($stmt->fetch())
    {
      $id=-1;
      $stmt->close();
      return $id;
    }    
    else
    {
      $stmt = $this->db->prepare("INSERT INTO IP_input(ip,port,channel,rmx_no,type) values(?,?,?,?,?)");
      $stmt->bind_param("siiii",$ip,$port,$channel,$rmx_no,$type);
      if($stmt->execute())
            $id = 0;
      else
            $id = 1;
      $stmt->close();
      return $id;  
    }   
}
public function updateIPInput($ip,$port,$channel,$type,$rmx_no)
{
    $stmt = $this->db->prepare("UPDATE IP_input SET ip = ?,port = ?,type = ? WHERE rmx_no = ? AND channel = ?");
    $stmt->bind_param("siiii",$ip,$port,$type,$rmx_no,$channel);
    if($stmt->execute())
        $id = 0;
    else
        $id = 1;
    $stmt->close();
    return $id;
}
public function deleteIPInput($ip,$port,$channel,$rmx_no,$type)
{
    $stmt = $this->db->prepare("DELETE FROM IP_input WHERE ip = ? AND port = ? AND channel = ? AND rmx_no = ? AND type = ?");
    $stmt->bind_param("siiii",$ip,$port,$channel,$rmx_no,$type);
    if($stmt->execute())
        $id = 0;
    else
        $id = 1;
    $stmt->close();
    return $id;
}
public function getIpInputData()
{
    $stmt = $this->db->prepare("SELECT ip,port,channel,rmx_no,type,id FROM IP_input");
    $IP_input_data = array();
    if($stmt->execute())
    {
        $stmt->bind_result($ip,$port,$channel,$rmx_no,$type,$id);
        while($stmt->fetch())
        {
            array_push($IP_input_data,array('ip'=>$ip,'port'=>$port,'channel'=>$channel,'rmx_no'=>$rmx_no,'type'=>$type,'id'=>$id));
        }
        $stmt->close();
    }
    return $IP_input_data;
}
public function getIpInput($channel,$rmx_no)
{
    $stmt = $this->db->prepare("SELECT ip,port,channel,rmx_no,type FROM IP_input WHERE channel = ? AND rmx_no = ?");
    $stmt->bind_param("ii",$channel,$rmx_no);
    $ipdata = array();
    if($stmt->execute())
    {
        $stmt->bind_result($ip,$port,$channel,$rmx_no,$type);
       while ( $stmt->fetch())
        {
            array_push($ipdata,array('ip'=>$ip,'port'=>$port,'channel'=>$channel,'rmx_no'=>$rmx_no,'type'=>$type));
        }
        
    }
    $stmt->close();
   return $ipdata; 
}
 
 /************************************************************************************
                    TUNER FUNCTIONS
*************************************************************************************/
public function tuneToFrequency($mxl_id,$rmx_id,$tunerId,$status,$demodId,$lnbId,$standard,$frequency,$rate,$modulation,$fec,$rolloff,$pilots,$spectrumInverted,$polarization,$lo_frequency,$Voltage)
{
    $stmt = $this->db->prepare("INSERT INTO tuned_frequencies(mxl_id,rmx_id,tunerId,status,demodId,lnbId,standard,frequency,rate,modulation,fec,rolloff,pilots,spectrumInverted,polarization,lo_frequency,Voltage) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE mxl_id=VALUES(mxl_id),rmx_id=VALUES(rmx_id),status=VALUES(status),demodId=VALUES(demodId),lnbId=VALUES(lnbId),standard=VALUES(standard),frequency=VALUES(frequency),rate=VALUES(rate),modulation=VALUES(modulation),fec=VALUES(fec),rolloff=VALUES(rolloff),pilots=VALUES(pilots),spectrumInverted=VALUES(spectrumInverted),polarization=VALUES(polarization),lo_frequency=VALUES(lo_frequency),Voltage=VALUES(Voltage)");
    $stmt->bind_param("iiiiiisiisssssiii",$mxl_id,$rmx_id,$tunerId,$status,$demodId,$lnbId,$standard,$frequency,$rate,$modulation,$fec,$rolloff,$pilots,$spectrumInverted,$polarization,$lo_frequency,$Voltage);
    $result = $stmt->execute();
    $stmt->close();
}
public function updateDemodStatus($tunerId,$status)
{
    $stmt = $this->db->prepare("INSERT INTO tuned_frequencies(tunerId,status) values(?,?) ON DUPLICATE KEY UPDATE status=VALUES(status)");
    $stmt->bind_param("ii",$tunerId,$status);
    $result = $stmt->execute();
    $stmt->close();
}
public function getStatus()
{
   $stmt = $this->db->prepare("SELECT tunerId,status,frequency,rate,demodId FROM tuned_frequencies");
    $status_data = array();
    if($stmt->execute()){
        $stmt->bind_result($tunerId,$status,$frequency,$rate,$demodId);
        while ( $stmt->fetch()){
            array_push($status_data,array('tunerId'=>$tunerId,'status'=>$status,'frequency'=>$frequency,'rate'=>$rate,'demodId'=>$demodId));
        }
    }
    return $status_data; 
}
public function getTunedFrequencies($tuner_id)
{
   $stmt = $this->db->prepare("SELECT demodId,lnbId,standard,frequency,rate,fec,modulation,polarization,spectrumInverted,lo_frequency,rolloff,pilots,status,Voltage FROM tuned_frequencies WHERE tunerId = ?");
    $stmt->bind_param("i",$tuner_id);
    $tuned_data = array();
    if($stmt->execute()){
        $stmt->bind_result($demodId,$lnbId,$standard,$frequency,$rate,$fec,$modulation,$polarization,$spectrumInverted,$lo_frequency,$rolloff,$pilots,$status,$Voltage);
        while ( $stmt->fetch()){
            $tuned_data = array('demodId'=>$demodId,'lnbId'=>$lnbId,'standard'=>$standard,'frequency'=>$frequency,'rate'=>$rate,'fec'=>$fec,'modulation'=>$modulation,'polarization'=>$polarization,'spectrumInverted'=>$spectrumInverted,'lo_frequency'=>$lo_frequency,'rolloff'=>$rolloff,'pilots'=>$pilots,'status'=>$status,'Voltage'=>$Voltage);
        }
    }
    return $tuned_data; 
}


 /************************************************************************************
                CHANNEL OUTPUT FUNCTIONS
*************************************************************************************/
public function getoutputChannelwithFrequency()
{
   $stmt = $this->db->prepare("SELECT channelnumber,output_channelname,inputid,targetid,changed_ch_number,changed_ch_name,Qam_Freq,rmx_no FROM outputchannels");
    $channeldata = array();
    if($stmt->execute()){
        $stmt->bind_result($channelnumber,$output_channelname,$inputid,$targetid,$changed_ch_number,$changed_ch_name,$qam_frequency,$rmx_no);
        while ( $stmt->fetch()){
            array_push($channeldata,array('channelnumber'=>$channelnumber,'output_channelname'=>$output_channelname,'inputid'=>$inputid,'targetid'=>$targetid,'changed_ch_number'=>$changed_ch_number,'changed_ch_name'=>$changed_ch_name,'Qam_Freq'=>$qam_frequency,'rmx_no'=>$rmx_no));
        }
    }
    return $channeldata; 
}
public function getMxlData()
{
   $stmt = $this->db->prepare("SELECT tunerId,mxl_id,rmx_id,status,frequency,rate,demodId FROM tuned_frequencies");
    $status_data = array();
    if($stmt->execute()){
        $stmt->bind_result($tunerId,$mxl_id,$rmx_id,$status,$frequency,$rate,$demodId);
        while ( $stmt->fetch()){
            array_push($status_data,array('tunerId'=>$tunerId,'mxl_id'=>$mxl_id,'rmx_id'=>$rmx_id,'status'=>$status,'frequency'=>$frequency,'rate'=>$rate,'demodId'=>$demodId));
        }
    }
    return $status_data; 
}

public function addScrablingServices($rmx_no,$input,$output,$programNumbers,$includeFlag,$keyids,$scramble,$parity)
{
    $stmt = $this->db->prepare("INSERT INTO scrambledServices(rmx_no,input,output,programNumbers,includeFlag,keyids,scramble,parity) values(?,?,?,?,?,?,?,?)");
    $stmt->bind_param("iiiiiiii",$rmx_no,$input,$output,$programNumbers,$includeFlag,$keyids,$scramble,$parity);
    $result = $stmt->execute();
    $stmt->close();
}

public function deleteScrablingServices($rmx_no,$input,$output,$programNumbers)
{
    $stmt = $this->db->prepare("DELETE FROM scrambledServices where programNumbers = ? AND input = ? AND output = ? AND rmx_no = ?");
    $stmt->bind_param("iiii",$programNumbers,$input,$output,$rmx_no);
    $result = $stmt->execute();
    $stmt->close();
}
public function getScrambledServices()
{
  $stmt = $this->db->prepare("SELECT * FROM scrambledServices");
  $Scrambled_services = array();
    if($stmt->execute()){
        $stmt->bind_result($programNumbers,$rmx_no,$input,$output,$includeFlag,$keyids,$parity,$scramble);
        while ( $stmt->fetch()){
            array_push($Scrambled_services,array('programNumbers'=>$programNumbers,'rmx_no'=>$rmx_no,'input'=>$input,'output'=>$output,'includeFlag'=>$includeFlag,'keyids'=>$keyids,'parity'=>$parity,'scramble'=>$scramble));
        }
    }
    return $Scrambled_services;  
}
public function addTunertype($Mxl_ID,$Tuner_ID,$Tuner_type)
{
    $stmt = $this->db->prepare("UPDATE Tuner_details SET Tuner_type = ? WHERE Mxl_ID = ? AND Tuner_ID = ?");
    $stmt->bind_param("iii",$Tuner_type,$Mxl_ID,$Tuner_ID);
    if($stmt->execute())
        $id = 0;
    else
        $id = 1;
    $stmt->close();
    return $id;
}
public function getTunerDetails()
{
 $stmt = $this->db->prepare("SELECT Tuner_ID,Mxl_ID,Tuner_type FROM Tuner_details");
 $Tuner_details = array();
    if($stmt->execute()){
        $stmt->bind_result($Tuner_ID,$Mxl_ID,$Tuner_type);
        while ( $stmt->fetch()){
            array_push($Tuner_details,array('Tuner_ID'=>$Tuner_ID,'Mxl_ID'=>$Mxl_ID,'Tuner_type'=>$Tuner_type));
        }
    }
    return $Tuner_details; 
}
}
