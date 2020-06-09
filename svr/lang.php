<?php
require_once 'config.php';

$lang_priority = ['en', 'si', 'ta'];

//TODO: Assure all the user messages are seved from this module
//TODO: Populate user message list from DB
$msg_list = [
    'already_updated_or_wrong_check_id' => [
        'en' => '\'$check_id\' is already updated or not belongs to you',
        'si' => '\'$check_id\' ඔබට අයත් නම් දැනටමත් යාවත්කාලීන කර ඇත',
        'ta' => '\'$check_id\' உங்களுக்கு சொந்தமானது அல்ல அல்லது ஏற்கனவே புதுப்பிக்கப்பட்டது'
    ],
    'contact_table_already_up_to_date' => [
        'en' => 'Contact table is already up-to-date',
        'si' => 'සම්බන්ධතා දත්ත දැනටමත් යාවත්කාලීන වී ඇත',
        'ta' => 'இணைப்பு தரவு ஏற்கனவே புதுப்பித்த நிலையில் உள்ளது'
    ],
    'err_authentication' => [
        'en' => 'Unauthorized access attempt',
        'si' => 'අනවසර පිවිසුම් උත්සාහයකි',
        'ta' => 'அங்கீகரிக்கப்படாத அணுகல் முயற்சி'
    ],
    'err_db_insert' => [
        'en' => 'Cannot insert data to DB',
        'si' => 'දත්ත ඇතුළු කිරීම අවසන් කල නොහැකි විය',
        'ta' => 'கோப்பினுள் தரவைச் செருக முடியாது'
    ],
    'err_db_insert_duplicate' => [
        'en' => 'Duplicated data',
        'si' => 'ඔබ ඇතුලත් කල තොරතුරු දැනටමත්  දත්ත ගොණුවේ ඇත',
        'ta' => 'நகல் தரவு'
    ],
    'err_expired_load' => [
        'en' => 'Permitted time elapsed',
        'si' => 'අවසර ලබාදී ඇති කාලය අවසන් වී ඇත',
        'ta' => 'அங்கீகரிக்கப்பட்ட காலம் முடிந்தது'
    ],
    'err_msg_not_exists' => [
        'en' => 'Corresponding user message is not defined',
        'si' => 'අදාල පරිශීලක පණිවිඩය අර්ථ දක්වා නැත',
        'ta' => 'Corresponding user message is not defined'
    ],
    'err_para_not_defined' => [
        'en' => 'One or more needed parameters are not defined.',
        'si' => 'අවශ්ය දත්ත එකක් හෝ කිහිපයක් සපයා නොමැත.',
        'ta' => 'ஒன்று அல்லது அதற்கு மேற்பட்ட தேவையான அளவுருக்கள் வரையறுக்கப்படவில்லை.'
    ],
    'ok_data_insert' => [
        'en' => 'Successfully added data',
        'si' => 'දත්ත සාර්ථකව එක් කරන ලදි',
        'ta' => ' தரவு வெற்றிகரமாக சேர்க்கப்பட்டது'
    ],
    'ok_login' => [
        'en' => 'Successful user login',
        'si' => 'පරිශීලක පිවිසුම සාර්ථකයි',
        'ta' => 'பயனர் உள்நுளைவு வெற்றிகரமாக அனுமதிக்கப்பட்டது '
    ],
    'ok_logout' => [
        'en' => 'logout successful',
        'si' => 'පිටවීම සාර්ථකයි.',
        'ta' => 'வெளியேற்றம் வெற்றிகரமாக நிறைவேறியது .'
    ],
    'ok_otp_api' => [
        'en' => 'Status of sending OTP to $contact: $sms_status',
        'si' => 'ඔබට අදාලවන  රහස් අංකය (OTP) $contact වෙත යැවීම ප්රතිපලය: $sms_status.',
        'ta' => 'உருவாக்கிய கடவுச்சொல்லை (OTP) $sms தொடர்புக்கு அனுப்புவதன் முடிவு: $sms_status.'
    ],
    'ok_vehicle_num' => [
        'en' => 'Vehicle Number is OK',
        'si' => 'වාහනයේ අංකය නිවැරදියි',
        'ta' => 'வாகன எண் சரியானது',
    ],
    'user_name_already_exists' => [
        'en' => 'User name is already up-to-date',
        'si' => 'පරිශීලකයාගේ නම දැනටමත් භාවිතා කර ඇත',
        'ta' => 'பயனர்பெயர் ஏற்கனவே பயன்பாட்டில் உள்ளது'
    ],
    'user_role_table_already_up_to_date' => [
        'en' => 'User role is already up-to-date',
        'si' => 'පරිශීලක භූමිකාව දැනටමත් යාවත්කාලීන වී ඇත',
        'ta' => 'பயனர் பங்கு ஏற்கனவே புதுப்பிக்கப்பட்டது'
    ],
    'user_table_updated' => [
        'en' => 'User table updated',
        'si' => 'පරිශීලක දත්ත යාවත්කාලීන කරන ලදී',
        'ta' => 'பயனர் தரவு புதுப்பிக்கப்பட்டது'
    ],
    'ERR_DB_CONNECT' => [
        'en' => 'ERR_DB_CONNECT',
        'si' => 'දත්ත ගබඩාවට සම්බන්ධ විය නොහැක.',
        'ta' => 'ERR_DB_CONNECT'
    ],
    'ERR_LOGIN_NOT_SUPPORTED' => [
        'en' => 'Seems your session expired. Please logout and login again',
        'ta' => 'உங்கள் உறவு காலாவதியானதாக தெரிகிறது. வெளியேறி மீண்டும் உள்நுழைக'
    ],
    'ERR_PARA_NOT_DEFINED' => [
        'en' => '$para_list is not defined',
        'si' => 'අවශ්‍ය දත්ත ($para_list) සපයා නැත',
        'ta' => 'தேவையான தரவு ($para_list) எதுவும் வழங்கப்படவில்லை.'
    ],
    'OK_DATA_UPDATE' => [
        'en' => 'Data updated $para_list',
        'si' => 'දත්ත යාවත්කාලීන කරන ලදී $para_list',
        'ta' => 'தரவு புதுப்பிக்கப்பட்டது $para_list'
    ]
];

function user_msg($code, $extra = [], $plain_response = false)
{
    global $msg_list;
    debug(__FILE__, __FUNCTION__, __LINE__, $code);
    $lang = isset($_REQUEST['lang']) ? $_REQUEST['lang'] : (isset($_SESSION['lang']) ? $_SESSION['lang'] : DEFAULT_LANG);
    $msg = (isset($msg_list[$code])) ? $msg_list[$code][$lang] : $msg_list["err_msg_not_exists"][$lang];
    
    foreach ($extra as $key => $val) {  //Associative Arrays
        $msg = str_replace("$" . $key, $val, $msg);
    }
    $resp = $msg;
    if (!$plain_response) {
        $resp = ['code' => $code, 'msg' => $msg];
    }
    return $resp;
}
