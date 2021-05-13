import 'dart:ui';
import 'package:satturno_app/export_widgets.dart';

class PopUpAlert extends StatelessWidget {
  final int typePop;
  PopUpAlert({this.typePop});
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
              height: 420,
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
                      fit: BoxFit.fill,
                      image: AssetImage("assets/alert.png"),
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 2),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Chamado Solicitado fora do\nhorário de atendimento.",
                            textAlign: TextAlign.center,
                            style: Template.myTextStyle4(),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Sua Solicitação será\nrecebida, porém só será\nprocessada no horário\nde atendimento",
                            textAlign: TextAlign.center,
                            style: Template.myTextStyle4(),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Em caso de chamado urgente\nfora do horário de atendimento\nentre em contato pelo número:\n(15)3229-7201",
                            textAlign: TextAlign.center,
                            style: Template.myTextStyle5(),
                          )
                        ],
                      ),
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
