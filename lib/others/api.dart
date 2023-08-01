import 'dart:convert';

import 'package:http/http.dart' as http;

import 'console.dart';
import 'show_alert.dart';

class API {
  static String baseUrl = "http://localhost:8080/";

  static dynamic findVideo({required String url}) async {
    try {
      PRINT({"url": url}.toString(), title: 'header');
      var response = await http.get(Uri.parse("${baseUrl}read"), headers: {"url": '$url'});
      Map result = jsonDecode(response.body);
      PRINT(result.toString(), title: "${baseUrl}read");
      if (response.statusCode == 200) {
        return result;
      } else {
        // Show.error(label: result.toString());
        return null;
      }
    } on Exception catch (e) {
      PRINT(e.toString(), title: "http://localhost:6908/read");
      Show.error(label: e.toString());
      return null;
    }
  }

  static dynamic updateUrl({required String url, required String postId}) async {
    try {
      PRINT({"new_url": url, "post_id": postId}.toString(), title: 'header');
      var response = await http.get(Uri.parse("${baseUrl}update"), headers: {"new_url": url, "post_id": postId});
      dynamic result = response.body;
      PRINT(result.toString(), title: "${baseUrl}update");
      if (response.statusCode == 200) {
        return result;
      } else {
        Show.error(label: result.toString());
        return null;
      }
    } on Exception catch (e) {
      PRINT(e.toString(), title: "${baseUrl}update");
      Show.error(label: e.toString());
      return null;
    }
  }
}
