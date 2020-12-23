// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:OptixToolkit/services/database.dart';

class PartModal extends StatelessWidget {
  final Part part;
  const PartModal({Key key, this.part}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color green = Color(0xff15ee07);
    final Color yellow = Color(0xffebe712);
    final Color red = Color(0xffd5212c);
    final Color orange = Colors.orange;

    final Map<String, TextStyle> styleMap = {
      "Arrived": GoogleFonts.rubik(
        color: green,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      "Shipped": GoogleFonts.rubik(
        color: yellow,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      "Ordered": GoogleFonts.rubik(
        color: orange,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      "Failure": GoogleFonts.rubik(
        color: red,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    };
    Widget doneButton = FlatButton(
      child: Text(
        "Done",
        style: GoogleFonts.rubik(
          fontWeight: FontWeight.bold,
          color: Color(0xff159deb),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    return AlertDialog(
      title: Text(
        part.name,
        style: GoogleFonts.rubik(
          fontWeight: FontWeight.bold,
          color: Color(0xff159deb),
        ),
      ),
      backgroundColor: Color(0xff26292c),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Ordered By: ',
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                  TextSpan(
                    text: part.displayName,
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Part Link: ',
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                  TextSpan(
                    text: part.link,
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Tracking Number: ',
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                  TextSpan(
                    text: part.trackingId,
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Priority: ',
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                  TextSpan(
                    text: part.priority.toString(),
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Status: ',
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                  TextSpan(
                    text: part.status,
                    style: styleMap[part.status],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        // editButton,
        doneButton,
      ],
    );
  }
}
