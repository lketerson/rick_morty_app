import 'package:flutter/material.dart';

import '../theme/constantes.theme.dart';

extension TemaX on BuildContext {
  ThemeData get tema => Theme.of(this);

  ColorScheme get esquemaCores => tema.colorScheme;

  TextTheme get temaTexto => tema.textTheme;

  TargetPlatform get plataforma => tema.platform;

  bool get ehModoEscuro => tema.brightness == Brightness.dark;

  MediaQueryData get dadosMediaQuery => MediaQuery.of(this);

  bool get ehPaisagem => dadosMediaQuery.orientation == Orientation.landscape;

  bool get ehRetrato => dadosMediaQuery.orientation == Orientation.portrait;
}

extension EspacamentoX on BuildContext {
  Widget get espaco4 => SizedBox(
    width: ConstantesApp.espacamento4,
    height: ConstantesApp.espacamento4,
  );

  Widget get espaco8 => SizedBox(
    width: ConstantesApp.espacamento8,
    height: ConstantesApp.espacamento8,
  );

  Widget get espaco16 => SizedBox(
    width: ConstantesApp.espacamento16,
    height: ConstantesApp.espacamento16,
  );

  Widget get espaco24 => SizedBox(
    width: ConstantesApp.espacamento24,
    height: ConstantesApp.espacamento24,
  );

  Widget get espaco32 => SizedBox(
    width: ConstantesApp.espacamento32,
    height: ConstantesApp.espacamento32,
  );

  Widget get espaco48 => SizedBox(
    width: ConstantesApp.espacamento48,
    height: ConstantesApp.espacamento48,
  );
}

extension PaddingX on BuildContext {
  EdgeInsets get padding4 => EdgeInsets.all(ConstantesApp.espacamento4);

  EdgeInsets get padding8 => EdgeInsets.all(ConstantesApp.espacamento8);

  EdgeInsets get padding16 => EdgeInsets.all(ConstantesApp.espacamento16);

  EdgeInsets get padding24 => EdgeInsets.all(ConstantesApp.espacamento24);

  EdgeInsets get padding32 => EdgeInsets.all(ConstantesApp.espacamento32);

  EdgeInsets get padding48 => EdgeInsets.all(ConstantesApp.espacamento48);
}

extension RaioBordaX on BuildContext {
  BorderRadius get raio4 => BorderRadius.circular(ConstantesApp.raio4);

  BorderRadius get raio8 => BorderRadius.circular(ConstantesApp.raio8);

  BorderRadius get raio12 => BorderRadius.circular(ConstantesApp.raio12);

  BorderRadius get raio16 => BorderRadius.circular(ConstantesApp.raio16);

  BorderRadius get raio24 => BorderRadius.circular(ConstantesApp.raio24);

  BorderRadius get raioTotal => BorderRadius.circular(ConstantesApp.raioMaximo);

  BorderRadius raio(double valor) => BorderRadius.circular(valor);
}
