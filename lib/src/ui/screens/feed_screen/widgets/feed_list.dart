part of "../feed_screen.dart";

class _FeedList extends StatelessWidget {
  int get itemCount => 12;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(context),
      child: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      ),
    );
  }

  Future<void> onRefresh(BuildContext context) async {}

  Widget itemBuilder(BuildContext context, int index) {
    return PostTile();
  }
}
