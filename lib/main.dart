import "package:flutter/material.dart";
import "config/router/routing_widget.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "TODO APP",
      theme: ThemeData(
        colorSchemeSeed: Colors.amber[200]
      ),
      routerConfig: router,
    );
  }
}
