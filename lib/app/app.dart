import 'package:flutter/material.dart';

import 'shared/router/app.router.dart';
import 'shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick and Morty App',
      theme: temaClaro(context),
      routerConfig: roteador,
      debugShowCheckedModeBanner: false,
    );
  }
}
