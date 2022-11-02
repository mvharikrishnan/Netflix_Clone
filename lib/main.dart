import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/domain/downloads/core/di/injectable.dart';
import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>getIt <DownloadsBloc>()),
        BlocProvider(create: (context) =>getIt <SearchBloc>()),
        BlocProvider(create: (context) =>getIt <FastLaughBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix App',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white)),
          primarySwatch: Colors.blue,
        ),
        home: const ScreenMainPage(),
      ),
    );
  }
}
