import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key});

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  TextEditingController _nameController = TextEditingController();
  String? _selectedOption;
  List<String> _dropdownItems = List.generate(10, (index) {
    if (index == 0) {
      return '000400.0              Loto Non-Life     Korea Stock Exchange';
    } else {
      return 'Option ${index + 1}';
    }
  });
  List<String> _filteredOptions = [];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0), // Adjusted padding
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
            ListTile(
              title: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[400]!,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: DropdownSearch<String>(
                  mode: Mode.BOTTOM_SHEET,
                  items: _dropdownItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue;
                    });
                  },
                  onFind: (String? searchValue) {
                    _filteredOptions = _dropdownItems
                        .where((option) => option
                            .toLowerCase()
                            .contains(searchValue?.toLowerCase() ?? ''))
                        .toList();
                    return Future.value(_filteredOptions);
                  },
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search (AAPL, GOOG) etc.',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                  showSearchBox: true, // Enable search box
                ),
              ),
            ),
            SizedBox(height: 20), // Adjusted spacing
            Container(
              height: 55,
              width: 220,
              child: ElevatedButton(
                onPressed: () {
                  // Perform API call using the selected option or entered value
                  // Navigator.pushNamed(context, '/Plan');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 15), // Adjusted padding
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'GET A QUOTE TODAY',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18, // Decreased font size
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
    );
  }
}
