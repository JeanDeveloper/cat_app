import 'package:flutter/material.dart';
import 'package:myapp/di.dart';
import 'package:myapp/presentation/blocs/cat/cat_bloc.dart';
import 'package:myapp/presentation/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => GetIt.instance.get<CatBloc>()),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cat App',
        theme: ThemeData(
          textTheme: GoogleFonts.oswaldTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
