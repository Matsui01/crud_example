import 'package:satturno_app/export_widgets.dart';


class EnergiaResult extends StatelessWidget {
  final VoidCallback solicitarOrcamento;
  EnergiaResult(this.solicitarOrcamento);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 438,
      margin: EdgeInsets.only(top: 45, bottom: 45),
      child: Material(
        elevation: 3,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
                size: 100,
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Resultado",
                  style: Template.myTextStyle4(),
                ),
              ),
              rowInfo("Área", "XX"),
              rowInfo("Potência", "XX"),
              rowInfo("Retorno do investimento", "XX"),
              rowInfo("Investimento total", "XX"),
              Button(
                text: 'Solicitar Orçamento',
                arrow: false,
                click: solicitarOrcamento,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container rowInfo(String inf, String result) {
    return Container(
      padding: EdgeInsets.only(right: 30, left: 30, top: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              inf,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.visible,
              style: Template.myTextStyle5(),
            ),
          ),
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 1,
            child: Text(
              result,
              textAlign: TextAlign.end,
              style: Template.myTextStyle4(),
            ),
          ),
        ],
      ),
    );
  }
}
