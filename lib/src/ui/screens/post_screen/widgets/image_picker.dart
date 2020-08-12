part of '../post_screen.dart';

class _ImagePicker extends StatefulWidget {
  @override
  __ImagePickerState createState() => __ImagePickerState();
}

class __ImagePickerState extends State<_ImagePicker> {
  bool get hasImage => imageFile != null;

  File imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickImage,
      child: Container(
        color: Theme.of(context).accentColor.withOpacity(0.1),
        height: MediaQuery.of(context).size.height / 3,
        child: hasImage
            ? Image.file(imageFile)
            : Center(
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
      ),
    );
  }

  void pickImage() {}
}
