import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme/bloc/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Event Payload',
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          home: MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'change Theme',
            style: TextStyle(fontSize: 24.0),
          ),
          onPressed: () {
            final int randInt = Random().nextInt(10);
            print('randInt: $randInt');
            //버튼 클릭시 이벤트 호ㄹ
            context.read<ThemeBloc>().add(ChangeThemeEvent(randInt: randInt));
          },
        ),
      ),
    );
  }
}
