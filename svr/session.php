<?php
if (session_id() == '') {
    session_start();
}
$session_id = session_id();
require_once 'util.php';

$postdata = file_get_contents("php://input");



$_REQUEST = get_request($_REQUEST, $postdata);

// This $action is used on calling module like line.php
$action = (isset($_REQUEST['action'])) ? $_REQUEST['action'] : (isset($_SESSION['action']) ? $_SESSION['action'] : ACTION_READ);

// Clear password before print logs
$request = reset_pass($_REQUEST);

info(__FILE__, __FUNCTION__, __LINE__, basename($_SERVER['SCRIPT_NAME']), $request, $session_id);
// Do we have an already logged in user in the session?
if (!is_existing_user_session()) {
  // User session data is not there
  $request_session_id = isset($request[FIELD_SESSION_ID]) ? $request[FIELD_SESSION_ID] : "";
  require_once 'db.php';
  if (!is_session_id_valid($request_session_id)) {
    //Session ID submitted in request is not valid
    clear_session();
    
    // Is this a login or user management request
    $script_name = $_SERVER['SCRIPT_NAME'];
    if (!is_login_or_user_management($action, $script_name)) {
      // It is not user login request
      $request_ip = $_SERVER['REMOTE_ADDR'];  // Returns the IP address from where the user is viewing the current page
      if (is_permitted_ip($request_ip, PERMITTED_IP_LIST)) {
        // Request is coming from a known IP
        $login = isset($_REQUEST[FIELD_LOGIN]) ? $_REQUEST[FIELD_LOGIN] : "anonymous";
        $pass = isset($_REQUEST[FIELD_PASS]) ? $_REQUEST[FIELD_PASS] : "";
        $validation = user_validation($login, $pass);
        if ($validation != OK_USER) {
          // Dialog Digital Reach do not support user/pass
          if (!is_permitted_ip($request_ip, NO_AUTH_IP_LIST)) {
            // Invalid access credentials
            warn(__FILE__, __FUNCTION__, __LINE__, $validation, $login, $pass, $request_ip, NO_AUTH_IP_LIST);
            exit(fail_return($validation, false));
          } else {
            // Nothing to do; user allowed to continue
          }
        } else {
          // Nothing to do; let valid user to proceed
        }
      } else {
        // IP is not allowed to access
        warn(__FILE__, __FUNCTION__, __LINE__, ERR_AUTHENTICATION, $request_ip);
        exit(fail_return(ERR_AUTHENTICATION, false));
      }
    } else {
      // Nothing to do; login and user management activities do not need a valid session
    }
  } else {
    // Nothing to do; let the valid session to contine
  }
}

function is_permitted_ip($ip, $allowed_ip_list) {
  return in_array($ip, explode(",", $allowed_ip_list));  // check ip 
}

function clear_session() {
  if (session_id()) {
    if (isset($_SESSION[FIELD_USER_ID])) unset($_SESSION[FIELD_USER_ID]);
    if (isset($_SESSION[FIELD_ROLE])) unset($_SESSION[FIELD_ROLE]);
    session_destroy();
  }
}

function is_existing_user_session() {
  return isset($_SESSION[FIELD_USER_ID]) && $_SESSION[FIELD_USER_ID];
}

function is_session_id_valid ($id) {
  return $id && (check_session(trim($id)) == OK_USER);
}

function is_login_or_user_management ($action, $script) {
  debug(__FILE__, __FUNCTION__, __LINE__,$action, $script );
  return $action == ACTION_LOGIN  || $action == ACTION_REGISTER || substr_compare($script, "user.php", -8) == 0;
}

function reset_pass($request) {
  unset($request[FIELD_PASS]);
  unset($request[FIELD_PASS1]);
  unset($request[FIELD_PASS2]);
  return $request;
}
?>
