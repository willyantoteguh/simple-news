import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_news/ui/pages/pages.dart';
import 'bloc/blocs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      ScreenUtil.init(constraints,
          orientation: Orientation.portrait,
          designSize: Size(720, 1600),
          allowFontScaling: false);

      return MultiBlocProvider(
        providers: [
          // BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => NewsBloc()..add(FetchNews()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          // home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      );
    });
  }
}
