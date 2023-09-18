class LoginStatus {
  List<Message>? message;
  List<Login>? login;

  LoginStatus({this.message, this.login});

  LoginStatus.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
    if (json['login'] != null) {
      login = <Login>[];
      json['login'].forEach((v) {
        login!.add(new Login.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    if (this.login != null) {
      data['login'] = this.login!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? msg;
  bool? msgStatus;

  Message({this.msg, this.msgStatus});

  Message.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    msgStatus = json['msg_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['msg_status'] = this.msgStatus;
    return data;
  }
}

class Login {
  bool? status;

  Login({this.status});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
