import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/geeta_model.dart';

class BhagwatGeeta extends StatefulWidget {
  const BhagwatGeeta({super.key});

  @override
  State<BhagwatGeeta> createState() => _BhagwatGeetaState();
}

class _BhagwatGeetaState extends State<BhagwatGeeta> {
  List<GeetaModel> chapterlist = [];
  Future<List<GeetaModel>> getgeetaapi() async {
    final response =
        await http.get(Uri.parse('https://bhagavadgitaapi.in/chapters'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        chapterlist.add(GeetaModel.fromJson(i));
      }
      return chapterlist;
    } else {
      return chapterlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bhagwat Geeta'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: getgeetaapi(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                } else {
                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: chapterlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                    'Chapter: ${chapterlist[index].chapterNumber}'),
                                Text(
                                    'verse: ${chapterlist[index].versesCount}'),
                                Text(chapterlist[index].name.toString()),
                                const SizedBox(height: 10),
                                Text(chapterlist[index].meaning!.en.toString()),
                                const SizedBox(height: 10),
                                Text(chapterlist[index].summary!.hi.toString()),
                                const SizedBox(height: 10),
                                Text(chapterlist[index].summary!.en.toString()),
                                const SizedBox(height: 10),
                                Text(chapterlist[index].translation.toString()),
                                const SizedBox(height: 10),
                              ],
                            )),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
