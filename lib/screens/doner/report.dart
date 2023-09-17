import 'dart:convert';

import 'package:clay_containers/clay_containers.dart';
import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hayah/model/report_model.dart';
import 'package:hayah/shared/constants.dart';

import '../../shared/network/local/sharedPrefHelper.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key, required this.reportModel, required this.repId});

  ReportModel? reportModel;
  int repId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text("Date of report : 12:00 pm 18/2/2023",
        //         style: TextStyle(fontWeight: FontWeight.bold)),

        //   ],
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Doctor id : ${reportModel!.DoctorCode.toString()}"),
                SizedBox(
                  height: 5,
                ),
                Text("Report id : ${repId}")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text("Report date : ${reportModel!.ReportDate}"),
                // Spacer(),
                // ClayContainer(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text("Accepted"),
                //     ),
                //     color: Colors.greenAccent,
                //     spread: 5,
                //     depth: 50,
                //     borderRadius: 50),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                text: '',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          "Dear ${jsonDecode(CacheHelper.getData(key: donorData))["fname"]}"),
                  TextSpan(text: ", your donation is "),
                  TextSpan(
                      text: reportModel!.status,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: reportModel!.status == "Rejected"
                              ? Colors.red
                              : Colors.green)),
                  TextSpan(text: ' and your results is here!'),
                ],
              ),
            ),
            // isHist
            //     ? Text(
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //         "Dear ${CacheHelper.getData(key: "user") == null ? 'Sohila Elsaid' : jsonDecode(CacheHelper.getData(key: "user"))["name"].toString()}, your donation is rejected and your results is here")
            //     : SizedBox(),
            SizedBox(
              height: 5,
            ),
            SizedBox(height: 10),
            Expanded(
              child: DataTable2(
                  lmRatio: 1.2,
                  horizontalMargin: 12,
                  dataRowHeight: 100,
                  columnSpacing: 0,
                  border: TableBorder(
                      horizontalInside: BorderSide(strokeAlign: 1),
                      bottom: BorderSide(strokeAlign: 1),
                      right: BorderSide(strokeAlign: 1),
                      left: BorderSide(strokeAlign: 1),
                      top: BorderSide(strokeAlign: 1)),
                  showBottomBorder: true,
                  dividerThickness: 5,
                  columns: [
                    DataColumn2(
                        label: Text('Test',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        size: ColumnSize.L,
                        fixedWidth: MediaQuery.of(context).size.width * 0.2),
                    DataColumn2(
                        label: Text(' Result',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        fixedWidth: MediaQuery.of(context).size.width * 0.2),
                    DataColumn2(
                        label: Text('     Unit',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        fixedWidth: MediaQuery.of(context).size.width * 0.2),
                    DataColumn(
                      label: Text(' Range',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                  rows: getdataCells(reportModel!)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClayContainer(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: reportModel!.status == "Rejected"
                        ? Text(
                            "We are sorry you cant donate because you have ${reportModel!.reason}",
                            style: TextStyle(fontWeight: FontWeight.bold))
                        : Text("Every thing is ok You have no diseases!",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<DataRow> getdataCells(ReportModel r) {
  List<DataRow> dataCells = [
    DataRow(cells: [
      DataCell(Text(
        "Hemoglobin",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.Hemoglobin.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("g%"),
        ],
      )),
      DataCell(Text(("Adult male: 13 - 18")))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "Red blood cell count",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.RedBloodCellCount.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 70,
              child: Text(
                "million/cmm",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              )),
        ],
      )),
      DataCell(Text(("4.2 - 5.9")))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "MCH",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.MCH.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("pg"),
        ],
      )),
      DataCell(Text(("27 - 33")))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "MCV",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.MCV.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("fl"),
        ],
      )),
      DataCell(Text(("80 - 100")))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "MCHC",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.MCHC.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("g/dl"),
        ],
      )),
      DataCell(Text(("31 - 37")))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "Platelet count",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.PlateletCount.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 70,
              child: Text("Thousand/cmm",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))),
        ],
      )),
      DataCell(Text(("150 - 450")))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "HBA1c",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.HBA1c.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("%"),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("- Non Diabetic 4.2 - 6.00"),
          Text("- pre Diabetic 5.7 - 6.4"),
          Text("- Diabetic > 8"),
        ],
      ))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "SGOT-AST",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.SGOTASAT.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("U/L"),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("- Female : up to 31"),
          Text("- Male : up to 38"),
        ],
      ))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "SGPT-ALT",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.SGPTALT.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("U/L"),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("- Female : up to 36"),
          Text("- Male : up to 43"),
        ],
      ))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "Blood urea",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.BloodUrea.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("mg/dl"),
        ],
      )),
      DataCell(Text("15 - 45 "))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "Serum creatinine",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.SerumCreatinine.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("mg/dl"),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("- Female : 0.6 to 1.2"),
          Text("- Male : 0.7 to 1.3"),
          Text("- Children : 0.3 to 0.7"),
        ],
      ))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "Serum uric acid",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.SerumUricAcid.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("mg/dl"),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("- Female: 2.5 to 6.8"),
          Text("- Male: 3.6 to 7.7"),
        ],
      ))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "HBs_Antigen",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.HBsAntigen.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(""),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(""),
        ],
      ))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "HCV_Ab_lgG",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.HCVAbLgG.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(""),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(""),
        ],
      ))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "HIV_Antibody",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.HIVAntibody.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(""),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(""),
        ],
      ))
    ]),
    DataRow(cells: [
      DataCell(Text(
        "VDRL",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(r.VDRL.toString()),
        ],
      )),
      DataCell(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(""),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(""),
        ],
      ))
    ]),
  ];
  return dataCells;
}
