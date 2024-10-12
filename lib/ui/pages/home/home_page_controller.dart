import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:neosao_task/ui/model/neo_sao_task_model.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController {
  NeoSaoTaskModel? neoSaoTaskModel;
  late List neoSaoTaskList = [];
  bool isLoading = false;
  bool isSearched = false;
  late List searchedApiList = [];

  @override
  void onInit() {
    super.onInit();
    fetchApiData();
  }

  Future<void> fetchApiData() async {
    isLoading = true;

    var client = http.Client();

    try {
      var url = Uri.https("jsonplaceholder.typicode.com", "/comments");
      var response = await client.get(url);

      List<dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

      neoSaoTaskList = decodedResponse
          .map((comment) => NeoSaoTaskModel.fromJson(comment))
          .toList();

      print(decodedResponse);
    } on Exception catch (e) {
      print("Error: ${e.toString()}");
    } finally {
      isLoading = false;
      client.close();
      update();
    }
  }

  Future<List> sortApiList(String value) async {
    if (value == "desc") {
      neoSaoTaskList.sort((a, b) => b.id.compareTo(a.id));
      update();
    } else {
      neoSaoTaskList.sort((a, b) => a.id.compareTo(b.id));
      update();
    }
    return neoSaoTaskList;
  }

  Future<List> searchInList(String query) async {
    print("Inside searchApiList func");
    isSearched = true;

    if (query.isEmpty) {
      searchedApiList = neoSaoTaskList;
    } else {
      searchedApiList = neoSaoTaskList
          .where((comment) =>
              comment.name.toLowerCase().contains(query.toLowerCase()) ||
              comment.email.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
    return searchedApiList;
  }
}
