<?php 

require_once 'db.php';
require_once 'lang.php';

//http://localhost:81/POS_App/svr/store.php?action=generate&session_id=jslcsa8ghu1lq0p6a4tji1mn5n
function db_generate_batch_num() {
    $query = "  SELECT ts.id
                FROM tbl_stock ts 
                ORDER BY ts.id DESC LIMIT 1;";
    $result = db_execute($query);
    $lastid = $result[0]['id'];
    if ($lastid == " ") {
        $stockid = "ITEM/". date("Y/m/d"). "/0001";
    } else {
        $stockid = intval($lastid);
        $stockid = "ITEM/". date("Y/m/d"). "/" . sprintf("%04d", ($stockid + 1));;
    }

    succ_return($stockid);
}

//http://localhost:81/POS_App/svr/store.php?action=add&product_name=Tiara&category_id=4&picture=https://www.bakedbyanintrovert.com/wp-content/uploads/2018/05/Birthday-Cake-Recipe-Image-720x720.jpg&supplier_id=1&store_location=7&unit_amount=1&unit=Kg&quentity=10&retail_price=40&cost_price=45&expire_date=&barcode_num=098-9899898-989&batch_num=ITEM/2020-06-08-0007&session_id=jslcsa8ghu1lq0p6a4tji1mn5n
function db_add_new_product($args) {

    if (!isset($args['product_name']) or !isset($args['category_id']) or !isset($args['supplier_id']) or !isset($args['unit_amount']) or !isset($args['unit']) or !isset($args['quentity']) or !isset($args['retail_price']) or !isset($args['cost_price']) or !isset($args['expire_date']) or !isset($args['barcode_num']) or !isset($args['batch_num']) or !isset($args['store_location']) or !isset($args['picture'])) {
        return fail_return(user_msg("err_para_not_defined"));
    }
    debug(__FILE__, __FUNCTION__, __LINE__, $args);
    $product_name =  $args['product_name'];
    $barcode_num = $args['barcode_num'];
    $retail_price = $args['retail_price'];
    $cost_unit_price = $args['cost_price'];
    $unit_id = db_find_unit_id($args['unit']);
    $picture = $args['picture'];
    $category_id = intval($args['category_id']);
    $unit_amout = $args['unit_amount'];


    $query = "  INSERT INTO tbl_product (barcode_num, name, retail_unit_price, cost_unit_price, picture, unit, category, unit_amount, created_ts) 
                VALUES ('$barcode_num', '$product_name', '$retail_price', '$cost_unit_price', '$picture', '$unit_id', '$category_id', '$unit_amout', current_timestamp())";
    db_execute($query, $db_errno , $affected_rows, $insert_id);
    $tbl_product_errno =  $db_errno;
    debug(__FILE__, __FUNCTION__, __LINE__, $db_errno);

    $product_id = $insert_id;
    $batch_num = $args['batch_num'];
    $location = $args['store_location'];
    $status = db_get_stock_status_id();

    $query = "  INSERT INTO tbl_store_location (number, created_ts) 
                VALUE ('$location', current_timestamp())";
    db_execute($query, $db_errno , $affected_rows, $insert_id);
    $tbl_store_location_errno =  $db_errno;
    debug(__FILE__, __FUNCTION__, __LINE__, $db_errno);

    if (!$tbl_store_location_errno) {
        $store_location_id = $insert_id;
    } else if ($tbl_store_location_errno == 1062 ) {
        $query = "SELECT tsl.id FROM tbl_store_location tsl WHERE tsl.number = '$location'";
        $result = db_execute($query);
        $store_location_id = $result[0]['id'];
    }


    $query = "  INSERT INTO tbl_stock (batch_num, product, location, status, created_ts) 
                VALUE ('$batch_num', '$product_id', '$store_location_id', '$status', current_timestamp())";
    db_execute($query, $db_errno , $affected_rows, $insert_id);
    $tbl_stock_errno =  $db_errno;
    debug(__FILE__, __FUNCTION__, __LINE__, $db_errno);

    $stock_id = $insert_id;
    $quentity_val = $args['quentity'];
    $quentity_para_id =  db_find_stock_para_id('Quantity');
    $stock_para_id_quentity = db_add_stock_para($stock_id, $quentity_para_id, $quentity_val, $db_errno);
    $tbl_stock_para__errno = $db_errno;

    if ($args['expire_date']) {
        $expire_date_val = $args['expire_date'];
        $expire_date_para_id = db_find_stock_para_id('Expiration date');
        $stock_para_id_expire_date = db_add_stock_para($stock_id, $expire_date_para_id, $expire_date_val, $db_errno);
    }

    $supplier_id = intval($args['supplier_id']);
    $query = "  INSERT INTO tbl_supplier_product (supplier , product, created_ts) 
                VALUE ('$supplier_id', '$product_id', current_timestamp())";
    db_execute($query, $db_errno , $affected_rows, $insert_id);
    $supplier_product_id = $insert_id; 
    $tbl_supplier_product_errno = $db_errno;
    debug(__FILE__, __FUNCTION__, __LINE__, $db_errno);

    debug(__FILE__, __FUNCTION__, __LINE__, (!is_null($product_id) && $product_id != 0) );
    if ((!is_null($product_id) && $product_id != 0) && (!is_null($stock_id) && $stock_id != 0 ) && (!is_null($supplier_product_id) && $supplier_product_id != 0) && ((!is_null($stock_para_id_quentity) && $stock_para_id_quentity != 0 ) ||  (!is_null($stock_para_id_expire_date) && $stock_para_id_expire_date != 0)) ) {
        return succ_return(user_msg("ok_data_insert"));
      } else if ($tbl_product_errno == 1062 && $tbl_stock_errno == 1452 && $tbl_stock_para__errno == 1452 && $tbl_supplier_product_errno == 1452) {
        return fail_return(user_msg("err_db_insert_duplicate"));
      } else {
       return fail_return(user_msg("err_db_insert"));
      }   
    
}

function db_add_stock_para($stock_id, $para, $val, &$db_errno) {

    $query = "  INSERT INTO tbl_stock_para (stock_id, para, val, created_ts) 
                VALUE ('$stock_id', '$para', '$val', current_timestamp())";
    db_execute($query, $db_errno , $affected_rows, $insert_id);
    debug(__FILE__, __FUNCTION__, __LINE__, $db_errno);

    return $insert_id;
}

function db_find_stock_para_id($para) {
    $query =  " SELECT csp.id FROM cfg_stock_para csp WHERE csp.name = '$para';";
    $result = db_execute($query);

   return $result[0]['id'];
}

function db_find_unit_id($unit_name) {
    $query =  " SELECT cu.id FROM cfg_unit cu WHERE cu.name = '$unit_name';";
    $result = db_execute($query);

   return $result[0]['id'];

}

function db_get_stock_status_id() {
    $query =  " SELECT csu.id FROM cfg_stock_status csu WHERE csu.name = 'Available';";
    $result = db_execute($query);

   return $result[0]['id'];
}

function db_set_supplier_id() {

}

//http://localhost:81/POS_App/svr/store.php?action=read_all_item&session_id=jslcsa8ghu1lq0p6a4tji1mn5n
function db_read_all_product() {
    $query =  " SELECT tp.id AS product_id, tp.barcode_num AS batcode_num, tp.name AS product_name, tp.retail_unit_price AS retail_unit_price,tp.cost_unit_price AS cost_unit_price,
                tp.picture AS picture,tp.unit_amount AS unit_amount, cu.name AS unit, tc.name AS category
                FROM tbl_product tp, cfg_unit cu, tbl_category tc
                WHERE tp.unit = cu.id AND tc.id = tp.category ";

    $result = db_execute($query);
    $result = db_populate_stock_detail($result);
    succ_return($result);
}

function db_populate_stock_detail($result) {
    $size = sizeof($result);
    for ($i = 0; $i < $size; $i++) {
        $id = $result[$i]['product_id'];
        $query = "  SELECT vsd.batch_num, vsd.store_location, vsd.expire_date, vsd.quantity, vsd.stock_status
                    FROM  view_stock_details vsd
                    WHERE vsd.stock_status IN ('Available', 'NOT Available') AND vsd.product_id = $id";        
        
        $result[$i]['stock_detail'] = db_execute($query);
    }
    return $result;
}


function db_read_product_category($args) {

    debug(__FILE__, __FUNCTION__, __LINE__, $args);
    
    $query = "SELECT * FROM tbl_category ";
    debug(__FILE__, __FUNCTION__, __LINE__,db_execute($query));
    succ_return(db_execute($query));
    

}
//http://localhost/pos/svr/store.php?action=read_supplier&session_id=ccgsmii941shj44qr4i940d5uo
function db_read_supplier($args) {

    debug(__FILE__, __FUNCTION__, __LINE__, $args);
    $query = "SELECT * FROM tbl_supplier ";
    succ_return(db_execute($query));

}
?>

















