import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class Upload extends StatefulWidget {
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
      color: Theme.of(context).accentColor.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('asset/images/upload.svg', height: 260.0),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
                child: Text(
                  "Photo Profil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
                onPressed: () => selectImage(context)),
          ),
        ],
      ),
    );
  }

  buildUploadForm() {
    return Text("File Loaded");
  }

  @override
  Widget build(BuildContext context) {
    return file == null ? buildSplashScreen() : buildUploadForm();
  }
}
