// import 'dart:math';
import 'package:ashinventory/components/empty_screen.dart';
import 'package:flutter/material.dart';
// import 'package:ashinventory/post.dart';
// import 'package:darq/darq.dart';
// import 'package:intl/intl.dart';
// import 'package:paged_datatable/paged_datatable.dart';

class DashOpStock extends StatefulWidget {
  final TextEditingController searchQuery;
  const DashOpStock({
    super.key,
    required this.searchQuery,
  });

  @override
  State<DashOpStock> createState() => _DashOpStockState();
}

class _DashOpStockState extends State<DashOpStock> {
  // final tableController = PagedDataTableController<String, Post>();
  // final hScrollController = ScrollController();
  final int _rowsPerPage = 10;
  final List<Map<String, dynamic>> data = [
  {
    "itemName": "A4 Sheets",
    "unitPriceGHS": 100,
    "quantity": 10,
    "totalCostGHS": 1000,
    "totalCostUSD": 15620,
    "note": "Initial stock",
  },
  {
    "itemName": "Pens (Blue)",
    "unitPriceGHS": 5,
    "quantity": 50,
    "totalCostGHS": 250,
    "totalCostUSD": 3905,
    "note": "Opening balance",
  },
  {
    "itemName": "Staplers",
    "unitPriceGHS": 25,
    "quantity": 20,
    "totalCostGHS": 500,
    "totalCostUSD": 7810,
    "note": "Office supplies",
  },
  {
    "itemName": "Printer Ink",
    "unitPriceGHS": 200,
    "quantity": 5,
    "totalCostGHS": 1000,
    "totalCostUSD": 15620,
    "note": "For printing",
  },
  {
    "itemName": "Notebooks",
    "unitPriceGHS": 15,
    "quantity": 30,
    "totalCostGHS": 450,
    "totalCostUSD": 7030,
    "note": "For distribution",
  },
];


  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRequests = data
        .where(
          (element) => element["itemName"].toLowerCase().contains(widget.searchQuery.text.toLowerCase())|| element["note"].toLowerCase().contains(widget.searchQuery.text.toLowerCase()),
        )
        .toList();
    return Scaffold(
      body:filteredRequests.isEmpty? const EmptyScreen(
        title: 'No Results',
      ): SingleChildScrollView(
        // color: Colors.amber,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 16,),
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Total (GHS): ",
                    style: Theme.of(context).textTheme.titleMedium),
                SelectionArea(
                  child: Text(78568.toStringAsFixed(2),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                        SizedBox(width: 8,),
              ],
            ),
            SizedBox(height: 8,),
            SelectionArea(
              child: DataTableTheme(
                data: DataTableThemeData(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  // dataRowMaxHeight: double.maxFinite,
                  horizontalMargin: 120,
                  headingRowColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.secondaryContainer),
                  dataRowColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.surfaceContainerLow),
                  headingTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                child: PaginatedDataTable(
                  // primary: true,
                  // controller: hScrollController,
                  // dataRowMaxHeight: double.maxFinite,
                  showCheckboxColumn: false,
                  rowsPerPage:
                      filteredRequests.length < _rowsPerPage
                            ? filteredRequests.length
                            : _rowsPerPage,
                  columnSpacing: 16, showEmptyRows: false,

                  columns: const [
                    DataColumn(
                      label: Text('Item name'),
                      // onSort: (columnIndex, _) {
                      //   setState(() {
                      //     fixMeRequests
                      //         .sort((a, b) => a['itemName'].compareTo(b['itemName']));
                      //   });
                      // },
                    ),
                    DataColumn(
                      label: Text('Unit price (GHS)'),
                    ),
                    DataColumn(
                      label: Text('Quantity (PCS)'),
                    ),
                    DataColumn(
                      label: Text('Total cost (GHS)'),
                      // onSort: (columnIndex, _) {
                      //   setState(() {
                      //     fixMeRequests.sort((a, b) =>
                      //         a['date'].compareTo(b['date']));
                      //   });
                      // },
                    ),
                    DataColumn(
                      label: Text('Total cost (USD)'),
                    ),
                    DataColumn(
                      label: Text('Notes'),
                    ),
                  ],
                  source: FixMeDataSource(filteredRequests, context),

                  // header: const Text(
                  //   'Your Requests',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  // availableRowsPerPage: const [5, 6, 7, 8, 9, 10],
                  // onRowsPerPageChanged: (value) {
                  //   setState(() {
                  //     _rowsPerPage = value ?? 5;
                  //   });
                  // },
                ),
              ),
            ),
            const SizedBox(height: 72)
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: const Text("Add item"),
      //   icon: const Icon(Icons.add),
      // ),
    );
  }
}

// Custom DataSource for the table
class FixMeDataSource extends DataTableSource {
  final List<Map<String, dynamic>> requests;
  final BuildContext context;

  FixMeDataSource(this.requests, this.context);

  @override
  DataRow getRow(int index) {
    final request = requests[index];
    // final formattedDate = DateFormat('dd MMM, y').format(request['date']);
    // final unitPriceGHS = request['unitPriceGHS'] as List<String>;

    return DataRow(
      // onSelectChanged: (_) {
      //   // Navigator.push(
      //   //   context,
      //   //   MaterialPageRoute(
      //   //     builder: (context) => FixMeDetails(details: request['details']),
      //   //   ),
      //   // );
      // },
      cells: [
        // DataCell(
        //   Text(formattedDate, overflow: TextOverflow.ellipsis),
        // ),

        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.2 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['itemName'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          Text(request["unitPriceGHS"].toString()),
        ),

        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['quantity'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['totalCostGHS'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['totalCostUSD'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.165 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['note'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => requests.length;

  @override
  int get selectedRowCount => 0;
}
