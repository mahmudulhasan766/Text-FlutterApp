const String kIconDir = 'assets/icons/';
const String kImageDir = 'assets/images/';
const String kFlagDir = 'assets/flags/';
const String kTranslatorDir = 'assets/translations';
const String kImageUrl = 'https://.../';
const String kBaseUrl = 'https://.../';

const String kLanguage = 'bn';
const String kCurrency = '৳';
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^\w+([\.\+-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$');
final RegExp strongPasswordRegExp =
    RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');
final RegExp numberFindRegExp = RegExp(r'[\d]');
final RegExp specialChrFindRegExp =
    RegExp(r'[~!@#$%^&*()_+`{}|<>?;:./,=\-\[\]]');
final RegExp mobileNumberRegex = RegExp(r'^-?\d+$');

