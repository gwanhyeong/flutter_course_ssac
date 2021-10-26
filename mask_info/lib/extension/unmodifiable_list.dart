import 'dart:collection';

extension UnmodifiableList<T> on List<T> {
  UnmodifiableListView<T> toUnmodifiableList() {
    return UnmodifiableListView(this);
  }
}
