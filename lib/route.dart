// ignore_for_file: prefer_const_constructors
part of 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Coming Soon"),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: Center(
          child: Column(children: const [
            Spacer(),
            Icon(Icons.settings_suggest_sharp, color: Colors.red, size: 120),
            Spacer(),
            Text(
              'Whoops...., Halaman Ini Masih Dalam Pengembangan Oleh Developer :) !',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Mclaren",
              ),
            ),
            Spacer(),
            Spacer(),
          ]),
        ),
      );
    });
  }
}
