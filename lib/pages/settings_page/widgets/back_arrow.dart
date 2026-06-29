import 'package:flutter/material.dart';
import 'package:quiz_app_front/pages/main_page.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 50, left: 20),

    child: Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
        ),
      ),
    ),
  );
}
