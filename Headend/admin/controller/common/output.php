<?php
class ControllerCommonOutput extends Controller {
	public function index() {
		$this->load->language('common/output');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		
		$this->load->model('common/dashboardchannels');
		$data['status']= $this->model_common_dashboardchannels->getStatus(); 

		//**********************MXL OUT*************************//
		$data['mxldata']=array();
		$i=0;
		$mxls= $this->model_common_dashboardchannels->getMxlData();

		foreach($mxls as $mxl){ 
			$url_set_demod = "http://".RMX_IP."/getDemodMxl";      
		 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
		 	$data_set_demod="mxl_id=".$mxl['mxl_id']."&rmx_no=".$mxl['rmx_id']."&demod_id=".$mxl['demodId'];
		 	$restapi_object = new restapi();
		 	$set_demod_resp =$restapi_object->callAPI("POST",$hdr,$url_set_demod,$data_set_demod);
		 	$set_demod_decoded = json_decode($set_demod_resp,true);
			
		    if($set_demod_resp == false || $set_demod_decoded['error'] == true){
		    	
				$this->response->setOutput(-1);
			}else{
				
				$data['mxldata'][$i]=array('tunerId'=>$mxl['tunerId'],'mxl_id'=>$mxl['mxl_id'],'rmx_id'=>$mxl['rmx_id'],'frequency'=>$mxl['frequency'],'rate'=>$mxl['rate'],'demodId'=>$mxl['demodId'],'signalstrength'=>$set_demod_decoded['snr'],'locked'=>$set_demod_decoded['locked']);
				$i++;
				
			}

		}
//**********************IP OUT*************************//
		$data['ipoutdata']=array();
		$i=0;
		$ips= $this->model_common_dashboardchannels->getIpStream();

		foreach($ips as $ip){ 
			
				$data['ipoutdata'][$i]=array('ip_address'=>$ip['Ip_Address'],'port'=>$ip['Port'],'payload_interface'=>$ip['payload_interface'],'signalstrength'=>0);
				$i++;

		}
//**********************IP IN*************************//
        $data['ipindata']=array();
		$i=0;
		$ipIn= $this->model_common_dashboardchannels->getIpInputData();

		foreach($ipIn as $IP){ 
			
				$data['ipindata'][$i]=array('ip_address'=>$IP['ip'],'port'=>$IP['port'],'channel'=>$IP['channel'],'rmx_no'=>$IP['rmx_no']);
				$i++;

		}
      

//**********************INPUT CHANNELS*************************//
		$input_channel_bitrate = array();
        $data_tunedTuner= $this->model_common_dashboardchannels->getTunedTuners();
       
	       $data['inputChannels_data']=array();
	       $j=0;
        foreach ($data_tunedTuner as $data_tuner ) 
	       {
	            $url_get_inputbitrate = "http://".RMX_IP."/getDataflowRates";      
			 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
			 	$data_get_inputbitrate="rmx_no=".$data_tuner['rmx_no']."&input=".$data_tuner['input']."&output=".$data_tuner['input'];
			 	$restapi_object = new restapi();
			 	$get_inputbitrate_resp =$restapi_object->callAPI("POST",$hdr,$url_get_inputbitrate,$data_get_inputbitrate);
			 	$get_inputbitrate_decoded = json_decode($get_inputbitrate_resp,true); 

			 	if($get_inputbitrate_resp == false || $get_inputbitrate_decoded['error'] == true){
			    	
					
				}	
				else
				{
				    $url_get_ProgList = "http://".RMX_IP."/getServiceList";      
				 	$hdr = array('Content-Type: application/x-www-form-urlencoded');
				 	$data_get_ProgList="rmx_no=".$data_tuner['rmx_no']."&input=".$data_tuner['input']."&output=".$data_tuner['input'];
				 	$restapi_object = new restapi();
				 	$get_ProgList_resp =$restapi_object->callAPI("POST",$hdr,$url_get_ProgList,$data_get_ProgList);
				 	$get_ProgList_decoded = json_decode($get_ProgList_resp,true);
					
				    if($get_ProgList_resp == false || $get_ProgList_decoded['error'] == true){
				    	
						
					}
					else if($get_ProgList_decoded['progNums'])
					{   
						$data_channel= $this->model_common_dashboardchannels->getInputChannels($data_tuner['rmx_no'],$data_tuner['input']);
						
		                $i=0;
						foreach($data_channel as $channel_data)
						{
                         $pos=  array_search($channel_data['channelnumber'], $get_ProgList_decoded['progNums']);
                         if(is_numeric($pos))
                         {
                         	
                         $bitrate=($get_inputbitrate_decoded['uInuputRate']/1000) *$get_ProgList_decoded['uband'][$pos];
                         }
                         else
                         {
                          $bitrate=0;	
                         }
                         $data['inputChannels_data'][$j]=array('channelnumber'=>$channel_data['channelnumber'],'channelname'=>$channel_data['channelname'],'input'=>$channel_data['input'],'rmx_no'=>$channel_data['rmx_no'],'bitrate'=>$bitrate);
                         $input_channel_bitrate[$channel_data['input'].'_'.$channel_data['rmx_no'].'_'.$channel_data['channelnumber']] = $bitrate;
                         
                         $i++;
                         $j++;
                         
						}
                      
					}	
				}
	       }

	       //**********************OUTPUT CHANNELS*************************//
		$data['datachannels']=array();
		$i=0;
		$channels= $this->model_common_dashboardchannels->getoutputChannelwithFrequency();

		foreach($channels as $channel)
		{ 
				
				$out_bitrate =  (isset($input_channel_bitrate[$channel['inputid'].'_'.$channel['rmx_no'].'_'.$channel['channelnumber']]))? $input_channel_bitrate[$channel['inputid'].'_'.$channel['rmx_no'].'_'.$channel['channelnumber']] : 0;
					
				$data['datachannels'][$i]=array('channelnumber'=>$channel['channelnumber'],'output_channelname'=>$channel['output_channelname'],'Qam_Freq'=>$channel['Qam_Freq'],'rmx_no'=>$channel['rmx_no'],'inputid'=>$channel['inputid'],'targetid'=>$channel['targetid'],'changed_ch_number'=>$channel['changed_ch_number'],'changed_ch_name'=>$channel['changed_ch_name'],'bitrate'=>$out_bitrate );
				$i++;
				
		}

		 
          
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		
		$data['footer'] = $this->load->controller('common/footer');
	

		if (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
			$data['logged'] = '';

			$data['home'] = $this->url->link('common/dashboard', '', 'SSL');
		} else {
			$data['logged'] = true;

			$data['home'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');
			$data['logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], 'SSL');
            $data['selection'] = $this->url->link('common/selection', 'token=' . $this->session->data['token'], 'SSL');
			$data['output'] = $this->url->link('common/output', 'token=' . $this->session->data['token'], 'SSL');
			$data['mxl'] = $this->url->link('common/mxl', 'token=' . $this->session->data['token'], 'SSL');
			$data['ipout'] = $this->url->link('common/ipout', 'token=' . $this->session->data['token'], 'SSL');
			$data['channelout'] = $this->url->link('common/channelout', 'token=' . $this->session->data['token'], 'SSL');
			
		}
		$this->response->setOutput($this->load->view('common/output.tpl', $data));
	}
}