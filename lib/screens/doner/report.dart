import 'dart:convert';

import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';

import '../../shared/network/local/sharedPrefHelper.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key, this.isHist = false});
  bool isHist = false;
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
            isHist
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Doctor id : 1455"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Report id : 144")
                    ],
                  )
                : SizedBox(),
            SizedBox(
              height: 5,
            ),
            Text("Report date : 18/2/2023 01:25 PM"),
            SizedBox(
              height: 5,
            ),
            isHist
                ? Text(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    "Dear ${CacheHelper.getData(key: "user") == null ? 'Sohila Elsaid' : jsonDecode(CacheHelper.getData(key: "user"))["name"].toString()}, your donation is rejected and your results is here")
                : SizedBox(),
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
                      verticalInside: BorderSide(strokeAlign: 1),
                      bottom: BorderSide(strokeAlign: 1),
                      right: BorderSide(strokeAlign: 1),
                      left: BorderSide(strokeAlign: 1),
                      top: BorderSide(strokeAlign: 1)),
                  showBottomBorder: true,
                  dividerThickness: 5,
                  columns: [
                    DataColumn2(
                        label: Text('Item'),
                        size: ColumnSize.L,
                        fixedWidth: MediaQuery.of(context).size.width * 0.3),
                    DataColumn2(
                        label: Text(' Result'),
                        fixedWidth: MediaQuery.of(context).size.width * 0.2),
                    DataColumn(
                      label: Text(' Range'),
                    ),
                  ],
                  rows: dataCells),
            ),
            Text("Every thing is ok You have no deceases!"),
          ],
        ),
      ),
    );
  }
}

List<DataRow> dataCells = [
  DataRow(cells: [
    DataCell(Text(
      "Hemoglobin",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("15g%"),
      ],
    )),
    DataCell(Text(("Adult male: 13g% - 18g%")))
  ]),
  DataRow(cells: [
    DataCell(Text(
      "Red blood cell count",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("5"),
      ],
    )),
    DataCell(Text(("4.2 - 5.9 million/cmm")))
  ]),
  DataRow(cells: [
    DataCell(Text(
      "MCH",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("30"),
      ],
    )),
    DataCell(Text(("27pg - 33pg")))
  ]),
  DataRow(cells: [
    DataCell(Text(
      "MCV",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("90"),
      ],
    )),
    DataCell(Text(("80fl - 100fl")))
  ]),
  DataRow(cells: [
    DataCell(Text(
      "MCHC",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("35"),
      ],
    )),
    DataCell(Text(("31 - 37g/dl")))
  ]),
  DataRow(cells: [
    DataCell(Text(
      "Platelet count",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("100"),
      ],
    )),
    DataCell(Text(("150 - 450 Thousand/cmm")))
  ]),
  DataRow(cells: [
    DataCell(Text(
      "HBA1c",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("6"),
      ],
    )),
    DataCell(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("- Non Diabetic 4.2% - 6.00%"),
        Text("- pre Diabetic 5.7% - 6.4%"),
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
        Text("26"),
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
        Text("35"),
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
        Text("25"),
      ],
    )),
    DataCell(Text("15 - 45 u/l"))
  ]),
  DataRow(cells: [
    DataCell(Text(
      "Serum creatinine",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    DataCell(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("1"),
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
        Text("1"),
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
];
