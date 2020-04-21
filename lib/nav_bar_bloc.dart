import 'package:bottom_navigation/nav_bar_event.dart';
import 'package:bottom_navigation/nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  int currentIndex = 0;

  @override
  NavBarState get initialState => PageLoading();

  @override
  Stream<NavBarState> mapEventToState(NavBarEvent event) async* {
    if (event is HomeStarted) {
      this.add(MenuTapped(index: this.currentIndex));
    }

    if (event is MenuTapped) {
      this.currentIndex = event.index;
      print('index = ${this.currentIndex}');
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (currentIndex == 0) {
        yield FirstPageLoaded();
      } else {
        yield SecondPageLoaded();
      }
    }
  }
}
