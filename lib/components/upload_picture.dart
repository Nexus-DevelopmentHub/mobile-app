import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:podcast_app/data/user_provider.dart';
import 'package:podcast_app/theme/style/button_oufline.dart';
import 'package:provider/provider.dart';

class UploadProfilePictureComponent extends StatefulWidget {
  const UploadProfilePictureComponent({
    super.key,
    required this.onSuccess,
  });

  final Function(String) onSuccess;

  @override
  State<UploadProfilePictureComponent> createState() =>
      _UploadProfileComponentState();
}

class _UploadProfileComponentState
    extends State<UploadProfilePictureComponent> {
  File? file;

  uploadImage() {
    if (file == null) {
      //stop!! because file not set
      return;
    }
    context.read<UserProvider>().uploadProfilePicture(file!).then((value) => {
          if (value.success) {widget.onSuccess("")},
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.message)))
        });
  }

  handleTakePhoto() async {
    Navigator.pop(context);
    final XFile? imagePicked = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    setState(() {
      file = File(imagePicked!.path);
    });
    uploadImage();
  }

  handleChooseFormGallery() async {
    Navigator.pop(context);
    final XFile? imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(imagePicked!.path);
    });
    uploadImage();
  }

  selectImage(parentContext) {
    return showDialog<void>(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
              title: const Text("Upload Photo"),
              children: <Widget>[
                SimpleDialogOption(
                    onPressed: handleTakePhoto,
                    child: const Text("Photo with Camera")),
                SimpleDialogOption(
                    onPressed: handleChooseFormGallery,
                    child: const Text("Image form Gallery")),
                SimpleDialogOption(
                  child: const Text("Cancel"),
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
          file == null
              ? Image.asset(
                  'lib/icons/Avatar2.png',
                  width: 98,
                  height: 98,
                )
              : Image.file(
                  file!,
                  width: 98,
                  height: 98,
                ),
          const SizedBox(
            width: 24,
          ),
          // SvgPicture.asset('asset/images/upload.svg', height: 260.0),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
                style: buttonOutline,
                child: const Text(
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
