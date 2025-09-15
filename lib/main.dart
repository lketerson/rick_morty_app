import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/core/injection/injection.dart';

void main() {
  registrarDependencias();
  runApp(const MyApp());
}
