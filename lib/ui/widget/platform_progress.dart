import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedb_flutter/ui/widget/platform_widget.dart';

class PlatformProgress extends PlatformWidget<CupertinoActivityIndicator,
    CircularProgressIndicator> {
  @override
  CircularProgressIndicator buildAndroidWidget(BuildContext context) {
    return CircularProgressIndicator();
  }

  @override
  CupertinoActivityIndicator buildIosWidget(BuildContext context) {
    return CupertinoActivityIndicator();
  }

  @override
  Widget buildDefaultWidget(BuildContext context) {
    return CircularProgressIndicator();
  }
}
