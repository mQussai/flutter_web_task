abstract class HomeEvent {}

class HomeTabChanged extends HomeEvent {
  HomeTabChanged(this.tab);
  int tab;
}
