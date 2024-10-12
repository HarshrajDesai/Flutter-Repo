import 'package:flutter/material.dart';
import 'package:neosao_task/ui/pages/webview/web_view_page.dart';

class BottomAppBarButton extends StatelessWidget {
  const BottomAppBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewPage()));
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.lightBlueAccent
        ),
        child: const Text("Click Here"),
      ),
    );
  }
}
