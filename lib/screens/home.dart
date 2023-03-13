import '../screens/bluetooth_selection.dart';
import 'package:flutter/material.dart';

import '../widget/controlpad.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  openBluetoothSelection(context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) =>BluetoothSelection()));  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 200),
                child: ElevatedButton(
                  onPressed: () => openBluetoothSelection(context), 
                  child: const Icon(Icons.bluetooth)
                ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ControlPad(),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                )
              ],
            ),
        ],
      ),
      );    
  }
}