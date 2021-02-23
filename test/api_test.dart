import '../lib/domain/globals.dart';

void main() async {
  // final characters = await charRepo.getCharacterByName('steve');
  // print(characters.length);
  // for (var item in characters) {
  //   print(item.id);
  //   print(item.name);
  //   print(item.description);
  //   print('\n==== Series ====');
  //   for (var serie in item.series.items) {
  //     print(serie.name);
  //   }
  //   print('================\n');
  //   print(item.thumbnail.path);
  //   print(item.modified);
  //   print('\n==== Stories ====');
  //   for (var story in item.stories.items) {
  //     print(story.name);
  //   }
  //   print('===================\n');
  //   print('\n==== Events ====');
  //   for (var event in item.events.items) {
  //     print(event.name);
  //   }
  //   print('==================\n');
  // }

  final series = await seriesRepo.getSeries(0);
  print(series.length);
  final series2 = await seriesRepo.getSeries(0);
  print(series2.length);
}
