// import 'dart:math';
import 'package:ashinventory/components/empty_screen.dart';
import 'package:ashinventory/components/text_field.dart';
import 'package:ashinventory/pages/details/issuances.dart';
import 'package:ashinventory/pages/details/items.dart';
import 'package:ashinventory/services/callback.dart';
import 'package:ashinventory/services/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:ashinventory/post.dart';
// import 'package:darq/darq.dart';
import 'package:intl/intl.dart';
// import 'package:paged_datatable/paged_datatable.dart';

class DashIssuances extends StatefulWidget {
  final TextEditingController searchQuery;
  const DashIssuances({
    super.key,
    required this.searchQuery,
  });

  @override
  State<DashIssuances> createState() => _DashIssuancesState();
}

class _DashIssuancesState extends State<DashIssuances> {
  // final tableController = PagedDataTableController<String, Post>();
  // final hScrollController = ScrollController();
  final int _rowsPerPage = 10;
  final List<Map<String, dynamic>> data = [
    {
      "department": "Engineering",
      "date": DateTime.now().subtract(const Duration(days: 1)),
      "recipient": "John Doe",
      "itemNumber": 5,
      "itemName": "A4 Sheets",
      "note": "To be returned",
    },
    {
      "department": "I.T.",
      "date": DateTime.now().subtract(const Duration(days: 3)),
      "recipient": "Jane Smith",
      "itemNumber": 2,
      "itemName": "Oscilloscope",
      "note": "Permanent allocation",
    },
    {
      "department": "Library",
      "date": DateTime.now().subtract(const Duration(days: 7)),
      "recipient": "Michael Brown",
      "itemNumber": 10,
      "itemName": "Projector",
      "note": "For seminar use",
    },
    {
      "department": "Business",
      "date": DateTime.now().subtract(const Duration(days: 2)),
      "recipient": "Emily White",
      "itemNumber": 3,
      "itemName": "Calculator",
      "note": "To be shared among staff",
    },
    {
      "department": "Health Center",
      "date": DateTime.now().subtract(const Duration(days: 4)),
      "recipient": "Dr. Alex Green",
      "itemNumber": 1,
      "itemName": "First Aid Kit",
      "note": "For emergency cases",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRequests = data
        .where(
          (element) =>
              element["recipient"]
                  .toLowerCase()
                  .contains(widget.searchQuery.text.toLowerCase()) ||
              element["note"]
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
                        columnSpacing: 16,
                        showEmptyRows: false,

                        columns: const [
                          DataColumn(
                            label: Text('Date'),
                            // onSort: (columnIndex, _) {
                            //   setState(() {
                            //     fixMeRequests
                            //         .sort((a, b) => a['department'].compareTo(b['department']));
                            //   });
                            // },
                          ),
                          DataColumn(
                            label: Text('Department'),
                          ),
                          DataColumn(
                            label: Text('Item name'),
                          ),
                          DataColumn(
                            label: Text('Quantity'),
                            // onSort: (columnIndex, _) {
                            //   setState(() {
                            //     fixMeRequests.sort((a, b) =>
                            //         a['date'].compareTo(b['date']));
                            //   });
                            // },
                          ),
                          DataColumn(
                            label: Text('Receipient'),
                          ),
                          DataColumn(
                            label: Text('Note'),
                          ),
                          DataColumn(
                            label: Text('Actions'),
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
        label: const Text("Issue item"),
        icon: const Icon(Icons.add),
        onPressed: () {
          TextEditingController itemName = TextEditingController();
          TextEditingController receipient = TextEditingController();
          TextEditingController itemNumber = TextEditingController();
          TextEditingController note = TextEditingController();
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FormTextField(
                      controller: itemName,
                      // hintText: "Item name",
                      labelText: "Item name",
                      filled: true,
                    ),
                    SizedBox(height: 16),
                    FormTextField(
                      controller: receipient,
                      // hintText: "Item name",
                      labelText: "Receipient",
                      filled: true,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                            value: selectedDepartment,
                            items: departments.map((country) {
                              return DropdownMenuItem(
                                  value: country, child: Text(country));
                            }).toList(),
                            validator: (value) {
                              // debugPrint(value.toString());
                              if (value == null) {
                                return "Department";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                selectedDepartment = value;
                                // selectedTown = null;
                                // selectedLocality = null;
                              });
                            },
                            // decoration: const InputDecoration(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Department',
                              filled: true,
                              counter: const SizedBox(
                                height: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            // style: TextStyle(
                            //   color: Theme.of(context).colorScheme.primary,
                            // ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: FormTextField(
                            controller: itemNumber,
                            labelText: "Quantity",
                            hintText: "No of items",
                            filled: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            // filledColor: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    FormTextField(
                      controller: note,
                      maxLines: 5,
                      minLines: 3,
                      // hintText: "Item name",
                      labelText: "Note",
                      filled: true,
                    ),
                  ],
                )),
              ),
              title: "Issue an item",
              confirmText: "Issue item",
              onConfirm: () {
                setState(() {
                  data.add(
                    {
                      "department": selectedDepartment ?? "N/A",
                      "date": DateTime.now(),
                      "recipient": receipient.text.trim(),
                      "itemNumber":
                          int.tryParse(itemNumber.text.trim()) ?? "N/A",
                      "itemName": itemName.text.trim(),
                      "note": note.text.trim(),
                    },
                  );
                });
                Navigator.pop(context);
              });
        },
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
    final formattedDate = DateFormat('dd MMM, y').format(request['date']);
    // final itemNumber = request['itemNumber'] as List<String>;

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
              minWidth: 0.08 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(formattedDate, overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.125 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['department'], overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.15 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['itemName'], overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          Text(request["itemNumber"].toString()),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.11 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['recipient'], overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          SizedBox(
            width: 0.2 * MediaQuery.sizeOf(context).width,
            child: Text(request['note'], overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.165 * MediaQuery.sizeOf(context).width,
            ),
            child: Row(
              children: [
                FilledButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      slideLeftTransition(
                        IssuanceDetailsPage(issuanceDetails: request),
                      ),
                    );
                  },
                  child: const Text("View"),
                ),
                // SizedBox(width: 8),
                // FilledButton(
                //   style: ButtonStyle(
                //       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(4)))),
                //   onPressed: () {},
                //   child: const Text("Stock"),
                // ),
                // SizedBox(width: 8),
                // FilledButton(
                //   style: ButtonStyle(
                //       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(4)))),
                //   onPressed: () {},
                //   child: const Text("View"),
                // ),
              ],
            ),
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
