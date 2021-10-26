class Usuario {
  String user_id;
  String nombre;
  String telefono;
  String direccion;
  String genero;
  String email;
  String password;
  String password2;

  Usuario(this.user_id, this.nombre, this.telefono, this.direccion, this.genero,
      this.email, this.password, this.password2);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'nombre': nombre,
      'direccion': direccion,
      'telefono': telefono,
      'genero': genero,
      'email': email,
      'password': password,
      'password2': password2
    };
    return map;
  }

  Usuario.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    nombre = map['nombre'];
    direccion = map['direccion'];
    telefono = map['telefono'];
    genero = map['genero'];
    email = map['email'];
    password = map['password'];
    password2 = map['password2'];
  }
}
