enum Url {
  dev(
    'https://check-car.itjn.ru:8079/realms/ep/protocol/openid-connect/token',
    'https://be.skabinet.su',
  ),
  /*dev('https://gds.skabinet.ru/users/login',
      'https://gds.skabinet.ru'),*/
  prod(
    'https://check-car.itjn.ru:8079/realms/ep/protocol/openid-connect/token',
   // 'http://158.160.125.73:8091'
    'https://be.skabinet.su',
  );

  final String authorization;
  final String base;

  Uri get authUri => Uri.parse(authorization);

  Uri get baseUri => Uri.parse(base);

  const Url(this.authorization, this.base);
}

enum EndPointType {
  singIn(
    'https://check-car.itjn.ru:8079/realms/ep/protocol/openid-connect/token',
    '',
    '',
  ),
  documents('/documents/', '', ''),
  documentView('/documents/', '', ''),
  documentDetail('/documents/', '/detailsIn', ''),
  //application('/applications/', '', ''),
  /* documentTemplate(
      '/document_templates/', '/files/search/by_size?size=low', ''),*/
  documentTemplate('/document_templates/', '/files', '/data'),
  documentFileTemplate('/document_templates/', '/files/', '/data'),
  application('/applications/', '/detailsOut/', ''),
  requestFile('/requests/', '/files/', '/data'),
  requestDelete('/requests/', '', ''),
  requestCreate('/requests/', '/details', ''),
  requestView('/requests/view/search/by_employee?employeeId=', '', ''),
  requestDetail('/requests/', '/details/view', ''),
  requestStatusEvent('/requests/', '/status_events', ''),
  requestFileTemplate('/request_templates/', '/files/', '/data'),
  getProfile('/employees/view/', '', ''),
  users('/users/', '', ''),
  usersRegistration('/users/registration/', '', ''),
  organizationsRegistration('/organizations/registration/', '/send', ''),
  employeesRegistration('/employees/registration/', '', ''),
  employees('/employees/', '', ''),
  validation('/invitations/', '/confirm?confirmationCode=', ''),
  cars('/cars/', '', ''),
  templates('/templates/', '/files/', '/data'),
  tasks('/tasks/view/search/by_employee?employeeId=', '', ''),
  taskView('/tasks/', '/view', ''),
  taskDetail('/tasks/', '/details/view', ''),
  taskFiles('/tasks/', '/files', ''),
  updateTaskDetail('/tasks/', '/details/view', ''),
  events('/checkListEvents?parentId=', '', ''),
  organizations('/organizations/', '', ''),
  registration('/', '', ''),
  serverFile('/', '', '');

  final String value;
  final String secondValue;
  final String thirdValue;

  const EndPointType(this.value, this.secondValue, this.thirdValue);
}

 extension EndPointTypeExt on EndPointType{
  String getUrl([String? id, String? secondId]) {
    String url = Url.dev.base+value;
    if (id != null) url = url + id + secondValue;
    if (secondId != null) url = '$url/$secondId$thirdValue/data';
    return url;
  }
}
