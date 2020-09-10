import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar_covid_clone/core/controllers/home_controller.dart';
import 'package:radar_covid_clone/ui/exposition/exposition_screen.dart';
import 'package:radar_covid_clone/ui/more_info/more_info_screen.dart';
import 'package:radar_covid_clone/ui/privacy/privacy_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomeController>(
        builder: (homeController) {
          return IndexedStack(
            index: homeController.indexSelected.value,
            children: [
              ExpositionScreen(),
              PrivacyScreen(),
              MoreInfoScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: _BottomAppBar(),
    );
  }
}

class _BottomAppBar extends StatefulWidget {
  const _BottomAppBar({
    Key key,
  }) : super(key: key);

  @override
  __BottomAppBarState createState() => __BottomAppBarState();
}

class __BottomAppBarState extends State<_BottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: GetX<HomeController>(
            builder: (controller) => BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              onTap: (value) {
                controller.setIndex(value);
              },
              currentIndex: controller.indexSelected.value,
              items: [
                BottomNavigationBarItem(
                  icon:
                      ImageIcon(AssetImage("assets/images/home_menu_icon.png")),
                  title: Container(),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/images/privacy_menu_icon.png")),
                  title: Container(),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/images/more_info_menu_icon.png")),
                  title: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
