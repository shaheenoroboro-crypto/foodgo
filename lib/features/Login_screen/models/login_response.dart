class LoginResponse {
  String? _refresh;
  String? _access;
  String? _email;

  LoginResponse({String? refresh, String? access, String? email}) {
    if (refresh != null) {
      this._refresh = refresh;
    }
    if (access != null) {
      this._access = access;
    }
    if (email != null) {
      this._email = email;
    }
  }

  String? get refresh => _refresh;
  set refresh(String? refresh) => _refresh = refresh;
  String? get access => _access;
  set access(String? access) => _access = access;
  String? get email => _email;
  set email(String? email) => _email = email;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    _refresh = json['refresh'];
    _access = json['access'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this._refresh;
    data['access'] = this._access;
    data['email'] = this._email;
    return data;
  }
}
