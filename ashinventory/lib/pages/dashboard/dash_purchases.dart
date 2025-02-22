// import 'dart:math';
import 'package:ashinventory/components/empty_screen.dart';
import 'package:ashinventory/components/text_field.dart';
import 'package:ashinventory/services/callback.dart';
import 'package:flutter/material.dart';
// import 'package:ashinventory/post.dart';
// import 'package:darq/darq.dart';
import 'package:intl/intl.dart';
// import 'package:paged_datatable/paged_datatable.dart';

class DashPurchases extends StatefulWidget {
  final TextEditingController searchQuery;
  const DashPurchases({
    super.key,
    required this.searchQuery,
  });

  @override
  State<DashPurchases> createState() => _DashPurchasesState();
}

class _DashPurchasesState extends State<DashPurchases> {
  // final tableController = PagedDataTableController<String, Post>();
  // final hScrollController = ScrollController();
  final int _rowsPerPage = 10;
  final List<Map<String, dynamic>> data = [
    {
      "supplier": "Tech Supplies Ltd.",
      "itemName": "Multimeter",
      "supplierContact": "techsupplies@gmail.com",
      "purchaseDate": DateTime.now().subtract(const Duration(days: 3)),
      "unitPriceGHS": 250,
      "quantity": 2,
      "totalCostGHS": 500,
      "invoiceNumber": 9876543210,
    },
    {
      "supplier": "Office Essentials Co.",
      "itemName": "Printer Paper",
      "supplierContact": "officeessentials@gmail.com",
      "purchaseDate": DateTime.now().subtract(const Duration(days: 5)),
      "unitPriceGHS": 50,
      "quantity": 10,
      "totalCostGHS": 500,
      "invoiceNumber": 1234567890,
    },
    {
      "supplier": "EduTech Ghana",
      "itemName": "Projector",
      "supplierContact": "edutechgh@gmail.com",
      "purchaseDate": DateTime.now().subtract(const Duration(days: 7)),
      "unitPriceGHS": 3200,
      "quantity": 1,
      "totalCostGHS": 3200,
      "invoiceNumber": 4567890123,
    },
    {
      "supplier": "Lab Equipment Inc.",
      "itemName": "Bunsen Burners",
      "supplierContact": "labequip@gmail.com",
      "purchaseDate": DateTime.now().subtract(const Duration(days: 2)),
      "unitPriceGHS": 75,
      "quantity": 4,
      "totalCostGHS": 300,
      "invoiceNumber": 5678901234,
    },
    {
      "supplier": "Construction Tools GH",
      "itemName": "Power Drill",
      "supplierContact": "constructtools@gmail.com",
      "purchaseDate": DateTime.now().subtract(const Duration(days: 1)),
      "unitPriceGHS": 450,
      "quantity": 3,
      "totalCostGHS": 1350,
      "invoiceNumber": 6789012345,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRequests = data
        .where(
          (element) =>
              element["itemName"]
                  .toLowerCase()
                  .contains(widget.searchQuery.text.toLowerCase()) ||
              element["supplier"]
                  .toLowerCase()
                  .contains(widget.searchQuery.text.toLowerCase()) ||
              element["supplierContact"]
                  .toLowerCase()
                  .contains(widget.searchQuery.text.toLowerCase()) ||
              element["invoiceNumber"]
                  .toString()
                  .toLowerCase()
                  .contains(widget.searchQuery.text.toLowerCase()),
        )
        .toList();
    return Scaffold(
      body: filteredRequests.isEmpty
          ? const EmptyScreen(
              title: 'No Results',
            )
          : SingleChildScrollView(
              // color: Colors.amber,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  // ConstrainedBox( 
                  //   constraints: BoxConstraints(
                  //       maxHeight: 0.6*MediaQuery.sizeOf(context).height),
                  //   child: CarouselView(
                  //     itemSnapping: true,
                  //     scrollDirection: Axis.vertical,
                  //     itemExtent: 0.5*MediaQuery.sizeOf(context).height,
                  //     children: [
                  //       Card.filled(),
                  //       Card.filled(),
                  //       Card.filled(),
                  //       Card.filled(),
                  //       Card.filled(),
                  //     ],
                  //   ),
                  // ),
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
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SelectionArea(
                    child: DataTableTheme(
                      data: DataTableThemeData(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
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
                        rowsPerPage: filteredRequests.length < _rowsPerPage
                            ? filteredRequests.length
                            : _rowsPerPage,
                        columnSpacing: 16, showEmptyRows: false,

                        columns: const [
                          DataColumn(
                            label: Text('Supplier name'),
                          ),
                          DataColumn(
                            label: Text('Supplier contact'),
                          ),
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
                            label: Text('Purchase date'),
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
                          // DataColumn(
                          //   label: Text('Total cost (USD)'),
                          // ),
                          DataColumn(
                            label: Text('invoice number'),
                          ),
                        ],
                        source: FixMeDataSource(
                            filteredRequests.reversed.toList(), context),

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          TextEditingController itemName = TextEditingController();
          TextEditingController unitPrice = TextEditingController();
          TextEditingController invoiceNumber = TextEditingController();
          TextEditingController quantity = TextEditingController();
          TextEditingController supplierName = TextEditingController();
          TextEditingController supplierContact = TextEditingController();
          // TextEditingController link = TextEditingController();
          String? selectedDepartment;
          List<String> departments = [
            "Engineering",
            "Hostels",
            "Health Center",
            "I.T.",
            "Business",
            "Library",
          ];

          callDialog(
              context: context,
              content: SizedBox(
                width: 500,
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Item details",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    FormTextField(
                      controller: itemName,
                      // hintText: "Item name",
                      labelText: "Item name",
                      filled: true,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: FormTextField(
                            controller: unitPrice,
                            // hintText: "Item name",
                            labelText: "Unit price (GHS)",
                            filled: true,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: FormTextField(
                            controller: quantity,
                            // maxLines: 5,
                            // minLines: 3,
                            // hintText: "Item name",
                            labelText: "Quantity",
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 16),
                    SizedBox(height: 16),
                    FormTextField(
                      controller: invoiceNumber,
                      // maxLines: 5,
                      // minLines: 3,
                      // hintText: "Item name",
                      labelText: "Invoice number",
                      filled: true,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Supplier details",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    FormTextField(
                      controller: supplierName,
                      // hintText: "Item name",
                      labelText: "Supplier name",
                      filled: true,
                    ),
                    SizedBox(height: 16),
                    FormTextField(
                      controller: supplierContact,
                      // hintText: "Item name",
                      labelText: "Supplier contact",
                      filled: true,
                    ),
                  ],
                )),
              ),
              title: "Record a purchase",
              confirmText: "Confirm",
              onConfirm: () {
                setState(() {
                  data.add({
                    "supplier": supplierName.text.trim(),
                    "itemName": itemName.text.trim(),
                    "supplierContact": supplierContact.text.trim(),
                    "purchaseDate": DateTime.now(),
                    "unitPriceGHS": double.tryParse(unitPrice.text.trim()),
                    "quantity": int.tryParse(quantity.text.trim()),
                    "totalCostGHS": (int.tryParse(quantity.text.trim()) ?? 0) *
                        (double.tryParse(unitPrice.text.trim()) ?? 0),
                    "invoiceNumber": invoiceNumber.text.trim(),
                  });
                });
                Navigator.pop(context);
              });
        },
        label: const Text("Add purchase"),
        icon: const Icon(Icons.add),
      ),
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
    final formattedDate =
        DateFormat('dd MMM, y').format(request['purchaseDate']);
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
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['supplier'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['supplierContact'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['itemName'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.076 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(formattedDate, overflow: TextOverflow.ellipsis),
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
        // DataCell(
        //   SizedBox(
        //     width: 0.1 * MediaQuery.sizeOf(context).width,
        //     child: Text(request['totalCostUSD'].toString(),
        //         overflow: TextOverflow.ellipsis),
        //   ),
        // ),
        DataCell(
          SizedBox(
            // width: 0.3 * MediaQuery.sizeOf(context).width,
            child: Text(request['invoiceNumber'].toString(),
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
