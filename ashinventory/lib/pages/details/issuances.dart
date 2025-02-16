import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IssuanceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> issuanceDetails;

  const IssuanceDetailsPage({super.key, required this.issuanceDetails});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM, y').format(issuanceDetails['date']);

    return Scaffold(
      appBar: AppBar(
        title: Text(issuanceDetails['itemName'] ?? 'Issuance Details'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              issuanceDetails['itemName'] ?? 'N/A',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _infoTile("Issued Quantity", issuanceDetails['quantity'].toString()),
            _infoTile("Department", issuanceDetails['department'] ?? 'N/A'),
            _infoTile("Recipient", issuanceDetails['recipient'] ?? 'N/A'),
            _infoTile("Issuer", issuanceDetails['issuer'] ?? 'N/A'),
            _infoTile("Storage Location", issuanceDetails['storageLocation'] ?? 'N/A'),
            _infoTile("Issuance Date", formattedDate),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Additional Notes:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              issuanceDetails['notes'] ?? 'No additional notes.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  /// A helper widget to display key-value pairs as a clean row.
  Widget _infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
