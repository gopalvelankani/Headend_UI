<?php
/**
* 
*/
class restapi 
{
	
	function callAPI($method,$headers,$url,$data=false){

		$ch=curl_init();
		curl_setopt($ch,CURLOPT_URL,$url);
		switch($method){
			case "POST":
				curl_setopt($ch,CURLOPT_POST,1);
				curl_setopt($ch,CURLOPT_POSTFIELDS,$data);
				break;
				case "DELETE":
					curl_setopt($ch,CURLOPT_CUSTOMREQUEST,'DELETE');
				curl_setopt($ch,CURLOPT_POSTFIELDS,$data);
					break;
					default:
					break;
		}
		curl_setopt($ch,CURLOPT_HTTPHEADER,$headers);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
		$server_output=curl_exec($ch);
		curl_close($ch);
		return $server_output;
	}
}