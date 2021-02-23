import 'package:marvel_app/domain/models/creator.dart';

abstract class CreatorsRepository {
  Future<Creator> getCreatorById(String creatorId);
}
