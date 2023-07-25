import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/generate_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuotePage(),
    );
  }
}

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key});

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  Quote? _selectedQuote;
  String? _selectedOptionName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'SAME DAY QUOTES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Bold',
                        fontSize: 30,
                        color: Colors.blue[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NO OBLIGATIONS',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Innovating for a',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sustainable Future',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Our Multi-Strategy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Bold',
                        fontSize: 35,
                        color: Colors.blue[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fund Approach',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                GestureDetector(
                  onTap: () {
                    _showAlertDialog(context);
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400]!,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              _selectedOptionName ?? "Search (AAPL, GOOG) etc.",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: _selectedOptionName == null
                                    ? Color.fromARGB(235, 158, 158, 158)
                                    : Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.grey[400],
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Container(
                  height: 55,
                  width: 220,
                  child: ElevatedButton(
                    onPressed: () async {
                      Quote? selectedQuote = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenerateSheetPage(),
                        ),
                      );

                      if (selectedQuote != null) {
                        setState(() {
                          _selectedOptionName = selectedQuote.name;
                        });
                      } else {
                        setState(() {
                          _selectedOptionName =
                              null; // Set to null when returning from Generate Term Sheet page
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'GET A QUOTE TODAY',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) async {
    String searchText = _selectedQuote?.symbol ?? '';
    List<Quote> fetchedData = [];
    Quote? selectedOption = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              content: SizedBox(
                height: 300,
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) async {
                        setState(() {
                          searchText = value;
                        });
                        if (searchText.isEmpty) {
                          setState(() {
                            fetchedData = [];
                          });
                        } else {
                          List<Quote> newData = await getData(searchText);
                          setState(() {
                            fetchedData = newData;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Search (AAPL, GOOG) etc.',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[400]!),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[400]!),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: fetchedData.length,
                        itemBuilder: (context, index) {
                          final quote = fetchedData[index];
                          final matchingLetter = quote.symbol[0].toUpperCase();
                          bool isHovered = false;

                          return MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                isHovered = false;
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context, quote);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: isHovered
                                      ? Colors.blue[100]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${quote.symbol}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        SizedBox(width: 90),
                                        Expanded(
                                          child: Text(
                                            quote.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[700],
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          quote.exchangeName,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (selectedOption != null) {
      setState(() {
        _selectedQuote = selectedOption;
        _selectedOptionName = _selectedQuote?.name;
      });
    }
  }

  Future<List<Quote>> getData(String filter) async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://liqueous.logixsy.com/api/quote/tickers?search=$filter",
        ),
      );
      // Print the JSON data before decoding
      print('JSON Data: ${response.body}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['data'] != null) {
          List<dynamic> quotesJson = data['data'];
          var detailsList = <Quote>[];
          for (Map<String, dynamic> quote in quotesJson) {
            detailsList.add(Quote(
              symbol: quote['code'],
              name: quote['name'],
              exchangeName: quote['exchange_name'],
            ));
          }
          print(detailsList);
          return detailsList;
        }
      }
      // Return an empty list if no data found or in case of an error
      return [];
    } catch (e) {
      // Return an empty list in case of an exception
      return [];
    }
  }
}

class Quote {
  final String symbol;
  final String name;
  final String exchangeName;

  Quote({
    required this.symbol,
    required this.name,
    required this.exchangeName,
  });
}

class GetQuotePage extends StatelessWidget {
  final Quote? selectedQuote;

  GetQuotePage({this.selectedQuote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Get a Quote'),
      // ),
      body: Center(
        child: Text(
          selectedQuote?.name ?? 'No quote selected',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
