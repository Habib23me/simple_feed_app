import 'package:flutter/material.dart';
import 'package:simple_feed/src/ui/widgets/post_tile/post_tile.dart';

import '../../../data/auth/bloc/auth_bloc.dart';
import '../../../util/setup/dependency_injector.dart';

part 'widgets/feed_list.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Feed"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              getIt<AuthenticationBloc>().signOut();
            },
          ),
        ],
      ),
      body: _FeedList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => onShare(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void onShare(BuildContext context) {}
}
