import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothSelection extends StatefulWidget {
  const BluetoothSelection({super.key});

  @override
  State<BluetoothSelection> createState() => _BluetoothSelectionState();
}

class _BluetoothSelectionState extends State<BluetoothSelection> {

  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  List<BluetoothDevice> results = 
      List<BluetoothDevice>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    bluetoothStartScan();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Select Bluetooth Device")),
      floatingActionButton: FloatingActionButton(onPressed: bluetoothStartScan,child: Icon(Icons.refresh)),
      body: ListView(
        children:   
          results.map((result) => ListTile(
            title: Text(result.name ?? "Unknown device"),
            subtitle: Text(result.address.toString()),
            onTap: () async => {
              await bluetooth.connect(result).then((value) => Navigator.pop(context))
            },
          )).toList(),
      ),
    );
  }

  bluetoothStartScan() {
    print("Started Scan");
    bluetooth.getBondedDevices().then((device) {
      setState(() {
        print("Scan Finished");
        results = device;
      });
    });
  }
}