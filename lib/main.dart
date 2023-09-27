import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ho Chi Minh City Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVertical = false;
  String _title = 'Ho Chi Minh city map';
  String _welcome = 'Welcome to Ho Chi Minh city';
  String _here = 'You are in District 1';
  String _locate = 'Locate';

  void _rotateScreen() {
    if (_isVertical) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    setState(() {
      _isVertical = !_isVertical;
      if (_isVertical) {
        _title = 'Carte de Ho Chi Minh-ville';
        _welcome = 'Bienvenue à Hô-Chi-Minh-Ville';
        _here = 'Vous êtes dans le District 1';
        _locate = 'Localiser';
      } else {
        _title = 'Ho Chi Minh city map';
        _welcome = 'Welcome to Ho Chi Minh city';
        _here = 'You are in District 1';
        _locate = 'Locate';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appBar = AppBar(
      title: Text(_title),
    );
    final imageSize = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _welcome,
              style: textTheme.headline5!.copyWith(
                fontSize: _isVertical ? 20 : 20,
              ),
            ),
            Image.asset(
              'assets/hochiminh.png',
              width: imageSize,
              height: imageSize,
            ),


            SizedBox(
              height: 5,
            ),
            Text(
              _here,
              style: textTheme.subtitle1!.copyWith(
                fontSize: _isVertical ? 16 : 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: _rotateScreen,
              child: Text(_locate),
            ),
          ],
        ),
      ),
    );
  }
}
