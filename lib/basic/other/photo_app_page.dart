import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoAPP extends StatefulWidget {
  @override
  _PhotoAPPState createState() => _PhotoAPPState();
}

class _PhotoAPPState extends State<PhotoAPP> {
  List<File> _images = [];

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _photoItem(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bottomPop(),
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _bottomPop() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[_item('拍照', true), _item('从相册选择', false)],
              ),
            ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        title: Text(title),
        leading: Icon(isTakePhoto ? Icons.photo_camera : Icons.photo_library),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  _photoItem() {
    return _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            // 圆角效果
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              file,
              width: 120,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _images.remove(file);
                });
              },
              // 圆角删除按钮
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }).toList();
  }
}
