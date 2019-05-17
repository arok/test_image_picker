import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  var path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page2'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('$path'),
          RaisedButton(
              child: Text('Click me'),
              onPressed: () async {
                var path = await showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        cancelButton: CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.pop(context, null),
                          child: Text('Cancel'),
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () async {
                              var result = await ImagePicker.pickImage(source: ImageSource.camera,);
                              Navigator.pop(context, result);
                            },
                            child: Text('Camera'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () async {
                              var result = await ImagePicker.pickImage(source: ImageSource.gallery,);
                              Navigator.pop(context, result);
                            },
                            child: Text('Gallery'),
                          )
                        ],
                      );
                    }
                );
                setState(() {
                  this.path = 'hello';
                });
              }),
        ],
      ),
    );
  }
}
