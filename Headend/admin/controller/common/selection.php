<?php
class ControllerCommonSelection extends Controller {
	public function index() {
		$this->load->language('common/selection');

           // exit(0);
		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');
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
		
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['order'] = $this->load->controller('dashboard/order');
		$data['sale'] = $this->load->controller('dashboard/sale');
		$data['customer'] = $this->load->controller('dashboard/customer');
		$data['online'] = $this->load->controller('dashboard/online');
		$data['map'] = $this->load->controller('dashboard/map');
		$data['chart'] = $this->load->controller('dashboard/chart');
		$data['activity'] = $this->load->controller('dashboard/activity');
		$data['recent'] = $this->load->controller('dashboard/recent');
		$data['footer'] = $this->load->controller('common/footer');
		if ($this->config->get('config_currency_auto')) 
		{
			$this->load->model('localisation/currency');
			$this->model_localisation_currency->refresh();
		}
		$this->response->setOutput($this->load->view('common/selection.tpl', $data));
	}
}