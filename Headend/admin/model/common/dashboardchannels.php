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
    $stmt = $this->db->prepare("SELECT * FROM outputchannels where  targetid = ? AND rmx_no = ? AND channelnumber = ?");
    $stmt->bind_param("iii",$output,$rmx_no,$channlNum);
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
public function isDuplicateServiceId($channlNum){
    $stmt = $this->db->prepare("SELECT * FROM outputchannels where changed_ch_number = ? ");
    $stmt->bind_param("i",$channlNum);
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
public function isDuplicateServiceName($chName,$output,$rmx_no)
{
   $stmt = $this->db->prepare("SELECT * FROM outputchannels where "."'".$chName."'"." IN (changed_ch_name,output_channelname) AND targetid = ? AND rmx_no = ? ");
    $stmt->bind_param("ii",$output,$rmx_no);
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
    $stmt = $this->db->query("SELECT * FROM outputchannels order by  channelnumber asc ,changed_ch_number asc ");
    return $stmt->rows;
}
public function getTSActivatedChannels($rmx_no,$targetid)
{
    $stmt = $this->db->prepare("SELECT CASE WHEN changed_ch_number != -1 THEN changed_ch_number ELSE channelnumber END AS service_id FROM outputchannels WHERE rmx_no=? AND targetid = ? order by  service_id asc  ");
    $stmt->bind_param("ii",$rmx_no,$targetid);
    $service_id_list=array();
    if($stmt->execute())
        {
            $stmt->bind_result($service_id);
             while($stmt->fetch())
              {
                 array_push($service_id_list,$service_id);
              }
            $stmt->close();  
        } 
    return $service_id_list;
}
public function getChangedServiceId($input)
{
    $stmt = $this->db->prepare("SELECT changed_ch_number FROM outputchannels WHERE inputid = ?");
     $stmt->bind_param("i",$inputid);
    $changed_service_id=array();
    
     if($stmt->execute())
        {
            $stmt->bind_result($changed_ch_number);
             while($stmt->fetch())
              {
                 array_push($changed_service_id,$changed_ch_number);
            }
            $stmt->close();  
        } 
    
    return $changed_service_id;  
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
public function deleteOutchannels($inputid,$rmx_no)
{
       /* $sql="DELETE  FROM outputchannels where inputid = ? AND rmx_no = ? ";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("ii",$inputid,$rmx_no);
        $stmt->execute();*/ 

    $stmt = $this->db->prepare("DELETE  FROM outputchannels where inputid = ? AND rmx_no = ? ");
    $stmt->bind_param("ii",$inputid,$rmx_no);
    $stmt->execute();
    $stmt->close();  
}
public function updateOutputChannel($Qam_Freq,$rmx_no,$targetid)
{
    $stmt = $this->db->prepare("UPDATE outputchannels SET Qam_Freq = ? WHERE rmx_no = ? AND targetid = ? ");
    $stmt->bind_param("iii",$Qam_Freq,$rmx_no,$targetid);
    $stmt->execute();
    $stmt->close();  
}  
public function StoreLcn($output,$input,$programNumber,$rmx_no,$Lcn)
{
    $stmt = $this->db->prepare("UPDATE outputchannels SET Lcn = ? WHERE rmx_no = ? AND targetid = ? AND inputid = ? AND channelnumber = ? ");
    $stmt->bind_param("iiiii",$Lcn,$rmx_no,$output,$input,$programNumber);
    $stmt->execute();
    $stmt->close();   
}

public function addECMGChannel($ecmg_Channel_Id,$Alias,$ip_Address,$port,$super_CAS_Id,$Cryptoperiod)
{
    $stmt = $this->db->prepare("INSERT INTO ecmg_channel(ecmg_channel_id,Alias,Ip_Address,Port,Super_CAS_Id, Cryptoperiod) values(?,?,?,?,?,?)");
    $stmt->bind_param("issisi",$ecmg_Channel_Id,$Alias,$ip_Address,$port,$super_CAS_Id,$Cryptoperiod);
    $result = $stmt->execute();
    $stmt->close();
    return $result;
}
public function getECMGChannel()
{
    $stmt = $this->db->prepare("SELECT ecmg_channel_id,Alias,Ip_Address,Port,Super_CAS_Id,Cryptoperiod FROM ecmg_channel");
    $ecmg_channeldata = array();
    if($stmt->execute())
    {
        $stmt->bind_result($ecmg_Channel_Id,$Alias,$ip_Address,$port,$super_CAS_Id,$Cryptoperiod);
        while($stmt->fetch())
        {
            array_push($ecmg_channeldata,array('ecmg_channel_id'=>$ecmg_Channel_Id,'Alias'=>$Alias,'Ip_Address'=>$ip_Address,'Port'=>$port,'Super_CAS_Id'=>$super_CAS_Id,'Cryptoperiod'=>$Cryptoperiod));
        }
        $stmt->close();
    }
    return $ecmg_channeldata;
}
public function addEMMGChannel($emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_pid)
{   
    $stmt = $this->db->prepare("INSERT INTO emmg_channel(alias,bandwidth,channel_id,stream_id,client_id,port,data_id,emm_pid) values(?,?,?,?,?,?,?,?)");
    $stmt->bind_param("siiisiii",$emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_pid);
    $result = $stmt->execute();
    $stmt->close();
}
public function getEMMGChannel()
{
    $stmt = $this->db->prepare("SELECT channel_id,alias,client_id,data_id,bandwidth,port,stream_id,emm_pid FROM emmg_channel");
    $emmg_channeldata = array();
    if($stmt->execute())
    {
        $stmt->bind_result($emm_channelid,$emm_alias,$emm_clientid,$emm_dataid,$emm_bw,$emm_port,$emm_streamid,$emm_pid);
        while($stmt->fetch())
        {
        array_push($emmg_channeldata,array('channel_id'=>$emm_channelid,'alias'=>$emm_alias,'client_id'=>$emm_clientid,'data_id'=>$emm_dataid,'bandwidth'=>$emm_bw,'port'=>$emm_port,'stream_id'=>$emm_streamid,'emm_pid'=>$emm_pid));
        }
            $stmt->close();
    }
    return $emmg_channeldata;
}

public function storeECMStream($ecm_stream_streamid,$ecmg_channel_id,$ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$ecm_pid,$rmx_no)
{
    $stmt = $this->db->prepare("INSERT INTO ECMStream(stream_id,ECMGid,alias,access_criteria,ecm_id,cw_group,cp_number,ecm_pid,rmx_no) values(?,?,?,?,?,?,?,?,?)");
    $stmt->bind_param("iisiisiii",$ecm_stream_streamid,$ecmg_channel_id,$ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$ecm_pid,$rmx_no);
     if($stmt->execute())
     {
        $resp=1;
     } 
     else
        {
            $resp=2;
        }
    $stmt->close();
    return $resp;
}
public function getECMStream()
{
    $stmt = $this->db->prepare("SELECT alias,access_criteria,ecm_id,cw_group,stream_id,cp_number,ECMGid,ecm_pid,rmx_no FROM ECMStream");
    $ECMStream = array();
    if($stmt->execute())
    {
        $stmt->bind_result($ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_streamid,$ecm_stream_CP_number,$ecmg_id,$ecm_pid,$rmx_no);
        while ( $stmt->fetch())
        {
            array_push($ECMStream,array('ecm_stream_alias'=>$ecm_stream_alias,'ecm_stream_access_criteria'=>$ecm_stream_access_criteria,'ecm_stream_ecmid'=>$ecm_stream_ecmId,'ecm_stream_CW_group'=>$ecm_stream_CW_group,'ecm_stream_streamid'=>$ecm_stream_streamid,'ecm_stream_CP_number'=>$ecm_stream_CP_number,'ecmg_id'=>$ecmg_id,'ecm_pid'=>$ecm_pid,'rmx_no'=>$rmx_no));
        }
    }
    $stmt->close();
    return $ECMStream;
}
public function getECMStreampid($stream_id,$ECMGid)
{
    $stmt = $this->db->prepare("SELECT ecm_pid FROM ECMStream WHERE stream_id = ? AND ECMGid = ?");
    $stmt->bind_param("ii",$stream_id,$ECMGid);
      if($stmt->execute())
        {
            $stmt->bind_result($ecm_pid);
            $stmt->fetch();   
        } 
    $stmt->close();
    return $ecm_pid;
}
public function validateEMMInputPara($emm_alias,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_pid,$is_update)
{
    $message = array();
    $message['error'] =false;
    if($is_update==1){
         $stmt=$this->db->prepare("SELECT  * From emmg_channel WHERE alias = ? AND stream_id != ? AND channel_id != ? ");
         $stmt->bind_param("sii",$emm_alias,$emm_streamid,$emm_channelid);
    }else{
        $stmt=$this->db->prepare("SELECT  * From emmg_channel WHERE alias = ? ");
        $stmt->bind_param("s",$emm_alias);
    }
    $result=0;
    $messg = "";
    if($stmt->execute())
    {
        $stmt->store_result();
        if($stmt->num_rows>0)
        {
            $message["error"] = true;
            $messg = "Duplicate Alias for EMM!";
        }
    }

   
    $stmt=$this->db->prepare("SELECT  * From emmg_channel WHERE stream_id = ? AND channel_id = ?");
    $stmt->bind_param("ii",$emm_streamid,$emm_channelid);

    $result=0;
    if($stmt->execute())
    {
        $stmt->store_result();
        if($is_update==1)
        {
            if($stmt->num_rows>1)
            {
                $message["error"] = true;
                $messg .= " Duplicate stream_id for EMM!";
            }
        }else{
            if($stmt->num_rows>0)
            {
                $message["error"] = true;
               $messg .= " Duplicate stream_id for EMM!";
            }
        }
        
    }

    if($is_update==1){
         $stmt=$this->db->prepare("SELECT  * From emmg_channel WHERE client_id = ? AND stream_id != ? AND channel_id != ? ");
         $stmt->bind_param("sii",$emm_clientid,$emm_streamid,$emm_channelid);
    }else{
        $stmt=$this->db->prepare("SELECT  * From emmg_channel WHERE client_id = ? ");
        $stmt->bind_param("s",$emm_clientid);
    }
    $result=0;
    if($stmt->execute())
    {
        $stmt->store_result();
        if($stmt->num_rows>0)
        {
            $message["error"] = true;
            $messg .= "Duplicate client_id for EMM!";
        }
    }

    if($is_update==1){
         $stmt=$this->db->prepare("SELECT  * From emmg_channel WHERE port = ? AND stream_id != ? AND channel_id != ? ");
         $stmt->bind_param("iii",$emm_port,$emm_streamid,$emm_channelid);
    }else{
        $stmt=$this->db->prepare("SELECT  * From emmg_channel WHERE port = ? ");
        $stmt->bind_param("i",$emm_port);
    }
    $result=0;
    if($stmt->execute())
    {
        $stmt->store_result();
        if($stmt->num_rows>0)
        {
            $message["error"] = true;
            $messg .= "Duplicate port for EMM!";
        }
    }

    if($is_update==1){
         $stmt=$this->db->prepare("SELECT  * From emmg_channel WHERE emm_pid = ? AND stream_id != ? AND channel_id != ? ");
         $stmt->bind_param("iii",$emm_pid,$emm_streamid,$emm_channelid);
    }else{
        $stmt=$this->db->prepare("SELECT  * From emmg_channel WHERE emm_pid = ? ");
        $stmt->bind_param("i",$emm_pid);
    }
    $result=0;
    if($stmt->execute())
    {
        $stmt->store_result();
        if($stmt->num_rows>0)
        {
            $message["error"] = true;
            $messg .= "Duplicate emm_pid for EMM!";
        }
    }
    $message["message"] = $messg;
    return $message;
}
public function getEcmStreamAccessCriteria($access_criteria)
{
    $stmt=$this->db->prepare("SELECT  * From ECMStream WHERE access_criteria = ? ");
    $stmt->bind_param("s",$access_criteria);
    $result=0;
    if($stmt->execute())
    {
        while($stmt->fetch())
        {
          $result=1;
        }
    }
    return $result;
}
public function getECMG($channel_id)
{
    $stmt = $this->db->prepare("SELECT ecmg_channel_id,Alias,Ip_Address,Port,Cryptoperiod,Super_CAS_Id FROM ecmg_channel where ecmg_channel_id = ?");
    $stmt->bind_param("i",$channel_id);
    $stmt->execute();
    $stmt->bind_result($ecmg_channel_id,$alias,$ip,$port,$cryptoperiod,$super_cas_id);
    $ECMGdata = array(); 
    while($stmt->fetch())
    {
        $ECMGdata = array('ecmg_channel_id'=>$ecmg_channel_id,'Alias'=>$alias,'Ip_Address'=>$ip,'Port'=>$port,'Cryptoperiod'=>$cryptoperiod,'Super_CAS_Id'=>$super_cas_id);
    }
    $stmt->close();
    return $ECMGdata;
}
public function updateECMGChannel($ecmg_Channel_Id,$Alias,$ip_Address,$port,$super_CAS_Id,$original_id,$Cryptoperiod)
{
    $stmt = $this->db->prepare("UPDATE  ecmg_channel SET ecmg_channel_id = ?,Alias = ?,Ip_Address= ?,Port = ?,Super_CAS_Id = ?,Cryptoperiod=? WHERE ecmg_channel_id = ?");
    $stmt->bind_param("issisii",$ecmg_Channel_Id,$Alias,$ip_Address,$port,$super_CAS_Id,$Cryptoperiod,$original_id);
    if($stmt->execute()){
        $resp=2;
    if($ecmg_Channel_Id != $original_id)
    {
            $stmt1 = $this->db->prepare("UPDATE  ECMStream SET ECMGid = ? WHERE ECMGid = ?");
            $stmt1->bind_param("ii",$ecmg_Channel_Id,$original_id);
            $result1 = $stmt1->execute();
            $stmt1->close();
        
    }
}
else
{
    $resp=3;
    
}
 $stmt->close();
 return $resp;
}
public function getLastStreamId($ecmg_id)
{
    $stmt = $this->db->prepare("SELECT stream_id FROM ECMStream WHERE ECMGid = ?");
    $stmt->bind_param("i",$ecmg_id);
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
    $stmt = $this->db->prepare("SELECT alias,access_criteria,ecm_id,cw_group,cp_number,ecm_pid FROM ECMStream where stream_id = ? AND ECMGid = ?");
    $stmt->bind_param("ii",$stream_id,$channel_id);
    $stmt->execute();
    $stmt->bind_result($alias,$access_criteria,$ecm_id,$cw_group,$cp_number,$ecm_pid);
    $ECMG_stream_data = array(); 
    while($stmt->fetch())
    {
        $ECMG_stream_data = array('alias'=>$alias,'access_criteria'=>$access_criteria,'ecm_id'=>$ecm_id,'cw_group'=>$cw_group,'cp_number'=>$cp_number,'ecm_pid'=>$ecm_pid);
    }
    $stmt->close();
    return $ECMG_stream_data; 
}
public function updateECMStream($ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$original_streamid,$original_ecmg_id,$ecm_pid)
{
    $query = "UPDATE ECMStream SET alias = '".$ecm_stream_alias."',access_criteria = '".$ecm_stream_access_criteria."',ecm_id = '".$ecm_stream_ecmId."',cw_group= '".$ecm_stream_CW_group."',cp_number = '".$ecm_stream_CP_number."',ecm_pid = '".$ecm_pid."' WHERE stream_id = '".$original_streamid."' AND ECMGid = '".$original_ecmg_id."'";
    if($this->db->query($query))
        return 0;
    else
        return 1;       
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
*/
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
public function checkECMPID_Duplicate($channelid,$ecmpid)
{
    $stmt = $this->db->prepare("SELECT alias FROM ECMStream WHERE ecm_pid = ? ");
    $stmt->bind_param("i",$ecmpid);
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
public function checkAccessCriteria_Duplicate($channelid,$access_criteria)
{
    $stmt = $this->db->prepare("SELECT alias FROM ECMStream WHERE access_criteria = ? ");
    $stmt->bind_param("i",$access_criteria);
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
public function activeECMStream($output,$rmx_no,$stream_id,$channel_id,$ecm_id,$cp_number,$access_criteria,$service_id,$pid,$input)
{
   $stmt = $this->db->prepare("INSERT INTO activeECMStream(output,rmx_no,stream_id,channel_id,ecm_id,cp_number,access_criteria,service_id,pid,input) values(?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE ecm_id=?,cp_number=?,access_criteria=?,service_id=?");
    $stmt->bind_param("iiiiiiiiiiiiii",$output,$rmx_no,$stream_id,$channel_id,$ecm_id,$cp_number,$access_criteria,$service_id,$pid,$input,$ecm_id,$cp_number,$access_criteria,$service_id);
    if($stmt->execute()){
       $resp= 0;
    }else{
        $resp= 2;
    }
    $stmt->close();
    return $resp;  
}
public function deleteActivatedECMStream($channel_id,$stream_id)
{
    $stmt = $this->db->prepare("DELETE FROM activeECMStream where stream_id = ? AND channel_id = ?");
    $stmt->bind_param("ii",$stream_id,$channel_id);
    $stmt->execute();
    $stmt->close();  
}
public function getActiveECMStream($rmx_no,$output,$service_id)
{
   $stmt = $this->db->prepare("SELECT stream_id,channel_id,ecm_id,cp_number,access_criteria,pid,rmx_no,output,service_id,input FROM activeECMStream WHERE rmx_no=? AND output=? AND service_id=?");
    $stmt->bind_param("iii",$rmx_no,$output,$service_id);
    $stmt->execute();
    $stmt->bind_result($stream_id,$channel_id,$ecm_id,$cp_number,$access_criteria,$pid,$rmx_no,$output,$service_id,$input);
    $ActiveECMStream_data = array(); 
    while($stmt->fetch())
    {
        array_push($ActiveECMStream_data, array('stream_id'=>$stream_id,'channel_id'=>$channel_id,'ecm_id'=>$ecm_id,'cp_number'=>$cp_number,'access_criteria'=>$access_criteria,'pid'=>$pid,'rmx_no'=>$rmx_no,'output'=>$output,'service_id'=>$service_id,'input'=>$input));
    }
    $stmt->close();
    return $ActiveECMStream_data;  
}
public function checkDuplicateECMStream($channel_id,$stream_id)
{
    $stmt = $this->db->prepare("SELECT * FROM activeECMStream  WHERE stream_id=? AND channel_id = ? ");
    $stmt->bind_param("ii",$stream_id,$channel_id);
    $stmt->execute();
   
    $is_exist=2;
    while($stmt->fetch())
    {
        $is_exist = 1;
    }
    $stmt->close();
    return $is_exist;
}
public function checkECMStream($rmx_no,$input,$output,$access_criteria)
{
    $stmt = $this->db->prepare("SELECT * FROM activeECMStream  WHERE rmx_no=? AND input =? AND output = ? AND access_criteria = ?");
    $stmt->bind_param("iiii",$rmx_no,$input,$output,$access_criteria);
    $stmt->execute();
   
    $is_exist=2;
    while($stmt->fetch())
    {
        $is_exist = 1;
    }
    $stmt->close();
    return $is_exist;
}
public function getEMMGData($channel_id)
{
    $stmt = $this->db->prepare("SELECT channel_id,alias,client_id,data_id,bandwidth,port,stream_id,emm_pid FROM emmg_channel WHERE channel_id = ?");
    $stmt->bind_param("i",$channel_id);
    $emmg_channeldata = array();
    if($stmt->execute())
    {
        $stmt->bind_result($emm_channelid,$emm_alias,$emm_clientid,$emm_dataid,$emm_bw,$emm_port,$emm_streamid,$emm_pid);
        while($stmt->fetch())
        {
        $emmg_channeldata = array('channel_id'=>$emm_channelid,'alias'=>$emm_alias,'client_id'=>$emm_clientid,'data_id'=>$emm_dataid,'bandwidth'=>$emm_bw,'port'=>$emm_port,'stream_id'=>$emm_streamid,'emm_pid'=>$emm_pid);
        }
            $stmt->close();
    }
    return $emmg_channeldata;
}
public function updateEMMG($emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_pid)
{
     $stmt = $this->db->prepare("UPDATE emmg_channel SET channel_id = ?,port =?,client_id = ?,data_id = ?,alias = ?,bandwidth = ?,stream_id = ? ,emm_pid = ? WHERE channel_id = ?");

    $stmt->bind_param("iisisiiii",$emm_channelid,$emm_port,$emm_clientid,$emm_dataid,$emm_alias,$emm_bw,$emm_streamid,$emm_pid,$emm_channelid);
     $stmt->execute();
    $stmt->close();
}
public function enableEMM($output,$rmx_no,$enable,$channel_id)
{
   $stmt = $this->db->prepare("INSERT INTO EMM_descriptor(output,rmx_no,enable,channel_id) values(?,?,?,?) ON DUPLICATE KEY UPDATE enable=?");
    $stmt->bind_param("iiiii",$output,$rmx_no,$enable,$channel_id,$enable);
    if($stmt->execute()){
        return 0;
    }else{
        return 1;
    }
    $stmt->close();   
}
public function getEnableEMM($output,$rmx_no)
{
   
   $stmt = $this->db->prepare("SELECT * FROM EMM_descriptor WHERE output = ? AND rmx_no = ? "); 
   $stmt->bind_param("ii",$output,$rmx_no);     
  
    $enable_emm_data = array();
    if($stmt->execute())
    {
        $stmt->bind_result($channel_id,$rmx_no,$output,$enable);
        while ($stmt->fetch())
        {
            array_push($enable_emm_data,array('channel_id'=>$channel_id,'rmx_no'=>$rmx_no,'output'=>$output,'enable'=>$enable));
        }
    }
    $stmt->close();
    return $enable_emm_data;  
}
public function updateenableEMM($enable,$output,$rmx_no,$channel_id)
{
    $stmt = $this->db->prepare("UPDATE EMM_descriptor SET enable = ? WHERE output = ? AND channel_id = ? AND rmx_no = ? ");

    $stmt->bind_param("iiii",$enable,$output,$channel_id,$rmx_no);
    $stmt->execute();
    $stmt->close();   
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
public function changeOutputPid($Old_OutputSid,$new_OutputSid,$Enable,$input,$output,$rmx_no)
{
    if($new_OutputSid == -1){
        $stmt = $this->db->prepare("UPDATE bouquet_service_list b LEFT JOIN outputchannels o ON b.service_id = o.changed_ch_number SET b.service_id = ?  WHERE  b.input = ? AND b.output = ? AND b.rmx_id = ? AND o.channelnumber = ?");
        $stmt->bind_param("iiiii",$Old_OutputSid,$input,$output,$rmx_no,$Old_OutputSid);
        $stmt->execute();
        $stmt->close();
        
    }else{
         $stmt = $this->db->prepare("UPDATE bouquet_service_list SET service_id = ?  WHERE service_id = ? AND input = ? AND output = ? AND rmx_id = ?");
        $stmt->bind_param("iiiii",$new_OutputSid,$Old_OutputSid,$input,$output,$rmx_no);
        $stmt->execute();
        $stmt->close();
    }
    
    $stmt = $this->db->prepare("UPDATE outputchannels SET changed_ch_number = ? ,Enable_ch_number = ? WHERE channelnumber = ? AND inputid = ? AND targetid = ? AND rmx_no = ?");
    $stmt->bind_param("iiiiii",$new_OutputSid,$Enable,$Old_OutputSid,$input,$output,$rmx_no);
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
        while( $stmt->fetch())
        {
            array_push($generateData,array('Update_PAT'=>$PAT,'Update_CAT'=>$CAT,'Update_SDT'=>$SDT,'Update_NIT'=>$NIT));
        }
    }
    $stmt->close();
    return $generateData;  
}
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
   $pmt_alarm = -1;
    if($stmt->execute())
    {
        $stmt->bind_result($alarm_enable);
        while ( $stmt->fetch())
        {
            $pmt_alarm = $alarm_enable;
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
    $high_priority = -1;
    if($stmt->execute())
    {
        $stmt->bind_result($Priority_checkbox);
        while ( $stmt->fetch())
        {
            $high_priority = $Priority_checkbox;//array_push($high_priority,array('Priority_checkbox'=>$Priority_checkbox));
        }
        $stmt->close();
    return $high_priority;
    }
    else
    {
       $stmt->close();
    return-1;   
    }
    
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
   $stmt = $this->db->prepare("SELECT freq_ID,freq_name,qam_id,frequency,bitrate,ts_id,EIT FROM Qam_freq ");
    $QamFreq_data = array();
    if($stmt->execute())
    {
        $stmt->bind_result($freq_ID,$freq_name,$qam_id,$frequency,$bitrate,$ts_id,$EIT);
        while ( $stmt->fetch())
        {
            array_push($QamFreq_data,array('freq_ID'=>$freq_ID,'freq_name'=>$freq_name,'qam_id'=>$qam_id,'frequency'=>$frequency,'bitrate'=>$bitrate,'ts_id' =>$ts_id,'EIT' =>$EIT));
        }
    }
    $stmt->close();
    return $QamFreq_data; 
}
public function qamFrq_Bitrate($freq_ID,$qam_id,$bitrate)
{
    $stmt = $this->db->prepare("UPDATE Qam_freq SET bitrate = ? WHERE qam_id = ? AND freq_ID=?");
    $stmt->bind_param("iii",$bitrate,$qam_id,$freq_ID);
    $stmt->execute();
    $stmt->close();
}
public function updateEIT($freq_ID,$qam_id,$EIT)
{
    $stmt = $this->db->prepare("UPDATE Qam_freq SET EIT = ? WHERE qam_id = ? AND freq_ID=?");
    $stmt->bind_param("iii",$EIT,$qam_id,$freq_ID);
    $stmt->execute();
    $stmt->close();
}
public function getEIT($freq_ID,$qam_id)
{
   $stmt = $this->db->prepare("SELECT EIT FROM Qam_freq WHERE  qam_id = ? AND freq_ID=? ");
    $stmt->bind_param("ii",$qam_id,$freq_ID);
      if($stmt->execute())
        {
            $stmt->bind_result($EIT);
            $stmt->fetch();   
        } 
    $stmt->close();
    return $EIT;   
}
public function input_Bitrate($RE_NO,$bitrate)
{
    $stmt = $this->db->prepare("UPDATE Input_bitrate SET bitrate = ? WHERE RE_NO = ?");
    $stmt->bind_param("ii",$bitrate,$RE_NO);
    $stmt->execute();
    $stmt->close();
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
 public function addSptsIP($channel_no,$rmx_no,$type,$port,$ip_address)
 {
     $stmt = $this->db->prepare("INSERT INTO IP_input_spts(channel_no,rmx_no,type,port,ip_address) values(?,?,?,?,?) ON DUPLICATE KEY UPDATE channel_no=VALUES(channel_no),rmx_no=VALUES(rmx_no),type=VALUES(type),port=VALUES(port),ip_address=VALUES(ip_address)");
      $stmt->bind_param("iiiis",$channel_no,$rmx_no,$type,$port,$ip_address);
      if($stmt->execute())
            $id = 0;
      else
            $id = 1;
      $stmt->close();
      return $id;
 }
 public function getSptsIP($rmx_no)
 {
    $stmt = $this->db->prepare("SELECT rmx_no,channel_no,ip_address,port,type FROM IP_input_spts WHERE rmx_no = ?");
    $stmt->bind_param("i",$rmx_no);
    $IPSPTS_data = array();
    if($stmt->execute()){
        $stmt->bind_result($rmx_no,$channel_no,$ip_address,$port,$type);
        while ($stmt->fetch()){
            array_push($IPSPTS_data,array('rmx_no'=>$rmx_no,'channel_no'=>$channel_no,'ip_address'=>$ip_address,'port'=>$port,'type'=>$type));
        }
    }
    return $IPSPTS_data;
 }
 public function deleteSptsIP($channel_no,$rmx_no)
 {
    $stmt = $this->db->prepare("DELETE FROM IP_input_spts WHERE   channel_no = ? AND rmx_no = ?");
    $stmt->bind_param("ii",$channel_no,$rmx_no);
    if($stmt->execute())
        $id = 0;
    else
        $id = 1;
    $stmt->close();
    return $id;
 }
 public function setCustomPid($rmx_no,$name,$output,$pid)
 {
  $stmt = $this->db->prepare("INSERT INTO custom_Pid(rmx_no,name,output,pid) values(?,?,?,?) ");
  $stmt->bind_param("isii",$rmx_no,$name,$output,$pid);
    if($stmt->execute())
        $id = 0;
    else
        $id = 1;
    $stmt->close();
    return $id;
 }
 public function getCustomPid($output,$rmx_no)
 {
   $stmt = $this->db->prepare("SELECT id,pid,name FROM custom_Pid WHERE output = ? AND rmx_no = ? ");
   $stmt->bind_param("ii",$output,$rmx_no);
   $pid_data = array();
    if($stmt->execute())
    {
        $stmt->bind_result($id,$pid,$name);
        while($stmt->fetch())
        {
            array_push($pid_data,array('id'=>$id,'pid'=>$pid,'name'=>$name));
        }
        $stmt->close();
    }
    return $pid_data; 
 }
 public function updateCustomPid($name,$pid,$id)
 {
   $stmt = $this->db->prepare("UPDATE custom_Pid SET name = ?,pid = ? WHERE id = ? ");
    $stmt->bind_param("sii",$name,$pid,$id);
    if($stmt->execute())
        $id = 0;
    else
        $id = 1;
    $stmt->close();
    return $id; 
 }
 public function deleteCustomPid($id)
 {
    $stmt = $this->db->prepare("DELETE FROM custom_Pid where id = ? ");
    $stmt->bind_param("i",$id);
    $stmt->execute();
    $stmt->close();  
 }
 public function insertNIT($network_name,$network_id,$version)
 {
     $stmt = $this->db->prepare("SELECT * FROM insertNIT");
     $stmt->execute();
     $stmt->store_result();
        
     if($stmt->num_rows==0 )
     {
        $stmt = $this->db->prepare("INSERT INTO insertNIT(network_name,network_id,version) values(?,?,?) ");
        $stmt->bind_param("sii",$network_name,$network_id,$version);
        $result = $stmt->execute();
        $stmt->close();
     }
     else
     {
        $stmt = $this->db->prepare("UPDATE insertNIT SET network_name = ?,network_id = ? , version = ? ");
        $stmt->bind_param("sii",$network_name,$network_id,$version);
        $result = $stmt->execute();
        $stmt->close();
     }
    
 }
 public function getInsertNIT()
 {
    $stmt = $this->db->query("SELECT * FROM insertNIT");
     return $stmt->rows;
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
public function deleteTuner($rmx_id,$demodId)
{
   $stmt = $this->db->prepare("DELETE FROM tuned_frequencies where rmx_id = ? AND demodId = ? ");
    $stmt->bind_param("ii",$rmx_id,$demodId);
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

public function addScrablingServices($rmx_no,$input,$output,$programNumbers,$includeFlag,$scramble)
{
    $stmt = $this->db->prepare("INSERT INTO scrambledServices(rmx_no,input,output,programNumbers,includeFlag,scramble) values(?,?,?,?,?,?) ON DUPLICATE KEY UPDATE input = ? , scramble = ? ");
    $stmt->bind_param("iiiiiiii",$rmx_no,$input,$output,$programNumbers,$includeFlag,$scramble,$input,$scramble);
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
public function getScrambledServices($rmx_no,$input,$output,$programNumbers)
{
    $stmt = $this->db->prepare("SELECT scramble FROM scrambledServices where programNumbers = ? AND input = ? AND output = ? AND rmx_no = ?");
    $stmt->bind_param("iiii",$programNumbers,$input,$output,$rmx_no);
 
     if($stmt->execute()){
        $stmt->bind_result($scramble);
        $stmt->fetch();
        $stmt->close();
         return $scramble;
          
     }
     else
     { 
        $stmt->close();
        return -1;
     }    
}
public function getAllScrambleData()
{
   $stmt = $this->db->query("SELECT * FROM scrambledServices");
   return $stmt->rows;  
}
public function getScrambleData($rmx_no,$output)
{
  $stmt = $this->db->prepare("SELECT programNumbers,input,scramble FROM scrambledServices where  output = ? AND rmx_no = ?");
  $stmt->bind_param("ii",$output,$rmx_no);
  $scramble_data=array();
     if($stmt->execute()){
        $stmt->bind_result($programNumbers,$input,$scramble);
        while ($stmt->fetch()){
            array_push($scramble_data,array('scramble'=>$scramble,'programNumbers'=>$programNumbers,'input'=>$input));
        }
    }
    return $scramble_data;   
} 
public function addPrivateData($private_data,$id,$loop,$output_list,$Table_type)
{
    $stmt = $this->db->prepare("INSERT INTO privateData(private_data,id,loop_no,output_list,Table_type) values(?,?,?,?,?) ON DUPLICATE KEY UPDATE private_data = ? , output_list = ? , loop_no = ? , Table_type = ?");
    $stmt->bind_param("siisissii",$private_data,$id,$loop,$output_list,$Table_type,$private_data,$output_list,$loop,$Table_type);
    $result = $stmt->execute();
    $stmt->close();   
}
public function getPrivatedata()
{
    $private_data = array();
   $stmt = $this->db->query("SELECT * FROM privateData");
   $private_data["nit_bat"] = $stmt->rows;  
   $stmt = $this->db->query(" SELECT * FROM sdt_private_data");
   $private_data["sdt"] = $stmt->rows;
   return $private_data;
}
public function deletePrivateData($id)
{
    $stmt = $this->db->prepare("DELETE FROM privateData where id = ?");
    $stmt->bind_param("i",$id);
    $resp=-1;
    if($stmt->execute())
    {
        $resp=1;
    } 
    return $resp;
    $stmt->close();  
}
public function getPrivateDataDetails($id,$table_type)
{
    if($table_type==2)
    {
     $stmt = $this->db->query("SELECT * FROM sdt_private_data WHERE id = ".$id."");
    }
    else
    {
       $stmt = $this->db->query("SELECT * FROM privateData WHERE id = ".$id.""); 
    }
   
   /*$stmt->bind_param("i",$id);
   $private_data=array();
   if($stmt->execute())
   {
     $stmt->bind_result($id,$private_data,$loop_no,$output_list);
      array_push($private_data, array('id'=>$id,'private_data'=>$private_data,'loop_no'=>$loop_no,'output_list'=>$output_list));
   }
   $stmt->close();*/
   // return $private_data;
    return $stmt->rows;
}
public function addSDTPrivateData($id,$private_data,$service_id,$ts_id,$addFlag)
{
  if($addFlag==1)
  {
    $stmt = $this->db->prepare("INSERT INTO sdt_private_data(id,private_data,service_id,ts_id) values(?,?,?,?) ON DUPLICATE KEY UPDATE private_data = ? , service_id = ? , ts_id = ? ");
    $stmt->bind_param("isiisii",$id,$private_data,$service_id,$ts_id,$private_data,$service_id,$ts_id);
    $result = $stmt->execute();
    $stmt->close();
    // return "INSERT INTO sdt_private_data(id,private_data,service_id,ts_id) values(".$id.",".$private_data.",".$service_id.",".$ts_id.") ON DUPLICATE KEY UPDATE private_data = ".$private_data." , service_id = ".$service_id." , ts_id = ".$ts_id."" ;
  }
  else
  {
    $stmt = $this->db->prepare("DELETE FROM sdt_private_data where id = ?");
    $stmt->bind_param("i",$id);
    $resp=-1;
    if($stmt->execute())
    {
        $resp=1;
    } 
    return $resp;
    $stmt->close();
  }
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
public function getTunerType($tunerId,$mxl_id)
{
  $stmt = $this->db->prepare("SELECT Tuner_type FROM Tuner_details  WHERE Tuner_ID = ? AND Mxl_ID = ?");
   $stmt->bind_param("ii",$tunerId,$mxl_id);
   $Tuner_type=-1;
    if($stmt->execute()){
        $stmt->bind_result($Tuner_type);
        $stmt->fetch();
            
        
    }
    return $Tuner_type;
}
public function getInputBitrate()
{
   $stmt = $this->db->query("SELECT * FROM Input_bitrate");
   return $stmt->rows;  
}
public function addInputChannels($channelnumber,$channelname,$input,$rmx_no)
{
    $stmt = $this->db->prepare("SELECT * FROM InputChannel where channelnumber = ? AND channelname = ? AND input = ? AND rmx_no = ?");
    $stmt->bind_param("isii",$channelnumber,$channelname,$input,$rmx_no);
    $stmt->execute(); 
    $is_exist=0;
    while($stmt->fetch())
    {
        $is_exist = 1;
    }
      if($is_exist==0)
      {
        $stmt = $this->db->prepare("INSERT INTO InputChannel(channelnumber,channelname,input,rmx_no) values(?,?,?,?) ");
        $stmt->bind_param("isii",$channelnumber,$channelname,$input,$rmx_no);
        $result = $stmt->execute();
      }
      else
      {
         $stmt = $this->db->prepare("UPDATE InputChannel SET channelnumber = ? ,channelname = ? WHERE rmx_no = ? AND input = ? AND channelnumber = ?");
         $stmt->bind_param("isiii",$channelnumber,$channelname,$rmx_no,$input,$channelnumber);
         $stmt->execute();
      }
    $stmt->close();
}
public function updateOutputChannels($listPnumbers=array(),$input,$rmx_no)
{
  $list = array();
  

        $plist = implode(',',$listPnumbers);
        $sql="DELETE  FROM outputchannels where inputid = ?  AND rmx_no = ? AND channelnumber NOT IN (".$plist.")";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("ii",$input,$rmx_no);
        $stmt->execute();
    

        $sql="DELETE  FROM bouquet_service_list where input = ?  AND rmx_id = ? AND service_id NOT IN (".$plist.")";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("ii",$input,$rmx_no);
        $stmt->execute();
        $stmt->close();
        return 1;
}
public function getInputChannels($rmx_no,$input)
{
    $stmt = $this->db->prepare("SELECT channelnumber,channelname,input,rmx_no FROM InputChannel WHERE rmx_no = ? AND input = ?");
    $stmt->bind_param("ii",$rmx_no,$input);
    $inputChannels_data = array();
    if($stmt->execute()){
        $stmt->bind_result($channelnumber,$channelname,$input,$rmx_no);
        while ($stmt->fetch()){
            array_push($inputChannels_data,array('channelnumber'=>$channelnumber,'channelname'=>$channelname,'input'=>$input,'rmx_no'=>$rmx_no));
        }
    }
    return $inputChannels_data;
}
public function getTunedTuners()
{
    $stmt = $this->db->prepare("SELECT DISTINCT input,rmx_no FROM InputChannel;");
    $tunedTuner_data = array();
    if($stmt->execute()){
        $stmt->bind_result($input,$rmx_no);
        while ($stmt->fetch()){
            array_push($tunedTuner_data,array('input'=>$input,'rmx_no'=>$rmx_no));
        }
    }
    return $tunedTuner_data;   
}
public function deleteInputChannels($input,$rmx_no)
{
    $stmt = $this->db->prepare("DELETE FROM InputChannel WHERE input = ? AND rmx_no = ?");
    $stmt->bind_param("ii",$input,$rmx_no);
    $resp=1;
    if($stmt->execute())
    {
        $resp=0;
    } 
    return $resp;
    $stmt->close(); 
}
public function getOrgServiceId($input,$output,$rmx_no,$service_id)
{
     $stmt = $this->db->query("SELECT channelnumber FROM outputchannels WHERE changed_ch_number = ".$service_id." AND inputid = ".$input." AND targetid = ".$output." AND rmx_no = ".$rmx_no." ");

    return $stmt->row;
        
}
public function dumpDatabase()
{
   $stmt = $this->db->prepare("DROP DATABASE ".DB_DATABASE);
   if($stmt->execute()){
        $stmt = $this->db->prepare("CREATE DATABASE ".DB_DATABASE);
        if($stmt->execute()){
            return 1;
        }else{
            return 0;
        }
    }else{
        return 0; 
   }  
}
public function addBouquet($bat_id,$bat_name,$service_ids,$service_rmx,$service_inputs,$service_output)
{
    $stmt = $this->db->prepare("INSERT INTO bouquet_descriptors(bouquet_id,Name,genreType) values(?,?,0)  ON DUPLICATE KEY UPDATE Name = ? ,genreType = 0");
    $stmt->bind_param("iss",$bat_id,$bat_name,$bat_name);
    $result =$stmt->execute();
    $stmt->close(); 

    $stmt = $this->db->prepare("DELETE FROM bouquet_service_list WHERE bouquet_id = ?");
    $stmt->bind_param("i",$bat_id);
    $result =$stmt->execute();
    $stmt->close(); 

    $stmt = $this->db->prepare("DELETE FROM sub_bouquet_list WHERE main_bouquet_id = ?");
    $stmt->bind_param("i",$bat_id);
    $result =$stmt->execute();
    $stmt->close();

    $query = "Insert into bouquet_service_list (bouquet_id,service_id,input,output,rmx_id) VALUES ";
    for ($pos=0; $pos <count($service_ids) ; $pos++) { 
       $query .="($bat_id,$service_ids[$pos],$service_inputs[$pos],$service_output[$pos],$service_rmx[$pos]),";
    }
    $query =trim($query,',');
    $query .= " ON DUPLICATE KEY UPDATE input = input;";
    $stmt = $this->db->query($query);
    return $query;

}
public function get_BAT_Data()
{
   $stmt = $this->db->prepare("SELECT bouquet_id,Name,genreType FROM bouquet_descriptors");
   $BAT_details = array();
    if($stmt->execute()){
        $stmt->bind_result($bouquet_id,$name,$genreType);
        while ( $stmt->fetch()){
            array_push($BAT_details,array('Name'=>$name,'bouquet_id'=>$bouquet_id,'genreType'=>$genreType));
        }
    }
    return $BAT_details;  
}
public function getBouquetDetails($bouquet_id)
{
   $stmt = $this->db->query("SELECT bouquet_id,service_id,input,output,rmx_id FROM bouquet_service_list WHERE bouquet_id = ".$bouquet_id."");

    return $stmt->rows;
}
public function deleteBouquet($bouquet_id)
{
    $stmt = $this->db->prepare("DELETE FROM bouquet_service_list WHERE bouquet_id = ?");
    $stmt->bind_param("i",$bouquet_id);
    $result =$stmt->execute();
    $stmt->close(); 

    $stmt = $this->db->prepare("DELETE FROM bouquet_descriptors WHERE bouquet_id = ?");
    $stmt->bind_param("i",$bouquet_id);
    $result =$stmt->execute();
    $stmt->close();
    return 1;

}
public function add_sub_BouquetList($main_bouquet_id,$sub_bouquet_id,$BAT_Name)
{
    $stmt = $this->db->prepare("DELETE FROM bouquet_service_list WHERE bouquet_id = ?");
    $stmt->bind_param("i",$main_bouquet_id);
    $result =$stmt->execute();
    $stmt->close(); 

     $stmt = $this->db->prepare("DELETE FROM sub_bouquet_list WHERE main_bouquet_id = ?");
    $stmt->bind_param("i",$main_bouquet_id);
    $result =$stmt->execute();
    $stmt->close(); 

   $query = "Insert into sub_bouquet_list (main_bouquet_id,sub_bouquet_id) VALUES ";
   for ($pos=0; $pos <count($sub_bouquet_id) ; $pos++) { 
       $query .="($main_bouquet_id,$sub_bouquet_id[$pos]),";
    }

    $query =trim($query,',');
    $stmt = $this->db->query($query);

    $stmt = $this->db->prepare("INSERT INTO bouquet_descriptors(bouquet_id,Name,genreType) values(?,?,1)  ON DUPLICATE KEY UPDATE Name = ? , genreType = 1");
    $stmt->bind_param("iss",$main_bouquet_id,$BAT_Name,$BAT_Name);
    $result =$stmt->execute();
    $stmt->close();
}
public function Deletebouquetservices($input,$rmx_no)
{
    /*$stmt = $this->db->prepare("DELETE FROM sub_bouquet_list WHERE input = ? AND rmx_no = ?");
    $stmt->bind_param("ii",$input,$rmx_no);
    $result =$stmt->execute();
    $stmt->close();*/


    $stmt = $this->db->prepare("DELETE FROM bouquet_service_list WHERE input = ? AND rmx_id = ? ");
    $stmt->bind_param("ii",$input,$rmx_no);
    $stmt->execute();
    $stmt->close();  
}
public function getGenreDetails($bouquet_id)
{
    $stmt = $this->db->query("SELECT sub_bouquet_id FROM sub_bouquet_list WHERE main_bouquet_id = ".$bouquet_id."");

    return $stmt->rows;
}
public function tsDetails($ts_id,$qam_id,$output)
{
    $stmt = $this->db->query("SELECT * FROM Qam_freq WHERE ts_id = ".$ts_id." ");

    $is_exist=0;
    if($stmt->num_rows > 0)
    {
        $is_exist = 1;
    }
     if($is_exist==0)
    {
        $stmt = $this->db->prepare("UPDATE Qam_freq SET ts_id = ? WHERE qam_id = ? AND freq_ID = ?");
        $stmt->bind_param("iii",$ts_id,$qam_id,$output);
        $result =$stmt->execute();
        $stmt->close();

        return 1;
    }
    else
    {
       return 0;   
    }
}
public function updateFlag($qam_id,$input,$value)
{
        $stmt = $this->db->prepare("UPDATE Qam_freq SET update_Flag = ? WHERE qam_id = ? AND freq_ID = ?");
        $stmt->bind_param("iii",$value,$qam_id,$input);
        $result =$stmt->execute();
        $stmt->close();
}
public function getFlag($qam_id,$input)
{
    $stmt = $this->db->prepare("SELECT update_Flag FROM Qam_freq  WHERE qam_id = ? AND freq_ID = ?");
    $stmt->bind_param("ii",$qam_id,$input);
    $update_Flag=0;
    if($stmt->execute()){
      $stmt->bind_result($update_Flag);
      $stmt->fetch();  
    }
    return $update_Flag; 
}

}
 