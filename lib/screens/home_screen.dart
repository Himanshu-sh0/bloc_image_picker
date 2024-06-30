import 'dart:io';

import 'package:bloc_image_picker/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_image_picker/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_image_picker/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              return Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: state.file == null
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.hide_image_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            "No Image",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    : Image.file(File(state.file!.path.toString())),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  context.read<ImagePickerBloc>().add(CameraCaptureEvent());
                },
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                icon: const Icon(Icons.photo),
                onPressed: () {
                  context
                      .read<ImagePickerBloc>()
                      .add(GalleryImagePickerEvent());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
