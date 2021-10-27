import 'package:flutter/material.dart';
import '../widgets/responsive.dart';
import '../data/data.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bar.dart';
import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> widgets = const [HomeScreen(), Scaffold(), Scaffold()];

  List<IconData> icons = const [Icons.home, Icons.ondemand_video, Icons.menu];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  child: CustomApBar(
                    selectedIndex: _selectedIndex,
                    icons: icons,
                    currentUser: currentUser,
                    onTaped: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                  preferredSize: const Size.fromHeight(100.0))
              : const PreferredSize(
                  child: SizedBox.shrink(),
                  preferredSize: Size.fromHeight(0.0)),
          body: IndexedStack(
            children: [widgets[_selectedIndex]],
            index: _selectedIndex,
          ),
          bottomNavigationBar: !Responsive.isDesktop(context)
              ? CustomTabBar(
                  icons: icons,
                  selectedIndex: _selectedIndex,
                  onTaped: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                )
              : const SizedBox.shrink(),
        ));
  }
}
