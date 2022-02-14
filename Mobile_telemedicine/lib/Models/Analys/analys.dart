// To parse this JSON data, do
//
//     final analys = analysFromJson(jsonString);

import 'dart:convert';

Analys analysFromJson(String str) => Analys.fromJson(json.decode(str));

String analysToJson(Analys data) => json.encode(data.toJson());

class Analys {
  Analys({
    this.name,
    this.lastname,
    this.numdemande,
    this.numdOrder,
    this.dateprelv,
    this.datenais,
    this.valone,
    this.valtwo,
    this.analysnameone,
    this.analysnametwo,
    this.valuselone,
    this.valuseltwo,
    this.indexnum,
    this.analysname,
  });

  String name;
  String lastname;
  String numdemande;
  String numdOrder;
  String dateprelv;
  String datenais;
  String valone;
  String valtwo;
  String analysnameone;
  String analysnametwo;
  String valuselone;
  String valuseltwo;
  String indexnum;
  String analysname;

  factory Analys.fromJson(Map<String, dynamic> json) => Analys(
        name: json["name"],
        lastname: json["lastname"],
        numdemande: json["numdemande"].toString(),
        numdOrder: json["numdOrder"].toString(),
        dateprelv: json["dateprelv"],
        datenais: json["datenais"],
        valone: json["valone"].toString(),
        valtwo: json["valtwo"].toString(),
        analysnameone: json["analysnameone"],
        analysnametwo: json["analysnametwo"],
        valuselone: json["valuselone"].toString(),
        valuseltwo: json["valuseltwo"].toString(),
        indexnum: json["indexnum"].toString(),
        analysname: json["analysname"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "numdemande": numdemande,
        "numdOrder": numdOrder,
        "dateprelv": dateprelv,
        "datenais": datenais,
        "valone": valone,
        "valtwo": valtwo,
        "analysnameone": analysnameone,
        "analysnametwo": analysnametwo,
        "valuselone": valuselone,
        "valuseltwo": valuseltwo,
        "indexnum": indexnum,
        "analysname": analysname,
      };
}
