import 'package:flutter/material.dart';

class AlivePage extends StatefulWidget {
  AlivePage({Key? key, required this.childClass}) : super(key: key);
  final Widget childClass;
  @override
  _AlivePageState createState() => _AlivePageState();
}

class _AlivePageState extends State<AlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return this.widget.childClass;
  }

  @override
  bool get wantKeepAlive => true;
}

List<Widget> getAlivePageList(List<Widget> items) {
  List<Widget> temp = [];
  for (Widget item in items) {
    temp.add(AlivePage(childClass: item));
  }
  return temp;
}
