sealed class UserEvent{}

class GetUsers extends UserEvent{}

class ToggleUserLike extends UserEvent {
  final int index;

  ToggleUserLike({required this.index});
}


