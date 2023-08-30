abstract class PlayableItemCollection {
  PlayableItemCollection(
    items,
    this.name, {
    this.cover,
  }) {
    add(items);
  }

  final String name;
  final String? cover;
  final List<PlayableItemCollection> items = [];

  void add(List<PlayableItemCollection> newItems) {
    items.addAll(newItems);
  }
}

class Group extends PlayableItemCollection {
  Group(
    super.items,
    super.name, {
    super.cover,
  });
}

class Album extends PlayableItemCollection {
  Album(
    super.items,
    super.name, {
    this.year,
    super.cover,
  });

  int? year;
}
