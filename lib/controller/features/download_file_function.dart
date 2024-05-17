import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

Future<void> downloadFile(
    BuildContext context, String url, String fileName) async {
  // Show loading indicator
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: CircularProgressIndicator(),
    ),
  );

  // Get the directory to save the downloaded file
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$fileName';

  // Make the HTTP GET request
  final response = await http.get(Uri.parse(url));

  Navigator.of(context).pop(); // Close the loading dialog

  if (response.statusCode == 200) {
    // Write the file
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    print('File downloaded to $filePath');

    // Show dialog with option to open the file
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Download Completed'),
        content: Text('File downloaded to $filePath'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              OpenFilex.open(filePath);
            },
            child: Text('Open'),
          ),
        ],
      ),
    );
  } else {
    print('Failed to download file: ${response.statusCode}');
  }
}
