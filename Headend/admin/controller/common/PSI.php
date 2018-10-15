<?php
class ControllerCommonPSI extends Controller {
	public function index() {

		$this->load->language('common/PSI');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');
		$this->load->model('common/dashboardchannels');
		/*$data=$this->model_common_dashboardchannels->getPrivateDataDetails(1);
        var_dump($data);exit(0);*/
		
		/************************CAS************************************/
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		/*$data['order'] = $this->load->controller('dashboard/order');
		$data['sale'] = $this->load->controller('dashboard/sale');
		$data['customer'] = $this->load->controller('dashboard/customer');
		$data['online'] = $this->load->controller('dashboard/online');
		$data['map'] = $this->load->controller('dashboard/map');
		$data['chart'] = $this->load->controller('dashboard/chart');
		$data['activity'] = $this->load->controller('dashboard/activity');
		$data['recent'] = $this->load->controller('dashboard/recent');*/
		$data['footer'] = $this->load->controller('common/footer');



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
		    $data['QamFreq_detail'][$s]=array('freq_ID'=>$QamFreq_info_data['freq_ID'],'freq_name'=>$QamFreq_info_data['freq_name'],'qam_id'=>$QamFreq_info_data['qam_id'],'frequency'=>$QamFreq_info_data['frequency'],'ts_id'=>$QamFreq_info_data['ts_id']);
			$s++;
		}

        $data['BAT_detail']= $this->model_common_dashboardchannels->get_BAT_Data();
        

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
        $PrivateData= $this->model_common_dashboardchannels->getPrivatedata();
        $data['Private_data'] = $PrivateData;
 

		/*if ($this->config->get('config_currency_auto')) 
		{
			$this->load->model('localisation/currency');
			$this->model_localisation_currency->refresh();
		}*/
		$this->response->setOutput($this->load->view('common/PSI.tpl', $data));
	}
 public function setServiceId()
{
	$original_chNumber = $this->request->get['channelnumber'];
	$new_channelnumber = $this->request->get['changed_ch_no'];
	$input = $this->request->get['inputid'];
	$output = $this->request->get['targetid'];
	$rmx_no = $this->request->get['rmx_no'];
	$addFlag = $this->request->get['addFlag'];
	if($new_channelnumber== -1)
	{
     $new_service_id=0;
	}
	else
	{
	  $new_service_id=$new_channelnumber;	
	}
	$resp=array();
    
    $Enable_serviceNumber=$addFlag;
    

        $hdr = array('Content-Type: application/x-www-form-urlencoded');
        $restapi_object = new restapi();
        
        $url_channel = "http://".RMX_IP."/setServiceID";
        $data="original_service_id=".$original_chNumber ."&new_service_id=".$new_service_id."&input=".$input."&output=".$output."&rmx_no=".$rmx_no."&addFlag=".$addFlag;
		
		$channleActivation_resp = $restapi_object->callAPI("POST",$hdr,$url_channel,$data);
		$channelActivation_decoded = json_decode($channleActivation_resp,true);
		  
		if($channleActivation_resp == false || $channelActivation_decoded['error'] == true)
		{	
			$resp["error"]=true;
			$resp["message"] = $channleActivation_resp;
		}
		else
		{
		   $resp["error"]=false;
		  $this->load->model('common/dashboardchannels');
		  $this->model_common_dashboardchannels->changeOutputPid($original_chNumber,$new_channelnumber,$Enable_serviceNumber,$input,$output,$rmx_no); 
		  $resp["message"] = $channleActivation_resp;
			
		} 
		$this->response->setOutput(json_encode($resp));	
}
public function getActivatedChannels()
 {
	$this->load->model('common/dashboardchannels');
		$output_channel_data = $this->model_common_dashboardchannels->getOutputActivatedChannels();
	$outputchannels_after_delete=array();
	$j=0;
	foreach ($output_channel_data as $outputdata) 
	{
		    $outputchannels_after_delete[$j]=array('channelname'=>$outputdata['output_channelname'],'channelnumber'=>$outputdata['channelnumber'],'rmx_no'=>$outputdata['rmx_no'],'targetid'=>$outputdata['targetid'],'inputid'=>$outputdata['inputid'],'changed_ch_number'=>$outputdata['changed_ch_number'],'changed_ch_name'=>$outputdata['changed_ch_name'],'Lcn'=>$outputdata['Lcn']);
			$j++;
	}
	$output_channel_json_arr=json_encode($outputchannels_after_delete);
	$this->response->setOutput($output_channel_json_arr);
 }
}