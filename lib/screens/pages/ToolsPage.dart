// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:barcode_scan/barcode_scan.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:OptixToolkit/screens/pages/subpages/ReserveTool.dart';
import 'package:OptixToolkit/services/NavigationService.dart';

class toolsPage extends StatelessWidget {
  const toolsPage({Key key, this.uid}) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return ToolWidget();
  }
}

class ToolWidget extends StatefulWidget {
  ToolWidget({Key key}) : super(key: key);

  @override
  _toolState createState() => _toolState();
}

class _toolState extends State<ToolWidget> {
  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void initState() {
    super.initState();
  }

  Future checkOutScan() async {
    try {
      String barcode_ = (await BarcodeScanner.scan()).rawContent;
      print(barcode_);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        print('Camera permission not granted');
      } else {
        print('Unknown Error: $e');
      }
    } on FormatException catch (e) {
      print('User pressed back button before scanning');
    } catch (e) {
      print('Unknown Error: $e');
    }
  }

  Future checkInScan() async {
    try {
      String barcode_ = (await BarcodeScanner.scan()).rawContent;
      print(barcode_);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        print('Camera permission not granted');
      } else {
        print('Unknown Error: $e');
      }
    } on FormatException catch (e) {
      print('User pressed back button before scanning');
    } catch (e) {
      print('Unknown Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12, top: 17, right: 12, bottom: 0),
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff3a3d41),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 110,
                    height: 55,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    child: RaisedButton(
                      onPressed: () {
                        NavigationService.goTo(
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                ReserveTool(),
                          ),
                        );
                      },
                      child: Text('RESERVE',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      color: Color(0xff159deb),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 110,
                    height: 55,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    child: RaisedButton(
                      onPressed: () {
                        checkOutScan().catchError(() {
                          _showDialog(context);
                        });
                      },
                      child: Text('CHECK OUT',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      color: Color(0xff159deb),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 110,
                    height: 55,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    child: RaisedButton(
                      onPressed: () {
                        checkInScan().catchError(() {
                          _showDialog(context);
                        });
                      },
                      child: Text('CHECK IN',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      color: Color(0xff159deb),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, top: 17, right: 12, bottom: 0),
            width: 400,
            height: MediaQuery.of(context).size.height * 0.63,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Color(0xff3a3d41),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Tool ',
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                )),
                            TextSpan(
                              text: 'Reservations',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff26292c),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Christopher\n",
                                          ),
                                          TextSpan(
                                            text: "Band Saw",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 22.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "12pm - 1pm",
                                            style: TextStyle(
                                                color: Color(0xff159deb),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff26292c),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Christopher\n",
                                          ),
                                          TextSpan(
                                            text: "Band Saw",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 22.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "12pm - 1pm",
                                            style: TextStyle(
                                                color: Color(0xff159deb),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff26292c),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Christopher\n",
                                          ),
                                          TextSpan(
                                            text: "Band Saw",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 22.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "12pm - 1pm",
                                            style: TextStyle(
                                                color: Color(0xff159deb),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff26292c),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Christopher\n",
                                          ),
                                          TextSpan(
                                            text: "Band Saw",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 22.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "12pm - 1pm",
                                            style: TextStyle(
                                                color: Color(0xff159deb),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff26292c),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Christopher\n",
                                          ),
                                          TextSpan(
                                            text: "Band Saw",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 22.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "12pm - 1pm",
                                            style: TextStyle(
                                                color: Color(0xff159deb),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff26292c),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Christopher\n",
                                          ),
                                          TextSpan(
                                            text: "Band Saw",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 22.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "12pm - 1pm",
                                            style: TextStyle(
                                                color: Color(0xff159deb),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff26292c),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Christopher\n",
                                          ),
                                          TextSpan(
                                            text: "Band Saw",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 22.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "12pm - 1pm",
                                            style: TextStyle(
                                                color: Color(0xff159deb),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff26292c),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Christopher\n",
                                          ),
                                          TextSpan(
                                            text: "Band Saw",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.rubik(
                                            color: Colors.white,
                                            fontSize: 22.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "12pm - 1pm",
                                            style: TextStyle(
                                                color: Color(0xff159deb),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
