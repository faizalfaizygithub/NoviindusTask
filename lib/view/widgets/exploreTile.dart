import 'package:flutter/material.dart';
import 'package:task/model/home_model.dart';

class ExploreTile extends StatelessWidget {
  final Result result;
  const ExploreTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(result.image.toString()),
          ),
          title: Text(
            result.user!.name.toString(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
          ),
          subtitle: Text(
            result.createdAt.toString(),
            style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w500,
                fontSize: 8),
          ),
        ),
        Container(
          color: Colors.white54,
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          child: const Text('hi'),
        ),
        Text(
          result.description.toString(),
          style: TextStyle(color: Colors.white70, fontSize: 8),
        )
      ],
    );
  }
}
