class AuthParams {
  final String email;
  final String password;
  final String? name;
  final String? image;
  final String? bio;
  final String? language;


  AuthParams(this.email, this.password,  this.name, this.image, {this.bio, this.language});
}
