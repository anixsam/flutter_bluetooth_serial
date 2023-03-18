import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:boat_control/providers/bluetooth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

class ControlPad extends StatefulWidget {
  ControlPad({super.key});

  @override
  State<ControlPad> createState() => _ControlPadState();
}

class _ControlPadState extends State<ControlPad> {
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  bool conveyorState  = false;

  moveLeft() {
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
    print('left');
    // bluetooth.write("d");
  }

  moveRight() {
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
    print('right');
    // bluetooth.write("r");
  }

  moveFront() async {
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
    print('up');
    // bluetooth.write("f");
  }

  cancelMove() {
    if(context.read<BluetoothConnectionState>().isConnected == false)
    {
      return;
    }
    print('cancel');
    // bluetooth.write("s");
  }

  moveBack() {
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
    print('down');
    // bluetooth.write("b");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                  height: 50,
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: InkWell(
                            onTapDown: (details) => moveFront(),
                            onTapUp: (details) => cancelMove(),
                            child: const Icon(Icons.keyboard_arrow_up,
                                color: Colors.white, size: 20),
                          )
                      ),
                    ],
                  )),
              SizedBox(
                  height: 50,
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: InkWell(
                            onTapDown: (details) => moveLeft(),
                            onTapUp: (details) => cancelMove(),
                            child: const Icon(Icons.keyboard_arrow_left,
                                color: Colors.white, size: 20),
                          )),
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: InkWell(
                            onTapDown: (details) => moveRight(),
                            onTapUp: (details) => cancelMove(),
                            child: const Icon(Icons.keyboard_arrow_right,
                                color: Colors.white, size: 20),
                          )),
                    ],
                  )),
              SizedBox(
                  height: 50,
                  width: 50,
                  child: InkWell(
                            onTapDown: (details) => moveBack(),
                            onTapUp: (details) => cancelMove(),
                            child: const Icon(Icons.keyboard_arrow_down,
                                color: Colors.white, size: 20),
                          )),
            ],
          ),
      ]
      ),
    );
  }
}
