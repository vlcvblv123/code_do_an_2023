import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:http/http.dart' as http;

import '../models/chat_model.dart';
import '../models/models_model.dart';
import 'api_consts.dart';

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(Uri.parse("$BASE_URL/models"),
          headers: {"Authorization": "Bearer $API_KEY"});

      Map jsonRespone = jsonDecode(response.body);
      if (jsonRespone['error'] != null) {
        //print("jsonRespone['error'] $jsonRespone['error']['message']");
        throw HttpException(jsonRespone['error']["message"]);
      }
      print("jsonRespone $jsonRespone");
      List temp = [];
      for (var value in jsonRespone["data"]) {
        temp.add(value);
        log("temp: ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }

  // Send Message
  static Future<List<ChatModel>> sendMessage(
      {required String messagex, required String modelId}) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL/chat/completions"),
        headers: {
          "Authorization": "Bearer $API_KEY",
          "Content-Type": "application/json"
        },
        body: jsonEncode(
          {
            "model": modelId,
            "messages": [
              {"role": "user", "content": "${messagex}"}
            ],
            "temperature": 0,
            "max_tokens": 1000,
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        //print("jsonRespone['error'] $jsonRespone['error']['message']");
        throw HttpException(jsonResponse['error']["message"]);
      }
      List<ChatModel> chatList = [];
      if (jsonResponse["choices"].length > 0) {
        log("jsonRespone[choise]message ${jsonResponse['choices'][0]['message']['content']}".toString());
        chatList = List.generate(
          jsonResponse["choices"].length,
              (index) => ChatModel(
            msg: jsonResponse['choices'][index]['message']['content'],

            chatIndex: 1,

          ),
        );

      }

      return chatList;
    } catch (error) {
      log("errors $error");
      rethrow;
    }
  }
}
