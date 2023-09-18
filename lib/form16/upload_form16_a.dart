import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UploadForm16 extends StatefulWidget {
  const UploadForm16({super.key});

  @override
  State<UploadForm16> createState() => _UploadForm16State();
}

class _UploadForm16State extends State<UploadForm16> {

  String responseTxt = "";

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
              print("-------------");
              // print(result!.files.first.bytes);
              if (result != null) {
                uploadPDFAPI(result);
              }
            },
            child: Text("Upload PDF"),
          ),
          const SizedBox(height: 50),
          Text(responseTxt),

        ],
      ),
    );
  }

  uploadPDFAPI(FilePickerResult result) async {
    Map<String, String> headersMap = {};
    headersMap['Content-Type'] = 'multipart/form-data';
    BaseOptions options = BaseOptions(headers: headersMap);

    Dio dio = Dio(options);

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

    File file = File(result.files.single.path!);
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(result.files.single.path!),
      'Content-Type' : 'application/pdf'
    });
    final response = await dio.post('https://newdev.taxation.onefin.app/datafetchedform16', data: formData);

    setState(() {
      responseTxt = response.toString();
    });
    print("PATH => ${result.files.single.path!}");
  }
}
