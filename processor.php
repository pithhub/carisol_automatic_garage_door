<?php
// Useful for generation of test Order numbers
function msTimeStamp()
{
 return (string)round(microtime(1) * 1000);
}




// Ensure you append the ?wsdl query string to the url
$wsdlurl ='https://ecm.firstatlanticcommerce.com/PGService/Services.svc?wsdl';

// Set up client to use SOAP 1.1 and NO CACHE for WSDL. You can choose between
// exceptions or status checking. Here we use status checking. Trace is forDebug only
// Works better with MS Web Services where

// WSDL is split into several files. Will fetch all the WSDL up front.
$options = array(
 'location' =>
'https://ecm.firstatlanticcommerce.com/PGService/Services.svc',
 'soap_version'=>SOAP_1_1,
 'exceptions'=>0,
 'trace'=>1,
 'cache_wsdl'=>WSDL_CACHE_NONE
 );
 
 
// WSDL Based calls use a proxy, so this is the best way
// to call FAC PG Operations.
$client = new SoapClient($wsdlurl , $options);

// This should not be in your code in plain text!
$password = 'd5VmG1OI';

// Use your own FAC ID
$facId = '000000000';

// Acquirer is always 464748
$acquirerId = '464748';

// orderNumber must be Unique per order. Put your own format here
$orderNumber = 'FACPGTEST' . msTimeStamp();


// 12 chars, always, no decimal place
$amount = '000000001199';


// 840 = USD, put your currency code here
$currency = '840';

// How to sign a FAC Authorize message
function sign($passwd, $facId, $acquirerId, $orderNumber, $amount, $currency)
{
 $stringtohash =
$passwd.$facId.$acquirerId.$orderNumber.$amount.$currency;
 $hash = sha1($stringtohash, true);
 $signature = base64_encode($hash);

 return $signature;
}

$signature = sign($password, $facId, $acquirerId, $orderNumber, $amount,
$currency);


// You only need to initialise the message sections you need. So for a basic Auth
// only Credit Cards and Transaction details are required.

// Card Details. Arrays serialise to elements in XML/SOAP4
$CardDetails = array('CardCVV2' => $_POST["Cvv"],
 'CardExpiryDate' => $_POST["expire-date"],
 'CardNumber' => $_POST["Cardno"],
 'CardName' =>$_POST["Cardname"],
 'IssueNumber' => '',
 'StartDate' => '');
 
// Transaction Details.
$TransactionDetails = array('AcquirerId' => $acquirerId,
 'Amount' => $amount,
 'Currency' => $currency,
 'CurrencyExponent' => 2,
 'IPAddress' => '',
 'MerchantId' => $facId,
 'OrderNumber' => $orderNumber,
'Signature' => $signature,
 'SignatureMethod' => 'SHA1',
 'TransactionCode' => '0'
 );

//Billing Details
$BillingDetails = array(
    'BillToAddress' => $_POST[""],
    'BillToAddress2' => $_POST[""],
    'BillToCity' => $_POST[""],
    'BillToCountry' => $_POST[""],
    'BillToEmail' => $_POST[""],
    'BillToFirstName' => $_POST[""],
    'BillToLastName' => $_POST[""],
    'BillToState' => $_POST[""],
    'BillToTelephone' => $_POST[""],
    'BillToZipPostCode' => $_POST[""],
    'BillToCounty' => $_POST[""],
    'BillToMobile' =>$_POST[""]
    );
 
// The request data is named 'Request' for reasons that are not clear!
$AuthorizeRequest = array('Request' => array('CardDetails' => $CardDetails,'TransactionDetails' => $TransactionDetails));

// For debug, to check the values are OK
var_dump($AuthorizeRequest);

// Call the Authorize through the Client
$result = $client->Authorize($AuthorizeRequest);


if(!$client->fault){
    echo 'successful';
    
final class ModificationTypes
{
 const Capture = 1;
 const Refund = 2;
 const Reversal = 3;
}

// Transaction Details.
$PreviousTransactionDetails = array('AcquirerId' => $acquirerId,
 'Amount' => $amount,
 'CurrencyExponent' => 2,
 'MerchantId' => $facId,
'ModificationType' => ModificationTypes::Capture,
 'OrderNumber' => $orderNumber,
 'Password' => $password);

$TransactionModificationRequest = array('Request' =>
$PreviousTransactionDetails);

$result = $client->TransactionModification($TransactionModificationRequest);

if ($client->fault) {
 echo '<h2>Fault</h2><pre>';
  print_r($result);
 echo '</pre>';
} else {
 // Check for errors
 $err = $client->error;
 if ($err) {
 // Display the error
 echo '<h2>Error</h2><pre>' . $err . '</pre>';
 } else {
 // Display the result
 echo '<h2>The Result</h2><pre>';
 print_r($result);
 echo '</pre>';
 }
}
}
/*
// Check for a fault
if ($client->fault) {
 echo '<h2>Fault</h2><pre>';
  print_r($result);
 echo '</pre>';
} else {
 // Check for errors
 $err = $client->error;
 if ($err) {
 // Display the error
 echo '<h2>Error</h2><pre>' . $err . '</pre>';
 } else {
 // Display the result
 echo '<h2>The Result</h2><pre>';
 print_r($result);
 echo '</pre>';
 }
}
*/

?>
