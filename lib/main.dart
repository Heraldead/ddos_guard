import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Navigator.of(context).pushReplacementNamed('/second');
      routes: {
        '/': (context) => LoginPage(),
      },
      initialRoute: '/',
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    _getHeader(),
                    Verify(),
                    _getSignIn(),
                    SizedBox(
                      height: 70,
                    )
                    // _getBottomRow(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_getHeader() {
  return Expanded(
    flex: 2,
    child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.bottomLeft,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('images/ddos1.png'),
              ),
              Text(
                'DDOS GUARD',
                style: TextStyle(fontStyle: FontStyle.italic),
              )
            ],
          ),
        )),
  );
}

class Verify extends StatefulWidget {
  Verify({Key key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextField(
            keyboardAppearance: Brightness.dark,
            keyboardType: TextInputType.emailAddress,
            controller: name,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),

              // fillColor: ,,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'Логин',
              labelStyle: TextStyle(color: Colors.grey),
              focusColor: Colors.red,
              fillColor: Colors.red,

              // fillColor: ,
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            toolbarOptions: ToolbarOptions(
              copy: false,
              paste: false,
              cut: false,
            ),
            obscuringCharacter: '*',
            obscureText: true,
            keyboardAppearance: Brightness.dark,
            controller: surname,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              labelText: 'Пароль',
              labelStyle: TextStyle(color: Colors.grey),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

_getSignIn() {
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Вход',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        Button()
      ],
    ),
  );
}

class Button extends StatefulWidget {
  const Button({Key key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  long_press() {
    return print('Long');
  }

  second_widget() {
    final name = Verify();
    return print('Press');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: second_widget,
        onLongPress: long_press,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                    side: BorderSide(color: Colors.blue)))),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 30,
        ),
      ),
    );
  }
}

// _getBottomRow() {
//   return Expanded(
//     flex: 1,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Text(
//           'Регистрация',
//           style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w500,
//               decoration: TextDecoration.underline),
//         ),
//         Text(
//           'Забыли пароль',
//           style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w500,
//               decoration: TextDecoration.underline),
//         )
//       ],
//     ),
//   );
// }

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey[900];
    canvas.drawPath(mainBackground, paint);

    // RED
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.grey[500];
    canvas.drawPath(blueWave, paint);

    // BLUE
    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.2);
    greyWave.cubicTo(
        sw * 2, sh * 0.1, sw * 0.7, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.6, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    greyWave.close();
    paint.color = Colors.white;
    canvas.drawPath(greyWave, paint);

    // WHITE
    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = Colors.blue;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
