<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$data['base'] = HTTPS_SERVER;
		} else {
			$data['base'] = HTTP_SERVER;
		}

		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$this->load->language('common/header');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
		$data['text_logout'] = $this->language->get('text_logout');

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
			$data['PSI'] = $this->url->link('common/PSI', 'token=' . $this->session->data['token'], 'SSL');
          
		}

		return $this->load->view('common/header.tpl', $data);
	}
}
