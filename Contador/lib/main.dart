import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/imagem.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Text(
                 isFull ? 'Lotado': 'Pode entrar!',
                 style: TextStyle(
                   fontSize: 30,
                   color: Colors.white,
                   fontWeight: FontWeight.w700,
                 ),
              ),
              Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 50,
                    color: isFull ? Colors.red : Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: increment,
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.2): Colors.white,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )
                    ),
                    child:
                      Text( 'Entrou',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                    ),
                  ),
                  SizedBox(width: 32),
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty ? Colors.white.withOpacity(0.2): Colors.white,
                        fixedSize: const Size(100, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )
                    ),
                    child:
                      Text( 'Saiu',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
