<?php
class ControllerCommonDashboard extends Controller 
{
	public function index()
	{

		$this->load->language('common/dashboard');
        $this->load->model('common/dashboardchannels');

		$restapi_object = new restapi();
		$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 $data['api_list']=array();
		 $data['inputRate']=array();
		$Selection_info= $this->model_common_dashboardchannels->get_Selection();
		$data['Selection_detail']=array();
		$s=0;
		$ip_input_data= $this->model_common_dashboardchannels->get_RE();
		$data['ip_input']=array(array());
		$data['ip_channels'] = array();
		$no_of_input= $this->model_common_dashboardchannels->rmx_config();
		foreach ($Selection_info as $Selection_info_data) 
		{
		    $data['Selection_detail'][$s]=array('Selection_Id'=>$Selection_info_data['Selection_Id'],'Selection_name'=>$Selection_info_data['Selection_name']);
		$p=0;
		
		foreach ($ip_input_data as $ip_data) 
		{
		   $k=0;
		   $data['ip_input'][$s][$p]=array('RE_name'=>$ip_data['RE_name'],'Id'=>$ip_data['Id'],'RE_UniqueID'=>$ip_data['RE_UniqueID']);
				$channelNumbers_url = "http://".RMX_IP."/getProgramList";  
				$input_value=$ip_data['Id']%$no_of_input;
				$rmx_no = (floor($ip_data['Id']/$no_of_input)+1)+($s*2);
				$program_list_data="input=".$input_value."&rmx_no=".$rmx_no;
				$channelNumbers_response = $restapi_object->callAPI("POST",$hdr,$channelNumbers_url ,$program_list_data);
				$channelNumbers_decoded = json_decode($channelNumbers_response,true);
				if ($channelNumbers_response == false || $channelNumbers_decoded['error'] == true ) 
				{
				   $data['ip_input'][$s][$p]['channels'] = array();
				}
				else
				{     
					$i=0;
					if(sizeof($channelNumbers_decoded ['progNums']))
					{
						foreach (array_combine($channelNumbers_decoded ['progNums'], $channelNumbers_decoded ['prog_names'])  as $pnumber => $name) 
						{ 	

                             $data['ip_channels'][$i]=array( "channelnumber"=>$pnumber,"channelname"=>$name,"rmx_no"=>$rmx_no,"input"=>$input_value);
                               $data['api_list'][$k][$i]=array( "channelnumber"=>$pnumber,"channelname"=>$name);

							$i++;
						}
                        
						$data['ip_input'][$s][$p]['channels'] = $data['ip_channels'];
					}

					else
					{
						$data['ip_input'][$s][$p]['channels'] = array();
					}

				}
				$p++;
		 		$k++; 	
		}
		$s++;
		}
		
		/*<-------------------------Activated Channels------------------------->*/
		$rmx_no = $this->model_common_dashboardchannels->rmx_no();
		$Act_ch_database = $this->model_common_dashboardchannels->getOutputActivatedChannels();
		$Input_Output = $this->model_common_dashboardchannels->getInputOutput();
		$Ch_database = array();
		$data['Database_Ch']=array();
		$data['rmx_no']=array();
		$data['Activated_channelNo']=array();
		$b=0;
		$c=0;
		$progList = array();
		$inputRate;
		foreach($rmx_no as $remux_no)
		{ 
			foreach ($Input_Output as  $In_Out) 
			{
				$input=$In_Out['Input'];
				$output=$In_Out['Output'];
                $rmx_no=$remux_no['Qam_ID'] + 1;
                   $get_ActivatedChannels="http://".RMX_IP."/getProgActivation/";
                   $data1="input=".$input."&output=".$output."&rmx_no=".$rmx_no;
	               $Activated_channels_response = $restapi_object->callAPI("POST",$hdr, $get_ActivatedChannels,$data1);
	               $Activated_channels_decode = json_decode($Activated_channels_response,true);
	               if ($Activated_channels_response == false || $Activated_channels_decode['error'] == true ) 
					{
					    $data['Activated_channelNo'][$b]=array();
					}
				  else
			       {

					if($Activated_channels_decode['pProg'] == NULL)
					{
	                    $data['Activated_channelNo'][$b]=array();
	                    $this->model_common_dashboardchannels->deleteOutputChannels($input,$output,$rmx_no,array());
					}
					else
				    {	 
	                   foreach($Activated_channels_decode['pProg'] as $progNum)
	                    {
							array_push($progList, $progNum);	
						}
                $this->model_common_dashboardchannels->deleteOutputChannels($input,$output,$rmx_no,$Activated_channels_decode['pProg']); 
				     } 
			      }
			    break;  
		    }
		    $b++;    
		}	
		$outputchanneldata = $this->model_common_dashboardchannels->getOutputActivatedChannels(); 
		$j = 0;
		$data['outputdata']=array();
		foreach ($outputchanneldata as $outputdata) 
		{
			$changed_ch_number = -1;
			$changed_ch_name = '-1';
			$Enable_ch_name = 0;
			$changed_ch_provider = '-1';
			$Enable_ch_provider = 0;
			if($outputdata['changed_ch_number']!= -1)
			{
				$changed_ch_number = $outputdata['changed_ch_number'];
			}
			if($outputdata['changed_ch_name'] != '-1')
			{
				$changed_ch_name = $outputdata['changed_ch_name'];
			}
			if($outputdata['Enable_ch_name'] != 0)
			{
				$Enable_ch_name = $outputdata['Enable_ch_name'];
			}
			if($outputdata['changed_ch_provider'] != '-1')
			{
				$changed_ch_provider = $outputdata['changed_ch_provider'];
			}
			if($outputdata['Enable_ch_provider'] != 0)
			{
				$Enable_ch_provider = $outputdata['Enable_ch_provider'];
			}
		    $data['outputdata'][$j]=array('rmx_no'=>$outputdata['rmx_no'],'channelname'=>$outputdata['output_channelname'],'channelnumber'=>$outputdata['channelnumber'],'qam_targetid'=>$outputdata['rmx_no']-1,'targetid'=>$outputdata['targetid'],'inputid'=>$outputdata['inputid'],'changed_ch_no'=>$changed_ch_number,'changed_ch_name'=>$changed_ch_name,'Enable_ch_name'=>$Enable_ch_name,'changed_ch_provider'=>$changed_ch_provider,'Enable_ch_provider'=>$Enable_ch_provider);
			$j++;
		}
	/*<-------------------------Activated Channels------------------------->*/
    /*<-------------------------Hardware Version------------------------->*/
        $remux_number= 1;
		$hardware_version_url = "http://".RMX_IP."/getHardwareVersion/".$remux_number; 
		$hardware_version_response = $restapi_object->callAPI("GET",$hdr, $hardware_version_url,$data1=array());
		$hardwareVersion_decode = json_decode($hardware_version_response,true);
		if($hardware_version_response == false || $hardwareVersion_decode['error'] ==true)
		{
            $data['min_ver'] = '';
			$data['maj_ver'] = '';
			$data['hardware_input'] = '';
			$data['hardware_output'] = '';
		}
		else
		{
			$data['min_ver'] = $hardwareVersion_decode['min_ver'];
			$data['maj_ver'] = $hardwareVersion_decode['maj_ver'];
			$data['hardware_input'] = $hardwareVersion_decode['input'];
			$data['hardware_output'] = $hardwareVersion_decode['output'];
		}
		/*<-------------------------Hardware Version------------------------->*/
		$enable_emm_data= $this->model_common_dashboardchannels->getEnableEMM(); 
		$data['enableEMM_data']=array();
		$m=0;
		foreach ($enable_emm_data as $enableEmm) 
		{
		    $data['enableEMM_data'][$m]=array('channel_id'=>$enableEmm['channel_id'],'rmx_no'=>$enableEmm['rmx_no'],'enable'=>$enableEmm['enable'],'output'=>$enableEmm['output']);
			$m++;
		}
    
       


		$ecmg_channel_data= $this->model_common_dashboardchannels->getECMGChannel(); 
		$data['ecmg_channel']=array();
		$m=0;
		foreach ($ecmg_channel_data as $ecmgdata) 
		{
		    $data['ecmg_channel'][$m]=array('ecmg_channel_id'=>$ecmgdata['ecmg_channel_id'],'Alias'=>$ecmgdata['Alias'],'Ip_Address'=>$ecmgdata['Ip_Address'],'Port'=>$ecmgdata['Port'],'Super_CAS_Id'=>$ecmgdata['Super_CAS_Id']);
			$m++;
		}
		$emmg_channel_data= $this->model_common_dashboardchannels->getEMMGChannel(); 
		$data['emmg_channel']=array();
		$n=0;
		foreach ($emmg_channel_data as $emmgdata) 
		{
		    $data['emmg_channel'][$n]=array('channel_id'=>$emmgdata['channel_id'],'alias'=>$emmgdata['alias'],'client_id'=>$emmgdata['client_id'],'data_id'=>$emmgdata['data_id'],'bandwidth'=>$emmgdata['bandwidth'],'port'=>$emmgdata['port'],'stream_id'=>$emmgdata['stream_id']);
			$n++;
		}
		$ECMStream= $this->model_common_dashboardchannels->getECMStream();
		$data['ecm_stream']=array();
		$s=0;
		foreach ($ECMStream as $ecm_stream_data) 
		{
		    $data['ecm_stream'][$s]=array('alias'=>$ecm_stream_data['ecm_stream_alias'],'access_criteria'=>$ecm_stream_data['ecm_stream_access_criteria'],'ecm_stream_ecmId'=>$ecm_stream_data['ecm_stream_ecmid'],'ecm_stream_CW_group'=>$ecm_stream_data['ecm_stream_CW_group'],'ecm_stream_streamid'=>$ecm_stream_data['ecm_stream_streamid'],'ecm_stream_CP_number'=>$ecm_stream_data['ecm_stream_CP_number'],'ecmg_id'=>$ecm_stream_data['ecmg_id']);
			$s++;
		}
		$Qam_info= $this->model_common_dashboardchannels->Qam();
		$data['Qam_detail']=array();
		$s=0;
		foreach ($Qam_info as $Qam_info_data) 
		{
		    $data['Qam_detail'][$s]=array('Qam_ID'=>$Qam_info_data['Qam_ID'],'Qam_name'=>$Qam_info_data['Qam_name'],'Ifreq'=>$Qam_info_data['Ifreq']);
			$s++;
		}
        $QamFreq_info= $this->model_common_dashboardchannels->Qam_freq();
		$data['QamFreq_detail']=array();
		$s=0;
		foreach ($QamFreq_info as $QamFreq_info_data) 
		{
		    $data['QamFreq_detail'][$s]=array('freq_ID'=>$QamFreq_info_data['freq_ID'],'freq_name'=>$QamFreq_info_data['freq_name'],'qam_id'=>$QamFreq_info_data['qam_id'],'frequency'=>$QamFreq_info_data['frequency']);
			$s++;
		}

        /************************************************************************************
                   IP OUT
        *************************************************************************************/
	    $GEdata= $this->model_common_dashboardchannels->GEInput(); 
		$data['GE_data']=array();
		$m=0;
		foreach ($GEdata as $GEname) 
		{
		    $data['GE_data'][$m]=array('GEName'=>$GEname['GEName']);
			$m++;
		}
        $getIpStream= $this->model_common_dashboardchannels->getIpStream(); 
		$data['Ipstream']=array();
		$m=0;
		foreach ($getIpStream as $stream) 
		{
		    $data['Ipstream'][$m]=array('Port'=>$stream['Port'],'rmx_no'=>$stream['rmx_no'],'Ip_Address'=>$stream['Ip_Address'],'Qam_id'=>$stream['Qam_id'],'payload_interface'=>$stream['payload_interface'],'channel_no'=>$stream['channel_no'],'id'=>$stream['id']);
			$m++;
		}
		$data['no_of_output']= $this->model_common_dashboardchannels->output_selection();
		$data['RMX_ip'] = RMX_IP;
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');
		$data['no_of_input']=$no_of_input;
		
		$this->response->setOutput($this->load->view('common/dashboard.tpl', $data));
}
public function getChannelInformation()
{
	$req_data = array();
	$restapi_object = new restapi();
	$channelNumber = $this->request->get['channel_number'];
	$input = $this->request->get['input_id'];
	$rmx_no = $this->request->get['rmx_no'];
	$output = $this->request->get['targetid'];
	$this->load->model('common/dashboardchannels');
			$ECMStream= $this->model_common_dashboardchannels->getECMStream();
			$stream=array();
			$s=0;
			foreach ($ECMStream as $ecm_stream_data) 
			{
			    $stream[$s]=array('alias'=>$ecm_stream_data['ecm_stream_alias'],'ecm_stream_ecmId'=>$ecm_stream_data['ecm_stream_ecmid'],'ecmg_id'=>$ecm_stream_data['ecmg_id']);
				$s++;
			}     
			$ecmg_channel_data= $this->model_common_dashboardchannels->getECMGChannel(); 
			$ecmg_channel=array();
			$m=0;
			foreach ($ecmg_channel_data as $ecmgdata) 
			{
			    $ecmg_channel[$m]=array('ecmg_channel_id'=>$ecmgdata['ecmg_channel_id'],'Alias'=>$ecmgdata['Alias']);
				$m++;
			}
				$high_priority_data= $this->model_common_dashboardchannels->get_high_priority($channelNumber,$input); 
				$high_priority=array();
				$m=0;
				foreach ($high_priority_data as $prioritydata) 
				{
				    $high_priority[$m]=array('Priority_checkbox'=>$prioritydata['Priority_checkbox']);
					$m++;
				}
	        $pmt_alarm_data= $this->model_common_dashboardchannels->get_pmt_alarm($channelNumber,$input); 
			$pmt_alarm=array();
			$m=0;
			foreach ($pmt_alarm_data as $alarmdata) 
			{
			    $pmt_alarm[$m]=array('alarm_enable'=>$alarmdata['alarm_enable']);
				$m++;
			}
			// get scrambled data
		    $Scrambleddata= $this->model_common_dashboardchannels->getScrambledServices(); 
			$Scrambled_data=array();
			$m=0;
			foreach ($Scrambleddata as $scrambledname) 
			{
			    $Scrambled_data[$m]=array('input'=>$scrambledname['input'],'rmx_no'=>$scrambledname['rmx_no'],'output'=>$scrambledname['output'],'programNumbers'=>$scrambledname['programNumbers'],'includeFlag'=>$scrambledname['includeFlag'],'keyids'=>$scrambledname['keyids'],'scramble'=>$scrambledname['scramble'],'parity'=>$scrambledname['parity']);
				$m++;
			}
		    //get scrambled data
			$hdr = array('Content-Type: application/x-www-form-urlencoded');
			$url_ch_detail = "http://".RMX_IP."/getChannelDetails";        
			$input_para="input=".$input."&output=".$output."&rmx_no=".$rmx_no."&progNumber=".$channelNumber;
			$ch_detail_resp = $restapi_object->callAPI("POST",$hdr,$url_ch_detail,$input_para);
			$ch_detail_decoded = json_decode($ch_detail_resp,true);
			$input_rate=""; 
			if($ch_detail_resp == false || $ch_detail_decoded['error'] == true)
			{
				$this->response->setOutput(1);
			}
			else{

				$input_rate =(isset($ch_detail_decoded["uInuputRate"])?$ch_detail_decoded["uInuputRate"]:"");
				$k=0;
				$video_pos=-1;
				$audio_pos=-1;
				if($ch_detail_decoded["type"]!= null)
				{
				  foreach ($ch_detail_decoded["type"] as $value) {
					if($value==27){
						$video_pos=$k;
					}elseif ($value==3 || $value==4) {
						$audio_pos=$k;
					}
					$k++;
				}	
				}
				
           
				$video_pid = ($video_pos != -1) ? $ch_detail_decoded['type'][$video_pos]:" ";
				$audio_pid = ($audio_pos != -1) ? $ch_detail_decoded['type'][$audio_pos]:" ";

				$video_band = ($video_pos != -1) ?$ch_detail_decoded['band'][$video_pos]:0;
				$audio_band = ($audio_pos != -1) ?$ch_detail_decoded['band'][$audio_pos]:0;

				$video_pids = ($video_pos != -1) ?$ch_detail_decoded['PIDS'][$video_pos]:"";
				$audio_pids = ($audio_pos != -1) ?$ch_detail_decoded['PIDS'][$audio_pos]:"";
				$pcr_pid = (sizeof($ch_detail_decoded['PIDS']) > 0)? $ch_detail_decoded['PIDS'][0] : 0;
				$pmt_pid = (sizeof($ch_detail_decoded['PIDS']) > 1)? $ch_detail_decoded['PIDS'][1] : 0;
				$channel_data = array('serviceprovider'=>$ch_detail_decoded['original_provider_name'],'servicetype'=>'Digital Telivision Services','PMTpid'=>$pmt_pid,'PCRpid'=>$pcr_pid,'audiopid'=>$audio_pid,'videopid'=>$video_pid,"input_rate"=>$input_rate,'video_per'=>$video_band,'audio_per'=>$audio_band,'audiopid_no'=>$audio_pids,'videopid_no'=>$video_pids,'Affected_input'=>$ch_detail_decoded['affected_input']);

				
			}     
			$channel_data['ecmg_channel'] = $ecmg_channel;
			$channel_data['stream'] = $stream;
	        $channel_data['pmt_alarm'] = $pmt_alarm_data;
	        $channel_data['high_priority'] = $high_priority;
	        $channel_data['Scrambled_data'] = $Scrambled_data;
			$channel_json_arr=json_encode($channel_data);
			$this->response->setOutput($channel_json_arr); 	
}
public function getchannelstatus()
{
    $req_data = array();
	$restapi_object = new restapi();
	
	$input = $this->request->get['input_id'];
	$rmx_no = $this->request->get['rmx_no'];
	$output = 0;

			$hdr = array('Content-Type: application/x-www-form-urlencoded');
			$url_ch_detail = "http://".RMX_IP."/getDataflowRates";        
			$input_para="input=".$input."&output=".$output."&rmx_no=".$rmx_no;
			$ch_detail_resp = $restapi_object->callAPI("POST",$hdr,$url_ch_detail,$input_para);
			$ch_detail_decoded = json_decode($ch_detail_resp,true);
			$input_rate=""; 
			if($ch_detail_resp == false || $ch_detail_decoded['error'] == true)
			{
				$input_rate=1;
				//$this->response->setOutput(1);
			}
			else{
                    $input_rate =$ch_detail_decoded["uInuputRate"];
			}     
			
			$channel_json_arr=json_encode($input_rate);
			$this->response->setOutput($channel_json_arr);	
}
public  function addToOutput()                 
 {	
	$qam_targetid = $_POST['qam_id'];
	$channlNums = $_POST['channlNum'];
	$channelNames = $_POST['channelName'];
	$freq_id = $_POST['freq_id'];
	$re_value = $_POST['re_value'];
	$input = $_POST['input'];
	$includeFlag = $_POST['includeFlag'];
	$output_rmx_no= $qam_targetid +1;
    $rmx_no=$qam_targetid +1;
	$this->load->model('common/dashboardchannels');
	$no_of_input= $this->model_common_dashboardchannels->rmx_config();
    $output_rmx_no=floor(($re_value/$no_of_input))+1;
    $input = $input%$no_of_input;
    $duplicate_services = array();
    if($rmx_no == $output_rmx_no)
    {
	    $frequency_ch=$this->model_common_dashboardchannels->channelFreq($qam_targetid,$freq_id);
	    $frequency=array();
		
        for ($i=0; $i < sizeof($channlNums); $i++) { 
         $duplicate_services[$i]=$this->model_common_dashboardchannels->isDuplicate($channlNums[$i],$input,$freq_id,$rmx_no);
        }
	    $ch_numbers = array('programNumber' => $channlNums);
		$url_channel = "http://".RMX_IP."/setKeepProg"; 
		$hdr = array('Content-Type: application/x-www-form-urlencoded');
		$data="programNumbers=".json_encode($ch_numbers)."&input=".$input."&output=".$freq_id."&includeFlag=".$includeFlag."&rmx_no=".$rmx_no;
		$restapi_object = new restapi();
		$channleActivation_resp = $restapi_object->callAPI("POST",$hdr,$url_channel,$data);
		$channelActivation_decoded = json_decode($channleActivation_resp,true);
		if($channleActivation_resp == false || $channelActivation_decoded['error'] == true)
		{
		 	$resp = 0;	
		}else{		 
			$resp_id = $this->model_common_dashboardchannels->addOutputChannels($freq_id,$channlNums,$input,$channelNames,$rmx_no,$frequency_ch);
			if($resp_id!=0)
		 		$resp=1;
		 	else
		 		$resp=2;
		 }
	}else{
		$resp= -1;
	}
	$test = array('1');
	$response_arr= array("error" => $resp,"status_array" => $duplicate_services);
	$this->response->setOutput(json_encode($response_arr));
 }
public function deleteChannel()   
 {
	$ch_number = $this->request->get['ch_number'];
	$target_id = $this->request->get['target_id'];
	$inputid = $this->request->get['inputid'];
	$rmx_no = $this->request->get['rmx_no'];
	$includeFlag = $this->request->get['includeFlag'];
    $qam_id=$rmx_no-1;
	$this->load->model('common/dashboardchannels');

		$ch_numbers = array('programNumber' => array($ch_number));
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
        $restapi_object = new restapi();
	 	$url_channel = "http://".RMX_IP."/setKeepProg";
        $data1="programNumbers=".json_encode($ch_numbers)."&input=".$inputid."&output=".$target_id."&includeFlag=".$includeFlag."&rmx_no=".$rmx_no;
        $Delete_ch_resp = $restapi_object->callAPI("POST",$hdr,$url_channel,$data1);
        $Delete_ch_decoded = json_decode($Delete_ch_resp,true);

         if($Delete_ch_resp == false || $Delete_ch_decoded['error'] == true)
		 	{
		 		$resp=0;
		 	}
	 	else
		 	{
		 		$resp_id=$this->model_common_dashboardchannels->deleteChannel($ch_number,$target_id,$inputid,$rmx_no);
		 		if($resp_id!=0)
		 		   $resp=1;
		 	    else
		 		   $resp=2;	
		 	}
		 	$this->model_common_dashboardchannels->addTunertype($rmx_no ,$inputid,-1);
	 	$this->response->setOutput($resp);	

 } 
public function addECMGChannel()         
 {
	$resp = 0;
	$ip_Address = $this->request->get['ip_Address'];
	$port = $this->request->get['port'];
	$super_CAS_Id = $this->request->get['super_CAS_Id'];
	$ecmg_Channel_Id = $this->request->get['ecmg_Channel_Id'];
	$Alias = $this->request->get['Alias'];
	$Enable = $this->request->get['Enable'];
	$Cryptoperiod = $this->request->get['Cryptoperiod'];

	$url_addECMG = "http://".RMX_IP."/addECMChannelSetup";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$ecmg_data="channel_id=".$ecmg_Channel_Id."&supercas_id=".$super_CAS_Id."&ip=".$ip_Address."&port=".$port;
 	$restapi_object = new restapi();
 	$ecmg_resp = $restapi_object->callAPI("POST",$hdr,$url_addECMG,$ecmg_data);
 	$ecmg_resp_decoded = json_decode($ecmg_resp,true);
 	if($ecmg_resp == false || $ecmg_resp_decoded['error'] == true)
 	{
 		$resp = 0;
 	}
 	else
 	{
 		$this->load->model('common/dashboardchannels');
		$result = $this->model_common_dashboardchannels->addECMGChannel($ecmg_Channel_Id,$Alias,$Enable,$ip_Address,$port,$super_CAS_Id,$Cryptoperiod); 
		$resp = $result;
 	}
 	$this->response->setOutput($resp); 	
 }
public function addEMMGChannel()           
 {
	$emm_alias = $this->request->get['emm_alias'];
	$emm_bw = $this->request->get['emm_bw'];
	$emm_channelid = $this->request->get['emm_channelid'];
	$emm_streamid = $this->request->get['emm_streamid'];
	$emm_clientid = $this->request->get['emm_clientid'];
	$emm_port = $this->request->get['emm_port'];
	$emm_dataid = $this->request->get['emm_dataid'];
	$emm_enable = $this->request->get['emm_enable'];

	$url_addEMMG = "http://".RMX_IP."/addEmmgSetup";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$emmg_data="channel_id=".$emm_channelid."&client_id=".$emm_clientid."&data_id=".$emm_dataid."&bw=".$emm_bw."&port=".$emm_port."&stream_id=".$emm_streamid;
 	$restapi_object = new restapi();
 	$emmg_resp = $restapi_object->callAPI("POST",$hdr,$url_addEMMG,$emmg_data);
 	$emmg_resp_decoded = json_decode($emmg_resp,true);
 	if($emmg_resp == false || $emmg_resp_decoded['error'] == true)
 	{
 		$resp = 0;
 		$this->response->setOutput($resp);
 	}
 	else
 	{
 		$this->load->model('common/dashboardchannels');
		$this->model_common_dashboardchannels->addEMMGChannel($emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_enable);
		$resp = 1;
 		$this->response->setOutput($resp);
 	}
 }
 public function enableEMM()
 {
 	$output = $this->request->get['output'];
	$qam_id = $this->request->get['qam_id'];
	$EnableEMM = $this->request->get['EnableEMM'];
	$channel_id = $this->request->get['channel_id'];
    
	$url_enable_emm = "http://".RMX_IP."/setCATCADescriptor";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$emmg_data="channel_id=".$channel_id."&output=".$output."&rmx_no=".($qam_id+1);
 	$restapi_object = new restapi();
 	$emmg_resp = $restapi_object->callAPI("POST",$hdr,$url_enable_emm,$emmg_data);
 	$emmg_resp_decoded = json_decode($emmg_resp,true);
 	if($emmg_resp == false || $emmg_resp_decoded['status'] == true)
 	{
 		$resp = 1;
 		$this->response->setOutput($resp);
 	}
 	else
 	{
 		$rmx_no=$qam_id+1;
 		 $this->load->model('common/dashboardchannels');
		 $this->model_common_dashboardchannels->enableEMM($output,$rmx_no,$EnableEMM,$channel_id);
		 $resp = 0;
 		$this->response->setOutput($resp);
 	}
	
 }
public function addBaseFrequency()
 {
	$base_freq = $this->request->get['basefrequency'];
	$Qam_ID = $this->request->get['Qam_ID'];
	$rmx_no=$Qam_ID+1;
	
	$basefrequency_url = "http://".RMX_IP."/setCenterFrequency";      
	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	$data_freq ="center_frequency=".$base_freq."&rmx_no=".$rmx_no;
	$restapi_object = new restapi();
	$basefrequency_resp = $restapi_object->callAPI("POST",$hdr,$basefrequency_url,$data_freq);
	$basefrequency_resp_decoded = json_decode($basefrequency_resp,true);

	if($basefrequency_resp ==  false || $basefrequency_resp_decoded['error']==true)
	{
		$this->response->setOutput(0);
	}
	else
	{
		$this->load->model('common/dashboardchannels');
		$output_channel_data = $this->model_common_dashboardchannels->QamFreqUpdate($base_freq,$Qam_ID);
		$this->response->setOutput(1);
	}	
 }
public function getActivatedChannels()
 {
	$this->load->model('common/dashboardchannels');
		$output_channel_data = $this->model_common_dashboardchannels->getOutputActivatedChannels();
	$outputchannels_after_delete=array();
	$j=0;
	foreach ($output_channel_data as $outputdata) 
	{
		    $outputchannels_after_delete[$j]=array('channelname'=>$outputdata['output_channelname'],'channelnumber'=>$outputdata['channelnumber'],'qam_targetid'=>$outputdata['rmx_no'],'targetid'=>$outputdata['targetid'],'inputid'=>$outputdata['inputid']);
			$j++;
	}
	$output_channel_json_arr=json_encode($outputchannels_after_delete);
	$this->response->setOutput($output_channel_json_arr);
 }
/*public function storeIPInput()
 {
	$alias = $this->request->get['ge1_alias'];
	$port = $this->request->get['ge1_port'];
	$payload_interface = $this->request->get['payload_interface'];
	$ip = $this->request->get['ge1_ip'];

	$this->load->model('common/dashboardchannels');
	$res = $this->model_common_dashboardchannels->storeIpInput($alias,$ip,$port,$payload_interface);
	$this->response->setOutput($res);
 }*/
public function addECMStream()
 {
	$ecm_stream_alias = $this->request->get['ecm_stream_alias'];
	$ecm_stream_access_criteria = $this->request->get['ecm_stream_access_criteria'];
	$ecm_stream_ecmId = $this->request->get['ecm_stream_ecmId'];
	$ecm_stream_CW_group = $this->request->get['ecm_stream_CW_group'];
	$ecm_stream_CP_number = $this->request->get['ecm_stream_CP_number'];
	$ecm_stream_streamid = $this->request->get['ecm_stream_streamid'];
	$ecmg_channel_id = $this->request->get['ecmg_id'];
    
	$this->load->model('common/dashboardchannels');
	$result = $this->model_common_dashboardchannels->checkECMID_Duplicate($ecmg_channel_id,$ecm_stream_ecmId);
	if(sizeof($result)>0)
	{
		$resp = -1;
		$this->response->setOutput($resp);
	}
	else
	{
		$url_addECMGStream = "http://".RMX_IP."/addECMStreamSetup";      
		$restapi_object = new restapi();
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$ecmg_stream_data="channel_id=".$ecmg_channel_id."&stream_id=".$ecm_stream_streamid."&access_criteria=".$ecm_stream_access_criteria."&cp_number=".$ecm_stream_CP_number."&ecm_id=".$ecm_stream_ecmId;
	 	$ecmg_stream_resp = $restapi_object->callAPI("POST",$hdr,$url_addECMGStream,$ecmg_stream_data);
	 	$ecmg_stream_resp_decoded = json_decode($ecmg_stream_resp,true);
	 	
	 	if($ecmg_stream_resp == false || $ecmg_stream_resp_decoded['error'] == true)
	 	{
	 		$resp = 0;
	 	}
	 	else
	 	{
			$this->model_common_dashboardchannels->storeECMStream($ecm_stream_streamid,$ecmg_channel_id,$ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number);
			$resp = 1;
	 	}
		$this->response->setOutput($resp);
	}	
 }
public function getLastStreamId()
 {
	$ecm_id = $this->request->get['ecm_id'];
	$this->load->model('common/dashboardchannels');
	$streamid= $this->model_common_dashboardchannels->getLastStreamId($ecm_id);
	$this->response->setOutput($streamid);
 }
public function getECMG()
 {
	$channel_id = $this->request->get['channel_id'];
	$this->load->model('common/dashboardchannels');
	$ECMGdata= $this->model_common_dashboardchannels->getECMG($channel_id);
	$ecmg_json_arr=json_encode($ECMGdata);
	$this->response->setOutput($ecmg_json_arr);

 }
public function updateECMGChannel()           
 {	
	$original_id = $this->request->get['original_id'];
	$ip_Address = $this->request->get['ip_Address'];
	$port = $this->request->get['port'];
	$super_CAS_Id = $this->request->get['super_CAS_Id'];
	$ecmg_Channel_Id = $this->request->get['ecmg_Channel_Id'];
	$Alias = $this->request->get['Alias'];
	$Enable = $this->request->get['Enable'];
	$this->load->model('common/dashboardchannels');
	if($original_id == $ecmg_Channel_Id)
	{
		$url_addECMG = "http://".RMX_IP."/updateECMChannelSetup";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$ecmg_data="channel_id=".$ecmg_Channel_Id."&supercas_id=".$super_CAS_Id."&ip=".$ip_Address."&port=".$port."&old_channel_id=".$original_id;
	 	$restapi_object = new restapi();
	 	$ecmg_resp = $restapi_object->callAPI("POST",$hdr,$url_addECMG,$ecmg_data);
	 	$ecmg_resp_decoded = json_decode($ecmg_resp,true);
	 	if($ecmg_resp == true || $ecmg_resp_decoded['error'] == false)
	 	{
	 		$this->model_common_dashboardchannels->updateECMGChannel($ecmg_Channel_Id,$Alias,$Enable,$ip_Address,$port,$super_CAS_Id,$original_id);
	 		$this->response->setOutput(1);
	 	}
	 	else if($ecmg_resp == false || $ecmg_resp_decoded['error'] == true)
	 	{	
	 		$this->response->setOutput(0);
	 	}
	}
	else
	{
		$result = $this->model_common_dashboardchannels->checkValidECMG($ecmg_Channel_Id);
		if(sizeof($result)>0)
		{
			$this->response->setOutput(0);
		}
		else
		{
			$url_addECMG = "http://".RMX_IP."/updateECMChannelSetup";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$ecmg_data="channel_id=".$ecmg_Channel_Id."&supercas_id=".$super_CAS_Id."&ip=".$ip_Address."&port=".$port."&old_channel_id=".$original_id;
		 	$restapi_object = new restapi();
		 	$ecmg_resp = $restapi_object->callAPI("POST",$hdr,$url_addECMG,$ecmg_data);
		 	$ecmg_resp_decoded = json_decode($ecmg_resp,true);
	 		if($ecmg_resp == false || $ecmg_resp_decoded['error'] == true)
		 	{
		 		$this->response->setOutput(0);
		 	}
		 	else
		 	{
		 		$this->model_common_dashboardchannels->updateECMGChannel($ecmg_Channel_Id,$Alias,$Enable,$ip_Address,$port,$super_CAS_Id,$original_id);
		 		$this->response->setOutput(1);
		 	}
		}
	}
 }
public function getLastECMGId()
 {
	$this->load->model('common/dashboardchannels');
	$ECMG= $this->model_common_dashboardchannels->getECMGChannel();
	$ECMG_id = array();
	$id = array();
	$val = sizeof($ECMG);
	$id = array($val);
	$ECMG_id = array('id'=>0);
	foreach ($ECMG as $ecmg_id) 
	{
	   $ECMG_id = array('id'=>$ecmg_id['ecmg_channel_id']);			
	}
	array_push($ECMG_id,$val);
	$json_arr=json_encode($ECMG_id);
	$this->response->setOutput($json_arr);
 }
public function getECMStreamData()
{	
	$stream_id = $this->request->get['stream_id'];
	$channel_id = $this->request->get['channel_id'];

	$this->load->model('common/dashboardchannels');
	$ECMGStream= $this->model_common_dashboardchannels->getStreamData($stream_id,$channel_id);
	$ecmg_stream_json_arr=json_encode($ECMGStream);
	$this->response->setOutput($ecmg_stream_json_arr);
}
public function updateECMStream()            
{
	$resp = 0;
	$ecm_stream_alias = $this->request->get['ecm_stream_alias'];
	$ecm_stream_access_criteria = $this->request->get['ecm_stream_access_criteria'];
	$ecm_stream_ecmId = $this->request->get['ecm_stream_ecmId'];
	$ecm_stream_CW_group = $this->request->get['ecm_stream_CW_group'];
	$ecm_stream_CP_number = $this->request->get['ecm_stream_CP_number'];
	$original_streamid = $this->request->get['original_streamid'];
	$original_ecmg_id = $this->request->get['original_ecmg_id'];
	$old_ecmid = $this->request->get['old_ecmid'];
    $this->load->model('common/dashboardchannels');
	if($old_ecmid == $ecm_stream_ecmId)
	{
		$url_addECMGStream = "http://".RMX_IP."/addECMStreamSetup";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$ecmg_stream_data="channel_id=".$original_ecmg_id."&stream_id=".$original_streamid."&access_criteria=".$ecm_stream_access_criteria."&cp_number=".$ecm_stream_CP_number."&ecm_id=".$ecm_stream_ecmId;
	 	$restapi_object = new restapi();
	 	$ecmg_stream_resp = $restapi_object->callAPI("POST",$hdr,$url_addECMGStream,$ecmg_stream_data);
	 	$ecmg_stream_resp_decoded = json_decode($ecmg_stream_resp,true);
		if($ecmg_stream_resp == false || $ecmg_stream_resp_decoded['error'] == true)
	 	{
	 		$resp = 0;
	 		$this->response->setOutput($resp);
	 	}
	 	else
	 	{
			$ECMStream = $this->model_common_dashboardchannels->updateECMStream($ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$original_streamid,$original_ecmg_id);
			$ecm_stream_json_arr=json_encode($ECMStream);
			$resp = 1;
			$this->response->setOutput($resp);
	 	}
	}
	else
	{
		$res = $this->model_common_dashboardchannels->checkECMID_Duplicate($original_ecmg_id,$ecm_stream_ecmId);
		if(sizeof($res)>0)
		{
			$resp = -1;
			$this->response->setOutput($resp);
		}
		else
		{
			$url_addECMGStream = "http://".RMX_IP."/addECMStreamSetup";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$ecmg_stream_data="channel_id=".$original_ecmg_id."&stream_id=".$original_streamid."&access_criteria=".$ecm_stream_access_criteria."&cp_number=".$ecm_stream_CP_number."&ecm_id=".$ecm_stream_ecmId;
		 	$restapi_object = new restapi();
		 	$ecmg_stream_resp = $restapi_object->callAPI("POST",$hdr,$url_addECMGStream,$ecmg_stream_data);
		 	$ecmg_stream_resp_decoded = json_decode($ecmg_stream_resp,true);
			if($ecmg_stream_resp == false || $ecmg_stream_resp_decoded['error'] == true)
		 	{
		 		$resp = 0;
		 		$this->response->setOutput($ecmg_stream_data);
		 	}
		 	else
		 	{
				$this->model_common_dashboardchannels->updateECMStream($ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$original_streamid,$original_ecmg_id);
				$resp = 1;
				$this->response->setOutput($resp);
		 	}
		}	
	}
 }
public function deleteECMG()
 {
	$ecmg_id = $this->request->get['ecmg_id'];
 	$url_ECM_delete = "http://".RMX_IP."/deleteECMChannelSetup";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data="channel_id=".$ecmg_id;
 	$restapi_object = new restapi();
 	$ECM_delete_resp = $restapi_object->callAPI("POST",$hdr,$url_ECM_delete,$data);
 	$ECM_delete_decode = json_decode($ECM_delete_resp,true);
 	$this->load->model('common/dashboardchannels');
 	if($ECM_delete_resp == false || $ECM_delete_decode['error'] == true)
		{
          $resp= -1;
		}
	else
	  {
		$this->model_common_dashboardchannels->deleteECMG($ecmg_id);
	    $resp=1;
 	  }
 	$this->response->setOutput($resp);
 }
public function deleteECMStream()
 {
	$resp = 0;
	$ecmg_id = $this->request->get['ecmg_id'];
	$stream_id = $this->request->get['stream_id'];
	$url_deleteECMStream = "http://".RMX_IP."/deleteECMStreamSetup";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$ecmg_stream_delete_data="channel_id=".$ecmg_id."&stream_id=".$stream_id;
 	$restapi_object = new restapi();
 	$ecm_stream_delete_resp = $restapi_object->callAPI("POST",$hdr,$url_deleteECMStream,$ecmg_stream_delete_data);
 	$ecm_stream_delete_resp_decoded = json_decode($ecm_stream_delete_resp,true);
 	if($ecm_stream_delete_resp == false || $$ecm_stream_delete_resp_decoded['error'] == true)
 	{
 		$resp = 0;
 	}
 	else
 	{
 		$this->load->model('common/dashboardchannels');
		$this->model_common_dashboardchannels->deleteECMStream($ecmg_id,$stream_id);
		$resp = 1;
 	}
	$this->response->setOutput($resp);
 }
/*public function getChannelData()
 {
	$port = $this->request->get['port'];
	$this->load->model('common/dashboardchannels');
	$Channeldata = $this->model_common_dashboardchannels->getChannelData($port);
	        $url_channel1 = "http://".RMX_IP."/setInputOutput";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$data1="input=".$port."&output=".$port;
		 	$restapi_object = new restapi();
		 	$input_output_resp = $restapi_object->callAPI("POST",$hdr,$url_channel1,$data1);
		 	if($input_output_resp == false)
		 	{
		 		$this->response->setOutput(1);
		 	}
		$get_priority_url = "http://".RMX_IP."/getHighPriorityServices";   
        $hdr = array('Content-Type: application/x-www-form-urlencoded');
        $restapi_object = new restapi();
		$get_priority_response = $restapi_object->callAPI("GET",$hdr,$get_priority_url,$data1=array());
		$get_priority_decoded = json_decode($get_priority_response,true);
			if($get_priority_response == false || $get_priority_decoded['error'] == true)
			{
              $this->response->setOutput(1);
			}	
	$Channeldata['priority']=$get_priority_decoded['pProg'];  
	$channeldata_json_arr=json_encode($Channeldata);
	$this->response->setOutput($channeldata_json_arr);
 }
public function delete_input()
 {
	$port = $this->request->get['port'];
	$this->load->model('common/dashboardchannels');
	$res = $this->model_common_dashboardchannels->delete_input($port);
	$this->response->setOutput($res);
 }
public function updateInput()
 {
	$alias = $this->request->get['ge1_alias'];
	$port = $this->request->get['ge1_port'];
	$ip = $this->request->get['ge1_ip'];
	$original_port = $this->request->get['original_port'];
	$this->load->model('common/dashboardchannels');
	$resp = $this->model_common_dashboardchannels->updateInput($alias,$ip,$port,$original_port);
	$this->response->setOutput($resp);
 }*/
public function getECMStreams()
 {
	$this->load->model('common/dashboardchannels');
	$streams = $this->model_common_dashboardchannels->getECMStreamNames();
	$stream_json_arr=json_encode($streams);
	$this->response->setOutput($stream_json_arr);
 }
public function getEMMid()
 {
	$this->load->model('common/dashboardchannels');
	$emmid = $this->model_common_dashboardchannels->getEMMid();
	$this->response->setOutput($emmid);
}
public function getEMMGData()
 {
	$channel_id = $this->request->get['channel_id'];
	$this->load->model('common/dashboardchannels');
	$emmdata = $this->model_common_dashboardchannels->getEMMGData($channel_id);
	$emm_json_arr=json_encode($emmdata);
	if($emm_json_arr== false)
	{
      $this->response->setOutput(1);
	}
	$this->response->setOutput($emm_json_arr);
 }
public function updateEMMG()
 {
	$emm_alias = $this->request->get['emm_alias'];
	$emm_bw = $this->request->get['emm_bw'];
	$emm_channelid = $this->request->get['emm_channelid'];
	$emm_streamid = $this->request->get['emm_streamid'];
	$emm_clientid = $this->request->get['emm_clientid'];
	$emm_port = $this->request->get['emm_port'];
	$emm_dataid = $this->request->get['emm_dataid'];
	$emm_enable = $this->request->get['emm_enable'];
	$url_updateEMMG = "http://".RMX_IP."/updateEmmgSetup";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$emmg_data="channel_id=".$emm_channelid."&client_id=".$emm_clientid."&data_id=".$emm_dataid."&bw=".$emm_bw."&port=".$emm_port."&stream_id=".$emm_streamid;
 	$restapi_object = new restapi();
 	$emmg_resp = $restapi_object->callAPI("POST",$hdr,$url_updateEMMG,$emmg_data);
 	$emmg_resp_decoded = json_decode($emmg_resp,true);
 	if($emmg_resp == false || $emmg_resp_decoded['error'] == true)
 	{
 		$resp = 0;
 		$this->response->setOutput($resp);
 	}
 	else
 	{
 		$this->load->model('common/dashboardchannels');
		$this->model_common_dashboardchannels->updateEMMG($emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_enable);
		$resp = 1;
 		$this->response->setOutput($resp);
 	}
 }
public function deleteEMMG()
 {
	$emm_channelid = $this->request->get['emm_channelid'];
 	$url_EMM_delete = "http://".RMX_IP."/deleteEMMSetup";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data="channel_id=".$emm_channelid;
 	$restapi_object = new restapi();
 	$EMM_delete_resp = $restapi_object->callAPI("POST",$hdr,$url_EMM_delete,$data);
 	$EMM_delete_decode = json_decode($EMM_delete_resp,true);
 	$this->load->model('common/dashboardchannels');
 	if($EMM_delete_resp == false || $EMM_delete_decode['error'] == true)
		{
          $resp= -1;
		}
	else
	  {
		$this->model_common_dashboardchannels->deleteEMMG($emm_channelid);
		$this->model_common_dashboardchannels->deleteEMMenable($emm_channelid);
	    $resp=1;
 	  }
 	$this->response->setOutput($resp);	
 }
public function GetTables()
 {
	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
	/*if($output > 3)
	{
		$output=$output/$output;
	}*/
	$url_table_detail = "http://".RMX_IP."/getTableDetails";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$table_detail_data="input=".$output."&output=".$output."&rmx_no=".$rmx_no;
 	$restapi_object = new restapi();
 	$table_detail_resp = $restapi_object->callAPI("POST",$hdr,$url_table_detail,$table_detail_data);
 	$table_detail_decode = json_decode($table_detail_resp,true);
 	if($table_detail_resp == false || $table_detail_decode['error'] == true)
		{
          $this->response->setOutput(-1);
		} 
	else
	{
	    $this->load->model('common/dashboardchannels');
		$generateData= $this->model_common_dashboardchannels->get_generate_mode($output,$rmx_no);
		foreach ($generateData as $psi_data) 
		{	
			$ex = array();
			$ex = array('PAT_TEXT'=>$psi_data['Update_PAT'],'CAT_TEXT'=>$psi_data['Update_CAT'],'SDT_TEXT'=>$psi_data['Update_SDT'],'NIT_TEXT'=>$psi_data['Update_NIT']);
		}
		$json_arr=json_encode(array_merge($ex,array('nit_int'=>$table_detail_decode['nit_int'],'pat_int'=>$table_detail_decode['pat_int'],'sdt_int'=>$table_detail_decode['sdt_int'],'nit_ver'=>$table_detail_decode['nit_ver'],'pat_ver'=>$table_detail_decode['pat_ver'],'sdt_ver'=>$table_detail_decode['sdt_ver'],'nit_isenable'=>$table_detail_decode['nit_isenable'],'pat_isenable'=>$table_detail_decode['pat_isenable'],'sdt_isenable'=>$table_detail_decode['sdt_isenable'])));

	    $this->response->setOutput($json_arr);	 
	}	     
 }
public function getBaseFreq()
 {
	$rmx_no = $this->request->get['rmx_no'];
	$Qam_ID=$rmx_no-1;
    $restapi_object = new restapi();
	$url_BaseFreq = "http://".RMX_IP."/getCenterFrequency/".$rmx_no;     
	$hdr = array('Content-Type: application/x-www-form-urlencoded');
    $BaseFreq_resp = $restapi_object->callAPI("GET",$hdr,$url_BaseFreq,$data1=array());
    $BaseFreq_decode = json_decode($BaseFreq_resp,true);
        if($BaseFreq_resp== false )
        {
        	$this->response->setOutput(1);
        }
        else
        {
        	$center_frequency=json_decode($BaseFreq_resp,true);
            $this->load->model('common/dashboardchannels');
		    $output_channel_data = $this->model_common_dashboardchannels->QamFreqUpdate($center_frequency['center_frequency'],$Qam_ID);
            $this->response->setOutput($BaseFreq_resp);    	
        }
 }
public function changeOutputSID()
{
	$original_chNumber = $this->request->get['original_chNumber'];
	$new_channelnumbar = $this->request->get['new_channelnumbar'];
	$input = $this->request->get['input'];
	$output = $this->request->get['output'];
	$new_service_name = $this->request->get['new_service_name'];
	$Enable_serviceName = $this->request->get['Enable_serviceName'];
	$service_provider = $this->request->get['service_provider'];
	$Enable_serviceProvider = $this->request->get['Enable_serviceProvider'];
	$rmx_no = $this->request->get['rmx_no'];
	$old_channelnumber = $this->request->get['old_channelnumber'];
	$org_chname = $this->request->get['org_chname'];
	$org_chprovider = $this->request->get['org_chprovider'];
	$old_enablechname = $this->request->get['old_enablechname'];
	$old_enablechProv = $this->request->get['old_enablechProv'];

    $this->load->model('common/dashboardchannels');
	$hdr = array('Content-Type: application/x-www-form-urlencoded');
    $restapi_object = new restapi();
 // ....................set Service Id..............................
    if($old_channelnumber!=$new_channelnumbar)
    {
 		if($original_chNumber!=$new_channelnumbar)
 		{
 	    
	        $original_service_id  = ''.$original_chNumber.'';
			$new_service_id  = ''.$new_channelnumbar.'';
			$addFlag=1;
		
	    }
	    else if($original_chNumber==$new_channelnumbar)
	    {           
	        $new_channelnumbar=-1;
	        $original_service_id  = ''.$original_chNumber.'';
		    $new_service_id  = 0;
		    $addFlag=0;
			        
	    }
	    $url_channel = "http://".RMX_IP."/setServiceID";
        $data="original_service_id=".$original_service_id ."&new_service_id=".$new_service_id."&input=".$input."&output=".$output."&rmx_no=".$rmx_no."&addFlag=".$addFlag;
		$object = new restapi();
		$channleActivation_resp = $restapi_object->callAPI("POST",$hdr,$url_channel,$data);
		$channelActivation_decoded = json_decode($channleActivation_resp,true);
		  
			if($channleActivation_resp == false || $channelActivation_decoded['error'] == true)
			{	
				$resp = 0;
			}
			else
			{
				$this->model_common_dashboardchannels->changeOutputPid($original_chNumber,$new_channelnumbar,$input,$output,$rmx_no); 
				$resp = 1;
				
			} 
	}
// ....................set Service Id..............................	    
// ....................set Service name..............................
	if($org_chname != $new_service_name || $old_enablechname != $Enable_serviceName)
	{
	    if($Enable_serviceName==1)
 		{   
	        $progNAME  = ''.$new_service_name.'';
			$progNUM   = ''.$original_chNumber.'';
			$addFlag=1;
	    }
	    else if($Enable_serviceName==0)
	    {
            $new_service_name='-1';
	        $progNAME  = ''.$new_service_name.'';
			$progNUM   = ''.$original_chNumber.'';
			$addFlag=0;
	    }
	        $url_set_service_name = "http://".RMX_IP."/setServiceName";
            $data_set_service_name="pname=".$progNAME ."&pnumber=".$progNUM."&input=".$input."&rmx_no=".$rmx_no."&addFlag=".$addFlag;
			$object = new restapi();
			$set_service_name_resp = $restapi_object->callAPI("POST",$hdr,$url_set_service_name,$data_set_service_name);
			$set_service_name_decoded = json_decode($set_service_name_resp,true);
			  
			if($set_service_name_resp == false || $set_service_name_decoded['error'] == true)
			{
				$resp = 2;
			}
			else
			{
				$this->model_common_dashboardchannels->changechannelname($new_service_name,$original_chNumber,$Enable_serviceName,$input,$output,$rmx_no); 
				$resp = 3;
				
			}
	}	
//......................set service name.............................
//......................set service provider.............................
	if($service_provider != $org_chprovider || $old_enablechProv != $Enable_serviceProvider)
	{
	    if($Enable_serviceProvider==1)
 		{
	 	     
	        $provNAME  = ''.$service_provider.'';
			$progNUM   = ''.$original_chNumber.'';
		    $addFlag   = 1;
			
	    }
	    else if($Enable_serviceProvider==0)
	    {
	        $service_provider='-1';
	        $provNAME  = 'test';
			$progNUM   = ''.$original_chNumber.'';
			$addFlag   = 0;
		
	    }
        $url_set_service_provider = "http://".RMX_IP."/setServiceProvider";
        $data_set_service_provider="providerName=".$provNAME ."&serviceNumber=".$progNUM."&input=".$input."&rmx_no=".$rmx_no."&addFlag=".$addFlag;
		$object = new restapi();
		$set_service_provider_resp = $restapi_object->callAPI("POST",$hdr,$url_set_service_provider,$data_set_service_provider);
		$set_service_provider_decoded = json_decode($set_service_provider_resp,true);
		 
		if($set_service_provider_resp == false || $set_service_provider_decoded['error'] == true)
		{
			$resp = 4;
		}
		else
		{
			$this->model_common_dashboardchannels->changechannelprovider($service_provider,$original_chNumber,$Enable_serviceProvider,$input,$output,$rmx_no); 
			$resp = 5;
			
		}
	}
//......................set service provider.............................
 	$this->response->setOutput($resp);
}
public function set_PSISiINT()
{
 	$Set_PAT = $this->request->get['Set_PAT'];
	$Set_SDT = $this->request->get['Set_SDT'];
	$Set_NIT = $this->request->get['Set_NIT'];
	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
 	$url_Set_table = "http://".RMX_IP."/setPsiSiInterval";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_Set_table="patint=".$Set_PAT."&sdtint=".$Set_SDT."&nitint=".$Set_NIT."&output=".$output."&rmx_no=".$rmx_no;
 	$restapi_object = new restapi();
 	$table_set_resp = $restapi_object->callAPI("POST",$hdr,$url_Set_table,$data_Set_table);
	 	if($table_set_resp == false )
	 	{
	 		$resp = 0;
	 	}
	 	else
	 	{
	 		$resp = 1;
	 	}
 	$this->response->setOutput($resp);
}
public function get_TSDetails()
{
	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	$restapi_object = new restapi();
	/*if($output>3)
	{
		$output=$output/$output;
	}*/
    $get_qam_url = "http://".RMX_IP."/getQAM/";
	$data_qam="rmx_no=".$rmx_no."&output=".$output; 
	$get_qam_response = $restapi_object->callAPI("POST",$hdr, $get_qam_url,$data_qam);
	$get_qam_decode = json_decode($get_qam_response,true);
	if($get_qam_response == false || $get_qam_decode['error'] ==true)
	{
         $this->response->setOutput(-1);
	}
	$get_gain_url = "http://".RMX_IP."/getGain/";
	$data_gain="rmx_no=".$rmx_no."&output=".$output; 
	$get_gain_response = $restapi_object->callAPI("POST",$hdr, $get_gain_url,$data_gain);
	$get_gain_decode = json_decode($get_gain_response,true);
	if($get_gain_response == false || $get_gain_decode['error'] ==true)
	{
         $this->response->setOutput(-2);
	}
    $get_FsymbolRate_url = "http://".RMX_IP."/getFSymbolRate/";
	$data_FsymbolRate="rmx_no=".$rmx_no."&output=".$output; 
	$get_FsymbolRate_response = $restapi_object->callAPI("POST",$hdr,$get_FsymbolRate_url,$data_FsymbolRate);
	$get_FsymbolRate_decode = json_decode($get_FsymbolRate_response,true);
	if($get_FsymbolRate_response == false || $get_FsymbolRate_decode['error'] ==true)
	{
         $this->response->setOutput(-3);
	}
	$get_bitStream_url = "http://".RMX_IP."/getSPIStatusReg/";
	$data_bitStream="rmx_no=".$rmx_no."&output=".$output; 
	$get_bitStream_response = $restapi_object->callAPI("POST",$hdr,$get_bitStream_url,$data_bitStream);
	$get_bitStream_decode = json_decode($get_bitStream_response,true);
	if($get_bitStream_response == false || $get_bitStream_decode['error'] ==true)
	{
         $this->response->setOutput(-4);
	}
	$get_nitMode_url = "http://".RMX_IP."/getNITmode/";
	$data_nitMode="rmx_no=".$rmx_no."&output=".$output."&input=".$output; 
	$get_nitMode_response = $restapi_object->callAPI("POST",$hdr,$get_nitMode_url,$data_nitMode);
	$get_nitMode_decode = json_decode($get_nitMode_response,true);
	if($get_nitMode_response == false || $get_nitMode_decode['error'] ==true)
	{
         $this->response->setOutput(-5);
	}
    $url_get_TSDetail = "http://".RMX_IP."/getTSDetails"; 
	$data_get_TSDetail="input=".$output."&output=".$output."&rmx_no=".$rmx_no;
    $TSDetail_resp = $restapi_object->callAPI("POST",$hdr,$url_get_TSDetail,$data_get_TSDetail);
    $TSDetail_data = json_decode($TSDetail_resp,true);
    if($TSDetail_resp == false || $TSDetail_data['error'] == true)
		{
		 $this->response->setOutput(1);	
		}
	$this->load->model('common/dashboardchannels');
	$IpOutputChannel=array();
	$IpOutputChannel= $this->model_common_dashboardchannels->getIpStream($rmx_no,$output+1); 
	// $data['IpOutputChannel']=array();
	// $m=0;
	// foreach ($getIpStream as $stream) 
	// {
	//     $data['Ipstream'][$m]=array('Port'=>$stream['Port'],'rmx_no'=>$stream['rmx_no'],'Ip_Address'=>$stream['Ip_Address'],'Qam_id'=>$stream['Qam_id'],'payload_interface'=>$stream['payload_interface'],'channel_no'=>$stream['channel_no'],'id'=>$stream['id']);
	// 	$m++;
	// }
	/*$this->load->model('common/dashboardchannels');
	$NITmode= $this->model_common_dashboardchannels->get_NIT_mode();*/

    $json_arr=json_encode(array('uTS_Id'=>$TSDetail_data['uTS_Id'],'uNet_Id'=>$TSDetail_data['uNet_Id'],'uOrigNet_Id'=>$TSDetail_data['uOrigNet_Id'],'nit_selected_id'=>$TSDetail_data['NIT_code'],'Qam_no'=>$get_qam_decode['qam'],'invert_IQ'=>$get_gain_decode['invert_IQ'],'Gain'=>$get_gain_decode['gain'],'FsymbolRate'=>$get_FsymbolRate_decode['fsymbol_rate'],'Rolloff'=>$get_FsymbolRate_decode['rolloff'],'bitStream'=>$get_bitStream_decode['bitstream'],'nitCode'=>$get_nitMode_decode['NIT_code'],'nitMode'=>$get_nitMode_decode['NIT_mode'],'IpOutputChannel'=>$IpOutputChannel));
    $this->response->setOutput($json_arr);		       
 }              
public function set_TS_ID()
 {
    $Set_TSID = $this->request->get['Set_TSID'];
    $Set_orgID = $this->request->get['Set_orgID'];
    $Set_NetworkID = $this->request->get['Set_NetworkID'];
	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
 	$url_Set_TSID = "http://".RMX_IP."/setTsId";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_Set_TSID="transportid=".$Set_TSID ."&originalnwid=".$Set_orgID."&networkid=".$Set_NetworkID."&output=".$output."&rmx_no=".$rmx_no;
 	$restapi_object = new restapi();
 	$TSID_set_resp = $restapi_object->callAPI("POST",$hdr,$url_Set_TSID,$data_Set_TSID);
 	$TSID_set_resp_decoded = json_decode($TSID_set_resp ,true);

 	if($TSID_set_resp == false || $TSID_set_resp_decoded['error'] == true)
 	{
 		$resp = 0;
 	}
 	else
 	{
 		$resp = 1;
 	}
 	$this->response->setOutput($resp);	
 }
public function downloadTables()
{
	$type = $this->request->get['type'];
	$table = $this->request->get['table'];
	$rmx_no = $this->request->get['rmx_no'];
 	$url_table = "http://".RMX_IP."/downloadTables";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_table="type=".$type."&table=".$table."&rmx_no=".$rmx_no;
 	$restapi_object = new restapi();
 	$resp=0;
 	$table_resp = $restapi_object->callAPI("POST",$hdr,$url_table,$data_table);
 	if($table_resp==false)
 	{
      $resp=-1;
 	}
 	$this->response->setOutput($resp);
}
public function generate_mode()
{
	$PAT_TEXT = $this->request->get['PAT_TEXT'];
	$CAT_TEXT = $this->request->get['CAT_TEXT'];
	$SDT_TEXT = $this->request->get['SDT_TEXT'];
	$NIT_TEXT = $this->request->get['NIT_TEXT'];
    $output = $this->request->get['output'];
    $rmx_no = $this->request->get['rmx_no'];
	$this->load->model('common/dashboardchannels');
	$this->model_common_dashboardchannels->generate_mode($PAT_TEXT,$CAT_TEXT,$SDT_TEXT,$NIT_TEXT,$output,$rmx_no);	
}
public function set_nit_mode()
{
    $output = $this->request->get['output'];
	$nit_mode = $this->request->get['nit_mode'];
	$rmx_no = $this->request->get['rmx_no'];
		$url_NIT = "http://".RMX_IP."/setNITmode";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_nit="mode=".$nit_mode."&output=".$output."&rmx_no=".$rmx_no;
	 	$restapi_object = new restapi();
	 	$resp=0;
	 	$nit_resp = $restapi_object->callAPI("POST",$hdr,$url_NIT,$data_nit);
	 	if($nit_resp == false)
 	      {
 		    $resp = -1;
 	      }
 	 $this->response->setOutput($resp);	
}
public function set_table_ver()
{
    $changed_nit_ver = $this->request->get['changed_nit_ver'];
	$changed_pat_ver = $this->request->get['changed_pat_ver'];
	$changed_sdt_ver = $this->request->get['changed_sdt_ver'];
	$nit_isenable = $this->request->get['nit_isenable'];
	$pat_isenable = $this->request->get['pat_isenable'];
	$sdt_isenable = $this->request->get['sdt_isenable'];
	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
		$url_table_version = "http://".RMX_IP."/setTablesVersion";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_table_version="pat_ver=".$changed_pat_ver."&sdt_ver=".$changed_sdt_ver."&nit_ver=".$changed_nit_ver."&nit_isenable=".$nit_isenable."&pat_isenable=".$pat_isenable."&sdt_isenable=".$sdt_isenable."&output=".$output."&rmx_no=".$rmx_no;
	 	$restapi_object = new restapi();
	 	$table_version_resp =$restapi_object->callAPI("POST",$hdr,$url_table_version,$data_table_version);
	 	$table_version_decoded = json_decode($table_version_resp ,true);

	 	if($table_version_resp == false || $table_version_decoded['error'] == true)
 	      {
 		    $this->response->setOutput(1);
 	      }
 	$this->response->setOutput(0);
}
public function set_pmt_alarm()
{
   $Pmt_alarm = $this->request->get['Pmt_alarm'];
   $input = $this->request->get['input'];
   $progNum = $this->request->get['progNum'];
   $rmx_no = $this->request->get['rmx_no'];
   $url_pmt_alarm = "http://".RMX_IP."/setPmtAlarm";      
   $hdr = array('Content-Type: application/x-www-form-urlencoded');
   $data_pmt_alarm="programNumber=".$progNum."&alarm=".$Pmt_alarm."&input=".$input."&rmx_no=".$rmx_no;
   $restapi_object = new restapi();
   $pmt_alarm_resp =$restapi_object->callAPI("POST",$hdr,$url_pmt_alarm,$data_pmt_alarm);
   $pmt_alarm_decoded = json_decode($pmt_alarm_resp ,true);
    
 	if($pmt_alarm_resp == false || $pmt_alarm_decoded['error'] == true)
	{
	  $this->response->setOutput(1);
	}
	$this->load->model('common/dashboardchannels');
	$this->model_common_dashboardchannels->pmt_alarm($progNum,$input,$Pmt_alarm); 
	$this->response->setOutput(0);      
}
 public function set_high_priority()
  {
   $Priority_checkbox = $this->request->get['Priority_checkbox'];
   $input = $this->request->get['input'];
   $program_number = $this->request->get['program_number'];
   $rmx_no = $this->request->get['rmx_no'];
    $url_high_priority = "http://".RMX_IP."/setHighPriorityServices";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_high_priority="programNumber=".$program_number."&input=".$input."&rmx_no=".$rmx_no;
 	$restapi_object = new restapi();
 	$high_priority_resp =$restapi_object->callAPI("POST",$hdr,$url_high_priority,$data_high_priority);
    $high_priority_decoded = json_decode($high_priority_resp ,true);
 	if($high_priority_resp == false || $high_priority_decoded['error'] == true)
      {
	    $this->response->setOutput(1);
      }
     $this->load->model('common/dashboardchannels');
     $this->model_common_dashboardchannels->high_priority($Priority_checkbox,$input,$program_number); 
     $this->response->setOutput(0);
  } 	    
public function getFrequencies()
 {
  	$no_of_output = $this->request->get['no_of_output'];
    $ifrequency = $this->request->get['basefrequency'];
    $Qam_ID = $this->request->get['Qam_ID'];

    $rmx_no = $Qam_ID + 1;
    $this->load->model('common/dashboardchannels');
	$frequencies=array();
	$center_frequency = $ifrequency-28;
	for ($i=0; $i < $no_of_output ; $i++) { 
		$frequencies[$i] = $center_frequency +($i * 8);
	}
    $qam_frequencies=json_encode($frequencies);
	for($i=0;$i<$no_of_output;$i++)
	{
		
		$this->model_common_dashboardchannels->FreqUpdate($frequencies[$i],$Qam_ID,$i);
		$this->model_common_dashboardchannels->updateOutputChannel($frequencies[$i],$rmx_no,$i);
	}
	$this->response->setOutput($qam_frequencies);
 }
public function addipStreaming()
{
	$port = $this->request->get['Port'];
	$qam_id = $this->request->get['qam_id'];
	$ip_address = $this->request->get['Ip'];
	$payload_interface = $this->request->get['payload_interface'];
	$channel_no = $this->request->get['channelNo'];
	$rmx_no=$qam_id+1;
     
    $url_Addip = "http://".RMX_IP."/setEthernetOut";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_Addip="port=".$port."&ip_address=".$ip_address."&rmx_no=".$rmx_no."&channel_no=".$channel_no;
 	$restapi_object = new restapi();
 	$Addip_resp =$restapi_object->callAPI("POST",$hdr,$url_Addip,$data_Addip);
    $Addip_decoded = json_decode($Addip_resp ,true);
 	if($Addip_resp == false || $Addip_decoded['error'] == true)
      {
	    $resp=-1;
      }
    else
    {
       $this->load->model('common/dashboardchannels');
	   $resp_id =$this->model_common_dashboardchannels->addIpStream($port,$rmx_no,$ip_address,$qam_id,$payload_interface,$channel_no);  
	   if($resp_id!=0)
		   $resp=0;
	   else
		   $resp=1;	
    }
     $this->response->setOutput($resp);
	
}
public function deleteIP()
{
	$Port = $this->request->get['portNo'];
	$rmx_no = $this->request->get['rmx_no'];
	$channel_number = $this->request->get['channel_number'];
	$Ip_Address = $this->request->get['ip_address'];
     
    $url_deleteip = "http://".RMX_IP."/setEthernetOutOff";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_deleteip="&rmx_no=".$rmx_no."&channel_no=".$channel_number;
 	$restapi_object = new restapi();
 	$deleteip_resp =$restapi_object->callAPI("POST",$hdr,$url_deleteip,$data_deleteip);
    $deleteip_decoded = json_decode($deleteip_resp ,true);
    if($deleteip_resp == false || $deleteip_decoded['error'] == true)
      {
	    $resp=-1;
      }
    else
    {
    	$this->load->model('common/dashboardchannels');
		$resp_id =$this->model_common_dashboardchannels->deleteIP($Port,$rmx_no,$Ip_Address,$channel_number);  
		if($resp_id!=0)
			$resp=0;
		else
			$resp=1;
	}
	$this->response->setOutput($resp);
}
public function updateipStreaming()
 {
	$port = $this->request->get['Port'];
	$rmx_no = $this->request->get['rmx_no'];
	$ip_address = $this->request->get['Ip_Address'];
	$channel_no = $this->request->get['channel_no'];
	$payload_interface = $this->request->get['payload_interface'];
	$id = $this->request->get['id'];
	
	$url_Updateip = "http://".RMX_IP."/setEthernetOut";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_Updateip="port=".$port."&ip_address=".$ip_address."&rmx_no=".$rmx_no."&channel_no=".$channel_no;
 	$restapi_object = new restapi();
 	$Updateip_resp =$restapi_object->callAPI("POST",$hdr,$url_Updateip,$data_Updateip);
    $Updateip_decoded = json_decode($Updateip_resp ,true);
    if($Updateip_resp == false || $Updateip_decoded['error'] == true)
      {
	    $resp=-1;
      }
    else
    {
		$this->load->model('common/dashboardchannels');
		$resp_id =$this->model_common_dashboardchannels->updateIpStream($port,$ip_address,$channel_no,$id);  
		if($resp_id!=0)
			$resp=0;
		else
			$resp=1;
	}
	 $this->response->setOutput($resp);
 }
 public function changeModulation()
 {
    $qam_no = $this->request->get['qam_no'];
	$rmx_no = $this->request->get['rmx_no'];
	$output = $this->request->get['output'];	
	    $url_change_modulation = "http://".RMX_IP."/setQAM";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_change_modulation="qam_no=".$qam_no."&rmx_no=".$rmx_no."&output=".$output;
	 	$restapi_object = new restapi();
	 	$change_modulation_resp =$restapi_object->callAPI("POST",$hdr,$url_change_modulation,$data_change_modulation);
        $change_modulation_decoded = json_decode($change_modulation_resp ,true);
	 	if($change_modulation_resp == false || $change_modulation_decoded['error'] == true)
 	      {
 		    $resp=1;
 	      }
 	    else
 	      {
 	    	$resp=0;
 	      }
 	    $this->response->setOutput($resp);
 }
 public function set_symbolRate()
 {
    $fsymbol_rate = $this->request->get['newSymbolRate'];
	$rmx_no = $this->request->get['rmx_no'];
	$output = $this->request->get['output'];
	$rolloff = $this->request->get['Roll_Off'];
    $url_set_symbolRate = "http://".RMX_IP."/setFSymbolRate";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_set_symbolRate="fsymbol_rate=".$fsymbol_rate."&rmx_no=".$rmx_no."&output=".$output."&rolloff=".$rolloff;
 	$restapi_object = new restapi();
 	$set_symbolRate_resp =$restapi_object->callAPI("POST",$hdr,$url_set_symbolRate,$data_set_symbolRate);
    $set_symbolRate_decoded = json_decode($set_symbolRate_resp ,true);
 	if($set_symbolRate_resp == false || $set_symbolRate_decoded['error'] == true)
      {
	    $resp=1;
      }
    else
      {
    	$resp=0;
      }
    $this->response->setOutput($resp);
 }
  public function confGain()
  {
  	$invert_IQ = $this->request->get['invert_IQ'];
	$rmx_no = $this->request->get['rmx_no'];
	$output = $this->request->get['output'];
	$gain = $this->request->get['gain'];
	$sin = $this->request->get['sin'];
	$mute = $this->request->get['mute'];
	    $url_change_gain = "http://".RMX_IP."/confGain";      
	    $hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_change_gain="invert_IQ=".$invert_IQ."&rmx_no=".$rmx_no."&output=".$output."&gain=".$gain."&sin=".$sin."&mute=".$mute;
	 	$restapi_object = new restapi();
	 	$change_gain_resp =$restapi_object->callAPI("POST",$hdr,$url_change_gain,$data_change_gain);
        $change_gain_decoded = json_decode($change_gain_resp ,true);
	 	if($change_gain_resp == false || $change_gain_decoded['error'] == true)
 	      {
 		    $resp=1;
 	      }
 	    else
 	      {
 	    	$resp=0;
 	      }
 	    $this->response->setOutput($resp);
  }   

  function addIPInput()
  {
  	$ip = $this->request->get['ip'];
  	$port = $this->request->get['port'];
	$channel = $this->request->get['channel'];
	$rmx_no = $this->request->get['rmx_no'];
	$type = $this->request->get['type'];
    $tunerId=$channel-1;
    $url_AddIPIN = "http://".RMX_IP."/setEthernetIn";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_AddIPIN="port=".$port."&ip_address=".$ip."&rmx_no=".$rmx_no."&channel_no=".$channel."&type=".$type;
 	$restapi_object = new restapi();
 	$AddIPIN_resp =$restapi_object->callAPI("POST",$hdr,$url_AddIPIN,$data_AddIPIN);
    $AddIPIN_decoded = json_decode($AddIPIN_resp ,true);
    if($AddIPIN_resp == false || $AddIPIN_decoded['error'] == true)
      {
	    $resp=-2;
      }
    else
    {
    	/*$url_rfauth = "http://".RMX_IP."/authorizeRFout";      
	 	$data_rfauth="&rmx_no=".$rmx_no;
	 	$authrf_resp =$restapi_object->callAPI("POST",$hdr,$url_rfauth,$data_rfauth);*/

      $this->load->model('common/dashboardchannels');
	  $resp=$this->model_common_dashboardchannels->addIPInput($ip,$port,$channel,$rmx_no,$type);
    }
    $this->model_common_dashboardchannels->addTunertype($rmx_no ,$tunerId,0);

	$this->response->setOutput($resp);	
  }
  function updateIPInput()
  {
    $ip = $this->request->get['ip'];
  	$port = $this->request->get['port'];
	$channel = $this->request->get['channel'];
	$rmx_no = $this->request->get['rmx_no'];
	$type = $this->request->get['type'];  
	$tunerId=$channel-1;
	$url_UpdateIPIN = "http://".RMX_IP."/setEthernetIn";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_UpdateIPIN="port=".$port."&ip_address=".$ip."&rmx_no=".$rmx_no."&channel_no=".$channel."&type=".$type;
 	$restapi_object = new restapi();
 	$UpdateIPIN_resp =$restapi_object->callAPI("POST",$hdr,$url_UpdateIPIN,$data_UpdateIPIN);
    $UpdateIPIN_decoded = json_decode($UpdateIPIN_resp ,true);
    if($UpdateIPIN_resp == false || $UpdateIPIN_decoded['error'] == true)
      {
	    $resp=-2;
      }
    else
      {
      	/*$url_rfauth = "http://".RMX_IP."/authorizeRFout";      
	 	$data_rfauth="&rmx_no=".$rmx_no;
	 	$authrf_resp =$restapi_object->callAPI("POST",$hdr,$url_rfauth,$data_rfauth);*/
	    $this->load->model('common/dashboardchannels');
	    $resp=$this->model_common_dashboardchannels->updateIPInput($ip,$port,$channel,$type,$rmx_no);
	  }
     $this->model_common_dashboardchannels->addTunertype($rmx_no ,$tunerId,0);

	$this->response->setOutput($resp);	
  }
 function deleteIPInput()
 {
 	$ip = $this->request->get['ip'];
  	$port = $this->request->get['port'];
	$channel = $this->request->get['channel'];
	$rmx_no = $this->request->get['rmx_no'];
	$type = $this->request->get['type'];  
	$tunerId=$channel-1;

	$url_DeleteIPIN = "http://".RMX_IP."/setEthernetInOff";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_DeleteIPIN="rmx_no=".$rmx_no."&channel_no=".$channel;
 	$restapi_object = new restapi();
 	$DeleteIPIN_resp =$restapi_object->callAPI("POST",$hdr,$url_DeleteIPIN,$data_DeleteIPIN);
    $DeleteIPIN_decoded = json_decode($DeleteIPIN_resp ,true);
    if($DeleteIPIN_resp == false || $DeleteIPIN_decoded['error'] == true)
      {
	    $resp=-2;
      }
    else
      {
		$this->load->model('common/dashboardchannels');
		$resp=$this->model_common_dashboardchannels->deleteIPInput($ip,$port,$channel,$rmx_no,$type);
	  }
$this->model_common_dashboardchannels->addTunertype($rmx_no ,$tunerId,-1);
	$this->response->setOutput($resp);
 }
 function getIPInput()
 {
 	$channel = $this->request->get['channel'];
	$rmx_no = $this->request->get['rmx_no'];

	   $this->load->model('common/dashboardchannels');
	 
	   $getIpInput= $this->model_common_dashboardchannels->getIpInput($channel,$rmx_no); 
		if(sizeof($getIpInput)>0)
			$getIpInput["error"] = 0;
		else
			$getIpInput["error"] = 1;

		$IpInput_json_arr=json_encode($getIpInput);

		$this->response->setOutput($IpInput_json_arr);
 }
  /************************************************************************
				TUNER FUNCTIONS
 ************************************************************************/
 function getMxlstatus(){
 	$mxl_id = $this->request->get['mxl_id'];
  	$rmx_id = $this->request->get['rmx_id'];
	$demodId = $this->request->get['demodId'];

 	$url_set_demod = "http://".RMX_IP."/getDemodMxl";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_set_demod="mxl_id=".$mxl_id."&rmx_no=".$rmx_id."&demod_id=".$demodId;
 	$restapi_object = new restapi();
 	$set_demod_resp =$restapi_object->callAPI("POST",$hdr,$url_set_demod,$data_set_demod);
 	$set_demod_decoded = json_decode($set_demod_resp,true);
	
    if($set_demod_resp == false || $set_demod_decoded['error'] == true){
    	
		$this->response->setOutput(-1);
	}else{
		$this->response->setOutput($set_demod_resp);
		
	}

 }
 function getTunerDetails(){
 	$tuner_id = $this->request->get['tuner_id'];
	$this->load->model('common/dashboardchannels');
	$resp = $this->model_common_dashboardchannels->getTunedFrequencies($tuner_id);
	if(sizeof($resp) == 0)
		$resp["size"] = 0;
	else
		$resp["size"] = 1;
	$this->response->setOutput(json_encode($resp));
	
 }
 function updateMxlstatus(){
 	$mxl_id = $this->request->get['mxl_id'];
 	$tunerId = $this->request->get['tunerId'];
  	$rmx_id = $this->request->get['rmx_id'];
	$demodId = $this->request->get['demodId'];

 	$url_set_demod = "http://".RMX_IP."/getDemodMxl";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_set_demod="mxl_id=".$mxl_id."&rmx_no=".$rmx_id."&demod_id=".$demodId;
 	$restapi_object = new restapi();
 	$set_demod_resp =$restapi_object->callAPI("POST",$hdr,$url_set_demod,$data_set_demod);
 	$set_demod_decoded = json_decode($set_demod_resp,true);
	
    if($set_demod_resp == false || $set_demod_decoded['error'] == true){
    	
		$this->response->setOutput(-1);
	}else{
		$status=$set_demod_decoded['locked'];
		$this->load->model('common/dashboardchannels');
		$this->model_common_dashboardchannels->updateDemodStatus($tunerId,$status);
		$this->response->setOutput($set_demod_resp);
			
	}
 }
 function tuneToFrequency(){
  	$mxl_id = $this->request->get['mxl_id'];
  	$rmx_id = $this->request->get['rmx_id'];
	$tunerId = $this->request->get['tunerId'];
	$demodId = $this->request->get['demodId'];
	$lnbId = $this->request->get['lnbId'];
	$standerd = $this->request->get['standerd'];
	$frequency = $this->request->get['frequency'];
	$rate = $this->request->get['rate'];
	$modulation = $this->request->get['modulation'];
	$fec = $this->request->get['fec'];
	$rolloff = $this->request->get['rolloff'];
	$pilots = $this->request->get['pilots'];
	$spectrumInverted = $this->request->get['spectrumInverted'];
	$polarization = $this->request->get['polarization'];
	$lo_frequency = $this->request->get['lo_frequency'];
	$auth_bit = $this->request->get['auth_bit'];
	$Voltage = $this->request->get['Voltage'];
    $this->load->model('common/dashboardchannels');
    $hdr = array('Content-Type: application/x-www-form-urlencoded');
    $restapi_object = new restapi();
    $this->model_common_dashboardchannels->addTunertype($mxl_id,$demodId,1);
    //Download firmware
   /* $url_download_firmware = "http://".RMX_IP."/downloadFirmware";       	
 	$data_download_firmware="mxl_id=".$mxl_id."&rmx_no=".$rmx_id;
 	$download_firmware_resp =$restapi_object->callAPI("POST",$hdr,$url_download_firmware,$data_download_firmware);
    $download_firmware_decoded = json_decode($download_firmware_resp,true);
    if($download_firmware_decoded[""] == false )
    if($download_firmware_decoded["FW Downloaded"] == false ){
    	$this->response->setOutput($download_firmware_decoded);
    }


    //SET_CONFALLEGRO
    $url_set_conf = "http://".RMX_IP."/setConfAllegro";       	
 	$data_set_conf="mxl_id=".$mxl_id."&lnb_id=".$lnbId."&voltage=".$Voltage;
 	$set_conf_resp =$restapi_object->callAPI("POST",$hdr,$url_set_conf,$data_set_conf);
    $set_conf_decoded = json_decode($set_conf_resp,true);
    if($set_conf_resp == false || $set_conf_decoded['error'] == true){
    	$this->response->setOutput(-1);
    }

    //SET_DEMOD
    $url_set_demodMxl = "http://".RMX_IP."/setDemodMxl";       	
 	$data_set_demodMxl="mxl_id=".$mxl_id."&lnb_id=".$lnbId."&voltage=".$Voltage."&rmx_no=".$rmx_id."&demod_id=".$demodId."&dvb_standard=".$standerd."&frequency=".$frequency."&symbol_rate=".$rate."&mod=".$modulation."&fec=".$fec."&rolloff=".$rolloff."&pilots=".$pilots."&spectrum=".$spectrumInverted."&lo_frequency=".$lo_frequency;
 	$set_demodMxl_resp =$restapi_object->callAPI("POST",$hdr,$url_set_demodMxl,$data_set_demodMxl);
    $set_demodMxl_decoded = json_decode($set_demodMxl_resp,true);
    if($set_demodMxl_resp == false || $set_demodMxl_decoded['error'] == true){
    	$this->response->setOutput(-2);
    }
     sleep(1);
    //SET_MPEGOUT
    $url_set_mpeg = "http://".RMX_IP."/setMPEGOut";       	
 	$data_set_mpeg="mxl_id=".$mxl_id."&rmx_no=".$rmx_id."&demod_id=".$demodId;
 	$set_mpeg_resp =$restapi_object->callAPI("POST",$hdr,$url_set_mpeg,$data_set_mpeg);
    $set_mpeg_decoded = json_decode($set_mpeg_resp,true);
    if($set_mpeg_resp == false || $set_mpeg_decoded['error'] == true){
    	$this->response->setOutput(-3);
    }*/
    //GET_DEMOD
    $url_get_demod = "http://".RMX_IP."/setMxlTuner";       	
    
 	$data_get_demod="mxl_id=".$mxl_id."&lnb_id=".$lnbId."&voltage=".$Voltage."&rmx_no=".$rmx_id."&demod_id=".$demodId."&dvb_standard=".$standerd."&frequency=".$frequency."&symbol_rate=".$rate."&mod=".$modulation."&fec=".$fec."&rolloff=".$rolloff."&pilots=".$pilots."&spectrum=".$spectrumInverted."&lo_frequency=".$lo_frequency."&auth_bit=".$auth_bit."&polarization=".$polarization;
 	$get_demod_resp =$restapi_object->callAPI("POST",$hdr,$url_get_demod,$data_get_demod);
     $get_demod_decoded = json_decode($get_demod_resp,true);

    if($get_demod_resp == false || $get_demod_decoded['error'] == true){
    	
    	$status=0;
    	
    	$this->model_common_dashboardchannels->tuneToFrequency($mxl_id,$rmx_id,$tunerId,$status,$demodId,$lnbId,$standerd,$frequency,$rate,$modulation,$fec,$rolloff,$pilots,$spectrumInverted,$polarization,$lo_frequency,$Voltage);
		$this->response->setOutput(-4);
    }
    else
    {
	 
		$status=$get_demod_decoded['locked'];
	
    	$this->model_common_dashboardchannels->tuneToFrequency($mxl_id,$rmx_id,$tunerId,$status,$demodId,$lnbId,$standerd,$frequency,$rate,$modulation,$fec,$rolloff,$pilots,$spectrumInverted,$polarization,$lo_frequency,$Voltage);
		$this->response->setOutput($status);
    }
   
  }

  /*************************************************************************
  						CHANNEL OUTPUT
  *************************************************************************/
   function getBitrate(){
	 	$rmx_no = $this->request->get['rmx_no'];
	  	$input = $this->request->get['input'];
		$output = $this->request->get['output'];
		$progNumber = $this->request->get['progNumber'];

	 	$url_set_demod = "http://".RMX_IP."/getPrograminfo";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_set_demod="rmx_no=".$rmx_no."&input=".$input."&output=".$output."&progNumber=".$progNumber;
	 	$restapi_object = new restapi();
	 	$set_demod_resp =$restapi_object->callAPI("POST",$hdr,$url_set_demod,$data_set_demod);
	 	$set_demod_decoded = json_decode($set_demod_resp,true);
		
	    if($set_demod_resp == false || $set_demod_decoded['error'] == true){
	    	
			$this->response->setOutput(-1);
		}else{
			$this->response->setOutput($set_demod_resp);
			
		}

	 } 
	/*************************************************************************
  						SCRAMBLEING
    *************************************************************************/ 
	 /*function scrambleService()
	 {
        $rmx_no = $this->request->get['rmx_no'];
	  	$input = $this->request->get['input'];
		$output = $this->request->get['output'];
		$programNumber = $this->request->get['programNumbers'];
		$includeFlag = $this->request->get['includeFlag'];
		$keyid = $this->request->get['keyids'];
		$scramble = $this->request->get['scramble'];
		$parity = $this->request->get['parity'];
        $this->load->model('common/dashboardchannels');

		$url_init_csa = "http://".RMX_IP."/initCsa/".$rmx_no;      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$restapi_object = new restapi();
	 	$init_csa_resp =$restapi_object->callAPI("GET",$hdr,$url_init_csa,$data=array());
	 	$init_csa_decoded = json_decode($init_csa_resp,true);
		
	    if($init_csa_resp == false || $init_csa_decoded['error'] == true){
	    	
			$this->response->setOutput(1);
		}
		else
		{
		    $url_set_csa= "http://".RMX_IP."/setCsa";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$data_set_csa="rmx_no=".$rmx_no."&input=".$input."&output=".$output."&parity=".$parity."&auth_bit=".$scramble;
		 	$restapi_object = new restapi();
		 	$set_csa_resp =$restapi_object->callAPI("POST",$hdr,$url_set_csa,$data_set_csa);
		 	$set_csa_decoded = json_decode($set_csa_resp,true);	

		 	if($set_csa_resp == false || $set_csa_decoded['error'] == true)
		 	{
			  $this->response->setOutput(2);
		    }
		    else
		    {
		    	
		    	$programNumbers = array('programNumber' => $programNumber);
		    	$keyids = array('keys' => $keyid);

		        $url_set_encrypt= "http://".RMX_IP."/setEncryptedServices";      
			 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
			 	$data_set_encrypt="&keyids=".json_encode($keyids)."&programNumbers=".json_encode($programNumbers)."&rmx_no=".$rmx_no."&input=".$input."&output=".$output."&includeFlag=".$includeFlag;
			 	$restapi_object = new restapi();
			 	$set_encrypt_resp =$restapi_object->callAPI("POST",$hdr,$url_set_encrypt,$data_set_encrypt);
			 	$set_encrypt_decoded = json_decode($set_csa_resp,true);	
			 	if($set_encrypt_resp == false || $set_encrypt_decoded['error'] == true)
				 {
					$this->response->setOutput(3);
				 }
				else
				{
					if($includeFlag==0)
					{
                      $this->model_common_dashboardchannels->deleteScrablingServices($rmx_no,$input,$output,$programNumber);
					}
					else
					{
                     $this->model_common_dashboardchannels->addScrablingServices($rmx_no,$input,$output,$programNumber,$includeFlag,$keyid,$scramble,$parity);
					}
				  $this->response->setOutput(0);	
				}
		    }
			
		}
	 }*/
}