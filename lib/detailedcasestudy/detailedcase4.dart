import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:expense/data/casestudy_list.dart';

class DetailedCase4 extends StatefulWidget {
  const DetailedCase4({super.key});

  @override
  State<DetailedCase4> createState() => _DetailedCase4State();
}

class _DetailedCase4State extends State<DetailedCase4> {
  bool _bookmarked = true;
  void _bookmarksList() {
    if (_bookmarked) {
      _bookmarked = false;
    } else {
      _bookmarked = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () {
                // setState(() {
                //   if (!Caselist.checkBookmark(widget.caselist)) {
                //     Caselist.addBookmark(widget.caselist);
                //   }
                // });
                _bookmarksList();
              },
              icon: (_bookmarked
                  ? const Icon(
                      Icons.bookmark_border,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.bookmark,
                      color: Colors.black,
                    )))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(caselists[3].imgUrl),
                      title: Text(
                        caselists[3].title,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ))),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          child: const Icon(Icons.format_list_bulleted),
          backgroundColor: Colors.redAccent,
          onPressed: () {},
        ),
      ),
    );
  }
}
