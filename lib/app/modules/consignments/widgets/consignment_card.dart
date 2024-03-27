import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mis_project/app/data/models/consignment.dart';
import 'package:mis_project/app/modules/consignments/views/delivery_status_view.dart';
import 'package:mis_project/app/modules/consignments/views/expenses_view.dart';

class ConsignmentCard extends StatefulWidget {
  const ConsignmentCard(
      {super.key, required this.consignment, required this.onUpdate});
  final Consignment consignment;
  final Function(Consignment) onUpdate;
  @override
  State<ConsignmentCard> createState() => _ConsignmentCardState();
}

class _ConsignmentCardState extends State<ConsignmentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.consignment.vehicleNo,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dispatch Date",
                    ),
                    Text(
                      DateFormat("d MMM, yyyy").format(
                        widget.consignment.dispatchDate,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                      left: 5,
                    ),
                    child: Row(
                      children: [
                        for (var i = 0; i <= 12; i++)
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: i % 2 == 0
                                  ? Colors.transparent
                                  : Colors.black,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("Delivery Date"),
                    Text(
                      DateFormat("d MMM, yyyy").format(
                        widget.consignment.deliveryDate!,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  "Destination : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(widget.consignment.destination),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Driver's Contact no. : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    widget.consignment.driverMobileNo,
                    style: TextStyle(
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () async {
                final consignment = await Get.dialog(
                  const ExpensesView(),
                  arguments: widget.consignment,
                );
                if (consignment != null && consignment is Consignment) {
                  widget.onUpdate(consignment);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.network(
                      "https://cdn-icons-png.flaticon.com/128/10758/10758868.png",
                      width: 40,
                    ),
                    const SizedBox(width: 8),
                    const Text(":"),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Expenses",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.consignment.ledger.profitAndLoss.expenses == 0
                              ? "NA"
                              : widget.consignment.ledger.profitAndLoss.expenses
                                  .toString(),
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                final consignment = await Get.dialog(
                  const DeliveryStatusView(),
                  arguments: widget.consignment,
                );
                if (consignment != null && consignment is Consignment) {
                  widget.onUpdate(consignment);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.network(
                      "https://cdn-icons-png.flaticon.com/128/2649/2649318.png",
                      width: 40,
                    ),
                    const SizedBox(width: 8),
                    const Text(":"),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Delivery Status",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.consignment.deliveryStatus,
                          style: const TextStyle(),
                        ),
                      ],
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
