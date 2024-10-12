import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:neosao_task/ui/pages/home/home_page_controller.dart';
import 'package:neosao_task/ui/pages/search/search_page.dart';
import 'package:neosao_task/ui/widget/home_page_row.dart';

import '../../widget/bottom_app_bar_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("NeoSao Task App"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
                },
                icon: const Icon(Icons.search),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(value: "asc",child: Text("ASC")),
                    const PopupMenuItem(value:"desc",child: Text("DESC")),
                  ];
                },
                icon: const Icon(Icons.sort),
                onSelected: (String value) async{
                  controller.sortApiList(value);
                },
              )
            ],
            automaticallyImplyLeading: controller.isSearched?true:false,
          ),
          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.isSearched? ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: HomePageRow(
                      neoSaoTaskModel: controller.searchedApiList[index],
                    )),
              );
            },
            itemCount: controller.searchedApiList.length,
            shrinkWrap: true,
          ):ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: HomePageRow(
                            neoSaoTaskModel: controller.neoSaoTaskList[index],
                          )),
                    );
                  },
                  itemCount: controller.neoSaoTaskList.length,
                  shrinkWrap: true,
                ),
          bottomNavigationBar: const BottomAppBar(
            child: BottomAppBarButton(),
          ),
        );
      },
      init: HomePageController(),
    );
  }
}
