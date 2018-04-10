<?php
class ControllerCommonMxl extends Controller {
	public function index() {
		$this->load->language('common/mxl');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');
		$this->load->model('common/dashboardchannels');
		$data['status']= $this->model_common_dashboardchannels->getMxlData();



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
				// $this->response->setOutput($set_demod_resp);
				$data['mxldata'][$i]=array('tunerId'=>$mxl['tunerId'],'mxl_id'=>$mxl['mxl_id'],'rmx_id'=>$mxl['rmx_id'],'frequency'=>$mxl['frequency'],'rate'=>$mxl['rate'],'demodId'=>$mxl['demodId'],'signalstrength'=>$set_demod_decoded['snr']);
				$i++;
				
			}

		}

		// $data['RMX_ip'] = RMX_IP;
		// $this->addECMStream();
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
			// Orders
			$this->load->model('sale/order');

			// Processing Orders
			$data['processing_status_total'] = $this->model_sale_order->getTotalOrders(array('filter_order_status' => implode(',', $this->config->get('config_processing_status'))));
			
			$data['processing_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&filter_order_status=' . implode(',', $this->config->get('config_processing_status')), 'SSL');

			// Complete Orders
			$data['complete_status_total'] = $this->model_sale_order->getTotalOrders(array('filter_order_status' => implode(',', $this->config->get('config_complete_status'))));
			$data['complete_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&filter_order_status=' . implode(',', $this->config->get('config_complete_status')), 'SSL');

			// Returns
			$this->load->model('sale/return');

			$return_total = $this->model_sale_return->getTotalReturns(array('filter_return_status_id' => $this->config->get('config_return_status_id')));

			$data['return_total'] = $return_total;

			$data['return'] = $this->url->link('sale/return', 'token=' . $this->session->data['token'], 'SSL');

			// Customers
			$this->load->model('report/customer');

			$data['online_total'] = $this->model_report_customer->getTotalCustomersOnline();

			$data['online'] = $this->url->link('report/customer_online', 'token=' . $this->session->data['token'], 'SSL');

			$this->load->model('customer/customer');

			$customer_total = $this->model_customer_customer->getTotalCustomers(array('filter_approved' => false));

			$data['customer_total'] = $customer_total;
			$data['customer_approval'] = $this->url->link('customer/customer', 'token=' . $this->session->data['token'] . '&filter_approved=0', 'SSL');

			// Products
			$this->load->model('catalog/product');

			$product_total = $this->model_catalog_product->getTotalProducts(array('filter_quantity' => 0));

			$data['product_total'] = $product_total;

			$data['product'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&filter_quantity=0', 'SSL');

			// Reviews
			$this->load->model('catalog/review');

			$review_total = $this->model_catalog_review->getTotalReviews(array('filter_status' => false));

			$data['review_total'] = $review_total;

			$data['review'] = $this->url->link('catalog/review', 'token=' . $this->session->data['token'] . '&filter_status=0', 'SSL');

			// Affliate
			$this->load->model('marketing/affiliate');

			$affiliate_total = $this->model_marketing_affiliate->getTotalAffiliates(array('filter_approved' => false));

			$data['affiliate_total'] = $affiliate_total;
			$data['affiliate_approval'] = $this->url->link('marketing/affiliate', 'token=' . $this->session->data['token'] . '&filter_approved=1', 'SSL');

			$data['alerts'] = $customer_total + $product_total + $review_total + $return_total + $affiliate_total;

			// Online Stores
			$data['stores'] = array();

			$data['stores'][] = array(
				'name' => $this->config->get('config_name'),
				'href' => HTTP_CATALOG
			);

			$this->load->model('setting/store');

			$results = $this->model_setting_store->getStores();

			foreach ($results as $result) {
				$data['stores'][] = array(
					'name' => $result['name'],
					'href' => $result['url']
				);
			}
		}
		$this->response->setOutput($this->load->view('common/mxl.tpl', $data));
	}
}