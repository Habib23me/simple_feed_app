import 'package:flutter/material.dart';
import 'package:simple_feed/src/data/post/model/post_populated.dart';

class PostTile extends StatelessWidget {
  final PostPopulatedData _post;
  String get profilePicture =>
      "https://images.unsplash.com/photo-1597072622260-42c5db534535?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80";
  String get postPicture =>
      "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80";
  String get name => "Giorgio Trovato";
  String get username => "giorgiotrovato";
  String get timeOfPost => "5 min ago";
  int get likes => 609;
  bool get isLiked => false;
  String get caption =>
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do elusmode tempor incididunt";
  const PostTile({Key key, @required PostPopulatedData post})
      :
        // : assert(post != null),
        _post = post,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              postPicture,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                profilePicture,
              ),
            ),
            title: Text(
              "$name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("$username . $timeOfPost"),
            trailing: ButtonTheme(
              child: TextButton.icon(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                onPressed: onLike,
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).textTheme.headline5.color,
                ),
                label: Text(
                  "$likes",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline5.color,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
            child: Text(
              "$caption",
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 14,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void onLike() {}
}
