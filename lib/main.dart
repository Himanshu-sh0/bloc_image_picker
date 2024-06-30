import 'package:bloc_image_picker/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_image_picker/screens/home_screen.dart';
import 'package:bloc_image_picker/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImagePickerBloc(ImagePickerUtils()),
      child: MaterialApp(
        title: 'Bloc Image Picker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(title: "Image Picker"),
      ),
    );
  }
}
