<?php 
require_once 'db.php';

function db_get_supplier_product($args) {

    debug(__FILE__, __FUNCTION__, __LINE__, $args);
    
    $query =  " SELECT tp.name AS product_name
                FROM tbl_product tp, tbl_supplier ts, tbl_category tc, tbl_supplier_product tsp
                WHERE tp.id = tsp.product AND ts.id = sp.supplier ";

    debug(__FILE__, __FUNCTION__, __LINE__,db_execute($query));
    succ_return(db_execute($query));    
}
?>