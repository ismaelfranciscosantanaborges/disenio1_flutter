import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[_pagina1(), _pagina2(context)],
    ));
  }

  Widget _pagina1() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos() {
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);

    return SafeArea(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text('11°', style: estiloTexto),
            Text('Miércoles', style: estiloTexto),
            Spacer(),
            GestureDetector(
              onTap: () => _pageController.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.linear),
              child: Container(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pagina2(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Bienvenidos', style: TextStyle(fontSize: 20.0)),
          ),
          onPressed: () => Navigator.pushNamed(context, 'botones'),
        ),
      ),
    );
  }
}
