// ignore_for_file: unnecessary_this
import 'package:srmobile/helpers/constantes.dart';
import 'package:srmobile/models/fichaenfermagemmodel.dart';

class FichaEnfermagemDbModel extends FichaEnfermagemModel {
  int? id;
  String? nmpaciente;

  FichaEnfermagemDbModel({this.id, this.nmpaciente});

  FichaEnfermagemDbModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map[TB_FICHAENFERMAGEM_ID];
    this.nmpaciente = map[TB_FICHAENFERMAGEM_NMPACIENTE];
    this.idadmission = map[TB_FICHAENFERMAGEM_IDADMISSION];
    this.idprofessional = map[TB_FICHAENFERMAGEM_IDPROFESSIONAL];
    this.idcapconsult = map[TB_FICHAENFERMAGEM_IDCAPCONSULT];
    this.idprofagenda = map[TB_FICHAENFERMAGEM_IDPROFAGENDA];
    this.datainicio = map[TB_FICHAENFERMAGEM_DATAINICIO];
    this.datafim = map[TB_FICHAENFERMAGEM_DATAFIM];
    this.acompanhante = map[TB_FICHAENFERMAGEM_ACOMPANHANTE];
    this.hospital = map[TB_FICHAENFERMAGEM_HOSPITAL];
    this.cuidadobanho = map[TB_FICHAENFERMAGEM_CUIDADOBANHO];
    this.cuidadovestir = map[TB_FICHAENFERMAGEM_CUIDADOVESTIR];
    this.cuidadotransferencia = map[TB_FICHAENFERMAGEM_CUIDADOTRANSFERENCIA];
    this.cuidadocontinencia = map[TB_FICHAENFERMAGEM_CUIDADOCONTINENCIA];
    this.cuidadoalimentacao = map[TB_FICHAENFERMAGEM_CUIDADOALIMENTACAO];
    this.utilizacaotqt = map[TB_FICHAENFERMAGEM_UTILIZACAOTQT];
    this.utilizacaocne = map[TB_FICHAENFERMAGEM_UTILIZACAOCNE];
    this.utilizacaogt = map[TB_FICHAENFERMAGEM_UTILIZACAOGT];
    this.utilizacaocvd = map[TB_FICHAENFERMAGEM_UTILIZACAOCVD];
    this.utilizacaooutros = map[TB_FICHAENFERMAGEM_UTILIZACAOOUTROS];
    this.utilizacaooutrostexto = map[TB_FICHAENFERMAGEM_UTILIZACAOOUTROSTEXTO];
    this.oxigenoterapiacilindro =
        map[TB_FICHAENFERMAGEM_OXIGENOTERAPIACILINDRO];
    this.oxigenoterapiaconcentrador =
        map[TB_FICHAENFERMAGEM_OXIGENOTERAPIACONCENTRADOR];
    this.oxigenoterapiacontinuo =
        map[TB_FICHAENFERMAGEM_OXIGENOTERAPIACONTINUO];
    this.oxigenoterapianao = map[TB_FICHAENFERMAGEM_OXIGENOTERAPIANAO];
    this.ventilacaomecanica = map[TB_FICHAENFERMAGEM_VENTILACAOMECANICA];
    this.ventilacaomecanicaequipamento =
        map[TB_FICHAENFERMAGEM_VENTILACAOMECANICAEQUIPAMENTO];
    this.pamax = map[TB_FICHAENFERMAGEM_PAMAX];
    this.pamin = map[TB_FICHAENFERMAGEM_PAMIN];
    this.feridapressao = map[TB_FICHAENFERMAGEM_FERIDAPRESSAO];
    this.feridavasculogencia = map[TB_FICHAENFERMAGEM_FERIDAVASCULOGENCIA];
    this.feridacirurgia = map[TB_FICHAENFERMAGEM_FERIDACIRURGIA];
    this.feridaoutros = map[TB_FICHAENFERMAGEM_FERIDAOUTROS];
    this.diag001 = map[TB_FICHAENFERMAGEM_DIAG001];
    this.diag002 = map[TB_FICHAENFERMAGEM_DIAG002];
    this.diag003 = map[TB_FICHAENFERMAGEM_DIAG003];
    this.diag004 = map[TB_FICHAENFERMAGEM_DIAG004];
    this.diag005 = map[TB_FICHAENFERMAGEM_DIAG005];
    this.diag006 = map[TB_FICHAENFERMAGEM_DIAG006];
    this.diag007 = map[TB_FICHAENFERMAGEM_DIAG007];
    this.diag008 = map[TB_FICHAENFERMAGEM_DIAG008];
    this.diag009 = map[TB_FICHAENFERMAGEM_DIAG009];
    this.diag010 = map[TB_FICHAENFERMAGEM_DIAG010];
    this.diag011 = map[TB_FICHAENFERMAGEM_DIAG011];
    this.diag012 = map[TB_FICHAENFERMAGEM_DIAG012];
    this.diag013 = map[TB_FICHAENFERMAGEM_DIAG013];
    this.diag014 = map[TB_FICHAENFERMAGEM_DIAG014];
    this.diag015 = map[TB_FICHAENFERMAGEM_DIAG015];
    this.proc001 = map[TB_FICHAENFERMAGEM_PROC001];
    this.proc002 = map[TB_FICHAENFERMAGEM_PROC002];
    this.proc003 = map[TB_FICHAENFERMAGEM_PROC003];
    this.proc004 = map[TB_FICHAENFERMAGEM_PROC004];
    this.proc005 = map[TB_FICHAENFERMAGEM_PROC005];
    this.proc006 = map[TB_FICHAENFERMAGEM_PROC006];
    this.proc007 = map[TB_FICHAENFERMAGEM_PROC007];
    this.proc008 = map[TB_FICHAENFERMAGEM_PROC008];
    this.procoutros = map[TB_FICHAENFERMAGEM_PROCOUTROS];
    this.procoutrostexto = map[TB_FICHAENFERMAGEM_PROCOUTROSTEXTO];
    this.cuid001 = map[TB_FICHAENFERMAGEM_CUID001];
    this.cuid002 = map[TB_FICHAENFERMAGEM_CUID002];
    this.cuid003 = map[TB_FICHAENFERMAGEM_CUID003];
    this.cuid004 = map[TB_FICHAENFERMAGEM_CUID004];
    this.cuid005 = map[TB_FICHAENFERMAGEM_CUID005];
    this.cuid006 = map[TB_FICHAENFERMAGEM_CUID006];
    this.cuid007 = map[TB_FICHAENFERMAGEM_CUID007];
    this.cuid008 = map[TB_FICHAENFERMAGEM_CUID008];
    this.cuidoutros = map[TB_FICHAENFERMAGEM_CUIDOUTROS];
    this.cuidoutrostexto = map[TB_FICHAENFERMAGEM_CUIDOUTROSTEXTO];
    this.bradenpercepcaosensorial =
        map[TB_FICHAENFERMAGEM_BRADENPERCEPCAOSENSORIAL];
    this.bradenumidade = map[TB_FICHAENFERMAGEM_BRADENUMIDADE];
    this.bradenatividade = map[TB_FICHAENFERMAGEM_BRADENATIVIDADE];
    this.bradenmobilidade = map[TB_FICHAENFERMAGEM_BRADENMOBILIDADE];
    this.bradennutricao = map[TB_FICHAENFERMAGEM_BRADENNUTRICAO];
    this.bradenficcao = map[TB_FICHAENFERMAGEM_BRADENFICCAO];
    this.observacao = map[TB_FICHAENFERMAGEM_OBSERVACAO];
    this.assinaturapaciente = map[TB_FICHAENFERMAGEM_ASSINATURAPACIENTE];
    this.assinaturaprofissional =
        map[TB_FICHAENFERMAGEM_ASSINATURAPROFISSIONAL];
    this.latitude = map[TB_FICHAENFERMAGEM_LATITUDE];
    this.longitude = map[TB_FICHAENFERMAGEM_LONGITUDE];
  }
}
