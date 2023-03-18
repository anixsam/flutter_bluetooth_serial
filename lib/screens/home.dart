import 'package:boat_control/providers/bluetooth_state.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

import '../screens/bluetooth_selection.dart';
import 'package:flutter/material.dart';

import '../widget/controlpad.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  bool conveyorState = true;

  openBluetoothSelection(context) {
    Navigator.pushNamed(context, '/bluetoothConnection');
  }

  tooggleConveyor(state) {

    if(context.read<BluetoothConnectionState>().isConnected == false)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Bluetooth not connected"),
          duration: Duration(seconds: 2),
        )
      );
      return;
    }

    setState(() {
      conveyorState = !conveyorState;
    });

    print('Conveyor ${conveyorState ? "On" : "Off"}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: ()=>{openBluetoothSelection(context)}, 
            child: const Icon(Icons.bluetooth)
          ),
          const SizedBox(
            width: double.infinity,
          ),
          Column(
            children: [
              const Text("Toggle Conveyor"),
              Switch(
                value: conveyorState, 
                onChanged: tooggleConveyor
              ),
            ],
          ),
          ControlPad(),
        ],
      )
    );  
  }
}