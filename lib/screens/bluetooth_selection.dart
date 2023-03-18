import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';
import 'package:boat_control/providers/bluetooth_state.dart';

class BluetoothSelection extends StatefulWidget {
  const BluetoothSelection({super.key});

  @override
  State<BluetoothSelection> createState() => _BluetoothSelectionState();
}

class _BluetoothSelectionState extends State<BluetoothSelection> {

  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  List<BluetoothDevice> results = List<BluetoothDevice>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    bluetoothStartScan();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Paired Devices")),
      floatingActionButton: FloatingActionButton(onPressed: reScanBluetooth,child: Icon(Icons.refresh)),
      body: ListView(
        children:   
              results.map((result) => ListTile(
                title: Text(result.name ?? "Unknown device"),
                subtitle: Text(result.address.toString()),
                onTap: () async => {
                  await bluetooth.connect(result).then(
                    (value) => 
                    {
                      print("Connected to ${result.name}"),
                      context.read<BluetoothConnectionState>().setConnectionState(true),
                      Navigator.pop(context)
                    }
                  )
                },
              )).toList(),
          ),
      );
  }

  bluetoothStartScan() {
    try
    {
      bluetooth.getBondedDevices().then((device) {
        setState(() {
          print("Scan Finished");
          results = device;
        });
      });
    }
    catch(e)
    {
      print("ERROR" + e.toString());
    }
  }


  reScanBluetooth() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Scanning..."),
          duration: Duration(seconds: 1),
        )
    );
    bluetoothStartScan();
  }
}