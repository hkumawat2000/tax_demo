import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UploadForm16 extends StatefulWidget {
  const UploadForm16({super.key});

  @override
  State<UploadForm16> createState() => _UploadForm16State();
}

class _UploadForm16State extends State<UploadForm16> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionTile(
        title: const Text("Upload Form 16"),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
        tilePadding: EdgeInsets.zero,
        children: [

          MaterialButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
              if (result != null) {
                File file = File(result.files.single.path!);
                uploadPDFAPI(file);
                print(result);
                print(result.files);
                print(result.files.single);
                print(result.files.single.name);
                print(result.files.single.size);
                print(result.files.single.path);

              }
            },
            child: Text("Upload PDF"),
          ),

        ],
      ),
    );
  }

  uploadPDFAPI(File file) async {
    var byte = file.readAsBytes();

    Dio dio = Dio();
    dio.interceptors.add(
      LogInterceptor(
        request: kDebugMode,
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseHeader: kDebugMode,
        responseBody: kDebugMode,
        error: kDebugMode,
      ),
    );
    Response response = await dio.post("https://newdev.taxation.onefin.app/datafetchedform16", data: {"file" : file});

    print(response);
  }
}
