//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'package:csv/csv.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'dart:convert';
//import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class buy_screen extends StatefulWidget {
  const buy_screen({super.key});

  @override
  State<buy_screen> createState() => _buy_screenState();
}

class _buy_screenState extends State<buy_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Alignment> topAlignment;
  late Animation<Alignment> bottomAlignment;
  List<int> quantity = [];
  final List<Map<String, dynamic>> _tableData = [
    {
      'platform': 'USV',
      'name': 'LUSV',
      'quantity': 0,
      'unitCost': 268821836,
      'tppu': 110.0,
      'tppu1': 110.0,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'lusv.jpg',
    },
    {
      'platform': 'USV',
      'name': 'Sea Hunter',
      'quantity': 0,
      'unitCost': 41453928,
      'tppu': 60.0,
      'tppu1': 60.0,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'seahunter.jpg'
    },
    {
      'platform': 'USV',
      'name': 'CUSV',
      'quantity': 0,
      'unitCost': 5527190,
      'tppu': 1.8,
      'tppu1': 1.8,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'cusv.jpg'
    },
    {
      'platform': 'USV',
      'name': 'GARC',
      'quantity': 0,
      'unitCost': 1381798,
      'tppu': 1.8,
      'tppu1': 1.8,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'garc.jpg'
    },
    {
      'platform': 'USV',
      'name': 'Triton',
      'quantity': 0,
      'unitCost': 2072696,
      'tppu': 0.9,
      'tppu1': 0.9,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'triton.jpg'
    },
    {
      'platform': 'USV',
      'name': 'Bluebottle',
      'quantity': 0,
      'unitCost': 690899,
      'tppu': 0.9,
      'tppu1': 0.9,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'bluebottle.jpg'
    },
    {
      'platform': 'UUV',
      'name': 'Orca',
      'quantity': 0,
      'unitCost': 103634820,
      'tppu': 15.0,
      'tppu1': 15.0,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'orca.jpg'
    },
    {
      'platform': 'UUV',
      'name': 'Speartooth',
      'quantity': 0,
      'unitCost': 6908988,
      'tppu': 7.5,
      'tppu1': 7.5,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'speartooth.jpg'
    },
    {
      'platform': 'UUV',
      'name': 'Knifefish',
      'quantity': 0,
      'unitCost': 6908988,
      'tppu': 0.8,
      'tppu1': 0.8,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'knifefish.jpg'
    },
    {
      'platform': 'UUV',
      'name': 'Remus 300',
      'quantity': 0,
      'unitCost': 2072696,
      'tppu': 0.4,
      'tppu1': 0.4,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'remus300.jpg'
    },
    {
      'platform': 'UAS',
      'name': 'MQ-4',
      'quantity': 0,
      'unitCost': 262541544,
      'tppu': 36.0,
      'tppu1': 36.0,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'mq4.jpg'
    },
    {
      'platform': 'UAS',
      'name': 'MQ-9',
      'quantity': 0,
      'unitCost': 27635952,
      'tppu': 22.0,
      'tppu1': 22.0,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'mq9.jpg'
    },
    {
      'platform': 'UAS',
      'name': 'MQ-25',
      'quantity': 0,
      'unitCost': 158906724,
      'tppu': 30.0,
      'tppu1': 30.0,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'mq25.jpg'
    },
    {
      'platform': 'UAS',
      'name': 'MQ-8',
      'quantity': 0,
      'unitCost': 34544940,
      'tppu': 15.0,
      'tppu1': 15.0,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'mq8.jpg'
    },
    {
      'platform': 'UAS',
      'name': 'Altius 600',
      'quantity': 0,
      'unitCost': 110544,
      'tppu': 0.04,
      'tppu1': 0.04,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'altius600.jpg'
    },
    {
      'platform': 'UAS',
      'name': 'Coyote',
      'quantity': 0,
      'unitCost': 13818,
      'tppu': 0.04,
      'tppu1': 0.04,
      'FtotalCost': 0,
      'FunitCost': 0,
      'image': 'coyote.jpg'
    },
  ];
  var myNumber;
  var _FunitCost;
  var _FtotalCost;

  Future<void> _exportToCSV() async {
    List<List<dynamic>> rows = [];
    List<dynamic> row = [];
    row.add('Platform');
    row.add('Name');
    row.add('Quantity');
    row.add('Unit Cost');
    row.add('Total Cost');
    row.add('Total Personnel per Unit');
    row.add('Total Personnel');
    rows.add(row);

    for (int i = 0; i < _tableData.length; i++) {
      List<dynamic> row = [];
      row.add(_tableData[i]['platform']);
      row.add(_tableData[i]['name']);
      row.add(_tableData[i]['quantity']);
      row.add(_tableData[i]['unitCost']);
      row.add(_tableData[i]['quantity'] * _tableData[i]['unitCost']);
      row.add(_tableData[i]['tppu']);
      row.add(_tableData[i]['quantity'] * _tableData[i]['tppu']);
      rows.add(row);
    }
    //print(rows);

    String csv = ListToCsvConverter().convert(rows);
    //print(csv);
    //String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    //if (selectedDirectory != null) {}
    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: 'output.csv',
      allowedExtensions: ['csv'],
    );

    if (outputFile != null) {
      final file = File(outputFile);
      await file.writeAsString(csv);
      print('CSV file saved at: $outputFile');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                'CSV file saved at $outputFile',
                style: GoogleFonts.robotoSlab(
                  color: Colors.black,
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'))
              ],
            );
          });
    }
  }

  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
  getFormattedNumber(String value) {
    var number = numberFormat.format(int.parse(value));
    return number;
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _tableData.length; i++) {
      _controllers.add(TextEditingController());
    }

    for (int i = 0; i < _tableData.length; i++) {
      _controllers1.add(TextEditingController());
    }
  }

  List<TextEditingController> _controllers = [];
  List<TextEditingController> _controllers1 = [];

  int _allocatedBudget = 1000000000000;
  String _FallocatedBudget = '';
  int _usedBudget = 0;
  int _usedBudget1 = 0;
  int _allocatedPersonnel = 1443;
  double _usedPersonnel = 0;
  double _usedPersonnel1 = 0;
  String _usedPersonnel2 = '';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/hudson-logo.png'),
                  )),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Card(
                        elevation: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DataTable(
                              columnSpacing: 55,
                              columns: [
                                DataColumn(
                                  label: Text(
                                    'Platform',
                                    style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.5,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                    label: Text(
                                  'Name',
                                  style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.5,
                                  ),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Quantity',
                                  style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.5,
                                  ),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Unit Cost',
                                  style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.5,
                                  ),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Total Cost',
                                  style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.5,
                                  ),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Total Personnel per Unit',
                                  style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.5,
                                  ),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Total Personnel',
                                  style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.5,
                                  ),
                                )),
                              ],
                              rows: _tableData.map((row) {
                                return DataRow(cells: [
                                  DataCell(Text(
                                    row['platform'],
                                  )),
                                  // DataCell(Text(row['name'])),
                                  DataCell(TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                elevation: 20,
                                                title: Text(
                                                  row['name'],
                                                  style: GoogleFonts.robotoSlab(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                content: Image.asset(
                                                    'assets/images/${row['image']}'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Close'),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Text(
                                        row['name'],
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ))),

                                  DataCell(
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      // inputFormatters: [
                                      //   ThousandsFormatter()
                                      // ],
                                      controller:
                                          _controllers[_tableData.indexOf(row)],
                                      decoration: InputDecoration(
                                        hintText: '0',
                                      ),
                                      onChanged: (value) {
                                        if (value.isEmpty) {
                                          row['quantity'] = 0;
                                        } else {
                                          // Otherwise, parse the value as double
                                          row['quantity'] =
                                              int.tryParse(value) ?? 0.0;
                                        }
                                        row['quantity'] = int.parse(value);
                                        _usedBudget1 =
                                            row['quantity'] * row['unitCost'];
                                        _usedBudget = 0;
                                        for (var r in _tableData) {
                                          _usedBudget1 =
                                              (r['quantity'] * r['unitCost']);
                                          _usedBudget =
                                              _usedBudget + _usedBudget1;
                                        }

                                        _usedPersonnel1 =
                                            row['quantity'] * row['tppu'];
                                        _usedPersonnel = 0;
                                        for (var r in _tableData) {
                                          _usedPersonnel1 =
                                              (r['quantity'] * r['tppu']);
                                          _usedPersonnel =
                                              _usedPersonnel1 + _usedPersonnel;
                                        }
                                        _usedPersonnel2 =
                                            _usedPersonnel.toStringAsFixed(2);

                                        setState(() {
                                          if (_usedPersonnel >
                                              _allocatedPersonnel) {
                                            _usedPersonnel1 =
                                                (row['quantity'] * row['tppu']);
                                            _usedPersonnel = _usedPersonnel -
                                                _usedPersonnel1;
                                            _usedPersonnel2 = _usedPersonnel
                                                .toStringAsFixed(2);
                                            _controllers1[
                                                    _tableData.indexOf(row)]
                                                .clear();
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Personnel Exceeded',
                                                        style: GoogleFonts
                                                            .robotoSlab(
                                                          color: Colors.black,
                                                        )),
                                                    content: Text(
                                                        'The Personnel has been exceeded. Please enter a lower quantity.',
                                                        style: GoogleFonts
                                                            .robotoSlab(
                                                          color: Colors.black,
                                                        )),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('Close'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          }
                                          if (_usedBudget > _allocatedBudget) {
                                            _usedBudget1 = row['quantity'] *
                                                row['unitCost'];
                                            _usedBudget =
                                                _usedBudget - _usedBudget1;
                                            row['quantity'] = 0;
                                            _controllers[
                                                    _tableData.indexOf(row)]
                                                .clear();
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Budget Exceeded',
                                                        style: GoogleFonts
                                                            .robotoSlab(
                                                          color: Colors.black,
                                                        )),
                                                    content: Text(
                                                        'The budget has been exceeded. Please enter a lower quantity.',
                                                        style: GoogleFonts
                                                            .robotoSlab(
                                                          color: Colors.black,
                                                        )),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('Close'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          }
                                        });
                                        row['FunitCost'] = getFormattedNumber(
                                            row['unitCost'].toString());
                                        row['FtotalCost'] = getFormattedNumber(
                                            (row['quantity'] * row['unitCost'])
                                                .toString());
                                      },
                                    ),
                                  ),
                                  DataCell(Text(row['FunitCost'] != 0
                                      ? '\$${row['FunitCost']}'
                                      : '\$${row['unitCost']}')),
                                  DataCell(Text(row['FtotalCost'] != 0
                                      ? '\$${row['FtotalCost']}'
                                      : '\$${row['quantity'] * row['unitCost']}')),
                                  DataCell(
                                    TextField(
                                      controller: _controllers1[
                                          _tableData.indexOf(row)],
                                      decoration: InputDecoration(
                                          hintText: (row['tppu1']).toString()),
                                      onChanged: (value) {
                                        if (value.isEmpty) {
                                          row['tppu'] = 0;
                                        } else {
                                          // Otherwise, parse the value as double
                                          row['tppu'] =
                                              double.tryParse(value) ?? 0.0;
                                        }
                                        row['tppu'] = double.parse(value);
                                        _usedPersonnel1 =
                                            row['quantity'] * row['tppu'];
                                        _usedPersonnel = 0;
                                        for (var r in _tableData) {
                                          _usedPersonnel1 =
                                              (r['quantity'] * r['tppu']);
                                          _usedPersonnel =
                                              _usedPersonnel1 + _usedPersonnel;
                                        }
                                        _usedPersonnel2 =
                                            _usedPersonnel.toStringAsFixed(2);
                                        setState(() {
                                          if (_usedPersonnel >
                                              _allocatedPersonnel) {
                                            _usedPersonnel1 =
                                                (row['quantity'] * row['tppu']);
                                            _usedPersonnel = _usedPersonnel -
                                                _usedPersonnel1;
                                            _usedPersonnel2 = _usedPersonnel
                                                .toStringAsFixed(2);
                                            _controllers1[
                                                    _tableData.indexOf(row)]
                                                .clear();
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Personnel Exceeded',
                                                        style: GoogleFonts
                                                            .robotoSlab(
                                                          color: Colors.black,
                                                        )),
                                                    content: Text(
                                                        'The Personnel has been exceeded. Please enter a lower quantity.',
                                                        style: GoogleFonts
                                                            .robotoSlab(
                                                          color: Colors.black,
                                                        )),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('Close'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  DataCell(
                                      Text('${row['quantity'] * row['tppu']}'))
                                ]);
                              }).toList()),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                          elevation: 20,
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Allocated Budget: \$$_allocatedBudget',
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Used Budget: \$${_allocatedBudget - _usedBudget}',
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Remaining Budget: \$${_allocatedBudget - _usedBudget}',
                                    style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(height: 15),
                      Card(
                          elevation: 20,
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Allocated Personnel: $_allocatedPersonnel',
                                      style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      )),
                                  SizedBox(height: 5),
                                  Text('Used Personnel: $_usedPersonnel2.',
                                      style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      )),
                                  SizedBox(height: 5),
                                  Text(
                                      'Remaining Personnel: ${_allocatedPersonnel - _usedPersonnel}',
                                      style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      )),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(height: 10),
                      Container(
                        width: 200,
                        height: 30,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 20,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Enter Allocated Budget',
                                          style: GoogleFonts.robotoSlab(
                                            color: Colors.black,
                                          )),
                                      content: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            _allocatedBudget = int.parse(value);
                                          });
                                        },
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Close'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: AutoSizeText('Edit Allocated Budget',
                                style: GoogleFonts.robotoSlab(
                                  color: Colors.black,
                                ))),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 200,
                        height: 30,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 20,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Enter Allocated Personnel',
                                          style: GoogleFonts.robotoSlab(
                                            color: Colors.black,
                                          )),
                                      content: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            _allocatedPersonnel =
                                                int.parse(value);
                                          });
                                        },
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Close'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Text('Edit Allocated Personnel',
                                style: GoogleFonts.robotoSlab(
                                  color: Colors.black,
                                  fontSize: 12.5,
                                ))),
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: 200,
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 20,
                              ),
                              onPressed: _exportToCSV,
                              child: AutoSizeText('Export Data',
                                  style: GoogleFonts.robotoSlab(
                                    color: Colors.black,
                                  )))),
                    ],
                  ),
                ],
              ),
            ),
          ])),
    ));
  }
}
