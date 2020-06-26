import 'package:intl/intl.dart';
import 'package:sigfrotas/src/model/server/veiculo.dart';

class ModelRequisicaoMoto {
  int id;
  int userId;
  int status;
  int veiculo_id;
  String prefixo;
  int km;
  int limpeza;
  int circunstancia;
  int ladoDireito;
  int ladoEsquerdo;
  int dianteira;
  int trazeira;
  int superior;
  int interna;
  int pneusDianteiro;
  int pneusTrazeiro;
  int combustivel;
  DateTime created_at;
  DateTime updated_at;
  Veiculo veiculo;

  ModelRequisicaoMoto({
    this.id,
    this.userId,
    this.status,
    this.veiculo_id,
    this.prefixo,
    this.km,
    this.limpeza,
    this.circunstancia,
    this.ladoDireito,
    this.ladoEsquerdo,
    this.dianteira,
    this.trazeira,
    this.superior,
    this.interna,
    this.pneusDianteiro,
    this.pneusTrazeiro,
    this.combustivel,
    this.created_at,
    this.updated_at,
  });

  ModelRequisicaoMoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    userId = json['user_id'];
    veiculo_id = json['veiculo_id'];
    prefixo = json['prefixo'];
    km = json['km'];
    limpeza = json['limpeza'];
    circunstancia = json['circunstancia'];
    ladoDireito = json['lado_direito'];
    ladoEsquerdo = json['lado_esquerdo'];
    dianteira = json['dianteira'];
    trazeira = json['trazeira'];
    superior = json['superior'];
    interna = json['interna'];
    pneusDianteiro = json['pneus_dianteiro'];
    pneusTrazeiro = json['pneus_trazeiro'];
    combustivel = json['combustivel'];
    veiculo = Veiculo.fromJson(json['veiculo']);
    created_at = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['created_at']);
    updated_at = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['veiculo_id'] = this.veiculo_id;
    data['prefixo'] = this.prefixo;
    data['km'] = this.km;
    data['limpeza'] = this.limpeza;
    data['circunstancia'] = this.circunstancia;
    data['lado_direito'] = this.ladoDireito;
    data['lado_esquerdo'] = this.ladoEsquerdo;
    data['dianteira'] = this.dianteira;
    data['trazeira'] = this.trazeira;
    data['superior'] = this.superior;
    data['interna'] = this.interna;
    data['pneus_dianteiro'] = this.pneusDianteiro;
    data['pneus_trazeiro'] = this.pneusTrazeiro;
    data['combustivel'] = this.combustivel;
    data['created_at'] = this.created_at.toIso8601String();
    data['updated_at'] = this.updated_at.toIso8601String();
    return data;
  }
}
