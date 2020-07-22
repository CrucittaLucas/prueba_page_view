import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[_Navegacion(), _PageView()],
        ),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionActual = Provider.of<_NavegacionModel>(context);
    return PageView(
        controller: navegacionActual.pageController,
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue)
        ]);
  }
}

class _PageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final navegacionActual = Provider.of<_NavegacionModel>(context);
    final style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        color: Colors.transparent,
        child: PageView(
          controller: navegacionActual.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Center(
                child: Text(
              'Hang Out',
              style: style,
            )),
            Center(child: Text('Deni In', style: style)),
            Center(child: Text('Shop', style: style)),
          ],
        ),
      ),
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();
  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
