<?php
require_once 'config.php';

//date_default_timezone_set(TIME_ZONE);

define('ACTION_ADD', 'add');
define('ACTION_BACKUP', 'backup');
define('ACTION_CLEAN', 'clean');
define('ACTION_CHECK', 'check');
define('ACTION_DEL', 'remove');
define('ACTION_FIND', 'search');
define('ACTION_GENERATE', 'generate');
define('ACTION_LOGIN', 'login');
define('ACTION_LOGOUT', 'logout');
define('ACTION_REGISTER', 'register');
define('ACTION_MOD', 'update');
define('ACTION_OTP_REQUEST', 'get_otp');
define('ACTION_OTP_VALIDATE', 'check_otp');
define('ACTION_PASSWD', 'passwd');
define('ACTION_POPULATE', 'populate');
define('ACTION_READ', 'read');
define('ACTION_REFUND', 'refund');
define('ACTION_RESTORE', 'restore');
define('ACTION_RESET_PASS', 'reset_password');
define('ACTION_READ_ALL', 'read_all_item');


define('AUDIT_LOG_FILE_EXT', 'log');
define('AUDIT_LOG_FILE_PREFIX', '');
define('AUDIT_LOG_FILE_SUFFIX', '_audit');

define('ERR_API', "API Error");
define('ERR_AUTHENTICATION', "Unauthorized access attempt.");
define('ERR_ACTION_NOT_DEFINED', "Action is not defined");
define('ERR_CURRENT_PASS_NA', "The current password is not given");

define('ERR_DB_BACKUP', "DB backup failed");
define('ERR_DB_CONNECT', "Cannot connect to DB");
define('ERR_DB_DELETE', "Data deletion failed");
define('ERR_DB_DELETE_NO_CONDITION', "No condition given to remove data");
define('ERR_DB_INCORRECT_ROW_COUNT', "Unexpected number of rows");
define('ERR_DB_INSERT', "Cannot insert data to DB");
define('ERR_DB_INSERT_DUPLICATE', "Duplicate data");
define('ERR_DB_READ', "Cannot read data from DB");
define('ERR_DB_RESTORE', "DB restore failed");
define('ERR_DB_UNKNOWN', "Unknown DB Error");
define('ERR_DB_UPDATE', "Cannot update DB");
define('ERR_DB_UPDATE_NO_DATA', "No data given to update");
define('ERR_DB_UPDATE_NO_ID', "Cannot update due to missing ID");
define('ERR_UNKNOWN_NOTIFICATION', "Cannot update due to unknown notification ID");
define('ERR_UNKNOWN_PARAMETER', "Define parameters accurately");

define('ERR_FILE_NOT_EXISTS', "The file does not exists");
define('ERR_ID_MISSING', "Missing record ID");
define('ERR_LOGIN', "Error Login. Please login again and try.");
define('ERR_LOGIN_NOT_SUPPORTED', "Login with username/password is not supported.");
define('ERR_MULTY_MATCH', "Matching Multiple Items");
define('ERR_NO_MATCH', "No Matching Items");
define('ERR_NON_SINGLE_RECORD', "This operation permits exatly with one record");
define('ERR_NEW_PASS_NA', "The new password is not given");
define('ERR_NEW_PASS_NOT_MATCH', "The new password and verification are not matching");
define('ERR_NON_PERMITTED_USERNAME', "Not permitted username");
define('ERR_OTP', "OTP Error");
define('ERR_PARA_NOT_DEFINED', "One or more parameters are not defined");
define('ERR_PERMISSION_DENIED', "Permission denied");
define('ERR_UNKNOWN', "Unknown error");
define('ERR_UNKNOWN_ACTION', "Unknown action");


define('FIELD_ID', 'id');
define('FIELD_LOGIN', 'login');
define('FIELD_PASS', 'pass');
define('FIELD_PASS1', 'pass1');
define('FIELD_PASS2', 'pass2');
define('FIELD_ROLE', 'role');
define('FIELD_SESSION_ID', 'session_id');
define('FIELD_UPDATED_TS', 'updated_ts');
define('FIELD_USER', 'user');
define('FIELD_USER_ID', 'user_id');


define('JSON_DETAILS', "details");
define('JSON_STATUS', "status");
define('JSON_SUCCESS', "success");
define('JSON_TOTAL', "total");

define('OK_DATA_DELETE', "Successfully removed the record");
define('OK_DATA_EMPTY_SET', "No data to display");
define('OK_DATA_INSERT', "Successfully added data");
define('OK_DATA_READ', "Successfully read data");
define('OK_DATA_UPDATE', "Successfully updated data");
define('OK_DB_BACKUP', "Successfully backed-up the database");
define('OK_DB_RESTORE', "Successfully restored database");
define('OK_LOGIN', "Successful user login");
define('OK_LOGOUT', "Successful user logout");
define('OK_USER', "User valid");





