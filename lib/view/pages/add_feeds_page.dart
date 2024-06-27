import 'package:flutter/material.dart';

class AddFeedsPage extends StatelessWidget {
  const AddFeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        title: Text(
          'Add Feeds',
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border:
                    Border.all(color: const Color.fromARGB(255, 219, 53, 41))),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Share Post',
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
