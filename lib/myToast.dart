class MyToast {
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
