import 'package:bottom_navigation/nav_bar_bloc.dart';
import 'package:bottom_navigation/nav_bar_event.dart';
import 'package:bottom_navigation/nav_bar_state.dart';
import 'package:bottom_navigation/ui/second_page.dart';
import 'package:bottom_navigation/ui/first_page.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavBarBloc navBarBloc = BlocProvider.of<NavBarBloc>(context);

    return Scaffold(
      backgroundColor: Color(0xFF285993),
      body: BlocBuilder(
        bloc: navBarBloc,
        builder: (BuildContext context, NavBarState state){
          if(state is PageLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is FirstPageLoaded){
            return FirstPage();
          }
          if(state is SecondPageLoaded){
            return SecondPage();
          }
          return Container();
        },
      ),
        bottomNavigationBar: BlocBuilder(
          bloc: navBarBloc,
          builder: (BuildContext context, NavBarState state){
            return BottomNavyBar(
              backgroundColor: Color(0xFF285993),
              selectedIndex: navBarBloc.currentIndex,
              onItemSelected: (index) => navBarBloc.add(MenuTapped(index: index)),
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Page 1'),
                  textAlign: TextAlign.center,
                  activeColor: Color(0xFFFFA816),
                  inactiveColor: Color(0xFFFFFFFF),
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.supervised_user_circle),
                  title: Text('Page 2'),
                  textAlign: TextAlign.center,
                  activeColor: Color(0xFFFFA816),
                  inactiveColor: Color(0xFFFFFFFF),
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.airline_seat_recline_normal),
                  title: Text('Page 3'),
                  textAlign: TextAlign.center,
                  activeColor: Color(0xFFFFA816),
                  inactiveColor: Color(0xFFFFFFFF),
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Page 4'),
                  textAlign: TextAlign.center,
                  activeColor: Color(0xFFFFA816),
                  inactiveColor: Color(0xFFFFFFFF),
                ),
              ],
            );
          },
        )
    );
  }
}
