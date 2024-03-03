import 'package:flutter/material.dart';
class ScrollBehavior1 extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    // Utilisez ClampingScrollPhysics avec un coefficient de friction pour réduire la taille de la barre de défilement.
    return ClampingScrollPhysics( // Ajustez le coefficient de friction selon vos préférences.
      parent: BouncingScrollPhysics(),
    );
  }
}