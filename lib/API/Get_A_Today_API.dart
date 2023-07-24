import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String? _selectedOption;
  List<Quote> _dropdownItems = [];

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
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    _showAlertDialog(context);
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400]!,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          _selectedOption ?? "Search (AAPL, GOOG) etc.",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: _selectedOption == null
                                ? Color.fromARGB(235, 158, 158, 158)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 55,
                  width: 220,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Quote');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'GET A QUOTE TODAY',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
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

  void _showAlertDialog(BuildContext context) {
    String searchText = _selectedOption ?? '';
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
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
                        List<Quote> fetchedData = await getData(searchText);
                        print('Fetched Data:');
                        fetchedData.forEach((quote) {
                          print('${quote.name} (${quote.symbol})');
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search (AAPL, GOOG) etc.',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Filtered Data:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: FutureBuilder<List<Quote>>(
                        future: getData(searchText),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error fetching data.'),
                            );
                          } else {
                            List<Quote> fetchedData = snapshot.data ?? [];
                            if (fetchedData.isEmpty) {
                              return Center(
                                child: Text('No data found.'),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: fetchedData.length,
                                itemBuilder: (context, index) {
                                  final quote = fetchedData[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedOption = quote.symbol;
                                      });
                                      // Use addPostFrameCallback to dismiss the AlertDialog after the current frame is drawn
                                      WidgetsBinding.instance!
                                          .addPostFrameCallback((_) {
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      color: _selectedOption == quote.symbol
                                          ? Colors.blue[100]
                                          : Colors.transparent,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          quote.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                _selectedOption == quote.symbol
                                                    ? Colors.blue
                                                    : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          }
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
  }

  Future<List<Quote>> getData(String filter) async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://liqueous.logixsy.com/api/quote/tickers?search=$filter",
        ),
      );

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
  bool isSelected; // Add the isSelected property to track selection

  Quote({
    required this.symbol,
    required this.name,
    required this.exchangeName,
    this.isSelected = false, // Default to unselected
  });
}
