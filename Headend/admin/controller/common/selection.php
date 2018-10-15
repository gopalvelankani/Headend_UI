<?php
class ControllerCommonSelection extends Controller {
	public function index() {
		$this->load->language('common/selection');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		/*$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');*/
		$this->load->model('common/dashboardchannels');
		$data['status']= $this->model_common_dashboardchannels->getStatus(); //to get the ECMG channel data from local database
		/************************************************************************************
                   TUNER DETAILS
        *************************************************************************************/
        $Tunerdetails= $this->model_common_dashboardchannels->getTunerDetails(); 
		$data['Tuner_details']=array();
		$data['Tuner_details'] = $Tunerdetails;
		/************************************************************************************
                   IP IN
        *************************************************************************************/
        $getIpInput= $this->model_common_dashboardchannels->getIpInputData(); 
		$data['IpInput']=array();
		$m=0;
		foreach ($getIpInput as $Ipindata) 
		{
		    $data['IpInput'][$m]=array('port'=>$Ipindata['port'],'rmx_no'=>$Ipindata['rmx_no'],'ip'=>$Ipindata['ip'],'channel'=>$Ipindata['channel'],'type'=>$Ipindata['type'],'id'=>$Ipindata['id']);
			$m++;
		}
		/***********************CAS************************************/
		 $ecmg_channel_data= $this->model_common_dashboardchannels->getECMGChannel(); 
		$data['ecmg_channel']=array();
		$m=0;
		foreach ($ecmg_channel_data as $ecmgdata) 
		{
		    $data['ecmg_channel'][$m]=array('ecmg_channel_id'=>$ecmgdata['ecmg_channel_id'],'Alias'=>$ecmgdata['Alias'],'Ip_Address'=>$ecmgdata['Ip_Address'],'Port'=>$ecmgdata['Port'],'Super_CAS_Id'=>$ecmgdata['Super_CAS_Id'],'Cryptoperiod'=>$ecmgdata['Cryptoperiod']);
			$m++;
		}
		$emmg_channel_data= $this->model_common_dashboardchannels->getEMMGChannel(); 
		$data['emmg_channel']=array();
		$n=0;
		foreach ($emmg_channel_data as $emmgdata) 
		{
		    $data['emmg_channel'][$n]=array('channel_id'=>$emmgdata['channel_id'],'alias'=>$emmgdata['alias'],'client_id'=>$emmgdata['client_id'],'data_id'=>$emmgdata['data_id'],'bandwidth'=>$emmgdata['bandwidth'],'port'=>$emmgdata['port'],'stream_id'=>$emmgdata['stream_id'],'emm_pid'=>$emmgdata['emm_pid']);
			$n++;
		}
		
		/************************CAS************************************/
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('common/selection.tpl', $data));
	}
}