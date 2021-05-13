import 'dart:ui';
import 'package:satturno_app/export_widgets.dart';


class PopBlur extends StatelessWidget {
  final int screen;
  PopBlur({this.screen});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      color: Color.fromARGB(50, 255, 112, 0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 270,
              width: 290,
              //alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/like.png"),
                      color: Theme.of(context).primaryColor,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 2),
                      child: screen == 0
                          ? Text(
                              "Orçamento solicitado com sucesso!\n Em breve entraremos em contato.",
                              textAlign: TextAlign.center,
                              style: Template.myTextStyle4(),
                            )
                          : screen == 1
                              ? Column(
                                  children: <Widget>[
                                    Text(
                                      "Solicitação enviada com sucesso!\n Em breve entraremos em contato.",
                                      textAlign: TextAlign.center,
                                      style: Template.myTextStyle4(),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "N° de protocolo: A0012020BCD",
                                      textAlign: TextAlign.center,
                                      style: Template.myTextStyle6(),
                                    )
                                  ],
                                )
                              : Container()
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
