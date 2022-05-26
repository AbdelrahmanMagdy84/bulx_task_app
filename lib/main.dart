import 'package:bulx_task_app/bloc/savings/cubit/savings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'bloc/cubit/animated_container_cubit.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SavingsCubit(),
          ),
          BlocProvider(
            create: (context) => AnimatedContainerCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Bulx',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.white,
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 12.h,
            ),
            canvasColor: Colors.white,
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
        ),
      );
    });
  }
}
