part of "../post_screen.dart";

class _PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.0),
      child: Center(
        child: ButtonTheme(
          minWidth: 115,
          height: 35,
          textTheme: ButtonTextTheme.accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: RaisedButton(
            elevation: 1.0,
            color: Theme.of(context).primaryColor,
            onPressed: () => onPost(context),
            child: Text(
              "Post",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  onPost(BuildContext context) {}
}
