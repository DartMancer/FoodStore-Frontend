import 'package:flutter/material.dart';

// BackEnd URL:
// const String urlApi = 'https://api.vkurse.space/';
const String urlApi = 'http://localhost:5148';
const String telegramBotUrl = 'https://t.me/vkurse_organiser_bot';
// DynamicLinks URL
const String link = 'https://www.vkurse.space';
const String uriPrefix = 'https://vkurse.page.link';
const String userLinkType = 'userLinkType';
const String partnerLinkType = 'partnerLinkType';
const String eventLinkType = 'eventLinkType';
// Documents URL
const String privacyUrl = '$link/privacy';
const String agreementUrlAndroid = '$link/agreement_android';
const String agreementUrlIos = '$link/agreement_ios';

// Mail info:
String mailUsername = 'pavukdmitriy@gmail.com';
String mailPassword = 'ludgsxvboissiktu';
String mailRecipients = 'logs.vkurse@gmail.com';

// SharedPreferences info:
String idPreference = 'user_id';
String usernamePreference = 'username';
String passwordPreference = 'password';
String accessTokenPreference = 'access_token';
String fcmTokenPreference = 'fcm_token';

// Main fonts for app:
const fontApp = "Montserrat";

// Main colors for app:
Color whiteClr = const Color(0xFFFFFFFF);
Color blackClr = const Color(0xFF000000);
Color textClr = const Color(0xFF959BCD);
Color elementsClr = const Color(0xFF3A3E62);
Color backgroundClr = const Color(0xFF000214);
Color errorColor = Colors.redAccent;

List<Color> lightBlueGradient = const [Color(0xFF17EAD9), Color(0xFF6078EA)];
List<Color> purpleGradient = const [Color(0xFF6094EA), Color(0xFFF02FC2)];
List<Color> lightPinkGradient = const [
  Color(0xFFF17B41),
  Color(0xFFE05BA2),
  Color(0xFF6078EA)
];
List<Color> pinkGradient = const [
  Color(0xFF879AF2),
  Color(0xFFD3208B),
  Color(0xFFFDA000)
];
List<Color> orangeGradient = const [
  Color(0xFFEA5A6F),
  Color(0xFFDE791E),
  Color(0xFFFCCF3A)
];
