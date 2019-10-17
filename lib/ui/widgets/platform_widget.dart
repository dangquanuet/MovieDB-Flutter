import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class PlatformWidget<iOS extends Widget, Android extends Widget>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return createAndroidWidget(context);
    } else if (Platform.isIOS) {
      return createIosWidget(context);
    } else {
      return createDefaultWidget(context);
    }
  }

  iOS createIosWidget(BuildContext context);

  Android createAndroidWidget(BuildContext context);

  Widget createDefaultWidget(BuildContext context);
}
