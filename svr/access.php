<?php
header("Access-Control-Allow-Origin: *");
require_once 'session.php';
require_once 'db_access.php';

switch ($action) {
  case ACTION_LOGIN:
    login($_REQUEST);
    break;
  case ACTION_LOGOUT:
    logout();
    break;
  default:
    warn(__FILE__, __FUNCTION__, __LINE__, ERR_UNKNOWN_ACTION, $_REQUEST);
    return fail_return(ERR_UNKNOWN_ACTION);
}



?>
