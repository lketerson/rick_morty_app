import 'package:flutter/material.dart';

import '../extensions/extensions.dart';

Color obterCoresPorStatus(BuildContext context, String status) {
  switch (status.toLowerCase()) {
    case 'alive':
      return context.esquemaCores.primary;
    case 'dead':
      return context.esquemaCores.error;
    default:
      return context.esquemaCores.secondary;
  }
}
