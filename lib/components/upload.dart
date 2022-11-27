import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

import 'package:podcast_app/theme/style/button_oufline.dart';
import 'package:podcast_app/theme/theme.dart';

class Upload extends StatefulWidget {
  const Upload({
    super.key,
    required this.onSuccess,
  });

  final Function(String) onSuccess;

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? file;

  handleTakePhoto() async {
    Navigator.pop(context);
    final XFile? imagePicked = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    setState(() {
      this.file = File(imagePicked!.path);
    });
  }

  handleChooseFormGallery() async {
    Navigator.pop(context);
    final XFile? imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = File(imagePicked!.path);
    });
  }

  selectImage(parentContext) {
    return showDialog<void>(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(title: Text("Upload Photo"), children: <Widget>[
            SimpleDialogOption(
                child: Text("Photo with Camera"), onPressed: handleTakePhoto),
            SimpleDialogOption(
                child: Text("Image form Gallery"),
                onPressed: handleChooseFormGallery),
            SimpleDialogOption(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
          ]);
        });
  }

  Container buildSplashScreen() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.file == null
              ? Image.asset('lib/icons/icons_google.png')
              : Image.file(this.file!),
          SizedBox(
            width: 24,
          ),
          // SvgPicture.asset('asset/images/upload.svg', height: 260.0),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
                style: buttonOutline,
                child: Text(
                  "Photo Profil",
                ),
                onPressed: () => selectImage(context)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildSplashScreen();
  }
}
