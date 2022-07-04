import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';

import '../models/museum_model.dart';
import '../services/api_service.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String generatedPdfFilePath = "";
  APIService _apiService = APIService();
  List<MuseumModel> museums = [];

  @override
  initState() {
    super.initState();
    _getData();
  }

  _getData() {
    _apiService.getMuseums().then((value) {
      museums = value;
    });
  }
  _generatePDF() async {
    ByteData bytesx = await rootBundle.load("assets/images/image1.png");
    Uint8List imageBytes = bytesx.buffer.asUint8List();

    pw.Document pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          //return pw.Text("Hola 2222");
          // return pw.Image(pw.MemoryImage(imageBytes));
          return pw.Table(children: [
            pw.TableRow(children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(
                      pw.MemoryImage(imageBytes),
                      height: 100,
                      // fit: pw.BoxFit.cover
                    ),
                    pw.Container(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                          pw.Text("Av. La Molina 1581, La Molina, Lima, Perú"),
                          pw.Text("Tlf: 975523380"),
                          pw.Text("E-mail: fernando.mogollon@iica.int"),
                          pw.Text("Página web: www.iica.int"),
                        ]))
                  ]),

            ]),
            pw.TableRow(
                children: [
                  pw.Divider()
                ]
            ),
            pw.TableRow(
                children: [
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Factura a"),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("Diseños Mediodia"),
                              pw.Text("Diseños Calle Eleonor de Villahermosa 10"),
                              pw.Text("30125 Valencia"),
                              pw.Text("España"),
                              pw.Text("XXXXXXXX"),
                            ]
                          ),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.end,
                              children: [
                                pw.Text("Factura: 2022-0125"),
                                pw.Text("Fecha de Factura: 15/06/2022"),
                                pw.Text("Fecha de vencimiento: 15/07/2022"),
                              ]
                          ),
                        ]
                      )
                    ]
                  )
                ]
            ),
            pw.TableRow(
                children: [
                  pw.Divider()
                ]
            ),
            pw.TableRow(
                children: [
                 pw.Row(
                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                     children: [
                       pw.Text("Descripción"),
                       pw.Row(
                           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                           children: [
                             pw.Container(
                             margin: pw.EdgeInsets.only(left: 30),
                             child: pw.Text("Cantidad"),
                             ),
                             pw.Container(
                               margin: pw.EdgeInsets.only(left: 30),
                               child: pw.Text("Unidad"),
                             ),
                             pw.Container(
                               margin: pw.EdgeInsets.only(left: 30),
                               child: pw.Text("Precio"),
                             ),
                             pw.Container(
                               margin: pw.EdgeInsets.only(left: 30),
                               child: pw.Text("IGV"),
                             ),
                             pw.Container(
                               margin: pw.EdgeInsets.only(left: 10),
                               child: pw.Text("Importe"),
                             ),

                           ]
                       )
                     ]
                 )
                ]
            ),
            pw.TableRow(
                children: [
                  pw.Divider()
                ]
            ),
            pw.TableRow(
                children: [
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text("Consulta XXXX"),
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Container(
                                margin: pw.EdgeInsets.only(left: 20),
                                child: pw.Text("1"),
                              ),
                              pw.Container(
                                margin: pw.EdgeInsets.only(left: 30),
                                child: pw.Text("hora"),
                              ),
                              pw.Container(
                                margin: pw.EdgeInsets.only(left: 30),
                                child: pw.Text("100.00"),
                              ),
                              pw.Container(
                                margin: pw.EdgeInsets.only(left: 30),
                                child: pw.Text("18%"),
                              ),
                              pw.Container(
                                margin: pw.EdgeInsets.only(left: 10),
                                child: pw.Text("118.00"),
                              ),

                            ]
                        )
                      ]
                  )
                ]
            ),
          ]);
        }));
    Uint8List bytes = await pdf.save();
    Directory dir = await getApplicationDocumentsDirectory();
    File _file = File("${dir.path}/examplePDF.pdf");
    //_file.create();
    _file.writeAsBytes(bytes);
    print(_file.path);
    OpenFile.open(_file.path);
  }

  Future<void> generateExampleDocument() async {
    final htmlContent = """
    <!DOCTYPE html>
    <html>
      <head>
        <style>
        table, th, td {
          border: 1px solid black;
          border-collapse: collapse;
        }
        th, td, p {
          padding: 5px;
          text-align: left;
        }
        </style>
      </head>
      <body>
        <h2>PDF Generated with flutter_html_to_pdf plugin</h2>
        
        <table style="width:100%">
          <caption>Sample HTML Table</caption>
          <tr>
            <th>Month</th>
            <th>Savings</th>
          </tr>
          <tr>
            <td>January</td>
            <td>100</td>
          </tr>
          <tr>
            <td>February</td>
            <td>50</td>
          </tr>
        </table>
        
        <p>Image loaded from web</p>
        <img src="https://i.imgur.com/wxaJsXF.png" alt="web-img">
      </body>
    </html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;
    final targetFileName = "example-pdf";

    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
    print(generatedPdfFilePath);
    if (generatedPdfFilePath != "") {
      OpenFile.open(generatedPdfFilePath);
    }
  }

  _generatePDF3() async {
    ByteData bytesx = await rootBundle.load("assets/images/image1.png");
    Uint8List imageBytes = bytesx.buffer.asUint8List();

    pw.Document pdf = pw.Document();


    pdf.addPage(
      pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              pw.Table(
                children: [
                  pw.TableRow(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Image(
                            pw.MemoryImage(
                              imageBytes,
                            ),
                            height: 100.0,

                          ),
                          pw.Container(
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                children: [
                                  pw.Text(
                                      "Calle Los Portales 23232 - Cayma - Arequipa"),
                                  pw.Text("Tlf: 43432232"),
                                  pw.Text("E-mail: isdsd@gmail.com"),
                                  pw.Text("Página web: www.sdsad.com"),
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Divider(),
                    ],
                  ),
                ],
              ),
              pw.Table(
                children: List.generate(
                  300,
                      (index) => pw.TableRow(
                    children: [
                      pw.Text("wwwwwwwwww"),
                    ],
                  ),
                ),
              ),
            ];
          }),
    );

    Uint8List bytes = await pdf.save();
    Directory dir = await getApplicationDocumentsDirectory();

    File _file = File("${dir.path}/example2PDF.pdf");

    _file.writeAsBytes(bytes);
    await OpenFile.open(_file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              _generatePDF();
            },
            child: Text("Generar PDF"),
          ),
          ElevatedButton(
            onPressed: () {
              generateExampleDocument();
            },
            child: Text("Generar PDF2"),
          ),
          ElevatedButton(
            onPressed: () {
              _generatePDF3();
            },
            child: Text("Generar PDF3"),
          ),
        ],
      ),
    ));
  }
}
