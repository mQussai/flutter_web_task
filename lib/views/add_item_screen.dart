import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          leadingWidth: 120,
          leading: Row(
            children: [
              const SizedBox(width: 80),
              CircleAvatar(
                backgroundColor: const Color(0xFF171717),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
              ),
            ],
          )),
      body: const Center(
        child: Text(
          "Add Item Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
