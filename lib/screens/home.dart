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

  bool conveyorState = false;

  Color color = Colors.blue; 
  IconData btIcon = Icons.bluetooth;

  openBluetoothSelection(context1) async {
    if(context.read<BluetoothConnectionState>().isConnected)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Disconnecting..."),
          duration: Duration(milliseconds: 250),
        )
      );
      // ignore: deprecated_member_use
      await bluetooth.disconnect().then((value) => {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Disconnected"),
            duration: Duration(seconds: 2),
          )
        ),
        context.read<BluetoothConnectionState>().setConnectionState(false)
      });
      return;
    }
    Navigator.pushNamed(context1, '/bluetoothConnection');
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
    bluetooth.write(conveyorState ? "c" : "C");
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    color = context.watch<BluetoothConnectionState>().isConnected ? Colors.red : Colors.blue;
    btIcon  = context.watch<BluetoothConnectionState>().isConnected ? Icons.bluetooth_connected : Icons.bluetooth;
    return Scaffold(
      body : Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: ()=>{
              openBluetoothSelection(context)
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ), 
            child: Icon(btIcon)
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