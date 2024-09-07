import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:quotes_app/modal/modalclass.dart';
import 'package:share_extend/share_extend.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Color Bgcolor = Colors.white;
  Color Textcolor = Colors.black;
  GlobalKey repaint = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Quotesmodal quotes =
        ModalRoute.of(context)!.settings.arguments as Quotesmodal;
    return Scaffold(
      appBar: AppBar(
        title: Text(quotes.cat),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
                child: RepaintBoundary(
              key: repaint,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Bgcolor,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onLongPress: () {
                    Clipboard.setData(ClipboardData(text: quotes.quote));
                  },
                  child: Text(
                    quotes.quote,
                    style: TextStyle(
                      color: Textcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )),
            SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text("Background Color"),
              ],
            ),
            Expanded(
              child: Column(
                //scrollDirection: Axis.horizontal,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(18, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                Bgcolor = Colors.primaries[index % 18];
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.primaries[index % 18],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Select color"),
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                        pickerColor: Textcolor,
                                        onColorChanged: (value) {
                                          setState(() {
                                            Textcolor = value;
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text("Text color")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShareExtend.share(quotes.quote, "image");
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}
