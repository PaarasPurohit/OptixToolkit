import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BarcodeScanner extends StatefulWidget {
  @override
  _BarcodeScannerState createState() => _BarcodeScanner();
}

class _BarcodeScanner extends State<ToolCheckInPage> {
  String barcodeId = '';
  String toolName = '';
  String toolCategory = '';
  String userID = 'user123'; // Replace with actual user ID
  List tools = [];

  Future<void> scanBarcode() async {
    var result = await BarcodeScanner.scan();
    setState(() {
      barcodeId = result.rawContent; // Store the scanned barcode value
    });

    await postInventoryCheckTool();
  }

  Future<void> postInventoryCheckTool() async {
    var response = await http.post(
      Uri.parse('https://toolkit.team3749.com/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'endpoint': 'post-inventory-check-tool',
        'barcodeId': barcodeId,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      toolName = jsonResponse['name'];
      toolCategory = jsonResponse['category'];

      await postTool(); // Proceed to add the tool
    }
  }

  Future<void> postTool() async {
    var response = await http.post(
      Uri.parse('https://toolkit.team3749.com/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'endpoint': 'post-tool',
        'name': toolName,
        'category': toolCategory,
        'reserverID': userID,
      }),
    );

    if (response.statusCode == 200) {
      fetchTools(); // Reload tools after successful POST
    }
  }

  Future<void> fetchTools() async {
    var response = await http.get(
      Uri.parse('https://toolkit.team3749.com/tools'),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        tools = jsonResponse.where((tool) => tool['reserverID'] == userID).toList();
      });
    }
  }

  Future<void> deleteTool(String name) async {
    var response = await http.delete(
      Uri.parse('https://toolkit.team3749.com/tools/$userID/$name'),
    );

    if (response.statusCode == 200) {
      fetchTools(); // Refresh the tools list after successful delete
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTools(); // Fetch tools when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tool Check-In'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: scanBarcode,
            child: Text('Scan Barcode'),
          ),
          Expanded(
            child: DataTable(
              columns: [
                DataColumn(label: Text('Tool Name')),
                DataColumn(label: Text('Check In')),
              ],
              rows: tools.map((tool) {
                return DataRow(cells: [
                  DataCell(Text(tool['name'])),
                  DataCell(
                    ElevatedButton(
                      onPressed: () => deleteTool(tool['name']),
                      child: Text('Check In'),
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
