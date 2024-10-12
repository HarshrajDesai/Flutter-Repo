import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:neosao_task/ui/pages/home/home_page_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              onChanged: (value){
                controller.searchInList(value);
              },
            ),
            automaticallyImplyLeading: false,
          ),
        );
      },
      init: HomePageController(),
    );
  }
}
