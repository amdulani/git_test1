<?php
header("Access-Control-Allow-Origin: *");
require_once 'session.php';
require_once 'db_store.php';

switch($action) {
    case ACTION_GENERATE:
        db_generate_batch_num();
        break;
    case ACTION_ADD:
        db_add_new_product($_REQUEST);
        break;
    case ACTION_READ:
        db_read_product_category($_REQUEST);
        break;
        break;
    case ACTION_READ_ALL:
        db_read_all_product();    
        break;
    case "read_supplier":
        db_read_supplier($_REQUEST);
        break;
    default:
        return fail_return(ERR_UNKNOWN_ACTION);
}

?>