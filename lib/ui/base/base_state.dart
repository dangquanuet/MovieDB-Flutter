import 'package:flutter/widgets.dart';
import 'package:moviedb_flutter/ui/base/base_bloc.dart';
import 'package:moviedb_flutter/ui/base/bloc_provider.dart';

abstract class BaseState<Widget extends StatefulWidget, Bloc extends BaseBloc>
    extends State<Widget> {
  Bloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<Bloc>(context);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
