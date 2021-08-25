import 'package:flutter/material.dart';
import 'package:premade_widgets/premade_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Widget> pages=[MyHomePage(title: 'Page 1'), ButtonPage(),ButtonThree()];
  final List<BottomNavigationBarItem> itemList= [BottomNavigationBarItem(icon:Icon(Icons.home), label: 'Page1'), 
  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Page 2'),
  BottomNavigationBarItem(icon: Icon(Icons.bathtub),label: 'Page 3')];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: NavBar(currentIndex: 0, pages: pages,navbarIcons: itemList,)
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
class ButtonPage extends StatefulWidget {
  const ButtonPage({ Key? key }) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TapChangeButton(beforeTap: 'Hit Me!',afterTap: "You're Strong",),
      
    );
  }
}
class ButtonThree extends StatelessWidget {
  const ButtonThree({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: TapChangeButton(afterTap: "You're strong too",beforeTap: "Bring it!",),),
      
    );
  }
}