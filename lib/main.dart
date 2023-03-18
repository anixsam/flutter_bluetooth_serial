import 'package:boat_control/providers/bluetooth_state.dart';
import 'package:boat_control/screens/bluetooth_selection.dart';
import 'package:boat_control/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BluetoothConnectionState()),
      ],
      child: MyApp(),)
  );
}

class MyApp extends StatefulWidget {


  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance; 
   
  @override
  void initState() {
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
     checkBluetooth(); //enable fullscreen
    super.initState();
  } 

  checkBluetooth() async {
    if(await bluetooth.isConnected)
    {
      context.read<BluetoothConnectionState>().setConnectionState(true);
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Boat Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/bluetoothConnection':(context) => const BluetoothSelection()
      },
    );
  }
}