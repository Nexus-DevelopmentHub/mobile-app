import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Upload extends StatefulWidget {
    @override
    _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
    File file;

    handleTakePhoto(){
        Navigator.pop(context);
        await ImagePicker.pickImage(source: ImageSource.camera,
        maxHeight: 675,
        maxWidth: 960,);
        setState((){
            this.file = file; 
        });
    }

    handleChooseFormGallery() async {
        Navigator.pop(context);
         File file = await ImagePicker.pickImage(source: ImageSource.gallery);
         setState((){
            this.file = file; 
        });
    }

    selectImage(parentContext){
        return showDiaglog(
            context: parentContext,
            builder: (context) {
                return SimpleDialog(
                    title : Text ("Create Post"),
                    children : <Widget>[
                        SimpleDialogOption(
                            child: Text("Photo with Camera")
                            onPressed: handleTakePhoto
                        ),
                        SimpleDialogOption(
                            child: Text("Image form Gallery")
                            onPressed: handleChooseFormGallery
                        ),
                        SimpleDialogOption(
                            child: Text("Cancel")
                            onPressed:() => Navigator.pop(context),
                        ), 
                    ]
                );
            }
        );
    }

    Container buildSplashScreen() {
        return Container(
            color: Theme.of(context).accentColor.withOpacity(0.6),
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    SvgPicture.asset('asset/images/upload.svg',height:260.0),
                    Padding(
                        padding: EdgeInsets.only(top:20.0),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                                "Upload Image",
                                style : TextStyle(
                                    color: Colors.white,
                                    fontSize:22.0,
                                ),
                            ),
                            color: Colors.deepOrange,
                            onPressed: () => selectImage(context)
                        ), ),
                ],
            ),
        );
    };

    buildUploadForm() {
        return Text("File Loaded");
    }
     
       @override
    Widget build(BuildContext context) {
     return file == null? buildSplashScreen(): buildUploadForm();
    }
}

