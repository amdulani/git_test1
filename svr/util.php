<?php
require_once 'definition.php';
define('LOG_FILE', AUDIT_LOG_DIR . '/' . AUDIT_LOG_FILE_PREFIX . date("Ymd") . AUDIT_LOG_FILE_SUFFIX . '.' . AUDIT_LOG_FILE_EXT);

function debug()
{
  //debug(__FILE__, __FUNCTION__, __LINE__, $session_id);
  $args = func_get_args();
  write(array_merge(array('DEBUG'), $args));
}

function info()
{
  $args = func_get_args();
  write(array_merge(array('INFO'), $args));
}

function warn()
{
  $args = func_get_args();
  write(array_merge(array('WARN'), $args));
}

function error()
{
  $args = func_get_args();
  write(array_merge(array('ERROR'), $args));
}

function todo()
{
  $args = func_get_args();
  write(array_merge(array('TODO'), $args));
}

function write()
{
  $args = func_get_args();
  $i = 0;
  if (sizeof($args) == 1 && is_array($args)) {
    $args = $args[0];
  }
  $print_arr = array();
  foreach ($args as $arg) {
    array_push($print_arr, arg_to_str($arg));
  }

  $t = microtime(true);
  $micro = sprintf("%06d", ($t - floor($t)) * 1000000);
  $d = new DateTime(date('Y-m-d H:i:s.' . $micro, $t));

  write_log($d->format("H:i:s.u") . ", " . $_SERVER['REMOTE_ADDR'] . ", " . session_id() . ", " . implode(", ", $print_arr) . "\r\n", 3, LOG_FILE);
}

function write_log($log, $type, $dest)
{
  error_log($log, $type, $dest);
}

function arg_to_str($arg)
{
  $str = "";
  if (is_array($arg)) {
    $str .= "array(";
    $str_arr = array();
    foreach ($arg as $key => $val) {
      array_push($str_arr, "$key => " . arg_to_str($val));
    }
    $str .= implode(", ", $str_arr);
    $str .= ")";
  } else if (is_object($arg)) {
    $str .= "object(" . var_export($arg, true) . ")";
  } else if (is_resource($arg)) {
    $str .= "resource(" . var_export($arg, true) . ")";
  } else if (is_file($arg)) {
    $str .= basename($arg, ".php");
  } else if (is_bool($arg)) {
    $str .= ($arg) ? 'true' : 'false';
  } else {
    $str .= $arg;
  }
  return $str;
}

function json_return($resp, $echo = false)
{
  header('Content-Type: application/json');
  $return = json_encode(($resp));

  if ($echo) {
    echo $return;
  }
  if (!$return) {
    echo json_last_error_msg();
  } 
  info(__FILE__, __FUNCTION__, __LINE__, final_audit_resp($resp));  
  return $return;
}

function final_audit_resp($resp, $outer_limit = 10, $inner_limit = 2)
{
  $ret_resp = array();
  if (is_array($resp)) {
    $resp_size = sizeof($resp);
    if ($resp_size > $outer_limit) {
      $resp = array_slice($resp, 0, $outer_limit);
      $resp["...more"] = $resp_size;
    }
    foreach ($resp as $key => $val) {
      if (is_array($val)) {
        $ret_resp[$key] = final_audit_resp($val, $inner_limit, $inner_limit);
      } else {
        $ret_resp[$key] = $val;
      }
    }
  } else {
    $ret_resp = $resp;
  }
  return $ret_resp;
}

function fail_return($details, $echo = true, $json = true, $success = true)
{
  if ($json) {
    return json_return(array(JSON_SUCCESS => $success, JSON_STATUS => false, JSON_DETAILS => $details), $echo);
  } else {
    if ($echo) echo arg_to_str($details);
    return $details;
  }
}

function succ_return($details, $echo = true, $json = true, $total = 0)
{
  if ($json) {
    return json_return(array(JSON_SUCCESS => true, JSON_STATUS => true, JSON_DETAILS => $details, JSON_TOTAL => $total), $echo);
  } else {
    if ($echo) echo arg_to_str($details);
    return $details;
  }
}

function is_set_all($array, $field)
{
  if (!is_array($field)) {
    return isset($array[$field]);
  }
  foreach ($field as $key) {


    if (!isset($array[$key]) && !($key == FIELD_ID)) {
      return false;
    }
  }
  return true;
}

function is_set_any($array, $field)
{
  debug(__FILE__, __FUNCTION__, __LINE__, is_array($field));
  if (!is_array($field)) { 
    return isset($array[$field]);
  }
  foreach ($field as $key) {
    if (isset($array[$key])) return true;
  }
  return false;
}

function array_remove($val, $arr, $preserve = true)
{
  if (empty($arr) || !is_array($arr)) {
    return $arr;
  }

  foreach (array_keys($arr, $val) as $key) {
    unset($arr[$key]);
  }

  return ($preserve) ? $arr : array_values($arr);
}

function create_table_from_list($list)
{
  if (!$list) return "";
  $out = "";
  $out .= "<table border='1'>\n";
  $head = array_shift($list);
  $out .= "<tr>";
  if (is_array($head)) {
    foreach ($head as $field) {
      $out .= "<th>$field</th>";
    }
  } else {
    $out .= "<th>$head</th>";
  }
  $out .= "</tr>\n";
  foreach ($list as $row) {
    $out .= "<tr>";
    if (is_array($row)) {
      foreach ($row as $field) {
        $out .= "<td>$field</td>";
      }
    } else {
      $out .= "<td>$row</td>";
    }
    $out .= "</tr>\n";
  }
  $out .= "</table>\n";
  return $out;
}

function tbl_array_from_associate_array($arr)
{
  return array_merge(array_keys($arr), array_values($arr));
}

function get_request($request, $post_str)
{
  $ret = is_array($request) ? $request : json_decode($request);
  if ($post_str) {
    $decoded = json_decode($post_str, true);
    if (!$decoded) {
      $pairs = explode("&", $post_str);
      $vars = array();
      foreach ($pairs as $pair) {
        $nv = explode("=", $pair);
        $name = urldecode($nv[0]);
        $value = urldecode($nv[1]);
        $decoded[$name] = $value;
      }
    }
    switch (gettype($decoded)) {
      case "NULL":
        break;
      case "array":
        $ret = array_merge($ret, $decoded);
        break;
      default:
        $ret = array_merge($ret, (array) $decoded);
        break;
    }
  }
  return unique_sort($ret);
}

/* function get_field_list($module)
{
  debug(__FILE__, __FUNCTION__, __LINE__, $module);
  if (is_file($module)) {
    $module = basename($module, ".php");
  }

  if ((!isset($_SESSION['field_list'][$module])) || (isset($_SESSION['field_list'][$module]))) {
    switch ($module) {
      case 'line':
      case 'util_line':
      case 'tbl_line':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_CODE, FIELD_NAME, FIELD_START_LOC,
          FIELD_END_LOC, FIELD_LENGTH, FIELD_TOWER_COUNT, FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'survey':
      case 'tbl_survey':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_LINE, FIELD_DATE, FIELD_LENGTH,
          FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'access':
      case 'user':
      case 'tbl_user':
      case 'util_user':
      case 'reset_pass':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_NAME, FIELD_LOGIN, FIELD_PASS, FIELD_ROLE,
          FIELD_MOBILE, FIELD_EMAIL, FIELD_SESSION_ID, FIELD_DEVICE_ID, FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'tbl_user_tbl_line':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_USER, FIELD_ITEM, FIELD_ACCESS,
          FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'util_tower_progress':
      case 'tbl_tower_progress':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_TOWER, FIELD_ACTIVITY, FIELD_DATE,
          FIELD_PROGRESS, FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'util_tower':
      case 'db_tower':
      case 'tbl_tower':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_TOWER, FIELD_LINE, FIELD_TW_TYPE,
          FIELD_BODY_EXT, FIELD_FOUND_TYPE, FIELD_PROGRESS, FIELD_CREATED_TS, FIELD_UPDATED_TS,
          FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'weather':
      case 'db_weather':
      case 'tbl_weather_report':
      case 'util_weather':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_LINE, FIELD_TOWER, FIELD_DATE,
          FIELD_TIME_SLOT, FIELD_WEATHER_STATUS, FIELD_CREATED_TS, FIELD_UPDATED_TS,
          FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'notification':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_TYPE, FIELD_DATA_TABLE, FIELD_DATA_ID, FIELD_PRIORITY,
          FIELD_PARA, FIELD_OLD_VAL, FIELD_NEW_VAL, FIELD_CREATED_TS, FIELD_UPDATED_TS,
          FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'tbl_notification':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_TYPE, FIELD_DATA_TABLE, FIELD_DATA_ID, FIELD_PRIORITY,
          FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'db_notification':
      case 'tbl_notification_recipient':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_NOTIFICATION_ID, FIELD_RECIPIENT, FIELD_STATUS,
          FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'tbl_line_history':
      case 'db_line_history':
        $_SESSION['field_list'][$module] = array(
          FIELD_HISTORY_ID, FIELD_ID, FIELD_CODE, FIELD_NAME, FIELD_START_LOC,
          FIELD_END_LOC, FIELD_LENGTH, FIELD_TOWER_COUNT, FIELD_PROGRESS, FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT,
          FIELD_HISTORY_STATUS, FIELD_HISTORY_UPDATED_TS
        );
        break;
      case 'tbl_tower_history':
      case 'db_tower_history':
        $_SESSION['field_list'][$module] = array(
          FIELD_HISTORY_ID, FIELD_ID, FIELD_TOWER, FIELD_LINE, FIELD_TW_TYPE,
          FIELD_BODY_EXT, FIELD_FOUND_TYPE, FIELD_PROGRESS, FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT,
          FIELD_HISTORY_STATUS, FIELD_HISTORY_UPDATED_TS
        );
        break;
      case 'activity':
      case 'tbl_activity':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_NAME, FIELD_WEIGHT, FIELD_LEVEL, FIELD_UPDATE_TYPE,
          FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'tbl_line_progress':
      case 'util_line_progress':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_LINE, FIELD_ACTIVITY, FIELD_DATE,
          FIELD_PROGRESS, FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'project':
      case 'tbl_project_progress':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_ACTIVITY, FIELD_DATE,
          FIELD_PROGRESS, FIELD_CREATED_TS, FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
      case 'tbl_weather':
        $_SESSION['field_list'][$module] = array(
          FIELD_ID, FIELD_STATUS, FIELD_CREATED_TS,
          FIELD_UPDATED_TS, FIELD_UPDATED_BY, FIELD_COMMENT
        );
        break;
    }
  }
  return $_SESSION['field_list'][$module];
} */

function unique_sort($arr)
{
  $ret = array();
  foreach ($arr as $key => $val) {
    if (!array_key_exists($key, $ret)) {
      $ret[$key] = $val;
    }
  }
  asort($ret);
  return $ret;
}

//Encode password
function pass_encrypt($pass)
{
  return base64_encode($pass);
 // return $pass;
}

function remove_fields($key_val_list, $key_list_to_remove)
{
  foreach ($key_list_to_remove as $key_to_remove) {
    unset($key_val_list[$key_to_remove]);
  }
  return $key_val_list;
}

function remove_tbl_fields($key_val_list, $key_list_to_remove)
{
  foreach ($key_list_to_remove as $key_to_remove) {
    foreach ($key_val_list as $key => $key_val) {
      if ($key_val == $key_to_remove) {
        unset($key_val_list[$key]);
      }
    }
  }
  return $key_val_list;
}

function format_phone_num($str_num)
{
  // let's remove all spaces, dashes and brackets in the given number (E.g. 077 378 5550, 077-378-5550)
  $str_num = preg_replace('/[\s\-\(\)]+/', '', $str_num);
  // If the number is 0773785550, +94773785550 or 0094773785550 format let's remove leading zero & +
  $str_num = ltrim($str_num, "0+");
  // Let's add 94 in front if number length is 9 (E.g 773785550)
  $str_num = (strlen($str_num) == 9) ? "94" . $str_num : $str_num;
  // Return formatted number
  return $str_num;
}

function format_vehicle_num($vehicle_num, $validate = false)
{
  $province_prefix_list = ['WP', 'SP', 'CP', 'NP', 'EP', 'SB', 'NW', 'NC', 'UV'];
  // Remove spaces from two ends and replace multiple spaces and dashes with a single space
  $vehicle_num = strtoupper(preg_replace("/[\s-]+/", " ", trim($vehicle_num)));
  // Return formatted number if not need to validate
  if (!$validate) return $vehicle_num;

  // Vehicle number should have two or three parts (E.g LK 2243, 20 3334, WPLD 4434, WP LD 4249)
  $num_part_list = explode(" ", $vehicle_num);

  // If no space
  if (sizeof($num_part_list) == 1) {
    $vehicle_num = array_pop($num_part_list);
    $match_resp = preg_match("/([a-zA-Z]+)([0-9]+)/", $vehicle_num, $num_part_list);
    if (!$match_resp) {
      // If the vehicle number containst only digit as a single part, it is not valid
      return ['valid' => 0, 'vehicle_num' => $vehicle_num, 'code' => 'err_vehicle_num_only_one_part'];
    };
    switch (sizeof($num_part_list)) {
      case 3:
      case 4:
        // Remove 1st element having full text
        array_shift($num_part_list);
        break;
      default:
        return ['valid' => 0, 'vehicle_num' => $vehicle_num, 'code' => 'err_vehicle_num_too_many_parts'];
    }
  }

  // If the vehicle number has more than 2 parts let's reject
  // It not advice to submit wp LK 3343 type vehicle numbers
  // In that case wp should come together with LK (E.g wpLK 4433)
  $part_count = sizeof($num_part_list);
  if ($part_count == 3) {
    // Number is wrong if the 1st part of the number is not province prefix
    if (!in_array(array_shift($num_part_list), $province_prefix_list)) {
      return ['valid' => 0, 'vehicle_num' => $vehicle_num, 'code' => 'err_vehicle_num_too_many_parts'];
    };
  } else if (sizeof($num_part_list) != 2) {
    return ['valid' => 0, 'vehicle_num' => $vehicle_num, 'code' => 'err_vehicle_num_too_many_parts'];
  }

  // Last part of the vehicle number should be numeric
  if (!is_numeric($num_part_list[1]))
    return ['valid' => 0, 'vehicle_num' => $vehicle_num, 'code' => 'err_vehicle_num_none_numeric'];

  $num_part_list[1] = sprintf('%04d', $num_part_list[1]); // Add leading zero to the number part

  // Replace if province prefix is there for the vehicle number
  $prefix_part_list = str_split($num_part_list[0], 2);
  if (in_array(array_shift($prefix_part_list), $province_prefix_list)) {
    $num_part_list[0] = implode($prefix_part_list);
  }

  // Separte English letters (first part of the vehicle number) from number at the end using a dash
  return ['valid' => 1, 'vehicle_num' => implode("-", $num_part_list), 'code' => 'ok_vehicle_num'];
}
