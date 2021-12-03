import 'package:flutter/cupertino.dart';

String API_URL = "https://api.brasil.io/v1/";


bool verifyScreenSize(BuildContext context){

  return MediaQuery.of(context).size.height>400;
}