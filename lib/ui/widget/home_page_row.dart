import 'package:flutter/material.dart';
import 'package:neosao_task/ui/model/neo_sao_task_model.dart';

class HomePageRow extends StatelessWidget {


  final NeoSaoTaskModel neoSaoTaskModel;
  const HomePageRow({super.key, required this.neoSaoTaskModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Post Id:",textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.w500),),
              Text("${neoSaoTaskModel.postId}",textAlign: TextAlign.justify,),
            ],
          ),
          Row(
            children: [
              const Text("Email:",textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.w500),),
              Expanded(child: Text("${neoSaoTaskModel.email}",textAlign: TextAlign.justify,)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name:",textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.w500),),
              Expanded(child: Text("${neoSaoTaskModel.name}",textAlign: TextAlign.justify,)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Content:",textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.w500),),
              Expanded(child: Text("${neoSaoTaskModel.body}",textAlign: TextAlign.justify,)),
            ],
          ),
        ],
      ),
    );
  }
}
