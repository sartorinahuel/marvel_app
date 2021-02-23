import 'package:marvel_app/domain/models/app_error.dart';

import '../../domain/globals.dart';
import 'package:marvel_app/domain/models/creator.dart';
import 'package:marvel_app/domain/repositories/creators_repository.dart';

class CreatorsImplementation extends CreatorsRepository {
  @override
  Future<Creator> getCreatorById(String creatorId) async {
    try {
      final response = await httpService.getMethod('/creators/$creatorId', '');
      final charResponse = Creator.fromJson(response['data']['results'].first);
      return charResponse;
    } on FormatException catch (e) {
      throw AppError(code: 'format-exception', message: e.message);
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      print(e);
      throw AppError(code: 'generic-error', message: 'An error occur');
    }
  }
}
