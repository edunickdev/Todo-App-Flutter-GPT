import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  static const String routeName = '/start';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("App TODO con ChatGPT-3.5", style: TextStyle(fontSize: 30, overflow: TextOverflow.ellipsis)),
            const SizedBox(height: 60),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  context.push('/main');
                },
                child: const Text("Ingresar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
