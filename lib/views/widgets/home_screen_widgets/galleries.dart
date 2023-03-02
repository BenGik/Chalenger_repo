// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_storage_path/flutter_storage_path.dart';


// class GalleriesPage extends StatefulWidget {
//   @override
//   _GalleriesPageState createState() => _GalleriesPageState();
// }

// class _GalleriesPageState extends State<GalleriesPage> {
//   List<dynamic> _files = [];
//   dynamic _selectedModel;

//   @override
//   void initState() {
//     super.initState();
//     getImagesPath();
//   }
//   getImagesPath() async {
//     if (_files.isNotEmpty)
//       setState(() {
//         _selectedModel = _files[0];
//       });
//     var imagePath = StoragePath.imagesPath.toString();
//     var images = jsonDecode(imagePath) as List;
//     _files = images.map<dynamic>((e) => dynamic).toList();
    
//   }

//   Future<String> getVideoPath() async {
//     String videoPath = "";
//     try {
//       videoPath = StoragePath.videoPath.toString();
//     } on PlatformException {
//       videoPath = 'Failed to get path';
//     }
//     return videoPath;
//   }

//   Future<String> getAudioPath() async {
//     String audioPath = "";
//     try {
//       audioPath = StoragePath.audioPath.toString();
//     } on PlatformException {
//       audioPath = 'Failed to get path';
//     }
//     return audioPath;
//   }

//   Future<String> getFilePath() async {
//     String filePath = "";
//     try {
//       filePath = StoragePath.filePath.toString();
//     } on PlatformException {
//       filePath = 'Failed to get path';
//     }
//     return filePath;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: _selectedModel == null ||
//                 (_selectedModel != null && _selectedModel.files.length < 1)
//             ? Container()
//             : GridView.builder(
//                 itemCount: _selectedModel.files.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4,
//                   crossAxisSpacing: 4,
//                   mainAxisSpacing: 4,
//                 ),
//                 itemBuilder: (_, i) {
//                   var file = _selectedModel.files[i];
//                   return Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5)
//                     ),
//                     child: Image.file(
//                       File(file),
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }