import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prudential_test/utils/TextStyles.dart';
import 'package:prudential_test/utils/colors.dart';

class MyImagePickerWidget extends StatefulWidget {
  String labelText = "";

  TextEditingController textEditingController;

  MyImagePickerWidget({
    @required this.labelText,
    this.textEditingController,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new State1();
  }
}

class State1 extends State<MyImagePickerWidget> {
  File _image;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text(
          widget.labelText,
          style: Ts.robotoMedium.copyWith(
            color: Cc.black,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Cc.red_prudential,
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        _image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
        )
      ],
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = image;
    });
    if (widget.textEditingController != null) {
      List<int> imageBytes = await _image.readAsBytes();
      widget.textEditingController.text = base64Encode(imageBytes);
    }
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = image;
    });
    if (widget.textEditingController != null) {
      List<int> imageBytes = await _image.readAsBytes();
      widget.textEditingController.text = base64Encode(imageBytes);
    }
  }
}