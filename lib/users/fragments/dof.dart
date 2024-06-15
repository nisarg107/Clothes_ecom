import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysqlpractise/users/fragments/favouritefragscreen.dart';
import 'package:mysqlpractise/users/fragments/homefragscreen.dart';
import 'package:mysqlpractise/users/fragments/orderfragscreen.dart';
import 'package:mysqlpractise/users/fragments/profilefragscreen.dart';
import 'package:mysqlpractise/users/userPreferences/current_user.dart';

class DashboardOfFragments extends StatefulWidget {
  const DashboardOfFragments({super.key});

  @override
  State<DashboardOfFragments> createState() => _DashboardOfFragmentsState();
}

class _DashboardOfFragmentsState extends State<DashboardOfFragments> {
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());
  List<Widget> _fragmentScreens = [
    HomeFragScreen(),
    FavouriteFragScreen(),
    OrderFragScreen(),
    ProfileFragScreen(),
  ];

  List _navigationButtonProperties = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": Icons.favorite,
      "non_active_icon": Icons.favorite_border,
      "label": "Favorites",
    },
    {
      "active_icon": Icons.add_box,
      "non_active_icon": Icons.add_box_outlined,
      "label": "Orders",
    },
    {
      "active_icon": Icons.person,
      "non_active_icon": Icons.person_outline,
      "label": "Profile",
    },
  ];
  RxInt _indexNumber = 0.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CurrentUser(),
        initState: (currentState) {
          _rememberCurrentUser.getUserInfo();
        },
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(child: Obx(() => _fragmentScreens[_indexNumber.value]
            ,)),
            bottomNavigationBar : Obx(() => BottomNavigationBar(
              currentIndex: _indexNumber.value,
              onTap: (value){
                _indexNumber.value=value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white24,
              items:List.generate(4, (index){
               var navigationButtonProperties= _navigationButtonProperties[index];
               return BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(navigationButtonProperties["non_active_icon"]),
                activeIcon: Icon(navigationButtonProperties["active_icon"]),
                label: navigationButtonProperties["label"]
                );
              })
            )),

          );
        });
  }
}
