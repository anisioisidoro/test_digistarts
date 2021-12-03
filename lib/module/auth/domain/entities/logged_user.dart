class LoggedUserModel {
  LoggedUserModel({this.sucess = false, this.user, this.token, this.message});

  bool sucess;
  User? user;
  String? token;
  String? message;

  factory LoggedUserModel.fromJson(Map<String, dynamic> json) =>
      LoggedUserModel(
        sucess: json["sucess"] == null ? null : json["sucess"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"] == null ? null : json["token"],
        message: json["message"] == null ? null : json["message"],
      );
}

class User {
  User({
    this.id,
    this.ano,
    this.codigo,
    this.nome,
    this.sexo,
    this.curso,
    this.anoFrequencia,
    this.turno,
    this.turma,
    this.polo,
    this.password,
  });

  int? id;
  String? ano;
  String? codigo;
  String? nome;
  String? sexo;
  String? curso;
  String? anoFrequencia;
  String? turno;
  String? turma;
  String? polo;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        ano: json["Ano"] == null ? null : json["Ano"],
        codigo: json["Codigo"] == null ? null : json["Codigo"],
        nome: json["Nome"] == null ? null : json["Nome"],
        sexo: json["Sexo"] == null ? null : json["Sexo"],
        curso: json["Curso"] == null ? null : json["Curso"],
        anoFrequencia:
            json["Ano_Frequencia"] == null ? null : json["Ano_Frequencia"],
        turno: json["Turno"] == null ? null : json["Turno"],
        turma: json["Turma"] == null ? null : json["Turma"],
        polo: json["Polo"] == null ? null : json["Polo"],
        password: json["Password"] == null ? null : json["Password"],
      );
}
