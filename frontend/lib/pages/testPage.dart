import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: SafeArea(
    //     child: Container(
    //       color: Colors.white,
    //       child: CustomPaint(
    //         painter: CurvePainter(),
    //         child: Container(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               children: [
    //                 Text(
    //                   "Shashank Nayak",
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     decoration: TextDecoration.none,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: 200.0,
    //                   height: 100.0,
    //                   child: Shimmer.fromColors(
    //                     baseColor: Colors.grey.shade300,
    //                     highlightColor: Colors.grey.shade100,
    //                     child: Text(
    //                       'Shimmer',
    //                       textAlign: TextAlign.center,
    //                       style: TextStyle(
    //                         fontSize: 40.0,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: _enabled,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // box
                        Container(
                          width: 75.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        // Space
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        // Lines
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 15.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 6,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _enabled = !_enabled;
                    });
                  },
                  child: Text(
                    _enabled ? 'Stop' : 'Play',
                    style: Theme.of(context).textTheme.button?.copyWith(
                        fontSize: 18.0,
                        color: _enabled ? Colors.redAccent : Colors.green),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.8, size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
