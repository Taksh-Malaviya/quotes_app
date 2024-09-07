import 'package:flutter/material.dart';
import 'package:quotes_app/Quotes_list/list.dart';
import 'package:quotes_app/Routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes"),
        actions: [
          IconButton(
              onPressed: () {
                setState(
                  () {
                    toggle = !toggle;
                  },
                );
              },
              icon: (toggle)
                  ? const Icon(Icons.import_contacts_sharp)
                  : const Icon(Icons.construction))
        ],
      ),
      body: Column(
        children: [
          if (toggle) buildListView() else buildListView2(),
        ],
      ),
    );
  }

  Expanded buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: allQuote.length,
        itemBuilder: (context, index) => ListTile(
          leading: Text("${index + 1}"),
          title: Text(allQuote[index].quote),
          subtitle: Text("~ ${allQuote[index].author}"),
          trailing: Text(allQuote[index].cat),
        ),
      ),
    );
  }

  Expanded buildListView2() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: allQuote.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.detailpage,
                arguments: allQuote[index]);
          },
          child: Card(
            // color: Colors.primaries[index % 18],
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(allQuote[index].quote),
                  Text("~ ${allQuote[index].author}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
