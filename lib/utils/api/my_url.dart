import 'package:crud_example/utils/api/api.dart';

class Myurl {
  String mainRoute = "";
  static String devRoute = "https://184fad91-8917-4e42-9b5d-e1f6f26f8ae6.mock.pstmn.io";
  static String fixRoute = "https://dev.api.atendimento.satturno.com.br";

  String auth;
  String cadastro;
  String logado;
  String arCondicionado;
  String ocorrencias;
  String categoriaEquipamentos;
  String solicitacaoChamado;
  String solicitacaoOrcamento;
  String valores;
  String clientes;
  String recuperarSenha;
  String pushNotifications;
  String categoriaEquipamentosAr;

  String verificarCadastro;
  String reenviarCodigo;
  String codigoCliente;

  static String setIdUrl(String url, int id) {
    List<String> splitResult = url.split(":id");
    print("ResultURL: $splitResult");
    return splitResult[0] + id.toString() + splitResult[1];
  }

  static String setParameters(String url, Map body) {
    List keys = body.keys.toList();
    url = "$url?";
    for (var i = 0; i < keys.length; i++) {
      if (i < keys.length - 1) {
        url += "${keys[i]}=${body[keys[i]]}&";
      } else {
        url += "${keys[i]}=${body[keys[i]]}";
      }
    }
    return url;
  }

  Future<bool> setURLs([bool value]) async {
    if (value == null) {
      value = await MyIo.loadBool("route");

      if (value == null) {
        await MyIo.saveBool("route", false);
        value = false;
      }
    } else {
      await MyIo.saveBool("route", value);
    }

    if (value) {
      mainRoute = devRoute;
    } else {
      mainRoute = fixRoute;
    }

    auth = "$mainRoute${StaticURL.auth}";
    cadastro = "$mainRoute${StaticURL.cadastro}";
    logado = "$mainRoute${StaticURL.logado}";
    arCondicionado = "$mainRoute${StaticURL.arCondicionado}";
    ocorrencias = "$mainRoute${StaticURL.ocorrencias}";
    categoriaEquipamentos = "$mainRoute${StaticURL.categoriaEquipamentos}";
    solicitacaoChamado = "$mainRoute${StaticURL.solicitacaoChamado}";
    solicitacaoOrcamento = "$mainRoute${StaticURL.solicitacaoOrcamento}";
    valores = "$mainRoute${StaticURL.valores}";
    clientes = "$mainRoute${StaticURL.clientes}";
    recuperarSenha = "$mainRoute${StaticURL.recuperarSenha}";
    pushNotifications = "$mainRoute${StaticURL.pushNotification}";
    categoriaEquipamentosAr = "$mainRoute${StaticURL.categoriaEquipamentosAr}";

    verificarCadastro = "$mainRoute${StaticURL.verificarCadastro}";
    reenviarCodigo = "$mainRoute${StaticURL.reenviarCodigo}";
    codigoCliente = "$mainRoute${StaticURL.codigoCliente}";

    return value;
  }
}

class StaticURL {
  static String auth = '/oauth/token';
  static String cadastro = '/v1/cliente/register';
  static String logado = '/v1/users/logado';
  static String arCondicionado = '/v1/simuladores/ar_condicionado';
  static String ocorrencias = '/v1/ocorrencias';
  static String solicitacaoChamado = '/v1/solicitacao-chamado';
  static String solicitacaoOrcamento = '/v1/solicitacao-orcamento';
  static String valores = '/v1/chamados/valores';
  static String clientes = '/v1/clientes/:id';
  static String recuperarSenha = '/v1/auth/password/email';
  static String pushNotification = '/v1/users/push-tokens';
  static String categoriaEquipamentos = '/v1/categorias_equipamentos';
  static String categoriaEquipamentosAr = '/categorias_equipamentos/ar_condicionado';

  static String verificarCadastro = '/v1/codigo-cliente/verificar-cadastro'; // POST -> {} - BODY -> 200 ou 403
  static String reenviarCodigo = '/v1/codigo-cliente/reenviar-email'; // POST -> {"user_id": 1} - BODY
  static String codigoCliente = '/v1/codigo-cliente'; // ->POST {"codigo": "ABCDEF"} - BODY
}
