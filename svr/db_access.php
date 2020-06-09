<?php
require_once 'db.php';

//http://localhost:81/POS_App/svr/access.php?action=logout
function logout() 
{
    clear_session();
    succ_return(OK_LOGOUT);
}
  
//http://localhost:81/POS_App/svr/access.php?action=login&login=Gihan%20Darshana&pass=123456789kamal
function login() 
{
    clear_session();
    $args = func_get_args();
    debug(__FILE__, __FUNCTION__, __LINE__, sizeof($args));
    $args = (sizeof($args) == 1) ? $args[0] : $args;
    debug(__FILE__, __FUNCTION__, __LINE__, $args);
    if (!((isset($args[FIELD_LOGIN]) && isset($args[FIELD_PASS])))) {
      $error = ERR_PARA_NOT_DEFINED . " (" . FIELD_LOGIN . ", " . FIELD_PASS . ")";
      warn(__FILE__, __FUNCTION__, __LINE__, $error, $args);
      exit(fail_return($error, false, true, false));
    }
    $user = $args[FIELD_LOGIN];
    $pass = $args[FIELD_PASS];
    user_login($user, $pass);
}
  

?>