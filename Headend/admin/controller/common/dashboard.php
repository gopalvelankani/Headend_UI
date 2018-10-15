<?php
class ControllerCommonDashboard extends Controller 
{
	public function index()
	{

		$this->load->language('common/dashboard');
        $this->load->model('common/dashboardchannels');

        $ScrambleData= $this->model_common_dashboardchannels->getAllScrambleData();
        $j = 0;
		$data['Allscrambledata']=array();
		foreach ($ScrambleData as $scrambledata) 
		{
         $data['Allscrambledata'][$j]=array('programNumbers'=>$scrambledata['programNumbers'],'rmx_no'=>$scrambledata['rmx_no'],'input'=>$scrambledata['input'],'output'=>$scrambledata['output'],'includeFlag'=>$scrambledata['includeFlag'],'scramble'=>$scrambledata['scramble']);
			$j++;
			
		}	
         
        $input_bitrate= $this->model_common_dashboardchannels->getInputBitrate();
        $k = 0;
		$data['InputBitrate']=array();
		foreach($input_bitrate as $inputbitrate) 
		{
         $data['InputBitrate'][$k]=array('RE_NO'=>$inputbitrate['RE_NO'],'bitrate'=>$inputbitrate['bitrate']);
			$k++;
			
		}
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
				$p++;
		 		$k++; 	
		}
		$s++;
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
		    $data['outputdata'][$j]=array('rmx_no'=>$outputdata['rmx_no'],'channelname'=>$outputdata['output_channelname'],'channelnumber'=>$outputdata['channelnumber'],'qam_targetid'=>$outputdata['rmx_no']-1,'targetid'=>$outputdata['targetid'],'inputid'=>$outputdata['inputid'],'changed_ch_no'=>$changed_ch_number,'changed_ch_name'=>$changed_ch_name,'Enable_ch_name'=>$Enable_ch_name,'changed_ch_provider'=>$changed_ch_provider,'Enable_ch_provider'=>$Enable_ch_provider,'Lcn'=>$outputdata['Lcn']);
			$j++;
		}
		// var_dump(sizeof( $data['outputdata']));exit(0);

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
		
        $emmg_channel_data= $this->model_common_dashboardchannels->getEMMGChannel(); 
		$data['emmg_channel']=array();
		$n=0;
		foreach ($emmg_channel_data as $emmgdata) 
		{
		    $data['emmg_channel'][$n]=array('channel_id'=>$emmgdata['channel_id'],'alias'=>$emmgdata['alias'],'client_id'=>$emmgdata['client_id'],'data_id'=>$emmgdata['data_id'],'bandwidth'=>$emmgdata['bandwidth'],'port'=>$emmgdata['port'],'stream_id'=>$emmgdata['stream_id'],'emm_pid'=>$emmgdata['emm_pid']);
			$n++;
		}
		$ecmg_channel_data= $this->model_common_dashboardchannels->getECMGChannel(); 
		$data['ecmg_channel']=array();
		$m=0;
		foreach ($ecmg_channel_data as $ecmgdata) 
		{
		    $data['ecmg_channel'][$m]=array('ecmg_channel_id'=>$ecmgdata['ecmg_channel_id'],'Alias'=>$ecmgdata['Alias'],'Ip_Address'=>$ecmgdata['Ip_Address'],'Port'=>$ecmgdata['Port'],'Super_CAS_Id'=>$ecmgdata['Super_CAS_Id'],'Cryptoperiod'=>$ecmgdata['Cryptoperiod']);
			$m++;
		}
		
		$ECMStream= $this->model_common_dashboardchannels->getECMStream();
		$data['ecm_stream']=array();
		$s=0;
		foreach ($ECMStream as $ecm_stream_data) 
		{
		    $data['ecm_stream'][$s]=array('alias'=>$ecm_stream_data['ecm_stream_alias'],'access_criteria'=>$ecm_stream_data['ecm_stream_access_criteria'],'ecm_stream_ecmId'=>$ecm_stream_data['ecm_stream_ecmid'],'ecm_stream_CW_group'=>$ecm_stream_data['ecm_stream_CW_group'],'ecm_stream_streamid'=>$ecm_stream_data['ecm_stream_streamid'],'ecm_stream_CP_number'=>$ecm_stream_data['ecm_stream_CP_number'],'ecmg_id'=>$ecm_stream_data['ecmg_id'],'ecm_pid'=>$ecm_stream_data['ecm_pid'],'rmx_no'=>$ecm_stream_data['rmx_no']);
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
		$input=0;
		foreach ($QamFreq_info as $QamFreq_info_data) 
		{
		    $data['QamFreq_detail'][$s]=array('freq_ID'=>$QamFreq_info_data['freq_ID'],'freq_name'=>$QamFreq_info_data['freq_name'],'qam_id'=>$QamFreq_info_data['qam_id'],'frequency'=>$QamFreq_info_data['frequency'],'bitrate'=>$QamFreq_info_data['bitrate'],'EIT'=>$QamFreq_info_data['EIT']);
		  
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
	$changed_number = $this->request->get['changed_number'];
    $hdr = array('Content-Type: application/x-www-form-urlencoded');
	$this->load->model('common/dashboardchannels');
			$ActiveECMStream= $this->model_common_dashboardchannels->getActiveECMStream($rmx_no,$output,$channelNumber);
			
			$high_priority_data= $this->model_common_dashboardchannels->get_high_priority($channelNumber,$input); 
			$high_priority=array();
			$m=0;

			if($high_priority_data != -1) 
			{
			    $high_priority=array('Priority_checkbox'=>$high_priority_data);
			}else
				$high_priority=array('Priority_checkbox'=>0);
	        $pmt_alarm_data= $this->model_common_dashboardchannels->get_pmt_alarm($channelNumber,$input); 
			$pmt_alarm=array();
			$m=0;
			if($pmt_alarm_data != -1) 
			{
			    $pmt_alarm=array('alarm_enable'=>$pmt_alarm_data);
			}else
				$pmt_alarm=array('alarm_enable'=>0);

			
			
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
					if($value==2 || $value==27){
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
				$channel_data = array('serviceprovider'=>$ch_detail_decoded['original_provider_name'],'changed_provider'=>$ch_detail_decoded['provider_name'],'servicetype'=>$ch_detail_decoded['service_type'],'PMTpid'=>$pmt_pid,'PCRpid'=>$pcr_pid,'audiopid'=>$audio_pid,'videopid'=>$video_pid,"input_rate"=>$input_rate,'video_per'=>$video_band,'audio_per'=>$audio_band,'audiopid_no'=>$audio_pids,'videopid_no'=>$video_pids,'Affected_input'=>$ch_detail_decoded['affected_input']);

				if($changed_number!= -1)
			     {
                   $channelNumber=$changed_number;
			     }
				else
				 {
	              $channelNumber=$channelNumber;
				 }

			$Scrambleddata= $this->model_common_dashboardchannels->getScrambledServices($rmx_no,$input,$output,$channelNumber);
		    //get scrambled data
			     
			// $channel_data['ecmg_channel'] = $ecmg_channel;
			$channel_data['ActiveECMStream'] = $ActiveECMStream;
	        $channel_data['pmt_alarm'] = $pmt_alarm_data;
	        $channel_data['high_priority'] = $high_priority;
	        $channel_data['Scrambled_data'] = $Scrambleddata;
	       
			$channel_json_arr=json_encode($channel_data);
			$this->response->setOutput($channel_json_arr);

				
			}
			// get scrambled data
		     
			 	
}
function lock_scramble()
{
    $rmx_no = $this->request->get['rmx_no'];
	$output = $this->request->get['output'];	
	$this->load->model('common/dashboardchannels');
	$ScrambleData= $this->model_common_dashboardchannels->getScrambleData($rmx_no,$output);
	$ScrambleData=json_encode($ScrambleData);
	$this->response->setOutput($ScrambleData);
}
function getInputChinfo()
{
	$channelNumber = $this->request->get['channel_number'];
	$input = $this->request->get['input_id'];
	$rmx_no = $this->request->get['rmx_no'];
	$output = $this->request->get['targetid'];
            $restapi_object = new restapi();
	        $hdr = array('Content-Type: application/x-www-form-urlencoded');
			$url_ch_detail = "http://".RMX_IP."/getChannelDetails";        
			$input_para="input=".$input."&output=".$output."&rmx_no=".$rmx_no."&progNumber=".$channelNumber;
			$ch_detail_resp = $restapi_object->callAPI("POST",$hdr,$url_ch_detail,$input_para);
			$ch_detail_decoded = json_decode($ch_detail_resp,true);
			
			if($ch_detail_resp == false || $ch_detail_decoded['error'] == true)
			{
				$this->response->setOutput(1);
			}
			else{				
				$pcr_pid = (sizeof($ch_detail_decoded['PIDS']) > 0)? $ch_detail_decoded['PIDS'][0] : 0;
				$pmt_pid = (sizeof($ch_detail_decoded['PIDS']) > 1)? $ch_detail_decoded['PIDS'][1] : 0;
				$channel_data = array('serviceprovider'=>$ch_detail_decoded['original_provider_name'],'servicetype'=>$ch_detail_decoded['service_type'],'PMTpid'=>$pmt_pid,'PCRpid'=>$pcr_pid);
				$channel_json_arr=json_encode($channel_data);
			    $this->response->setOutput($channel_json_arr);
			} 
}
public function changeServiceType()
{
    $program_no = $this->request->get['channelNumber'];
	$input = $this->request->get['input'];
	$rmx_no = $this->request->get['rmx_no'];	
    $service_type= $this->request->get['service_type'];
	           $restapi_object = new restapi();
	        $hdr = array('Content-Type: application/x-www-form-urlencoded');
			$url_set_service = "http://".RMX_IP."/setServiceType";        
			$input_para="input=".$input."&rmx_no=".$rmx_no."&program_no=".$program_no."&addFlag=1"."&service_type=".$service_type;
			$set_service_resp = $restapi_object->callAPI("POST",$hdr,$url_set_service,$input_para);
			$set_service_decoded = json_decode($set_service_resp,true);
			
			if($set_service_resp == false || $set_service_decoded['error'] == true)
			{
				$this->response->setOutput($set_service_resp);
			}
			else
			 {
               $this->response->setOutput(1);
			 }
}
public function getchannelstatus()
{
    $req_data = array();
	$restapi_object = new restapi();
	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	$input = $this->request->get['input_id'];
	$rmx_no = $this->request->get['rmx_no'];
	$control_fpga = $this->request->get['control_fpga'];
	$output = 0;
    $channel=$input+1; 
    $count=$input;   
    $this->load->model('common/dashboardchannels');
	 $input_rate="";
	        $i=0;

			
				$url_ch_detail = "http://".RMX_IP."/getDataflowRates";        
				$input_para="input=".$input."&output=".$output."&rmx_no=".$rmx_no;
				$ch_detail_resp = $restapi_object->callAPI("POST",$hdr,$url_ch_detail,$input_para);
				$ch_detail_decoded = json_decode($ch_detail_resp,true);
				
				if($ch_detail_resp == false || $ch_detail_decoded['error'] == true)
				{
					$this->response->setOutput(-1);
					
				}
				else
				{
					$input_rate =$ch_detail_decoded["uInuputRate"];
					//*****************
					if($input_rate > 0){
						$this->response->setOutput($input_rate);
					}
					else{
						$ch_detail_resp = $restapi_object->callAPI("POST",$hdr,$url_ch_detail,$input_para);
						$ch_detail_decoded = json_decode($ch_detail_resp,true);
						
						if($ch_detail_resp == false || $ch_detail_decoded['error'] == true)
						{
							$this->response->setOutput(-1);
							
						}else{
							$input_rate =$ch_detail_decoded["uInuputRate"];
								$this->response->setOutput($input_rate);
						}

					}
					   
				}  		 		        
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
	$rmx_no= $qam_targetid +1;
    // $rmx_no=$qam_targetid +1;
	$this->load->model('common/dashboardchannels');
	$no_of_input= $this->model_common_dashboardchannels->rmx_config();
    $input_rmx_no=floor(($re_value/$no_of_input))+1;
    // $input = $input%$no_of_input;
    $duplicate_services = array();
    $resp = 0;
    if($rmx_no == $input_rmx_no)
    {
	    $frequency_ch=$this->model_common_dashboardchannels->channelFreq($qam_targetid,$freq_id);
	    $frequency=array();
		
        for ($i=0; $i < sizeof($channlNums); $i++) { 
         $duplicate_services[$i]=$this->model_common_dashboardchannels->isDuplicate($channlNums[$i],$input,$freq_id,$rmx_no);
         if($duplicate_services[$i] == 1)
         	$resp = 2;

        }
       	$changed_serviceId=$this->model_common_dashboardchannels->getChangedServiceId($input);
      	$data= array();
    
	for ($i=0; $i < sizeof($channlNums); $i++) { 
		for ($j=0; $j < sizeof($changed_serviceId); $j++) { 
			if(($changed_serviceId[$j] == $channlNums[$i]))
	        {
	            $resp = 2;
	        }
		}          
	}
	if($resp == 2){
		$this->response->setOutput(json_encode($resp));
	}else{	
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
		 $response_arr= array("error" => $resp,"status_array" => $duplicate_services);
		$this->response->setOutput(json_encode($response_arr));
		
       }
   	}else
	{
		$resp= -1;
	}	
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
		 		{
		 		  $resp=1;
		 		  $this->model_common_dashboardchannels->deleteScrablingServices($rmx_no,$inputid,$target_id,$ch_number);	
		 		}
		 		   
		 	    else
		 	    {
		 		   $resp=2;	
		 	    }
		 		
		 	}
		
	 	$this->response->setOutput($resp);	

 } 
public function get_output_bitrate()
{
	$output = $this->request->get['output'];
	$input = $this->request->get['input'];
	$rmx_no = $this->request->get['rmx_no'];
	$qam_id=$rmx_no-1;
	    $this->load->model('common/dashboardchannels');
		$hdr = array('Content-Type: application/x-www-form-urlencoded');
        $restapi_object = new restapi();

		    $url_ch_detail = "http://".RMX_IP."/getDataflowRates";        
			$input_para="input=".$input."&output=".$output."&rmx_no=".$rmx_no;
			$ch_detail_resp = $restapi_object->callAPI("POST",$hdr,$url_ch_detail,$input_para);
			$ch_detail_decoded = json_decode($ch_detail_resp,true);
			$PayloadRate=""; 
			if($ch_detail_resp == false || $ch_detail_decoded['error'] == true)
			{
				$PayloadRate=0;
				
			}
			else
			{
                    $PayloadRate =$ch_detail_decoded["uPayloadRate"];     
	                $this->model_common_dashboardchannels->qamFrq_Bitrate($output,$qam_id,$PayloadRate);
	                $this->response->setOutput($PayloadRate);	

			}
		 
}
public function get_input_bitrate()
{
    $re_no = $this->request->get['re_no'];
	$output = $this->request->get['output'];
	$input = $this->request->get['input'];
	$rmx_no = $this->request->get['rmx_no'];

    $this->load->model('common/dashboardchannels');
	$hdr = array('Content-Type: application/x-www-form-urlencoded');
    $restapi_object = new restapi();

		    $url_ch_detail = "http://".RMX_IP."/getDataflowRates";        
			$input_para="input=".$input."&output=".$output."&rmx_no=".$rmx_no;
			$ch_detail_resp = $restapi_object->callAPI("POST",$hdr,$url_ch_detail,$input_para);
			$ch_detail_decoded = json_decode($ch_detail_resp,true);
			$uInuputRate=""; 
			if($ch_detail_resp == false || $ch_detail_decoded['error'] == true)
			{
				$uInuputRate=0;
				
			}
			else
			{  
	            $uInuputRate =$ch_detail_decoded["uInuputRate"];
	            $this->model_common_dashboardchannels->input_Bitrate($re_no,$uInuputRate);
	            $this->response->setOutput($uInuputRate); 
			}
		 
}
public function addECMGChannel()         
 {
	$resp = 0;
	$ip_Address = $this->request->get['ip_Address'];
	$port = $this->request->get['port'];
	$super_CAS_Id = $this->request->get['super_CAS_Id'];
	$ecmg_Channel_Id = $this->request->get['ecmg_Channel_Id'];
	$Alias = $this->request->get['Alias'];
	
	$Cryptoperiod = $this->request->get['Cryptoperiod'];

	$url_addECMG = "http://".RMX_IP."/addECMChannelSetup";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$ecmg_data="channel_id=".$ecmg_Channel_Id."&supercas_id=".$super_CAS_Id."&ip=".$ip_Address."&port=".$port;
 	$restapi_object = new restapi();
 	$ecmg_resp = $restapi_object->callAPI("POST",$hdr,$url_addECMG,$ecmg_data);
 	$ecmg_resp_decoded = json_decode($ecmg_resp,true);
 	if($ecmg_resp == false || $ecmg_resp_decoded['error'] == true)
 	{
 		$resp = $ecmg_resp;
 	}
 	else
 	{
 		$this->load->model('common/dashboardchannels');
		$result = $this->model_common_dashboardchannels->addECMGChannel($ecmg_Channel_Id,$Alias,$ip_Address,$port,$super_CAS_Id,$Cryptoperiod); 
		$resp = 1;
 	}
 	$this->response->setOutput($resp); 	
 }
 public function activateEcmStream()
 {
 	$input = $this->request->get['input'];
 	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
	$stream_id = $this->request->get['stream_id'];
	$channel_id = $this->request->get['channel_id'];
	$ecm_id = $this->request->get['ecm_id'];
	$cp_number = $this->request->get['cp_number'];
	$access_criteria = $this->request->get['access_criteria'];
    $service_id = $this->request->get['service_id'];
    $addFlag = $this->request->get['addFlag'];
    $restapi_object = new restapi();
    $hdr = array('Content-Type: application/x-www-form-urlencoded');
    $this->load->model('common/dashboardchannels');
    $auth_output=255;
   
    $duplicate_ECMStream=$this->model_common_dashboardchannels->checkDuplicateECMStream($channel_id,$stream_id);

    if($duplicate_ECMStream==1)
    {
    	$resp=1;
    }
    else
    {
       $Org_serviceId=$this->model_common_dashboardchannels->getOrgServiceId($input,$output,$rmx_no,$service_id);
       if(sizeof($Org_serviceId)>0)
       {
         $service_id=$Org_serviceId['channelnumber'];
       }

        $url_progInfo = "http://".RMX_IP."/getPrograminfo";      
	 	$progInfo_data="rmx_no=".$rmx_no."&output=".$output."&input=".$input."&progNumber=".$service_id;
	 	$progInfo_resp = $restapi_object->callAPI("POST",$hdr,$url_progInfo,$progInfo_data);
	 	$progInfo_resp_decoded = json_decode($progInfo_resp,true);
	 	if($progInfo_resp == false || $progInfo_resp_decoded['error'] == true)
	 	{
	 		$resp = -1;
	 		
	 	}
	 	else
	 	{
	 		if(sizeof($progInfo_resp_decoded["PIDS"])>0)
	 		{
		        $PID=$progInfo_resp_decoded["PIDS"][0];
		        $url_activeEcm = "http://".RMX_IP."/setPMTCADescriptor";      
	 	
			 	$activeEcm_data="channel_id=".$channel_id."&rmx_no=".$rmx_no."&output=".$output."&programNumber=".$service_id."&service_pid=".$PID."&stream_id=".$stream_id."&addFlag=".$addFlag."&input=".$input;
			 	
			 	$activeEcm_resp = $restapi_object->callAPI("POST",$hdr,$url_activeEcm,$activeEcm_data);
			 	$activeEcm_resp_decoded = json_decode($activeEcm_resp,true);
			 	if($activeEcm_resp == false || $activeEcm_resp_decoded['error'] == true)
			 	{
			 		$resp = -2;
			 		
			 	}
			 	else
			 	{
			 	  $resp=$this->model_common_dashboardchannels->activeECMStream($output,$rmx_no,$stream_id,$channel_id,$ecm_id,$cp_number,$access_criteria,$service_id,$PID,$input);	

                 $ecm_pid=$this->model_common_dashboardchannels->getECMStreampid($stream_id,$channel_id);	
			 	 $url_set_custompid = "http://".RMX_IP."/setCustomPids";
			 	 $set_custompid_data="pid=".$ecm_pid."&output=".$output."&rmx_no=".$rmx_no."&addFlag=".$addFlag."&auth_output=".$auth_output;	
			 	 $set_custompid_resp = $restapi_object->callAPI("POST",$hdr,$url_set_custompid,$set_custompid_data);
			 	 $set_custompid_resp_decoded = json_decode($set_custompid_resp,true);
			 	}
			
	 	    }
		 	else
		 	{
		 		$resp = -3;
		 	}
	 }
    }
    $this->response->setOutput($resp);
 }
 public function deleteActiveEcmStream()
 {
 	$input = $this->request->get['input'];
 	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
	$stream_id = $this->request->get['stream_id'];
	$channel_id = $this->request->get['channel_id'];
	$ecm_id = $this->request->get['ecm_id'];
	$cp_number = $this->request->get['cp_number'];
	$access_criteria = $this->request->get['access_criteria'];
    $service_id = $this->request->get['service_id'];
    $addFlag = $this->request->get['addFlag'];
    
    $restapi_object = new restapi();
    $hdr = array('Content-Type: application/x-www-form-urlencoded');
    $this->load->model('common/dashboardchannels');
    $auth_output=255;
        $url_progInfo = "http://".RMX_IP."/getPrograminfo";      
	 	$progInfo_data="rmx_no=".$rmx_no."&output=".$output."&input=".$input."&progNumber=".$service_id;
	 	$progInfo_resp = $restapi_object->callAPI("POST",$hdr,$url_progInfo,$progInfo_data);
	 	$progInfo_resp_decoded = json_decode($progInfo_resp,true);
	 	if($progInfo_resp == false || $progInfo_resp_decoded['error'] == true)
	 	{
	 		$resp = -1;
	 		
	 	}
	 	else
	 	{
	 		if(sizeof($progInfo_resp_decoded["PIDS"])>0)
	 		{
	        $PID=$progInfo_resp_decoded["PIDS"][0];
	        $url_activeEcm = "http://".RMX_IP."/setPMTCADescriptor";      
 	
		 	$activeEcm_data="channel_id=".$channel_id."&rmx_no=".$rmx_no."&output=".$output."&programNumber=".$service_id."&service_pid=".$PID."&stream_id=".$stream_id."&addFlag=".$addFlag."&input=".$input;
		 	
		 	$activeEcm_resp = $restapi_object->callAPI("POST",$hdr,$url_activeEcm,$activeEcm_data);
		 	$activeEcm_resp_decoded = json_decode($activeEcm_resp,true);
		 	if($activeEcm_resp == false || $activeEcm_resp_decoded['error'] == true)
		 	{
		 		$resp = -1;
		 		
		 	}
		 	else
		 	{
		 		$ecm_pid=$this->model_common_dashboardchannels->getECMStreampid($stream_id,$channel_id);
 		             $url_set_custompid = "http://".RMX_IP."/setCustomPids";
				 	 $set_custompid_data="pid=".$ecm_pid."&output=".$output."&rmx_no=".$rmx_no."&addFlag=".$addFlag."&auth_output=".$auth_output;	
				 	 $set_custompid_resp = $restapi_object->callAPI("POST",$hdr,$url_set_custompid,$set_custompid_data);
				 	 $set_custompid_resp_decoded = json_decode($set_custompid_resp,true);
		 	  $this->model_common_dashboardchannels->deleteActivatedECMStream($channel_id,$stream_id);	
		 	  $resp=0;
		 	}
			
	 	}
	 	else
	 	{
	 		$resp = -3;
	 	}
	 }
  $this->response->setOutput($resp);
 }
 public function getEcmStreamAccessCriteria()
 {
 	 $access_criteria=$_POST['access_criteria'];
 	  
 	 $this->load->model('common/dashboardchannels');
 	 $result=$this->model_common_dashboardchannels->getEcmStreamAccessCriteria($access_criteria);
 	 echo $result ;
    // $this->responce->setOutput(json_encode($access_criteria));
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
	
	$emm_pid = $this->request->get['emm_pid'];
	$this->load->model('common/dashboardchannels');
	$resp_message=$this->model_common_dashboardchannels->validateEMMInputPara($emm_alias,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_pid,0);

	if($resp_message['error']== true)
	{
        $this->response->setOutput(json_encode($resp_message));
	}
	else
	{
	    $url_addEMMG = "http://".RMX_IP."/addEmmgSetup";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$emmg_data="channel_id=".$emm_channelid."&client_id=".$emm_clientid."&data_id=".$emm_dataid."&bw=".$emm_bw."&port=".$emm_port."&stream_id=".$emm_streamid."&emm_pid=".$emm_pid;
	 	$restapi_object = new restapi();
	 	$emmg_resp = $restapi_object->callAPI("POST",$hdr,$url_addEMMG,$emmg_data);
	 	$emmg_resp_decoded = json_decode($emmg_resp,true);
	 	if($emmg_resp == false || $emmg_resp_decoded['error'] == true)
	 	{
	 		
	 		$this->response->setOutput($emmg_resp);
	 	}
	 	else
	 	{
	 		
			$this->model_common_dashboardchannels->addEMMGChannel($emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_pid);
			
	 		$this->response->setOutput($emmg_resp);
	 	}	
	}
	
 }
 public function enableEMM()
 {
 	$output = $this->request->get['output'];
	$qam_id = $this->request->get['qam_id'];
	$EnableEMM = $this->request->get['EnableEMM'];
	$channel_id = $this->request->get['channel_id'];
	$emm_pid = $this->request->get['emm_pid'];
    $addFlag=1;
    $auth_output=255;

	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	$restapi_object = new restapi();

 	
 	$url_enable_emm = "http://".RMX_IP."/setCATCADescriptor";
 	$emmg_data="channel_id=".$channel_id."&output=".$output."&rmx_no=".($qam_id+1)."&addFlag=".$addFlag;	
 	$emmg_resp = $restapi_object->callAPI("POST",$hdr,$url_enable_emm,$emmg_data);
 	$emmg_resp_decoded = json_decode($emmg_resp,true);
 	if($emmg_resp == false || $emmg_resp_decoded['error'] == true)
 	{
 		$resp = -1;
 		
 	}
 	else
 	{

 		 $rmx_no=$qam_id+1;

 		 $url_set_custompid = "http://".RMX_IP."/setCustomPids";
	 	 $set_custompid_data="pid=".$emm_pid."&output=".$output."&rmx_no=".$rmx_no."&addFlag=".$addFlag."&auth_output=".$auth_output;	
	 	 $set_custompid_resp = $restapi_object->callAPI("POST",$hdr,$url_set_custompid,$set_custompid_data);
	 	 $set_custompid_resp_decoded = json_decode($set_custompid_resp,true);

 		 $this->load->model('common/dashboardchannels');
		 $resp= $this->model_common_dashboardchannels->enableEMM($output,$rmx_no,$EnableEMM,$channel_id);
		 
 		
 	}
	$this->response->setOutput($resp);
 }
 public function disableEMM()
 {
 	$output = $this->request->get['output'];
	$qam_id = $this->request->get['qam_id'];
	$EnableEMM = $this->request->get['EnableEMM'];
	$channel_id = $this->request->get['channel_id'];
	$emm_pid = $this->request->get['emm_pid'];
    $addFlag=0;
    $auth_output=255;
	$url_enable_emm = "http://".RMX_IP."/setCATCADescriptor";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$emmg_data="channel_id=".$channel_id."&output=".$output."&rmx_no=".($qam_id+1)."&addFlag=".$addFlag;
 	$restapi_object = new restapi();
 	$emmg_resp = $restapi_object->callAPI("POST",$hdr,$url_enable_emm,$emmg_data);
 	$emmg_resp_decoded = json_decode($emmg_resp,true);
 	if($emmg_resp == false || $emmg_resp_decoded['error'] == true)
 	{
 		$resp = 1;
 		$this->response->setOutput($resp);
 	}
 	else
 	{
 		 $rmx_no=$qam_id+1;
 		 $url_set_custompid = "http://".RMX_IP."/setCustomPids";
	 	 $set_custompid_data="pid=".$emm_pid."&output=".$output."&rmx_no=".$rmx_no."&addFlag=".$addFlag."&auth_output=".$auth_output;	
	 	 $set_custompid_resp = $restapi_object->callAPI("POST",$hdr,$url_set_custompid,$set_custompid_data);
	 	 $set_custompid_resp_decoded = json_decode($set_custompid_resp,true);

 		 $this->load->model('common/dashboardchannels');
		 $this->model_common_dashboardchannels->updateenableEMM($EnableEMM,$output,$rmx_no,$channel_id);
		 $resp = 0;
 		$this->response->setOutput($resp);
 	}
	
 }
 public function emmCheck()
 {
 	$output = $this->request->get['output'];
	$qam_id = $this->request->get['qam_id'];
	
	$rmx_no=$qam_id+1;
 	    $this->load->model('common/dashboardchannels');
 	    // $enable_emm_data=ayyay();
        $enable_emm_data= $this->model_common_dashboardchannels->getEnableEMM($output,$rmx_no); 
		$data['enableEMM_data']=array();
		$m=0;
		foreach ($enable_emm_data as $enableEmm) 
		{
		    $data['enableEMM_data'][$m]=array('channel_id'=>$enableEmm['channel_id'],'rmx_no'=>$enableEmm['rmx_no'],'enable'=>$enableEmm['enable'],'output'=>$enableEmm['output']);
			$m++;
		}	
		$this->response->setOutput(json_encode($data['enableEMM_data']));
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


public function addECMStream()
 {
	$ecm_stream_alias = $this->request->get['ecm_stream_alias'];
	$ecm_stream_access_criteria = $this->request->get['ecm_stream_access_criteria'];
	$ecm_stream_ecmId = $this->request->get['ecm_stream_ecmId'];
	$ecm_stream_CW_group = $this->request->get['ecm_stream_CW_group'];
	$ecm_stream_CP_number = $this->request->get['ecm_stream_CP_number'];
	$ecm_stream_streamid = $this->request->get['ecm_stream_streamid'];
	$ecmg_channel_id = $this->request->get['ecmg_id'];
    $ecm_pid = $this->request->get['ecm_stream_Pid'];
     $rmx_no = $this->request->get['rmx_no'];
	$this->load->model('common/dashboardchannels');
	$result = $this->model_common_dashboardchannels->checkECMID_Duplicate($ecmg_channel_id,$ecm_stream_ecmId);
	$ecmPID = $this->model_common_dashboardchannels->checkECMPID_Duplicate($ecmg_channel_id,$ecm_pid);
	$Access_criteria = $this->model_common_dashboardchannels->checkAccessCriteria_Duplicate($ecmg_channel_id,$ecm_stream_access_criteria);
	if(sizeof($result)>0 || sizeof($ecmPID)>0 || sizeof($Access_criteria)>0 )
	{
		$resp = -1;
		
	}
	else
	{
		$url_addECMGStream = "http://".RMX_IP."/addECMStreamSetup";      
		$restapi_object = new restapi();
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$ecmg_stream_data="channel_id=".$ecmg_channel_id."&stream_id=".$ecm_stream_streamid."&access_criteria=".$ecm_stream_access_criteria."&cp_number=".$ecm_stream_CP_number."&ecm_id=".$ecm_stream_ecmId."&ecm_pid=".$ecm_pid;
	 	$ecmg_stream_resp = $restapi_object->callAPI("POST",$hdr,$url_addECMGStream,$ecmg_stream_data);
	 	$ecmg_stream_resp_decoded = json_decode($ecmg_stream_resp,true);
	 	
	 	if($ecmg_stream_resp == false || $ecmg_stream_resp_decoded['error'] == true)
	 	{
	 		$resp = $ecmg_stream_resp;
	 	}
	 	else
	 	{
			$resp=$this->model_common_dashboardchannels->storeECMStream($ecm_stream_streamid,$ecmg_channel_id,$ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$ecm_pid,$rmx_no);
			
	 	}
		
	}	
	$this->response->setOutput($resp);
 }
public function getLastStreamId()
 {
	$ecmg_id = $this->request->get['ecmg_id'];
	$this->load->model('common/dashboardchannels');
	$streamid= $this->model_common_dashboardchannels->getLastStreamId($ecmg_id);
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
	$Cryptoperiod = $this->request->get['Cryptoperiod'];
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
	 		$resp=$this->model_common_dashboardchannels->updateECMGChannel($ecmg_Channel_Id,$Alias,$ip_Address,$port,$super_CAS_Id,$original_id,$Cryptoperiod);
	 		$this->response->setOutput($resp);
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
		 		$resp=$this->model_common_dashboardchannels->updateECMGChannel($ecmg_Channel_Id,$Alias,$ip_Address,$port,$super_CAS_Id,$original_id,$Cryptoperiod);
		 		$this->response->setOutput($resp);
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
	
	$ecm_stream_alias = $this->request->get['ecm_stream_alias'];
	$ecm_stream_access_criteria = $this->request->get['ecm_stream_access_criteria'];
	$ecm_stream_ecmId = $this->request->get['ecm_stream_ecmId'];
	$ecm_stream_CW_group = $this->request->get['ecm_stream_CW_group'];
	$ecm_stream_CP_number = $this->request->get['ecm_stream_CP_number'];
	$original_streamid = $this->request->get['original_streamid'];
	$original_ecmg_id = $this->request->get['original_ecmg_id'];
	$old_ecmid = $this->request->get['old_ecmid'];
	$ecm_pid = $this->request->get['ecm_pid'];
    $this->load->model('common/dashboardchannels');

	if($old_ecmid == $ecm_stream_ecmId)
	{
		    $url_updateStream = "http://".RMX_IP."/updateECMStreamSetup";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$ecmg_stream_data="channel_id=".$original_ecmg_id."&stream_id=".$original_streamid."&access_criteria=".$ecm_stream_access_criteria."&cp_number=".$ecm_stream_CP_number."&ecm_id=".$ecm_stream_ecmId."&ecm_pid=".$ecm_pid;
		 	$restapi_object = new restapi();
		 	$ecmg_stream_resp = $restapi_object->callAPI("POST",$hdr,$url_updateStream,$ecmg_stream_data);
		 	$ecmg_stream_resp_decoded = json_decode($ecmg_stream_resp,true);
			if($ecmg_stream_resp == false || $ecmg_stream_resp_decoded['error'] == true)
		 	{
		 		$resp = -2;
		 		
		 	}
		 	else
		 	{
				$resp=$this->model_common_dashboardchannels->updateECMStream($ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$original_streamid,$original_ecmg_id,$ecm_pid);
				
				
		 	}
	}
	else
	{
		$res = $this->model_common_dashboardchannels->checkECMID_Duplicate($original_ecmg_id,$ecm_stream_ecmId);
		if(sizeof($res)>0)
		{
			$resp = -1;
			
		}
		else
		{
			$url_updateStream = "http://".RMX_IP."/updateECMStreamSetup";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$ecmg_stream_data="channel_id=".$original_ecmg_id."&stream_id=".$original_streamid."&access_criteria=".$ecm_stream_access_criteria."&cp_number=".$ecm_stream_CP_number."&ecm_id=".$ecm_stream_ecmId."&ecm_pid=".$ecm_pid;
		 	$restapi_object = new restapi();
		 	$ecmg_stream_resp = $restapi_object->callAPI("POST",$hdr,$url_updateStream,$ecmg_stream_data);
		 	$ecmg_stream_resp_decoded = json_decode($ecmg_stream_resp,true);
			if($ecmg_stream_resp == false || $ecmg_stream_resp_decoded['error'] == true)
		 	{
		 		$resp = -2;
		 		
		 	}
		 	else
		 	{
				$resp=$this->model_common_dashboardchannels->updateECMStream($ecm_stream_alias,$ecm_stream_access_criteria,$ecm_stream_ecmId,$ecm_stream_CW_group,$ecm_stream_CP_number,$original_streamid,$original_ecmg_id,$ecm_pid);
				
				
		 	}
		}
			
	 }
	 $this->response->setOutput($resp);
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
		 $this->model_common_dashboardchannels->deleteActivatedECMStream($ecmg_id,$stream_id);
		$resp = 1;
 	}
	$this->response->setOutput($resp);
 }

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
	
	$emm_pid = $this->request->get['emm_pid'];
	$this->load->model('common/dashboardchannels');
	$resp_message=$this->model_common_dashboardchannels->validateEMMInputPara($emm_alias,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_pid,1);
	
	if($resp_message['error']== true)
	{
        $this->response->setOutput(json_encode($resp_message));
	}
	else
	{
		$url_addEMMG = "http://".RMX_IP."/addEmmgSetup";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$emmg_data="channel_id=".$emm_channelid."&client_id=".$emm_clientid."&data_id=".$emm_dataid."&bw=".$emm_bw."&port=".$emm_port."&stream_id=".$emm_streamid."&emm_pid=".$emm_pid;
	 	$restapi_object = new restapi();
	 	$emmg_resp = $restapi_object->callAPI("POST",$hdr,$url_addEMMG,$emmg_data);
	 	$emmg_resp_decoded = json_decode($emmg_resp,true);
	 	if($emmg_resp == false || $emmg_resp_decoded['error'] == true)
	 	{
	 		$this->response->setOutput($emmg_resp);
	 	}
	 	else
	 	{
	 		
			$this->model_common_dashboardchannels->updateEMMG($emm_alias,$emm_bw,$emm_channelid,$emm_streamid,$emm_clientid,$emm_port,$emm_dataid,$emm_pid);
			$resp = 1;
	 		$this->response->setOutput($emmg_resp);
	 	}
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
			 $resp=0;	
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
 	while(1)
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
        	$check=json_encode($BaseFreq_decode['center_frequency']);
        	$center_frequency=json_decode($BaseFreq_resp,true);
            $this->load->model('common/dashboardchannels');
		    $output_channel_data = $this->model_common_dashboardchannels->QamFreqUpdate($center_frequency['center_frequency'],$Qam_ID);
            $this->response->setOutput($BaseFreq_resp);    	
        }
        if($check!= 0)
        {
          break;
        }
    }
 }
public function changeOutputSID()
{
	$original_chNumber = $this->request->get['original_chNumber'];
	$new_channelnumber = $this->request->get['new_channelnumber'];
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
	$old_enablechnumber = $this->request->get['old_enablechnumber'];
	$Enable_serviceNumber = $this->request->get['Enable_serviceNumber'];
	$old_enablechProv = $this->request->get['old_enablechProv'];
    $count=0;
    $this->load->model('common/dashboardchannels');
	$hdr = array('Content-Type: application/x-www-form-urlencoded');
    $restapi_object = new restapi();
 // ....................set Service Id..............................
    if($original_chNumber != $new_channelnumber || $Enable_serviceNumber != $old_enablechnumber)
	{
 		if($Enable_serviceNumber==1)
 		{
 	    
	        $original_service_id  = ''.$original_chNumber.'';
			$new_service_id  = ''.$new_channelnumber.'';
			$addFlag=1;
		
	    }
	    else if($Enable_serviceNumber==0)
	    {           
	        $new_channelnumber=-1;
	        $original_service_id  = ''.$original_chNumber.'';
		    $new_service_id  = 0;
		    $addFlag=0;
			        
	    }
	  
           		$result=$this->model_common_dashboardchannels->isDuplicateServiceId($new_service_id); 
           		if($result==0)
           		{
			        $url_channel = "http://".RMX_IP."/setServiceID";
			        $data="original_service_id=".$original_service_id ."&new_service_id=".$new_service_id."&input=".$input."&output=".$output."&rmx_no=".$rmx_no."&addFlag=".$addFlag;
					$object = new restapi();
					$channleActivation_resp = $restapi_object->callAPI("POST",$hdr,$url_channel,$data);
					$channelActivation_decoded = json_decode($channleActivation_resp,true);
					  
					if($channleActivation_resp == false || $channelActivation_decoded['error'] == true)
					{	
						$resp = $channleActivation_resp;
					}
					else
					{
					  $this->model_common_dashboardchannels->changeOutputPid($original_chNumber,$new_channelnumber,$Enable_serviceNumber,$input,$output,$rmx_no); 
					  $resp = 1;
						
					}  
				}
				else
				{
					$resp=-1;
				}
               
	    
	}
	sleep(0.5);
// ....................set Service Id..............................	    
// ....................set Service name..............................
	if($org_chname != $new_service_name || $old_enablechname != $Enable_serviceName)
	{
	    if($Enable_serviceName==1)
 		{   
	        $progNAME  = ''.$new_service_name.'';
			$progNUM   = ''.$original_chNumber.'';
			$addFlag=1;
			$new_name=''.$new_service_name.'';
	    }
	    else if($Enable_serviceName==0)
	    {
            $new_service_name='-1';
	        $progNAME  = ''.$new_service_name.'';
			$progNUM   = ''.$original_chNumber.'';
			$addFlag=0;
			$new_name=0;
	    }


            $result=$this->model_common_dashboardchannels->isDuplicateServiceName($new_name,$output,$rmx_no);
            if($result==0)
            {
                $url_set_service_name = "http://".RMX_IP."/setServiceName";
	            $data_set_service_name="pname=".$progNAME ."&pnumber=".$progNUM."&input=".$input."&rmx_no=".$rmx_no."&addFlag=".$addFlag;
				$object = new restapi();
				$set_service_name_resp = $restapi_object->callAPI("POST",$hdr,$url_set_service_name,$data_set_service_name);
				$set_service_name_decoded = json_decode($set_service_name_resp,true);
				  
				if($set_service_name_resp == false || $set_service_name_decoded['error'] == true)
				{
					$resp = $set_service_name_resp;
				}
				else
				{
					$this->model_common_dashboardchannels->changechannelname($new_service_name,$original_chNumber,$Enable_serviceName,$input,$output,$rmx_no); 
					$resp = 1;
					
				}	
            }
            else
            {
            	$resp=6;
            }
	        


	}	
	// sleep(1);
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
			$resp = 1;
			
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
	
 	$url_Set_table = "http://".RMX_IP."/setPsiSiIntervalToAllRmx";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_Set_table="patint=".$Set_PAT."&sdtint=".$Set_SDT."&nitint=".$Set_NIT;
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
	

    $json_arr=json_encode(array('uTS_Id'=>$TSDetail_data['uTS_Id'],'uNet_Id'=>$TSDetail_data['uNet_Id'],'uOrigNet_Id'=>$TSDetail_data['uOrigNet_Id'],'nit_selected_id'=>$TSDetail_data['NIT_code'],'Qam_no'=>$get_qam_decode['qam'],'invert_IQ'=>$get_gain_decode['invert_IQ'],'Gain'=>$get_gain_decode['gain'],'FsymbolRate'=>$get_FsymbolRate_decode['fsymbol_rate'],'Rolloff'=>$get_FsymbolRate_decode['rolloff'],'bitStream'=>$get_bitStream_decode['bitstream'],'IpOutputChannel'=>$IpOutputChannel));
    
    $this->response->setOutput($json_arr);		       
 }  
 public function getNITMode()
 {
 	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	$restapi_object = new restapi();
	$get_nitMode_url = "http://".RMX_IP."/getNITmode/";
	$data_nitMode="rmx_no=".$rmx_no."&output=".$output; 
	$get_nitMode_response = $restapi_object->callAPI("POST",$hdr,$get_nitMode_url,$data_nitMode);
	$get_nitMode_decode = json_decode($get_nitMode_response,true);
	if($get_nitMode_response == false || $get_nitMode_decode['error'] ==true)
	{
         $this->response->setOutput(-1);
	}
	else
	{
		   $json_arr=json_encode(array('nitCode'=>$get_nitMode_decode['NIT_code'],'nitMode'=>$get_nitMode_decode['NIT_mode']));
    
    $this->response->setOutput($json_arr);
	}
 } 
  public function get_network_id()
 {
 	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	$restapi_object = new restapi();
	$url_get_TSDetail = "http://".RMX_IP."/getTSDetails"; 
	$data_get_TSDetail="input=".$output."&output=".$output."&rmx_no=".$rmx_no;
    $TSDetail_resp = $restapi_object->callAPI("POST",$hdr,$url_get_TSDetail,$data_get_TSDetail);
    $TSDetail_decode = json_decode($TSDetail_resp,true);
    if($TSDetail_resp == false || $TSDetail_decode['error'] == true)
		{
		 $this->response->setOutput(-1);	
		}
	else
	{
		   $json_arr=json_encode(array('uNet_Id'=>$TSDetail_decode['uNet_Id'],'uOrigNet_Id'=>$TSDetail_decode['uOrigNet_Id']));
    
    $this->response->setOutput($json_arr);
	}
 } 
 public function set_network_id()
 {
 	 $org_network_id = $this->request->get['org_network_id'];
	 $network_id = $this->request->get['network_id'];

	    $hdr = array('Content-Type: application/x-www-form-urlencoded');
		$restapi_object = new restapi();
		$url_set_network = "http://".RMX_IP."/setONId"; 
		$data_set_network="originalnwid=".$org_network_id."&networkid=".$network_id;
	    $set_network_resp = $restapi_object->callAPI("POST",$hdr,$url_set_network,$data_set_network);
	    $set_network_decode = json_decode($set_network_resp,true);
	    if($set_network_resp == false || $set_network_decode['error'] == true)
			{
			 $this->response->setOutput(-1);	
			}
		else
		{
			 $this->response->setOutput(0);
		}
 }          
public function set_TS_ID()
 {
    $Set_TSID = $this->request->get['Set_TSID'];
  	$output = $this->request->get['output'];
	$rmx_no = $this->request->get['rmx_no'];
    $this->load->model('common/dashboardchannels');
	$result=$this->model_common_dashboardchannels->tsDetails($Set_TSID,$rmx_no-1,$output);
     if($result==0)
     {
       $this->response->setOutput(2);
     }
     else
     {
     	
	 	$url_Set_TSID = "http://".RMX_IP."/setTransportStreamId";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_Set_TSID="transportid=".$Set_TSID ."&output=".$output."&rmx_no=".$rmx_no;
	 	$restapi_object = new restapi();
	 	$TSID_set_resp = $restapi_object->callAPI("POST",$hdr,$url_Set_TSID,$data_Set_TSID);
	 	$TSID_set_resp_decoded = json_decode($TSID_set_resp ,true);

	 	if($TSID_set_resp == false || $TSID_set_resp_decoded['error'] == true)
	 	{
	 		$this->response->setOutput($TSID_set_resp);
	 	}
	 	else
	 	{
	 		$this->response->setOutput(1);
	 	}
     }
	
 		
 }
 public function EnableEIT()
 {
 	$rmx_no=$this->request->get['rmx_no'];
 	$output=$this->request->get['output'];
 	$EIT_value=$this->request->get['EIT_value'];
    $qam_id=$rmx_no-1;
    $addFlag=$EIT_value;

        $url_EnableEIT = "http://".RMX_IP."/enableEIT";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_EnableEIT="addFlag=".$addFlag ."&output=".$output."&rmx_no=".$rmx_no;
	 	$restapi_object = new restapi();
	 	$EnableEIT_resp = $restapi_object->callAPI("POST",$hdr,$url_EnableEIT,$data_EnableEIT);
	 	$EnableEIT_resp_decoded = json_decode($EnableEIT_resp ,true);

	 	if($EnableEIT_resp == false || $EnableEIT_resp_decoded['error'] == true)
	 	{
	 		$this->response->setOutput($EnableEIT_resp);
	 	}
	 	else
	 	{
	 		$this->load->model('common/dashboardchannels');
		 	$this->model_common_dashboardchannels->updateEIT($output,$qam_id,$EIT_value);

		 	$this->response->setOutput(1);
	 	}

 	
 }
 public function getEIT()
 {
 	$qam_id=$this->request->get['qam_id'];
 	$output=$this->request->get['output'];
 	$this->load->model('common/dashboardchannels');
 	$resp=$this->model_common_dashboardchannels->getEIT($output,$qam_id);
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
 
	$nit_mode = $this->request->get['nit_mode'];

		$url_NIT = "http://".RMX_IP."/setNITmodeToAllRmx";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_nit="mode=".$nit_mode;
	 	$restapi_object = new restapi();
	 	$resp=0;
	 	$nit_resp = $restapi_object->callAPI("POST",$hdr,$url_NIT,$data_nit);
	 	$nit_resp_decoded = json_decode($nit_resp ,true);

	 	if($nit_resp == false || $nit_resp_decoded['error'] == true)
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
	
		$url_table_version = "http://".RMX_IP."/setTablesVersionToAllRmx";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_table_version="pat_ver=".$changed_pat_ver."&sdt_ver=".$changed_sdt_ver."&nit_ver=".$changed_nit_ver."&nit_isenable=".$nit_isenable."&pat_isenable=".$pat_isenable."&sdt_isenable=".$sdt_isenable;
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
     else
     {
     $this->load->model('common/dashboardchannels');
     $this->model_common_dashboardchannels->high_priority($Priority_checkbox,$input,$program_number); 
     $this->response->setOutput(0);
     }
  } 
  public function setLCN()
  {
  	  $output = $this->request->get['output'];
	  $input = $this->request->get['input'];
	  $programNumber = $this->request->get['programNumber'];
	  $rmx_no = $this->request->get['rmx_no'];
	  $channelNumber = $this->request->get['channelNumber'];
	  $addFlag = $this->request->get['addFlag'];
    
	  $url_set_lcn = "http://".RMX_IP."/setHostNITLcn";      
 	  $hdr = array('Content-Type: application/x-www-form-urlencoded');
 	  $data_set_lcn="service_id=".$programNumber."&input=".$input."&rmx_no=".$rmx_no."&output=".$output."&lcn_id=".$channelNumber."&addFlag=".$addFlag;
 	  $restapi_object = new restapi();
 	  $set_lcn_resp =$restapi_object->callAPI("POST",$hdr,$url_set_lcn,$data_set_lcn);
      $set_lcn_decoded = json_decode($set_lcn_resp ,true);
 	  if($set_lcn_resp == false || $set_lcn_decoded['error'] == true)
      {
	    $this->response->setOutput($set_lcn_resp);
      }
      else
      {
      	    $this->load->model('common/dashboardchannels');
            $this->model_common_dashboardchannels->StoreLcn($output,$input,$programNumber,$rmx_no,$channelNumber); 
            $this->response->setOutput(0);

      }


  }	
  public function unsetLCN()
  {
  	  $output = $this->request->get['output'];
	  $input = $this->request->get['input'];
	  $service_id = $this->request->get['programNumber'];
	  $rmx_no = $this->request->get['rmx_no'];
      $channelNumber=NULL;
	  $url_unset_lcn = "http://".RMX_IP."/unsetHostNITLcn";      
 	  $hdr = array('Content-Type: application/x-www-form-urlencoded');
 	  $data_unset_lcn="service_id=".$service_id."&input=".$input."&rmx_no=".$rmx_no."&output=".$output;
 	  $restapi_object = new restapi();
 	  $unset_lcn_resp =$restapi_object->callAPI("POST",$hdr,$url_unset_lcn,$data_unset_lcn);
      $unset_lcn_decoded = json_decode($unset_lcn_resp ,true);
 	  if($unset_lcn_resp == false || $unset_lcn_decoded['error'] == true)
      {
	    $this->response->setOutput($set_lcn_resp);
      }
      else
      {
      	    $this->load->model('common/dashboardchannels');
            $this->model_common_dashboardchannels->StoreLcn($output,$input,$service_id,$rmx_no,$channelNumber); 
            $this->response->setOutput(0);

      }
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
	$ip_data_id = $this->request->get['ip_data_id'];
	$re_no=$ip_data_id-1;
    $tunerId=$channel-1;
    $input=$channel-1;
    $lnbId = $this->request->get['lnbId'];
     $hdr = array('Content-Type: application/x-www-form-urlencoded');
     $restapi_object = new restapi();
     $this->load->model('common/dashboardchannels');
     $input_rate="";

            $url_AddIPIN = "http://".RMX_IP."/setEthernetIn";      
		 	$data_AddIPIN="port=".$port."&ip_address=".$ip."&rmx_no=".$rmx_no."&channel_no=".$channel."&type=".$type;
		 	$AddIPIN_resp =$restapi_object->callAPI("POST",$hdr,$url_AddIPIN,$data_AddIPIN);
		    $AddIPIN_decoded = json_decode($AddIPIN_resp ,true);
		    if($AddIPIN_resp == false || $AddIPIN_decoded['error'] == true)
		      {
			    $resp=-2;
		      }
		    else
		    {
		      
			        $resp=$this->model_common_dashboardchannels->addIPInput($ip,$port,$channel,$rmx_no,$type);

			        $this->model_common_dashboardchannels->updateFlag($rmx_no-1,$input,0);

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
	$ip_data_id = $this->request->get['ip_data_id'];
	$lnbId = $this->request->get['lnbId'];
	$re_no=$ip_data_id-1;
	$tunerId=$channel-1;
    $hdr = array('Content-Type: application/x-www-form-urlencoded');
    $restapi_object = new restapi();
    $input_rate="";
    $input=$channel-1;

	   

			$url_UpdateIPIN = "http://".RMX_IP."/setEthernetIn";      
		 	$data_UpdateIPIN="port=".$port."&ip_address=".$ip."&rmx_no=".$rmx_no."&channel_no=".$channel."&type=".$type;
		 	$UpdateIPIN_resp =$restapi_object->callAPI("POST",$hdr,$url_UpdateIPIN,$data_UpdateIPIN);
		    $UpdateIPIN_decoded = json_decode($UpdateIPIN_resp ,true);
		    if($UpdateIPIN_resp == false || $UpdateIPIN_decoded['error'] == true)
		      {
			    $resp=-2;
		      }
		    else
		      {
		      	sleep(2);
			    $this->load->model('common/dashboardchannels');
			    $resp=$this->model_common_dashboardchannels->updateIPInput($ip,$port,$channel,$type,$rmx_no);
			    $this->model_common_dashboardchannels->updateFlag($rmx_no-1,$input,0);
			    
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
		$this->model_common_dashboardchannels->deleteInputChannels($tunerId,$rmx_no);
		$this->model_common_dashboardchannels->deleteOutChannels($tunerId,$rmx_no);
		$this->model_common_dashboardchannels->Deletebouquetservices($tunerId,$rmx_no);

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
 function addSptsIP()
 {
 	$ip = $this->request->get['SPTS_IP'];
  	$port = $this->request->get['SPTS_PORT'];
	$channel_no = $this->request->get['channel_no'];
	$rmx_no = $this->request->get['rmx_no'];
	$type = $this->request->get['SPTS_type'];
	$this->load->model('common/dashboardchannels');
      $tunerId=0;


	$url_add_spts = "http://".RMX_IP."/setSPTSEthernetIn";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_set_spts="channel_no=".$channel_no."&rmx_no=".$rmx_no."&type=".$type."&port=".$port."&ip_address=".$ip;
 	$restapi_object = new restapi();
 	$set_addspts_resp =$restapi_object->callAPI("POST",$hdr,$url_add_spts,$data_set_spts);
 	$set_addspts_decoded = json_decode($set_addspts_resp,true);
	
    if($set_addspts_resp == false || $set_addspts_decoded['error'] == true){
    	
		$this->response->setOutput($set_addspts_resp);
	}else{

		
		$this->model_common_dashboardchannels->addSptsIP($channel_no,$rmx_no,$type,$port,$ip);
		$resp=0;
		
	}
	if($rmx_no==1)
	{
		$rmx_no=1;
	}
	else if($rmx_no==2)
	{
		$rmx_no=3;
	}
	else 
	{
		$rmx_no=5;
	}
  $this->model_common_dashboardchannels->addTunertype($rmx_no,$tunerId,2);
  $this->response->setOutput($resp);

 }
 function getSPTSIP()
 {
 	$data=array();
 	$rmx_no = $this->request->get['rmx_no'];
 	$this->load->model('common/dashboardchannels');
 	$IPSPTS_data=array();
 	$IPSPTS_data= $this->model_common_dashboardchannels->getSptsIP($rmx_no); 
	 if(sizeof($IPSPTS_data)>0)
			$data["error"] = 0;
		else
			$data["error"] = 1;
	$data["list"] = $IPSPTS_data;
	

  $this->response->setOutput(json_encode($data));
 }
 function deleteSPTSIP()
 {
 	$channel_no = $this->request->get['channel_no'];
	$rmx_no = $this->request->get['rmx_no'];
	$tunerId=0;
    $this->load->model('common/dashboardchannels');

	$url_delete_spts = "http://".RMX_IP."/setSPTSEthernetInOff";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_delete_spts="channel_no=".$channel_no."&rmx_no=".$rmx_no;
 	$restapi_object = new restapi();
 	$set_deletespts_resp =$restapi_object->callAPI("POST",$hdr,$url_delete_spts,$data_delete_spts);
 	$set_deletespts_decoded = json_decode($set_deletespts_resp,true);
	
    if($set_deletespts_resp == false || $set_deletespts_decoded['error'] == true){
    	
		$this->response->setOutput($set_deletespts_resp);
	}else{

		
		$resp=$this->model_common_dashboardchannels->deleteSptsIP($channel_no,$rmx_no);
		
		
	}
	if($rmx_no==1)
	{
		$rmx_no=1;
	}
	else if($rmx_no==2)
	{
		$rmx_no=3;
	}
	else 
	{
		$rmx_no=5;
	}
  $this->model_common_dashboardchannels->addTunertype($rmx_no ,$tunerId,-1);
  $this->response->setOutput($resp);

 }
 function insertNIT()
 {
 	$network_name = $this->request->get['network_Name'];
	$network_id = $this->request->get['network_Id'];
	$version = $this->request->get['Version'];
    $this->load->model('common/dashboardchannels');
	$url_insert_nit = "http://".RMX_IP."/insertNITable";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_insert_nit="network_name=".$network_name."&network_id=".$network_id."&version=".$version;
 	$restapi_object = new restapi();
 	$insert_nit_resp =$restapi_object->callAPI("POST",$hdr,$url_insert_nit,$data_insert_nit);
 	$insert_nit_decoded = json_decode($insert_nit_resp,true);

    if($insert_nit_resp == false || $insert_nit_decoded['error'] == true){
    	
		$this->response->setOutput(-1);
	}
	else
	{
		$this->model_common_dashboardchannels->insertNIT($network_name ,$network_id,$version);
		$this->response->setOutput(1);
		
	}

 }
 function getInsertNIT()
 {
 	  $data=array();
 	  $this->load->model('common/dashboardchannels');
 	  $getNIT=array();
 	  $getNIT= $this->model_common_dashboardchannels->getInsertNIT();
 
 	   if(sizeof($getNIT)>0)
 	   {
			$data["error"] = 0;
 	   }
		else
		{
			$data["error"] = 1;
		}
	  $data["list"] = $getNIT;
 	  $this->response->setOutput(json_encode($data)); 	 
	
 }

function disableNIT()
{
	$url_disable_nit = "http://".RMX_IP."/disableNITable";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	
 	$restapi_object = new restapi();
 	$disable_nit_resp =$restapi_object->callAPI("POST",$hdr,$url_disable_nit,$data_disable_nit=array());
 	$disable_nit_decoded = json_decode($disable_nit_resp,true);

    if($disable_nit_resp == false || $disable_nit_decoded['error'] == true){
    	
		$this->response->setOutput($disable_nit_resp);
	}
	else
	{
		
		$this->response->setOutput(1);
		
	}
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
    $input_rate="";
    $re_no=$tunerId-1;

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
				sleep(2);	    
				$status=$get_demod_decoded['locked'];
			
		    	$this->model_common_dashboardchannels->tuneToFrequency($mxl_id,$rmx_id,$tunerId,$status,$demodId,$lnbId,$standerd,$frequency,$rate,$modulation,$fec,$rolloff,$pilots,$spectrumInverted,$polarization,$lo_frequency,$Voltage);
		    	$this->model_common_dashboardchannels->updateFlag($rmx_id-1,$demodId,0);
		    	
					    $max_bandwidth = 0;
					    $lnb_demodes = array();
					    $lnb_demodes = ($lnbId == 0)? [0,1] : (($lnbId == 1)? [2,3] : (($lnbId == 2)? [4,5] : [6,7]));
				       for ($i=0; $i < count($lnb_demodes); $i++) 
				       { 
				    	$url_ch_detail = "http://".RMX_IP."/getDataflowRates";        
						$input_para="input=".$lnb_demodes[$i]."&output=".$lnb_demodes[$i]."&rmx_no=".$rmx_id;
						$ch_detail_resp = $restapi_object->callAPI("POST",$hdr,$url_ch_detail,$input_para);
						$ch_detail_decoded = json_decode($ch_detail_resp,true);
						
						if($ch_detail_resp == false || $ch_detail_decoded['error'] == true)
						{
							
							
						}
						else
						{
							
				                $max_bandwidth =  $max_bandwidth+$ch_detail_decoded["uInuputRate"];     
				              
						}
				      }
					    if($max_bandwidth > 100000000)
					    {
                                $url_set_tunerOff = "http://".RMX_IP."/setMxlTunerOff";      
							 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
							 	$data_set_tunerOff="mxl_id=".$mxl_id."&demod_id=".$demodId;
							 	$restapi_object = new restapi();
							 	$set_tunerOff_resp =$restapi_object->callAPI("POST",$hdr,$url_set_tunerOff,$data_set_tunerOff);
							 	$set_tunerOff_decoded = json_decode($set_tunerOff_resp,true);
							 	 if($set_tunerOff_resp == false || $set_tunerOff_decoded['error'] == true)
							 	 {
			                         
		                         }
		                         else
		                         {
		                         	 $this->response->setOutput(2);
		                         }
		                    
					    }
              //*********************
				$this->response->setOutput($status);
		    }
	
   
   
  }
 function setTunerOff()
 {
 	$mxl_id = $this->request->get['rmx_no'];
	$demod_id = $this->request->get['demodId'];

	    $url_set_tunerOff = "http://".RMX_IP."/setMxlTunerOff";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_set_tunerOff="mxl_id=".$mxl_id."&demod_id=".$demod_id;
	 	$restapi_object = new restapi();
	 	$set_tunerOff_resp =$restapi_object->callAPI("POST",$hdr,$url_set_tunerOff,$data_set_tunerOff);
	 	$set_tunerOff_decoded = json_decode($set_tunerOff_resp,true);
		
	    if($set_tunerOff_resp == false || $set_tunerOff_decoded['error'] == true){
	    	
			$this->response->setOutput($set_tunerOff_resp);
		}else{

		   $this->load->model('common/dashboardchannels');
           $this->model_common_dashboardchannels->deleteTuner($mxl_id,$demod_id);
           $this->model_common_dashboardchannels->addTunertype($mxl_id ,$demod_id,-1);
           $this->model_common_dashboardchannels->deleteInputChannels($demod_id,$mxl_id);
           $this->model_common_dashboardchannels->deleteOutChannels($demod_id,$mxl_id);
           $this->model_common_dashboardchannels->Deletebouquetservices($demod_id,$mxl_id);
           $this->response->setOutput($set_tunerOff_decoded['message']);
			
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
	 function getChannels()
	 {
	 	$input = $this->request->get['input'];
	  	$rmx_no = $this->request->get['rmx_no'];
	 
         $data['channelList']=array();
	     $channelNumbers_url = "http://".RMX_IP."/getProgramList";  
		       $restapi_object = new restapi();
		       $hdr = array('Content-Type: application/x-www-form-urlencoded');		
				$program_list_data="input=".$input."&rmx_no=".$rmx_no;
				$channelNumbers_response = $restapi_object->callAPI("POST",$hdr,$channelNumbers_url ,$program_list_data);
				$channelNumbers_decoded = json_decode($channelNumbers_response,true);
				if ($channelNumbers_response == false || $channelNumbers_decoded['error'] == true ) 
				{
				   $data['channelList'] = array();
				}
				else
				{  
					$this->load->model('common/dashboardchannels');
					$result=$this->model_common_dashboardchannels->getFlag($rmx_no-1,$input);
					if($result==0)
					{
						if(is_array($channelNumbers_decoded['progNums']) )
				    	{
				    	 $this->model_common_dashboardchannels->updateOutputChannels($channelNumbers_decoded['progNums'],$input,$rmx_no);
				    	foreach (array_combine($channelNumbers_decoded['progNums'],$channelNumbers_decoded['prog_names'] ) as $ProgNumber => $ProgName )
				    	 {
				    		$this->model_common_dashboardchannels->addInputChannels($ProgNumber,$ProgName,$input,$rmx_no);
				         }
				         $this->model_common_dashboardchannels->updateFlag($rmx_no-1,$input,1);
				       }
				       else
				       {
                         $resp=-2;
				       }
					}

					$i=0;
					if(sizeof($channelNumbers_decoded ['progNums']))
					{
						$data["temp"] = $this->model_common_dashboardchannels->updateOutputChannels($channelNumbers_decoded['progNums'],$input,$rmx_no);
						foreach (array_combine($channelNumbers_decoded ['progNums'], $channelNumbers_decoded ['prog_names'])  as $pnumber => $name) 
						{ 	

                             
                           	$data['channelList'][$i]=array( "channelnumber"=>$pnumber,"channelname"=>$name);

							$i++;
						}
                        
						$data["error"]=0;	
						$data["rmx_no"]=$rmx_no;
						$data["input"]=$input;
					}

					else
					{
						$data = array("error"=>1,"message"=>"No records!");
					}

				}

	  	$this->response->setOutput(json_encode($data));
}
function validateFrequency()
{
	$this->load->model('common/dashboardchannels');
	$data['QamFreq_info']= $this->model_common_dashboardchannels->Qam_freq();

   $this->response->setOutput(json_encode($data));
}
	 function setCustomPids()
	 {
	 	$name = $this->request->get['name'];
	 	$pid = $this->request->get['pid'];
	 	$output = $this->request->get['freq_id'];
	 	$qam_id = $this->request->get['qam_id'];
        $rmx_no=$qam_id+1;
        $auth_output=255;
        $addFlag=1;
	 	    $url_set_pid= "http://".RMX_IP."/setCustomPids";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$data_set_pid="rmx_no=".$rmx_no."&addFlag=".$addFlag."&output=".$output."&auth_output=".$auth_output."&pid=".$pid;
		 	$restapi_object = new restapi();
		 	$set_pid_resp =$restapi_object->callAPI("POST",$hdr,$url_set_pid,$data_set_pid);
		 	$set_pid_decoded = json_decode($set_pid_resp,true);	

		 	if($set_pid_resp == false || $set_pid_decoded['error'] == true)
		 	{
			  $this->response->setOutput(2);
		    }
		    else
		    {
		    	$this->load->model('common/dashboardchannels');
		    	$resp=$this->model_common_dashboardchannels->setCustomPid($rmx_no,$name,$output,$pid);
		    	$this->response->setOutput($resp);
		    }

	 }
	 function updateCustomPids()
	 {
	 	$id = $this->request->get['id'];
	 	$name = $this->request->get['name'];
	 	$pid = $this->request->get['pid'];
	 	$output = $this->request->get['freq_id'];
	 	$qam_id = $this->request->get['qam_id'];
        $rmx_no=$qam_id+1;
        $auth_output=255;
        $addFlag=1;
        $url_set_pid= "http://".RMX_IP."/setCustomPids";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$data_set_pid="rmx_no=".$rmx_no."&addFlag=".$addFlag."&output=".$output."&auth_output=".$auth_output."&pid=".$pid;
		 	$restapi_object = new restapi();
		 	$set_pid_resp =$restapi_object->callAPI("POST",$hdr,$url_set_pid,$data_set_pid);
		 	$set_pid_decoded = json_decode($set_pid_resp,true);	

		 	if($set_pid_resp == false || $set_pid_decoded['error'] == true)
		 	{
			  $this->response->setOutput(2);
		    }
		    else
		    {
		    	$this->load->model('common/dashboardchannels');
		    	$resp=$this->model_common_dashboardchannels->updateCustomPid($name,$pid,$id);
		    	$this->response->setOutput($resp);
		    }
	 }
	 function get_pid_data()
	 {
	 	 $data=array();
	 	$output = $this->request->get['freq_id'];
	 	$qam_id = $this->request->get['qam_id'];
        $rmx_no=$qam_id+1;
        $pid_data=array();
        $this->load->model('common/dashboardchannels');
	 	$pid_data= $this->model_common_dashboardchannels->getCustomPid($output,$rmx_no);
	 	 if(sizeof($pid_data)>0)
			$data["error"] = 0;
		else
			$data["error"] = 1;
	    $data["list"] = $pid_data;
	 	$this->response->setOutput(json_encode($data));
	 }
     function deleteCustomPid()
     {
     	$id = $this->request->get['id'];
     	$name = $this->request->get['name'];
	 	$pid = $this->request->get['pid'];
	 	$output = $this->request->get['freq_id'];
	 	$qam_id = $this->request->get['qam_id'];
        $rmx_no=$qam_id+1;
        $auth_output=255;
        $addFlag=0;
	 	    $url_set_pid= "http://".RMX_IP."/setCustomPids";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$data_set_pid="rmx_no=".$rmx_no."&addFlag=".$addFlag."&output=".$output."&auth_output=".$auth_output."&pid=".$pid;
		 	$restapi_object = new restapi();
		 	$set_pid_resp =$restapi_object->callAPI("POST",$hdr,$url_set_pid,$data_set_pid);
		 	$set_pid_decoded = json_decode($set_pid_resp,true);	

		 	if($set_pid_resp == false || $set_pid_decoded['error'] == true)
		 	{
			  $this->response->setOutput($set_pid_resp);
		    }
		    else
		    {
		    	$this->load->model('common/dashboardchannels');
		    	$resp=$this->model_common_dashboardchannels->deleteCustomPid($id);
		    	$this->response->setOutput($resp);
		    }
     }
function getInputType()
 {
        $control_fpga = $this->request->get['control_fpga'];

        $url_get_inputType= "http://".RMX_IP."/getInputChannelTunerType";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_get_inputType="&control_fpga=".$control_fpga;
	 	$restapi_object = new restapi();
	 	$get_inputType_resp =$restapi_object->callAPI("POST",$hdr,$url_get_inputType,$data_get_inputType);
	 	$get_inputType_decoded = json_decode($get_inputType_resp,true);	
	 	if($get_inputType_resp == false || $get_inputType_decoded['error'] == true)
		 {
			$this->response->setOutput(-1);
		 }
		else
		{
           $this->response->setOutput(json_encode($get_inputType_decoded['input_type']));
		}
 }
public function addPrivateData()
{
	$Private_data = $this->request->get['Private_data'];
	$addFlag = $this->request->get['addFlag'];
	$id = $this->request->get['count'];
	$frequencies = $this->request->get['frequencies'];
	$loop = $this->request->get['loop'];
	$Table = $this->request->get['Table'];
	$service_id = $this->request->get['service_id'];
	$ts_id = $this->request->get['ts_id'];
	$this->load->model('common/dashboardchannels');
       if($service_id== -1)
       {
        $output_list=array_map('intval',explode(',',$frequencies));

        $url_Private_data= "http://".RMX_IP."/setPrivateData";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_Private_data="&private_data=".$Private_data."&addFlag=".$addFlag."&private_data_id=".$id."&loop=".$loop."&table_type=".$Table."&output_list=".json_encode(array('outputs' => $output_list));
	 	$restapi_object = new restapi();
	 	$Private_data_resp =$restapi_object->callAPI("POST",$hdr,$url_Private_data,$data_Private_data);
	 	$Private_data_decoded = json_decode($Private_data_resp,true);	
	 	if($Private_data_resp == false || $Private_data_decoded['error'] == true)
		 {
			$this->response->setOutput($data_Private_data);
		 }
		else
		{
           
           
          if($addFlag==1)
          {
           $this->model_common_dashboardchannels->addPrivateData($Private_data,$id,$loop,$frequencies,$Table);
          }
          else
          {
          	$this->model_common_dashboardchannels->deletePrivateData($id);
          } 
		   $this->response->setOutput(1);
		}
	}
	else
	{
		$url_Private_data= "http://".RMX_IP."/setSDTPrivateData";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_Private_data="&private_data=".$Private_data."&addFlag=".$addFlag."&private_data_id=".$id."&service_id=".$service_id."&ts_id=".$ts_id;
	 	$restapi_object = new restapi();
	 	$Private_data_resp =$restapi_object->callAPI("POST",$hdr,$url_Private_data,$data_Private_data);
	 	$Private_data_decoded = json_decode($Private_data_resp,true);
	 	if($Private_data_resp == false || $Private_data_decoded['error'] == true)
		 {
			$this->response->setOutput($data_Private_data);
		 }
		else
		{
          $this->model_common_dashboardchannels->addSDTPrivateData($id,$Private_data,$service_id,$ts_id,$addFlag);
		  $this->response->setOutput(1);
		}
	}
}

function getPrivateDataDetails()
{
	$id=$_POST['id'];
	$table_type=$_POST['table_type'];
	$this->load->model('common/dashboardchannels');
	$data=$this->model_common_dashboardchannels->getPrivateDataDetails($id,$table_type);
	$this->response->setOutput(json_encode($data));
}
function getActivatedPrograms()
{
	$rmx_no = $this->request->get['rmx_no'];
	$input = $this->request->get['input'];
	$output = $this->request->get['output'];
    $hdr = array('Content-Type: application/x-www-form-urlencoded');
    $restapi_object = new restapi();
	               $get_ActivatedChannels="http://".RMX_IP."/getProgActivation/";
                   $data_activatedProgs="&input=".$input."&output=".$output."&rmx_no=".$rmx_no;
	               $Activated_channels_response = $restapi_object->callAPI("POST",$hdr, $get_ActivatedChannels,$data_activatedProgs);
	               $Activated_channels_decode = json_decode($Activated_channels_response,true);
	               if ($Activated_channels_response == false || $Activated_channels_decode['error'] == true ) 
					{
					  $programs=json_encode($Activated_channels_decode['pProg']);  
					}
				  else
			       {
                     $programs=json_encode($Activated_channels_decode['pProg']);
			       }
		$this->response->setOutput($programs);	       
}
	/*************************************************************************
  						SCRAMBLEING
    *************************************************************************/ 
	 function scrambleService()
	 {
        $rmx_no = $this->request->get['rmx_no'];
	  	$input = $this->request->get['input'];
		$output = $this->request->get['output'];
		$programNumber = $this->request->get['programNumbers'];
		$includeFlag = $this->request->get['includeFlag'];
		$parity=0;
		$scramble = $this->request->get['scramble'];
		$changed_ch_no = $this->request->get['changed_ch_no'];
	
        $this->load->model('common/dashboardchannels');

		if($includeFlag==0)
		{
			if($changed_ch_no!= -1)
			{
              $result=$this->model_common_dashboardchannels->checkECMStream($rmx_no,$input,$output,$changed_ch_no);
			}
			else
			{
			 $result= $this->model_common_dashboardchannels->checkECMStream($rmx_no,$input,$output,$programNumber);	
			}
          if($result==1)
          {
          	// $this->response->setOutput(4);
          	$resp=4;
          }
          else
          {
          	    $url_set_encrypt= "http://".RMX_IP."/setEncrypteService";      
			 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
			 	$data_set_encrypt="&programNumber=".$programNumber."&rmx_no=".$rmx_no."&input=".$input."&output=".$output."&includeFlag=".$includeFlag;
			 	$restapi_object = new restapi();
			 	$set_encrypt_resp =$restapi_object->callAPI("POST",$hdr,$url_set_encrypt,$data_set_encrypt);
			 	$set_encrypt_decoded = json_decode($set_encrypt_resp,true);	
			 	if($set_encrypt_resp == false || $set_encrypt_decoded['error'] == true)
				 {
					// $this->response->setOutput(3);
					$resp=$set_encrypt_resp;
				 }
				else
				{
					$resp=0;
					   if($changed_ch_no!= -1)
						{
                          $programNumber=$changed_ch_no;
						}
						
					if($includeFlag==0)
					{

                      $this->model_common_dashboardchannels->deleteScrablingServices($rmx_no,$input,$output,$programNumber);
					}
					else
					{
                     $this->model_common_dashboardchannels->addScrablingServices($rmx_no,$input,$output,$programNumber,$includeFlag,$scramble);
                     $auth_bit=255;
                        $url_set_csa= "http://".RMX_IP."/setCsa";      
					 
					 	$data_set_csa="&auth_bit=".$auth_bit."&rmx_no=".$rmx_no."&input=".$input."&output=".$output."&parity=".$parity;
					 	
					 	$set_csa_resp =$restapi_object->callAPI("POST",$hdr,$url_set_csa,$data_set_csa);
					 	$set_csa_decoded = json_decode($set_csa_resp,true);	
					 	if($set_csa_resp == false || $set_csa_decoded['error'] == true)
						 {
							// $this->response->setOutput(3);
							$resp=$set_csa_resp;
						 }
						 else
						 {
						 	$resp=0;
						 }
					}
				  // $this->response->setOutput(0);	
				}
          }
		}
		else
		{
			$url_set_encrypt= "http://".RMX_IP."/setEncrypteService";      
			 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
			 	$data_set_encrypt="&programNumber=".$programNumber."&rmx_no=".$rmx_no."&input=".$input."&output=".$output."&includeFlag=".$includeFlag;
			 	$restapi_object = new restapi();
			 	$set_encrypt_resp =$restapi_object->callAPI("POST",$hdr,$url_set_encrypt,$data_set_encrypt);
			 	$set_encrypt_decoded = json_decode($set_encrypt_resp,true);	
			 	if($set_encrypt_resp == false || $set_encrypt_decoded['error'] == true)
				 {
					// $this->response->setOutput(3);
					$resp=$set_encrypt_resp;
				 }
				else
				{
					$resp=0;
					   if($changed_ch_no!= -1)
						{
                          $programNumber=$changed_ch_no;
						}
						
					if($includeFlag==0)
					{

                      $this->model_common_dashboardchannels->deleteScrablingServices($rmx_no,$input,$output,$programNumber);
					}
					else
					{
                     $this->model_common_dashboardchannels->addScrablingServices($rmx_no,$input,$output,$programNumber,$includeFlag,$scramble);
                     $auth_bit=255;
                        $url_set_csa= "http://".RMX_IP."/setCsa";      
					 
					 	$data_set_csa="&auth_bit=".$auth_bit."&rmx_no=".$rmx_no."&input=".$input."&output=".$output."&parity=".$parity;
					 	
					 	$set_csa_resp =$restapi_object->callAPI("POST",$hdr,$url_set_csa,$data_set_csa);
					 	$set_csa_decoded = json_decode($set_csa_resp,true);	
					 	if($set_csa_resp == false || $set_csa_decoded['error'] == true)
						 {
							// $this->response->setOutput(3);
							$resp=$set_csa_resp;
						 }
						else
						{
							$resp=0;
						}
					}
				  // $this->response->setOutput(0);	
				}
		}
$this->response->setOutput($resp);
		        	
	 }
function ChangeDataPortIP()
{
	 $ip_address = $this->request->get['ip_address'];
	 $data_ip_id = $this->request->get['data_ip_id'];


        $url_set_FPGAStaticIP= "http://".RMX_IP."/setFPGAStaticIP";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$data_set_FPGAStaticIP="&ip_address=".$ip_address."&data_ip_id=".$data_ip_id;
	 	$restapi_object = new restapi();
	 	$set_FPGAStaticIP_resp =$restapi_object->callAPI("POST",$hdr,$url_set_FPGAStaticIP,$data_set_FPGAStaticIP);
	 	$set_FPGAStaticIP_decoded = json_decode($set_FPGAStaticIP_resp,true);	
	 	if($set_FPGAStaticIP_resp == false || $set_FPGAStaticIP_decoded['error'] == true)
		 {
			// $this->response->setOutput(3);
			$resp=$set_FPGAStaticIP_resp;
		 }
		else
		{
			$resp=1;
		}
		$this->response->setOutput($resp);
}
function getFPGAStaticIP()
{
	
$resp=array();
for($data_ip_id=1;$data_ip_id<=3;$data_ip_id++)
{
        $url_set_FPGAStaticIP= "http://".RMX_IP."/getFPGAStaticIP/".$data_ip_id;      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 
	 	$restapi_object = new restapi();
	 	$set_FPGAStaticIP_resp =$restapi_object->callAPI("GET",$hdr,$url_set_FPGAStaticIP,$data_set_FPGAStaticIP=array());
	 	$set_FPGAStaticIP_decoded = json_decode($set_FPGAStaticIP_resp,true);	
	 	if($set_FPGAStaticIP_resp == false || $set_FPGAStaticIP_decoded['error'] == true)
		 {
			// $this->response->setOutput(3);
			$resp[$data_ip_id]="0";
		 }
		else
		{
			$HEX_IP=dechex($set_FPGAStaticIP_decoded['static_ip']);
			if(strlen($HEX_IP)==8)
			{
			    
				$HEX_IP1=substr($HEX_IP,0,2);
				$HEX_IP2=substr($HEX_IP,2,2);
				$HEX_IP3=substr($HEX_IP,4,2);
				$HEX_IP4=substr($HEX_IP,6,2);
				$DEC_IP=hexdec($HEX_IP1).'.'.hexdec($HEX_IP2).'.'.hexdec($HEX_IP3).'.'.hexdec($HEX_IP4);
				$resp[$data_ip_id]=$DEC_IP;	
			}
			else
			{
				$resp[$data_ip_id]="0";
			}
			
		}
		
}
 $this->response->setOutput(json_encode($resp));       
}
function getSystemBackup()
{
	$url_backup = "http://".RMX_IP."/getControllerBackup";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	
 	$restapi_object = new restapi();
 	$resp = array();
 	$json_sys_backup =$restapi_object->callAPI("POST",$hdr,$url_backup,$data_sb=array());
 	$sys_backup = json_decode($json_sys_backup,true);

    if($sys_backup == false || $sys_backup['error'] == true){
    	
		$this->response->setOutput($json_sys_backup);
	}
	else
	{
		if($sys_backup["error"] == false){
			$file_path = DIR_DOWNLOAD."database_dump";
			if (!file_exists($file_path)) {
			    mkdir($file_path, 0777, true);
			}else{
				if (file_exists($file_path."/dumpHeadendController.sql"))
					exec("rm -R ".$file_path."/dumpHeadendController.sql");
				if (file_exists($file_path."/dumpHeadendUI.sql"))
					exec("rm -R ".$file_path."/dumpHeadendUI.sql");
			}
			exec("mysqldump -u".DB_USERNAME." -p".DB_PASSWORD." ".DB_DATABASE." > ".$file_path."/dumpHeadendUI.sql");
			exec("mysqldump -u".$sys_backup["db_user"]." -p".$sys_backup["db_pass"]." ".$sys_backup["db_name"]." > ".$file_path."/dumpHeadendController.sql");
			
			if (file_exists($file_path."/dumpHeadendController.sql") && file_exists($file_path."/dumpHeadendUI.sql")){
				

				$zipPassword = "passwd";
				exec('zip -jrq -P '.$zipPassword.' '.$file_path.'.zip '.$file_path);

				$pos=0;
				$file_path_arr = explode("/",$file_path);

				for ($i=0; $i < sizeof($file_path_arr); $i++) { 
					if($file_path_arr[$i] == "html"){
						$pos = $i;
					}
				}
				$download_path = HTTPS_SERVER;
				$download_path = substr($download_path,0,strpos($download_path,"admin"));
				$pos +=2; 
				for ($i=$pos; $i < count($file_path_arr); $i++) { 
					$download_path .= $file_path_arr[$i]."/";
				}
				$download_path =rtrim($download_path,"/");

				$resp["error"] = false;
				$resp["message"] = "Successfully took backup!";
				$resp["path"] = $download_path.'.zip';
			}else{
				$resp["error"] = true;
				$resp["message"] = "Failed to download!";
			}	
		}
		else{
			$resp = $sys_backup;
		}
		$this->response->setOutput(json_encode($resp));//$download_path.'.zip');		
	}
}

function setFactoryReset()
{
	$file_path = DIR_SYSTEM;
	$file_path = substr($file_path,0,strpos($file_path,"system"));
	$file_path .="install/Headend.sql";
	$resp = array();
	if (file_exists($file_path)) {
		$url_factory_reset = "http://".RMX_IP."/setControllerFactoryReset";      
	 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	 	$restapi_object = new restapi();
	 	$json_sys_fr =$restapi_object->callAPI("POST",$hdr,$url_factory_reset,$data_sb=array());
	 	$sys_freset = json_decode($json_sys_fr,true);
	 	$this->load->model('common/dashboardchannels');
	    if($sys_freset == false || $sys_freset['error'] == true){
	    	
			$this->response->setOutput($json_sys_fr);
		}
		else
		{
			if($sys_freset["error"] == false){
				$db_created = $this->model_common_dashboardchannels->dumpDatabase();
				exec("mysql -u".DB_USERNAME." -p".DB_PASSWORD." ".DB_DATABASE." < ".$file_path);
				$resp["error"] = false;
				$resp["message"] = "Successfully reseted system! Please restart the board to apply changes!";
			}else{
				$resp["error"] = true;
				$resp["message"] = "Failed to download!";
			}
		}

	}else{
		$resp["error"] = true;
		$resp["message"] = "Headend.sql file does not exist in Headend/install/ folder!";
	}
	$this->response->setOutput(json_encode($resp));
}
function restoreSystem()
{
	$resp = array();
	$this->load->model('common/dashboardchannels');
	if (isset($_FILES['file']['name'])){
		if(substr($_FILES['file']['name'],strpos($_FILES['file']['name'],".")) == ".zip")
		{
		 	$file_dir_path = DIR_DOWNLOAD."database_backup";
			if (!file_exists($file_dir_path)) {
			    mkdir($file_dir_path, 0777, true);
			}
			
			$file_path =$file_dir_path ."/database_backup";
			if (file_exists($file_path)) {
	            exec("rm -R ".$file_dir_path."/*");
	        }
	        $upload_resp = move_uploaded_file($_FILES['file']['tmp_name'], $file_path);
	        if($upload_resp){
	        	exec("unzip -P passwd ".$file_path." -d ".$file_dir_path);
			  	if (file_exists($file_dir_path."/dumpHeadendController.sql") && file_exists($file_dir_path."/dumpHeadendUI.sql"))
				{
					$url_restore = "http://".RMX_IP."/restoreBackup";      
				 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
				 	$restapi_object = new restapi();
				 	$json_sys_restore =$restapi_object->callAPI("POST",$hdr,$url_restore,$data_sb=array());
				 	$sys_restore = json_decode($json_sys_restore,true);
				    if($sys_restore == false || $sys_restore['error'] == true){
						$this->response->setOutput($json_sys_restore);
					}else{
						$db_created = $this->model_common_dashboardchannels->dumpDatabase();
						exec("mysql -u".DB_USERNAME." -p".DB_PASSWORD." ".DB_DATABASE." < ".$file_dir_path."/dumpHeadendUI.sql");
						exec("mysql -u".$sys_restore["db_user"]." -p".$sys_restore["db_pass"]." ".$sys_restore["db_name"]." < ".$file_dir_path."/dumpHeadendController.sql");
						$resp["message"] = 'File successfully uploaded!';
						$resp["error"] = false;
					}
				}else{
					$resp["message"] = 'Invalid backup file!';
					$resp["error"] = true;
				}
			    	


	   
			}else{
				$resp["message"] = 'Failed to uploaded :' . $_FILES['file']['name'];
				$resp["error"] = true;
			}
		}else{
			$resp["message"] = $_FILES['file']['name'] .' file invalid type! Required .zip file';
			$resp["error"] = true;
		}
	}
	else{
		$resp["message"] = "Please select file to upload Or Invalid backup file ";
		$resp["error"] = true;
	}
	$this->response->setOutput(json_encode($resp));
}
function addBAT()
{
	$this->load->model('common/dashboardchannels');
	$bat_name = $this->request->get['bat_name'];
	$bat_id = $this->request->get['bat_id'];
	$service_list = $this->request->get['service_list'];
	$service_ids= array();
	$service_inputs= array();
	$service_output= array();
	$service_rmx= array();
	$message = array();
	$count=0;
	$data_bat = array();
	foreach ($service_list as $service) {
		$service_detail = explode("_", $service); 
	 	 array_push($service_ids, $service_detail[0]);
	 	 array_push($service_rmx, $service_detail[1]);
	 	 array_push($service_inputs, $service_detail[2]);
	 	 array_push($service_output, $service_detail[3]);
	} 
	for ($i = 0; $i<count($service_list);$i+=70) {
		$end_offset = (($i+70) < count($service_list))? 70 : count($service_list)-$i;
		$service_array = array_slice( $service_list,$i,$end_offset);
		$url_isert_bat= "http://".RMX_IP."/setBATtable";      
		$hdr = array('Content-Type: application/x-www-form-urlencoded');
		$data_bat="&bouquet_id=".$bat_id."&bouquet_name=".$bat_name."&service_list=".json_encode(array('service_ids' => $service_array))."&count=".$count;
		
		$restapi_object = new restapi();
		$set_bat_resp =$restapi_object->callAPI("POST",$hdr,$url_isert_bat,$data_bat);
		$set_bat_decoded = json_decode($set_bat_resp,true);	
		if($set_bat_resp == false || $set_bat_decoded['error'] == true)
		 {

		 	$message = $set_bat_resp;
		 	break;
		 }
		else
		{
			$message = $set_bat_resp;
		}
		$count++;
	} 
	if($message != false || $message['error'] == false)
		$this->model_common_dashboardchannels->addBouquet($bat_id,$bat_name,$service_ids,$service_rmx,$service_inputs,$service_output);
	$this->response->setOutput($message);
}
function insertBAT()
{
	$url_isert_bat= "http://".RMX_IP."/insertBAT";      
	$hdr = array('Content-Type: application/x-www-form-urlencoded');
	$restapi_object = new restapi();
	$set_bat_resp =$restapi_object->callAPI("GET",$hdr,$url_isert_bat,array());
	$set_bat_decoded = json_decode($set_bat_resp,true);	
	$this->response->setOutput($set_bat_resp);
}
function getBouquetDetails()
{
    $bouquet_id = $this->request->get['bouquet_id'];
    $this->load->model('common/dashboardchannels');
    $bouquet_info=$this->model_common_dashboardchannels->getBouquetDetails($bouquet_id);	
    $this->response->setOutput(json_encode($bouquet_info));
}

function deleteBouquet()
{
 	$bouquet_id = $this->request->get['bouquet_id'];
    $this->load->model('common/dashboardchannels');
   	$url_del_bat= "http://".RMX_IP."/deleteBouquet";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_bat="&bouquet_id=".$bouquet_id;
 	$restapi_object = new restapi();
 	$set_bat_resp =$restapi_object->callAPI("POST",$hdr,$url_del_bat,$data_bat);
 	$set_bat_decoded = json_decode($set_bat_resp,true);	
 	if($set_bat_resp == false || $set_bat_decoded['error'] == true)
	{
		$this->response->setOutput($set_bat_resp);
	}
	else
	{
		$this->model_common_dashboardchannels->deleteBouquet($bouquet_id);	
		$this->response->setOutput($set_bat_resp);
	}
}
function addGenre()
{
	$this->load->model('common/dashboardchannels');
	$bouquetId_list = $this->request->get['bouquetId_list'];
	$Main_BAT_Id = $this->request->get['Main_BAT_Id'];
	$BAT_Name = $this->request->get['BAT_Name'];
	
	$url_isert_mainGenre= "http://".RMX_IP."/insertMainBouquet";      
 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
 	$data_mainGenre="&bouquet_id=".$Main_BAT_Id."&bouquet_name=".$BAT_Name."&bouquet_list=".json_encode(array('bouquet_ids' => $bouquetId_list));
 	$restapi_object = new restapi();
 	$set_mainGenre_resp =$restapi_object->callAPI("POST",$hdr,$url_isert_mainGenre,$data_mainGenre);
 	$set_mainGenre_decoded = json_decode($set_mainGenre_resp,true);	
 	if($set_mainGenre_resp == false || $set_mainGenre_decoded['error'] == true)
	 {
		$this->response->setOutput($set_mainGenre_resp);
	 }
	else
	{
        $this->model_common_dashboardchannels->add_sub_BouquetList($Main_BAT_Id,$bouquetId_list,$BAT_Name);	
	
       
    }
	$this->response->setOutput($set_mainGenre_resp);
}
function getGenreDetails()
{
	$bouquet_id = $this->request->get['bouquet_id'];
    $this->load->model('common/dashboardchannels');
    $genre_info=$this->model_common_dashboardchannels->getGenreDetails($bouquet_id);	
    $this->response->setOutput(json_encode($genre_info));
}
function getBATList()
{
	$this->load->model('common/dashboardchannels');
	$data= $this->model_common_dashboardchannels->get_BAT_Data();
	$this->response->setOutput(json_encode($data));
}
function getTunerType()
{
  $tunerId = $this->request->get['tuner_id'];
  $mxl_id = $this->request->get['mxl_id'];
  $this->load->model('common/dashboardchannels');
  $data= $this->model_common_dashboardchannels->getTunerType($tunerId,$mxl_id);
  $this->response->setOutput($data);	
}
function getTSchannels()
{
  $ts_id = $this->request->get['ts_id'];

  $rmx_no = floor($ts_id/8)+1;
  $targetid =  floor($ts_id%8);
  $this->load->model('common/dashboardchannels');
  $data= $this->model_common_dashboardchannels->getTSActivatedChannels($rmx_no,$targetid);
  $this->response->setOutput(json_encode($data));
}
function getFpgaVersion()
{
  $hdr = array('Content-Type: application/x-www-form-urlencoded');
  $restapi_object = new restapi();
  $allFPGAVersion=array();

  $url_version_1to3= "http://".RMX_IP."/getFPGA1To3Version";
  $data1to3=array();
  $version_1to3_resp =$restapi_object->callAPI("POST",$hdr,$url_version_1to3,$data1to3);
  $version_1to3_decoded = json_decode($version_1to3_resp,true);	
  if($version_1to3_resp == false || $version_1to3_decoded['error'] == true)
	 {
		$this->response->setOutput($version_1to3_resp);
	 }
	 else
	 {
	  $allFPGAVersion['Version1to3']=$version_1to3_decoded;	
	 }

  $url_version_5to7= "http://".RMX_IP."/getFPGA5To7Version";
  $data5to7=array();
  $version_5to7_resp =$restapi_object->callAPI("POST",$hdr,$url_version_5to7,$data5to7);
  $version_5to7_decoded = json_decode($version_5to7_resp,true);	
  if($version_5to7_resp == false || $version_5to7_decoded['error'] == true)
	 {
		$this->response->setOutput($version_5to7_resp);
	 }
	 else
	 {
	  $allFPGAVersion['Version5to7']=$version_5to7_decoded;	
	 }

  $url_version_8to13= "http://".RMX_IP."/getFPGA8To13Version";
  $data8to13=array();
  $version_8to13_resp =$restapi_object->callAPI("POST",$hdr,$url_version_8to13,$data8to13);
  $version_8to13_decoded = json_decode($version_8to13_resp,true);	
  if($version_8to13_resp == false || $version_8to13_decoded['error'] == true)
	 {
		$this->response->setOutput($version_8to13_resp);
	 }
 else
	 {
	  $allFPGAVersion['Version8to13']=$version_8to13_decoded;	
	 }

  $url_version_fpga4= "http://".RMX_IP."/getFPGA4Version";
  $datafpga4=array();
  $version_fpga4_resp =$restapi_object->callAPI("POST",$hdr,$url_version_fpga4,$datafpga4);
  $version_fpga4_decoded = json_decode($version_fpga4_resp,true);	
  if($version_fpga4_resp == false || $version_fpga4_decoded['error'] == true)
	 {
		$this->response->setOutput($version_fpga4_resp);
	 }
 else
	 {
	  $allFPGAVersion['Version4']=$version_fpga4_decoded;	
	 }
	for($rmx_no=1;$rmx_no<=6;$rmx_no++)
	{
	  $url_firmware_version= "http://".RMX_IP."/getFirmwareVersion/".$rmx_no;
	  $dataFirmware=array();
	  $firmware_version_resp =$restapi_object->callAPI("GET",$hdr,$url_firmware_version,$dataFirmware);
	  $firmware_version_decoded = json_decode($firmware_version_resp,true);	
	  if($firmware_version_resp == false || $firmware_version_decoded['error'] == true)
		 {
			$this->response->setOutput($firmware_version_resp);
		 }
	 else
		 {
		  $allFPGAVersion['FirmwareVersion'.$rmx_no]=$firmware_version_decoded;	
		 } 

	}
  	 $this->response->setOutput(json_encode($allFPGAVersion));
}

}