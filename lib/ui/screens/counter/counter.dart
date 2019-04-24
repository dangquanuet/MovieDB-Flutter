import 'package:flutter/material.dart';
import 'package:moviedb_flutter/ui/screens/counter/counter_bloc.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  CounterBloc _counterBloc = CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              StreamBuilder(
                  stream: _counterBloc.counterObservable,
                  builder: (context, AsyncSnapshot<int> snapshot) {
                    return Text('${snapshot.data}',
                        style: Theme.of(context).textTheme.display1);
                  })
            ],
          ),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
                onPressed: _counterBloc.increment,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              )),
          FloatingActionButton(
            onPressed: _counterBloc.decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ]));
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
