<?php echo $header; ?>
<!DOCTYPE html>
<html >
<head>
	<title>IP OUTPUT</title>
	<meta charset="UTF-8" />
      
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
        <script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
         <link rel="stylesheet" type="text/css" href="view/javascript/bootstrap/css/bootstrap1.min.css">
        <link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
        <link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
        <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
        <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
        <script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
        <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
        <link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
        <link href="view/javascript/jquery.dataTables.min.css" type="text/css" rel="stylesheet"/>

        <script src="view/javascript/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="view/javascript/common.js" type="text/javascript"></script>

        <script src="view/javascript/headend.js" type="text/javascript"></script>
        <script src="view/javascript/date.js" type="text/javascript"></script>
         <link rel="stylesheet" type="text/css" href="view/javascript/bootstrap/css/bootstrap1.min.css">

         <style type="text/css">
         	#loading-img {
			    background: url("view/image/loading.gif") center center no-repeat;
			    display: none;
			    height: 176px;
			    width: 308px;
			    position: absolute;
			    top: 33%;
			    left: 1%;
			    right: 1%;
			    margin: auto;
			}
        	
        	.button{
        		padding: 10px 25px;
        	}

        	.stream{
        		font-size: 15px;
        		padding-left: 40px;
        		padding-right: 60px;
        	}
        	.ip{
        		width:150px;
        		
        	}
        	.port{
        		width:100px;
        		
        	}
        	.overlay {
			    background: #e9e9e9;  
			    display: none;        
			    position: absolute;  
			    top: 0;                  
			    right: 0;               
			    bottom: 0;
			    left: 0;
			    opacity: 0.5;
			}
        	.modalText{

        		background-color: #004466; 
        		color: white; 
        		min-height: 30px; 
        		text-align: center;
        		padding-top: 5px; 
        		min-width: 20px;
        	}
        	.td{
        		padding:0 0px 0 5px; padding-top: 10px;
        	}
        	.pad{
        		margin-top: 1.9px;
        	}
        	.modal.modal-wide .modal-dialog {
			  width: 90%;
			}
			.modal-wide .modal-body {
			  overflow-y: auto;
			}
			/* make sidebar nav vertical */ 
			    body,html{
					height: 100%;
				}

				/* remove outer padding */
				.main .row{
					padding: 0px;
					margin: 0px;
				}

				/*Remove rounded coners*/

				nav.sidebar.navbar {
					border-radius: 0px;
				}

				nav.sidebar, .main{
					-webkit-transition: margin 200ms ease-out;
				    -moz-transition: margin 200ms ease-out;
				    -o-transition: margin 200ms ease-out;
				    transition: margin 200ms ease-out;
				}

				/* Add gap to nav and right windows.*/
				.main{
					padding: 0px 10px 0 10px;
				}

				/* .....NavBar: Icon only with coloring/layout.....*/

				/*small/medium side display*/
				@media (min-width: 768px) {

					/*Allow main to be next to Nav*/
					.main{
						position: absolute;
						width: calc(100% - 40px); /*keeps 100% minus nav size*/
						margin-left: 40px;
						float: right;
					}

					/*lets nav bar to be showed on mouseover*/
					nav.sidebar:hover + .main{
						margin-left: 200px;
					}

					/*Center Brand*/
					nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
						margin-left: 0px;
					}
					/*Center Brand*/
					nav.sidebar .navbar-brand, nav.sidebar .navbar-header{
						text-align: center;
						width: 100%;
						margin-left: 0px;
					}

					/*Center Icons*/
					nav.sidebar a{
						padding-right: 13px;
					}

					/*adds border top to first nav box */
					nav.sidebar .navbar-nav > li:first-child{
						border-top: 1px #e5e5e5 solid;
					}

					/*adds border to bottom nav boxes*/
					nav.sidebar .navbar-nav > li{
						border-bottom: 1px #e5e5e5 solid;
					}

					/* Colors/style dropdown box*/
					nav.sidebar .navbar-nav .open .dropdown-menu {
						position: static;
						float: none;
						width: auto;
						margin-top: 0;
						background-color: transparent;
						border: 0;
						-webkit-box-shadow: none;
						box-shadow: none;
					}

					/*allows nav box to use 100% width*/
					nav.sidebar .navbar-collapse, nav.sidebar .container-fluid{
						padding: 0 0px 0 0px;
					}

					/*colors dropdown box text */
					.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
						color: #777;
					}

					/*gives sidebar width/height*/
					nav.sidebar{
						width: 200px;
						height: 100%;
						margin-left: -160px;
						float: left;
						z-index: 8000;
						margin-bottom: 0px;
					}

					/*give sidebar 100% width;*/
					nav.sidebar li {
						width: 100%;
					}

					/* Move nav to full on mouse over*/
					nav.sidebar:hover{
						margin-left: 0px;
					}
					/*for hiden things when navbar hidden*/
					.forAnimate{
						opacity: 0;
					}
				}

				/* .....NavBar: Fully showing nav bar..... */

				@media (min-width: 1330px) {

					/*Allow main to be next to Nav*/
					.main{
						width: calc(100% - 200px); /*keeps 100% minus nav size*/
						margin-left: 200px;
					}

					/*Show all nav*/
					nav.sidebar{
						margin-left: 0px;
						float: left;
					}
					/*Show hidden items on nav*/
					nav.sidebar .forAnimate{
						opacity: 1;
					}
				}

				nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus {
					color: #CCC;
					background-color: transparent;
				}

				nav:hover .forAnimate{
					opacity: 1;
				}
				section{
					padding-left: 15px;
					padding-top: 0px;
				}
        
        	
        </style>  
        
</head>

<body>	
	<nav class="navbar navbar-inverse sidebar" role="navigation">
	    <div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand">SELECT</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">

				<ul class="nav navbar-nav">

					<li ><a href="<?php echo $mxl;?>">MXL<span style="font-size:16px;" class="pull-right hidden-xs showopacity "></span></a></li>

					<li class="active"><a href="<?php echo $ipout;?>">IP<span style="font-size:16px;" class="pull-right hidden-xs showopacity "></span></a></li>

					<li ><a href="<?php echo $channelout;?>">CHANNELS<span style="font-size:16px;" class="pull-right hidden-xs showopacity "></span></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<div class="main">
	<!-- Content Here -->
		<div id="box">
			 
		</div>
	</div>
	<script type="text/javascript">

	    function htmlbodyHeightUpdate(){
		var height3 = $( window ).height()
		var height1 = $('.nav').height()+50
		height2 = $('.main').height()
		if(height2 > height3){
			$('html').height(Math.max(height1,height3,height2)+10);
			$('body').height(Math.max(height1,height3,height2)+10);
		}
		else
		{
			$('html').height(Math.max(height1,height3,height2));
			$('body').height(Math.max(height1,height3,height2));
		}
		
	}
	$(document).ready(function () {
		htmlbodyHeightUpdate()
		$( window ).resize(function() {
			htmlbodyHeightUpdate()
		});
		$( window ).scroll(function() {
			height2 = $('.main').height()
  			htmlbodyHeightUpdate()
		});
	});

	var ips = <?php echo json_encode($ipdata); ?>;

	var bitrates=[];
	var count=0;
	var parse=false;
	// 'ip_address'=>$ip['ip_address'],'port'=>$ip['port'],'payload_interface'=>$ip['payload_interface']);
	ips.forEach(function(ip) {
		console.log(ip['ip_address'],ip['port'],ip['payload_interface'])

	});

	 var html = "<table border='1|1' class='table' id='myTable' >";	

	 html+="<thead>";
	 html+="<th>IP ADDRESS</th>";
	 html+="<th>PORT</th>";
	 html+="<th>PAYLOAD INTERFACE</th>";
	 html+="<th>STATUS</th>";
	 html+="<th>RATE</th>";
	 html+="</thead>";
	 html+="<tbody>";

	 
    ips.forEach(function(ip) {
        html+="<tr class='active'>";
        html+="<td>"+ip['ip_address']+"</td>";
        html+="<td>"+ip['port']+"</td>";
        html+="<td>"+ip['payload_interface']+"</td>";
        
        if(ip['signalstrength']==0){
	        html+="<td><button type='button' class='channel btn btn-danger' data-toggle='modal' data-target='#tunerModal'></button></td>";
	        html+="<td>0.00</td>";
        }else{
        	html+="<td><button type='button' class='channel btn btn-success' data-toggle='modal' data-target='#tunerModal'></button></td>";
        	html+="<td>"+ip['signalstrength']+".00</td>";
        }
        
        html+="</tr>";

    });
    html+="</tbody>";
    html+="</table>";
	document.getElementById("box").innerHTML = html;
	$('#myTable').dataTable();
	</script>
</body>

</html>