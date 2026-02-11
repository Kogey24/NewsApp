import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class StoriesBloc {
  final _topIds = PublishSubject<List<int>>();
  final _repository = Repository();

  // Getters to Streams
  Stream<List<int>> get topIds => _topIds.stream;

  dispose() {
    _topIds.close();
  }
}
