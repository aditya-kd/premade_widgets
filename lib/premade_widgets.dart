library premade_widgets;

import 'package:flutter/material.dart';

import 'navigationBar.dart';

class MinMade {
  String monthName(int number) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'Decemeber'
    ];
    return months[number - 1];
  }
}

class TapChangeButton extends StatefulWidget {
  const TapChangeButton(
      {Key? key, required this.beforeTap, required this.afterTap})
      : super(key: key);
  final String beforeTap, afterTap;
  @override
  _TapChangeButtonState createState() => _TapChangeButtonState();
}

class _TapChangeButtonState extends State<TapChangeButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print('Pressed');
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: isPressed
            ? Text('${widget.afterTap}')
            : Text('${widget.beforeTap}'));
  }
}

class PowerTile extends StatelessWidget {
  final String? line3;
  PowerTile({
    Key? key,
    required this.title,
    required this.line2,
    this.line3,
  }) : super(key: key);
  final String title;
  final String line2;

  @override
  Widget build(BuildContext context) {
    String thirdLine = line3.toString();

    return ListTile(
      isThreeLine: true,
      title: Text('${this.title}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          space3dpi(),
          Text(
            this.line2,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          space3dpi(),
          Text('$thirdLine'),
        ],
      ),
    );
  }
}

Widget space3dpi() => SizedBox(
      height: 3,
    );

class NavBar extends StatefulWidget {
  NavBar({
    Key? key,
    required this.pages,
    required this.navbarIcons,
    required this.currentIndex,
    this.unselectedItemColor,
    this.selectedItemColor,
  }) : super(key: key);

  final List<Widget> pages;
  final Color? unselectedItemColor;
  final Color? selectedItemColor;
  final int currentIndex;
  final List<BottomNavigationBarItem> navbarIcons;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  PageController _controller = new PageController();
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTap(int index) {
    _controller.animateToPage(index,
        duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = getAlivePageList(this.widget.pages);
    return SafeArea(
        child: Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTap,
        currentIndex: _selectedIndex,
        selectedItemColor: this.widget.selectedItemColor,
        unselectedItemColor: this.widget.unselectedItemColor,
        items: this.widget.navbarIcons,
      ),
    ));
  }
}
