enum Url {
  dev(
    'https://check-car.itjn.ru:8079/realms/ep/protocol/openid-connect/token',
    'https://be.skabinet.su',
  ),
  prod(
    'https://check-car.itjn.ru:8079/realms/ep/protocol/openid-connect/token',
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
  application('/applications/', '/detailsOut/', ''),
  cars('/cars/', '', ''),
  documents('/documents/', '', ''),
  documentEvents('/document_statuses/?parentId=', '', ''),
  documentView('/documents/', '', ''),
  documentDetail('/documents/', '/detailsIn', ''),
  //application('/applications/', '', ''),
  /* documentTemplate(
      '/document_templates/', '/files/search/by_size?size=low', ''),*/
  documentTemplate('/document_templates/', '/files', '/data'),
  documentFileTemplate('/document_templates/', '/files/', '/data'),
  employeesRegistration('/employees/registration/', '', ''),
  employees('/employees/', '', ''),
  events('/events?parentId=', '', ''),
  getProfile('/employees/view/', '', ''),
  notification('/notificationClients/', '/detailsIn', ''),
  organizations('/organizations/', '', ''),
  registration('/', '', ''),
  requestFile('/requests/', '/files/', '/data'),
  requestDelete('/requests/', '', ''),
  requestCreate('/requests/', '/details', ''),
  requestView('/requests/view/search/by_employee?employeeId=', '', ''),
  requestDetail('/requests/', '/details/view', ''),
  requestStatusEvent('/requests/', '/status_events', ''),
  requestFileTemplate('/request_templates/', '/files/', '/data'),
  users('/users/', '', ''),
  usersRegistration('/users/registration/', '', ''),
  organizationsRegistration('/organizations/registration/', '/send', ''),
  validation('/invitations/', '/confirm?confirmationCode=', ''),
  serverFile('/', '', ''),
  templates('/templates/', '/files/', '/data'),
  tasks('/tasks/view/search/by_employee?employeeId=', '', ''),
  taskView('/tasks/', '/view', ''),
  taskDetail('/tasks/', '/details/view', ''),
  taskFiles('/tasks/', '/files', ''),
  updateTaskDetail('/tasks/', '/details/view', '');

  final String value;
  final String secondValue;
  final String thirdValue;

  const EndPointType(this.value, this.secondValue, this.thirdValue);
}

extension EndPointTypeExt on EndPointType {
  String getUrl([String? id, String? secondId]) {
    String url = Url.dev.base + value;
    if (id != null) url = url + id + secondValue;
    if (secondId != null) url = '$url/$secondId$thirdValue/data';
    return url;
  }
}
