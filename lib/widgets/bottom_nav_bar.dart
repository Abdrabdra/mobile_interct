// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../data/constants/colors.dart';
import '../data/constants/textStyles.dart';
import 'bottom_nav_items.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.maxWidth,
    required this.selectedIndex,
  }) : super(key: key);
  final double maxWidth;
  final int selectedIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedI = 0;
  double itemSelectorWidth = 32;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedI = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = ((widget.maxWidth - 24) / 5);
    double marginSelectedItem = (itemWidth - itemSelectorWidth) / 4;
    // print(itemWidth);
    // print(marginSelectedItem);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
        // color: Colors.yellow,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFF333333)),
            child: Stack(
              children: [
                // animasia pod ikonkami kak budto ten'
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                  height: 40.0,
                  width: 32,
                  margin: EdgeInsets.only(
                      top: 2,
                      left: (selectedI == 0
                              ? MediaQuery.of(context).size.width * 0.0
                              : itemWidth * selectedI) +
                          marginSelectedItem * 2),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    // color: Colors.yellow,
                    // borderRadius: BorderRadius.circular(20.0),
                    // shape: BoxShape.,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(45, 195, 106, 0.3),
                        Color.fromRGBO(45, 195, 106, 0),
                        // Color.fromARGB(0, 49, 209, 113),
                        // Color(0xFF333333),
                        // Colors.yellow,
                      ],
                      // stops: [0.1, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.repeated,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(7, 40),
                        topRight: Radius.elliptical(7, 40)),
                    // image: DecorationImage(
                    //   image: AssetImage('images/shadow_trapedia.png'),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Column(
                  children: [
                    // dvijok opredelyauwii selected/unselected
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                          color: Colors.transparent,
                          alignment: Alignment.topLeft,
                          width: selectedI == 0
                              ? MediaQuery.of(context).size.width * 0.0
                              :
                              // itemSelectorWidth * selectedI,
                              itemWidth * selectedI,
                          // itemWidth,
                          height: 3.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: marginSelectedItem),
                        ),
                        Flexible(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                            width: itemSelectorWidth,
                            height: 3.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: color_green,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ////// icons of nav bar
                    Expanded(
                      child: Container(
                        // margin: const EdgeInsets.only(top: 0.0),
                        child: BottomNavigationBar(
                          backgroundColor: Colors.transparent,
                          currentIndex: selectedI,
                          selectedItemColor: Colors.white,
                          unselectedItemColor: const Color(0xFF878787),
                          type: BottomNavigationBarType.fixed,
                          onTap: (value) {
                            setState(() {
                              value != 2 ? selectedI = value : null;
                              if (value == 0) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              }
                              if (value == 1) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/likesPage');
                              }
                              if (value == 2) {
                                Navigator.of(context)
                                    .pushNamed('/podachaObyavlenie');
                              }
                              if (value == 3) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/chatList');
                              }
                              if (value == 4) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/profile');
                              }
                            });
                          },
                          showUnselectedLabels: false,
                          showSelectedLabels: true,
                          // selectedLabelStyle: const TextStyle(
                          //   fontSize: 10,
                          //   fontWeight: FontWeight.w600,
                          //   letterSpacing: 0.5,
                          // ),
                          selectedLabelStyle: tsf4_10_600_05,
                          iconSize: 22,
                          items: navItems.map((it) {
                            return it;
                          }).toList(),
                          selectedIconTheme: IconThemeData(size: 26),
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 5.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: items.map((item) {
                    //         int index = items.indexOf(item);
                    //         return Flexible(
                    //           child: GestureDetector(
                    //             onTap: () {
                    //               setState(() {
                    //                 selectedI = items.indexOf(item);
                    //               });
                    //             },
                    //             child: Container(
                    //               color: Colors.transparent,
                    //               child: item.icon,
                    //             ),
                    //           ),
                    //         );
                    //       }).toList(),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    //  Container(
    //   width: double.infinity,
    //   height: 56,
    //   padding: EdgeInsets.only(
    //       top: this.navBarEssentials!.padding?.top ?? 0.0,
    //       left: this.navBarEssentials!.padding?.left ??
    //           MediaQuery.of(context).size.width * 0.05,
    //       right: this.navBarEssentials!.padding?.right ??
    //           MediaQuery.of(context).size.width * 0.05,
    //       bottom: this.navBarEssentials!.padding?.bottom ??
    //           this.navBarEssentials!.navBarHeight! * 0.1),
    //   child: Column(
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           AnimatedContainer(
    //             duration:
    //                 this.navBarEssentials!.itemAnimationProperties?.duration ??
    //                     Duration(milliseconds: 300),
    //             curve: this.navBarEssentials!.itemAnimationProperties?.curve ??
    //                 Curves.ease,
    //             color: Colors.transparent,
    //             width: this.navBarEssentials!.selectedIndex == 0
    //                 ? MediaQuery.of(context).size.width * 0.0
    //                 : itemSelectorWidth * this.navBarEssentials!.selectedIndex!,
    //             height: 4.0,
    //           ),
    //           Flexible(
    //             child: AnimatedContainer(
    //               duration: this
    //                       .navBarEssentials!
    //                       .itemAnimationProperties
    //                       ?.duration ??
    //                   Duration(milliseconds: 300),
    //               curve:
    //                   this.navBarEssentials!.itemAnimationProperties?.curve ??
    //                       Curves.ease,
    //               width: itemSelectorWidth,
    //               height: 4.0,
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(
    //                 color: selectedItemActiveColor,
    //                 borderRadius: BorderRadius.circular(100.0),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.only(top: 5.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: this.navBarEssentials!.items!.map((item) {
    //               int index = this.navBarEssentials!.items!.indexOf(item);
    //               return Flexible(
    //                 child: GestureDetector(
    //                   onTap: () {
    //                     if (this.navBarEssentials!.items![index].onPressed !=
    //                         null) {
    //                       this.navBarEssentials!.items![index].onPressed!(this
    //                           .navBarEssentials!
    //                           .selectedScreenBuildContext);
    //                     } else {
    //                       this.navBarEssentials!.onItemSelected!(index);
    //                     }
    //                   },
    //                   child: Container(
    //                     color: Colors.transparent,
    //                     child: _buildItem(
    //                         item,
    //                         this.navBarEssentials!.selectedIndex == index,
    //                         this.navBarEssentials!.navBarHeight),
    //                   ),
    //                 ),
    //               );
    //             }).toList(),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
