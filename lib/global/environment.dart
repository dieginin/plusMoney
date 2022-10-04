import 'dart:io';

const localhost = 'http://localhost:3000';
const defhost = 'http://10.0.2.2:3000';

class Environment {
  static String apiUrl = Platform.isAndroid ? '$defhost/api' : '$localhost/api';
}
