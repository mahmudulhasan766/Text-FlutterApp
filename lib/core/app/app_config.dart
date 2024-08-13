const String appName = "Test App"; //this shows in the splash screen
const String appVersion = '1.0.0'; //this shows in the splash screen//this shows in the splash screen
///configure this
const bool https = true;
///configure url
const String publicFolder = "public";
const String protocol = https ? "https://" : "http://";
const String kDomainPath = "";
const String kApiEndPath = "api/";
const String apiVersion = "v1";
const String rawBaseUrl = "$protocol$kDomainPath$kApiEndPath$apiVersion";
const String baseUrl = rawBaseUrl;
