import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Debjit Chakraborty'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FocusNode _focusNode = FocusNode();
  String dropdownValue = 'One';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            'Debjit Chakraborty',
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 18,
            onPressed: () {},
            icon: Icon(Zocial.github),
          ),
          IconButton(
            iconSize: 15,
            onPressed: () {},
            icon: Icon(Zocial.twitter),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Entypo.menu),
          ),
          GestureDetector(
            child: Icon(Icons.arrow_drop_down_circle),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButton<String>(
                  focusNode: _focusNode,
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: Colors.deepPurple
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                    .toList(),
                ),
              ),
              Container(
                height: 400.0,
                color: Colors.black,
              ),
              Container(
                height: 400.0,
                color: Colors.yellow,
              ),
              Container(
                height: 400.0,
                color: Colors.orange,
              ),
              Container(
                height: 400.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
