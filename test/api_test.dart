import 'package:marvel_app/domain/globals.dart';

void main() async {
  final response = await httpService.getMethod('/series', '');
  print(response);
}
