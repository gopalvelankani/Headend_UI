<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
<?php foreach ($styles as $style) { ?>
<link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
 <link rel="stylesheet" type="text/css" href="view/javascript/bootstrap/css/bootstrap1.min.css">
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="view/javascript/common.js" type="text/javascript"></script>
<script src="view/javascript/headend.js" type="text/javascript"></script>
<script src="view/javascript/date.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

 <style type="text/css">
   .blank_row{ height: 1vh !important; background-color: #FFFFFF; }
  .glyphicon {cursor: pointer;}
  [data-draggable="item"][aria-grabbed="true"]
  {
    /*background-color:orange;*/
    /*color:orange;*/
    box-shadow:0 0 0 1px orange;
  }
  .afterclick{background-color: orange }
  .hover1{background-color: lightblue }
  .hover2{background-color: lightgreen} 
  .blank_row{ background-color: #f2f2f2; }
  .panel{ cursor: pointer; background-color:black; width:100%;}
  .panel1{ cursor: pointer;
     background-color:#f2f2f2; min-height: 4vh; border: 1px solid Gainsboro; white-space:nowrap; table-layout:fixed; width:100%;    
   }   
  .panel2{ cursor: pointer; 
  background-color:#f2f2f2; width: 100%; min-height: 4vh; border: 1px solid Gainsboro; white-space:nowrap; table-layout:fixed;}
  .col-md-4{ height: 85vh; overflow: scroll; }
  .container-fluid{ background-color:Gainsboro;} 
  .panel-body{ background-color: white; } 
  .search-query{ float: right; }
  .channels{ color:black; } 
  .modal-content{ background-color: #f2f2f2; }
  #content-areas{ background-color: silver; }   
  .Rmx_ip{ color: white; } 
  .panelSetting{color:white;} 
  .collapse-panel{width: 100%; min-height: 3vh;}
  .freq-table{ width: 100%; min-height: 3vh; margin: 0 auto;}
  .Ip-panel{ margin-top: 5%;background-color: white; width: 100%;}
  .ip-panel{ margin-top: 1%; margin-bottom: 1%;background-color: white;}
  .img-active{ width:70%;}
  .ch-name{ white-space:nowrap; text-overflow:ellipsis; overflow:hidden;}
  .ch-number{ margin-left:10%;}
  .panel-ecmg{width: 100%;}
</style>
<script type="text/javascript">
 $('#pass, #pass_repeat').keyup(function() {
      var empty = false;
      $('#pass, #pass_repeat').each(function() 
      {
        if ($(this).val() == '') 
         {
           empty = true;
          }
      });
      if (empty) 
        {
         $('#save_admin').attr('disabled', 'disabled'); 
        } else { 
      if(check_repeat_pass() )
        {
         $('#save_admin').removeAttr('disabled'); 
        }
      else
        {
         $('#save_admin').attr('disabled', 'disabled');
        }
      }
  });
function check_repeat_pass()
{
   org_password = $("#pass").val();
   repeat_password = $("#pass_repeat").val();
   $("#error_repeat_pass").hide();
   if(repeat_password!=org_password)
   {
     $("#error_repeat_pass").html("It should match with above ");
     $("#error_repeat_pass").show();
    return false;
   }
   else{
    return true;
   }
}
</script>
</head>
<body>
<div id="container">
<header class="page-header" style="color:white;margin-top: 0%">
      <div>
    <a href="<?php echo $home; ?>" class="navbar-brand"><img src="view/image/vepl_logo3.png" style="margin-top: -9%" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" /></a></div>
    <?php if ($logged) { ?>
   <a  id="mapping" href="<?php echo $home;?>" style="color: white;margin-left:25%;">MAPPING</a>
    <a  id="selection" href="<?php echo $selection;?>" style="color: white;margin-left: 2%;">SELECTION</a>
    <a class="nav-link" id="output" href="<?php echo $output;?>" style="color: white;margin-left: 2%;">OUTPUTS</a>

     <a class="glyphicon glyphicon-user" data-toggle="modal" data-target="#admin" style="color: white; margin-left: 20%;" >
      Admin </a> 
      
      <a href="<?php echo $logout; ?>" class="glyphicon glyphicon-off" style="color: white;margin-left: 2%;">
       Logout </a> 
      
      <div id="clockbox" style="margin-left:75%; margin-top:1%"></div>
      <div class="modal fade" id="admin" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 80%;align-self: center;">
          <div class="modal-content" style="background-color: #f2f2f2">
            <div lass="modal-body">
              <table class="genral" style="width:70%; min-height: 25%; color: black; margin-left: 20px;">
                <col style="width: 30%">
                <col style="width: 40%">
                <tr>
                  <td><h3>Edit Admin</h3></td>
                </tr>
                <tr>
                  <th>User Name:</th>
                  <th>Group</th>
                </tr>
                <tr>
                  <td>Admin</td>
                  <td>Admin</td>
                </tr>
                <tr>
                  <td>Password</td>
                </tr>
                <tr>
                  <td><input type="password" class="form-control-default" id="pass" style="margin-top:4px;" ></td>
                </tr>
                <tr>
                  <td>Repeat Password</td>
                </tr>
                <tr>
                  <td><input type="password" class="form-control-default" id="pass_repeat" style="margin-top:4px;"><span id="error_repeat_pass" style="color: red;"></span></td>
                  
                </tr>
              </table>
              <div  class="modal-footer" style="margin-top: 20px;">
                <button type="button" class="btn btn-default" onclick="admin()" id="save_admin" disabled="disabled">APPLY & SAVE</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
      </div>  
      <?php } ?>    


</header>