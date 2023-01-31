// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatroom/common/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:chatroom/widgets/glowing_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:chatroom/utilis/global_variable.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  void _onNavigationItemSelected(index) {
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return homeScreenItems[value];
          },
        ),
        bottomNavigationBar:
            BottomNavigationBar(onItemSelected: _onNavigationItemSelected),
      ),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;

  const BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<BottomNavigationBar> createState() => __BottomNavigationBarState();
}

class __BottomNavigationBarState extends State<BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      color: Theme.of(context).cardColor,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationBarItem(
                index: 0,
                lable: 'Messages',
                icon: CupertinoIcons.chat_bubble_2_fill,
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelected,
                color: Theme.of(context).primaryColor,
              ),
              NavigationBarItem(
                index: 1,
                lable: 'Calls',
                icon: Ionicons.call,
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelected,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GlowingActionButton.def(
                  color: Theme.of(context).primaryColor,
                  icon: CupertinoIcons.add,
                  onPressed: () {
                    Navigator.pushNamed(context, SelectContactScreen.routeName);
                  },
                ),
              ),
              NavigationBarItem(
                index: 2,
                lable: 'Status',
                icon: Ionicons.logo_tableau,
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelected,
                color: Theme.of(context).primaryColor,
              ),
              NavigationBarItem(
                index: 3,
                lable: 'Settings',
                icon: CupertinoIcons.settings,
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelected,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  final int index;
  final String lable;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;
  final Color color;
  const NavigationBarItem({
    Key? key,
    required this.index,
    required this.lable,
    required this.icon,
    this.isSelected = false,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? color : null,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              lable,
              style: isSelected
                  ? TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    )
                  : const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
