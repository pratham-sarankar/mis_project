import 'package:intl/intl.dart';
import 'package:mis_project/app/data/models/ledger.dart';

class Consignment {
  final String id;
  final int srNo;
  String lrNo;
  DateTime dispatchDate;
  String destination;
  String vehicleNo;
  String driverMobileNo;
  String deliveryStatus;
  DateTime? deliveryDate;
  String? detention;
  String? remarks;
  Ledger ledger;

  Consignment({
    required this.id,
    required this.srNo,
    required this.lrNo,
    required this.dispatchDate,
    required this.destination,
    required this.vehicleNo,
    required this.driverMobileNo,
    required this.deliveryStatus,
    required this.ledger,
    this.deliveryDate,
    this.detention,
    this.remarks,
  });

  factory Consignment.fromJson(Map<String, dynamic> json) {
    return Consignment(
      id: json['id'],
      srNo: json['srNo'],
      lrNo: json['lrNo'],
      dispatchDate: DateTime.parse(json['dispatchDate']),
      destination: json['destination'],
      vehicleNo: json['vehicleNo'],
      driverMobileNo: json['driverMobileNo'],
      deliveryStatus: json['deliveryStatus'],
      deliveryDate: DateTime.parse(json['deliveryDate']),
      detention: json['detention'],
      remarks: json['remarks'],
      ledger: Ledger.fromJson(json['ledger']),
    );
  }

  factory Consignment.empty() {
    return Consignment(
      id: "",
      srNo: 0,
      lrNo: '',
      destination: '',
      vehicleNo: '',
      driverMobileNo: '',
      deliveryStatus: '',
      ledger: Ledger.empty(),
      dispatchDate: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson({bool isInline = false}) {
    //A date format that is valid for mongodb
    final format = DateFormat("yyyy-MM-dd");
    return {
      'id': id,
      'srNo': srNo,
      'lrNo': lrNo,
      'dispatchDate': format.format(dispatchDate),
      'destination': destination,
      'vehicleNo': vehicleNo,
      'driverMobileNo': driverMobileNo,
      'deliveryStatus': deliveryStatus,
      'deliveryDate': format.format(deliveryDate!),
      'detention': detention,
      'remarks': remarks,
      if (isInline)
        ...ledger.toJson(isInline: isInline)
      else
        'ledger': ledger.toJson(),
    };
  }
}
