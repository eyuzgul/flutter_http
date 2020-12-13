import 'package:flutter/material.dart';
import 'models/post.dart';
import 'datas.dart';

void main() {
  runApp(ListViewApp());
}

class ListViewApp extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewApp> {
  List<Post> items = List<Post>();

  @override
  void initState() {
    super.initState();
    items = makeList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSA ListView Demo',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('ListView Demo'),
            centerTitle: true,
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.all(15.0),
                itemBuilder: (context, position) {
                  Post item = items[position];
                  return Dismissible(
                      key: Key(item.id.toString()),
                      onDismissed: (direction) {
                        print(direction.index.toString());
                        // setState(() {
                        //   items.removeAt(position);
                        // });
                      },
                      background: Container(
                        color: Colors.redAccent,
                      ),
                      child: Column(
                        children: <Widget>[
                          Divider(height: 5.0),
                          ListTile(
                            title: Text(item.title),
                            subtitle: Text(item.body),
                            leading: CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              radius: 5.0,
                              child: Text('User ${item.userId}'),
                            ),
                            onTap: () => myToast(context, "listtile tab event"),
                          ),
                        ],
                      ));
                }),
          ),
        ),
      ),
    );
  }

  static void myToast(context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        elevation: 5,
        onVisible: () => print("asdfasdf"),
        action: SnackBarAction(
          label: "OK",
          textColor: Colors.blue,
          onPressed: () {
            myToast(context, "onaylandı");
          },
        ),
        padding: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),
        duration: Duration(milliseconds: 1000),
        content: Text(msg)));
  }
}
