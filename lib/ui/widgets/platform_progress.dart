import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedb_flutter/ui/widgets/platform_widget.dart';

class PlatformProgress extends PlatformWidget<CupertinoActivityIndicator,
    CircularProgressIndicator> {
  @override
  CircularProgressIndicator createAndroidWidget(BuildContext context) {
    return CircularProgressIndicator();
  }

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) {
    return CupertinoActivityIndicator();
  }

  @override
  Widget createDefaultWidget(BuildContext context) {
    return CircularProgressIndicator();
  }
}
