import 'package:flutter/material.dart';

class ControlPad extends StatelessWidget {
  const ControlPad({super.key});

  moveLeft() {
    print('left');
  }

  moveRight() {
    print('right');
  }

  moveFront() {
    print('up');
  }

  moveBack() {
    print('down');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        children: [
          Container(
              height: 50,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                        onPressed: moveFront,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        child: const Icon(Icons.keyboard_arrow_up,
                            color: Colors.white, size: 20),
                      )),
                ],
              )),
          Container(
              height: 50,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                        onPressed: moveLeft,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        child: const Icon(Icons.keyboard_arrow_left,
                            color: Colors.white, size: 20),
                      )),
                  Container(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                        onPressed: moveRight,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        child: const Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 20),
                      )),
                ],
              )),
          Container(
              height: 50,
              width: 50,
              child: ElevatedButton(
                onPressed: moveBack,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
                  elevation: MaterialStateProperty.all<double>(0),
                ),
                child: const Icon(Icons.keyboard_arrow_down,
                    color: Colors.white, size: 20),
              )),
        ],
      ),
    );
  }
}
