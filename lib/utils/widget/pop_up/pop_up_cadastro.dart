import 'dart:ui';
import 'package:satturno_app/controller/pop_up_cadastro_controller.dart';
import 'package:satturno_app/export_widgets.dart';
import 'package:satturno_app/utils/texts/my_validator.dart';

class PopUpCadastro extends StatelessWidget {
  final popUpCadastroController = PopUpCadastroController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(50, 255, 112, 0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                  flex: 7,
                ),
                Expanded(
                  flex: 80,
                  child: ListView(
                    children: [
                      Container(
                        height: 520,
                        width: 350,
                        //alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(
                            top: 50, right: 0, left: 0, bottom: 10),
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
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text(
                                        "Informe seu CPF e o código de acesso nos campos abaixo.",
                                        textAlign: TextAlign.center,
                                        style: Template.myTextStyle4(),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(30, 10, 30, 15),
                                      height: 2,
                                      color: Color.fromRGBO(255, 166, 25, 1),
                                    ),
                                    ImputField(
                                      text: 'CPF',
                                      hintText: '',
                                      darkColor: false,
                                      controller: popUpCadastroController.cpfController,
                                      validator: Validators.validatorNotNullObrigatorio,
                                      obscure: false,
                                      topPadding: 10,
                                    ),
                                    const SizedBox(height: 10),
                                    ImputField(
                                      text: 'Código de acesso',
                                      hintText: '',
                                      darkColor: false,
                                      controller: popUpCadastroController.acessoController,
                                      validator: Validators.validatorNotNullObrigatorio,
                                      obscure: false,
                                      topPadding: 10,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                margin: EdgeInsets.only(bottom: 15),
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  elevation: 4,
                                  child: Text('Continuar'),
                                  onPressed: () {},
                                  animationDuration: Duration(seconds: 2),
                                  color: Color.fromRGBO(255, 166, 25, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                  flex: 7,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
