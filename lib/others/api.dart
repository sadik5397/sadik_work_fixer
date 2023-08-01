import 'dart:convert';

import 'package:http/http.dart' as http;

import 'console.dart';
import 'show_alert.dart';

class API {
  static String baseUrl = "http://localhost:8080/";

  static dynamic findVideo({required String url}) async {
    try {
      PRINT({"url": url}.toString(), title: 'header');
      var response = await http.get(Uri.parse("${baseUrl}read"), headers: {"url": url});
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
      Map result = jsonDecode(response.body);
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

  static dynamic findChannel({required String url}) async {
    try {
      PRINT({"url": url}.toString(), title: 'header');
      var response = await http.post(Uri.parse("https://ytlarge.com/youtube/channel-id-finder/channel-id-finder"), headers: {"Accept" : "*/*"}, body: {"v": url});
      String result = response.body
          .toString()
          .split("target='_blank'><img width='40' height='40' src='https://yt3.ggpht"
              ".com/-pk8ySQUzEX2pcGL9arIQmadaSEpj6AEHTvM_c8R1jajOnRSoG6BDXLrn1l6PSjJFMmv32GsBWw=s240-c-k-c0x00ffffff-no-rj'/> <b>")[1]
          .split(" </b>")[0];
      PRINT(result.toString(), title: "https://ytlarge.com/youtube/channel-id-finder/channel-id-finder");
      if (response.statusCode == 200) {
        return result;
      } else {
        // Show.error(label: result.toString());
        return null;
      }
    } on Exception catch (e) {
      PRINT(e.toString(), title: "https://ytlarge.com/youtube/channel-id-finder/channel-id-finder");
      Show.error(label: e.toString());
      return null;
    }
  }
}
