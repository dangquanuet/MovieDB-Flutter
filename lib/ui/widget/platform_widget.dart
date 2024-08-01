import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class PlatformWidget<iOS extends Widget, Android extends Widget>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return buildAndroidWidget(context);
    } else if (Platform.isIOS) {
      return buildIosWidget(context);
    } else {
      return buildDefaultWidget(context);
    }
  }

  iOS buildIosWidget(BuildContext context);

  Android buildAndroidWidget(BuildContext context);

  Widget buildDefaultWidget(BuildContext context);
}
