import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/surface_creation/surface_creation_bloc.dart';
//import 'src/common_functions/material_colors.dart';
//import 'src/extensions/colours.dart';


final Stopwatch globalStopwatch = Stopwatch();

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MasterSurfaceCreationBloc>(
          create: (context) => MasterSurfaceCreationBloc(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // this theme currently only drives the data picker refer function selectDate
        theme: ThemeData(
          //primarySwatch: createMaterialColor(QCIColours.backgroundDark),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.amber,
    ));
  }
}
