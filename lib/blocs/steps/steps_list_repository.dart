import 'package:kearun/models/steps.dart';

abstract class StepsListRepository {
  Stream<List<Steps>> read();
  Future<void> create(Steps steps);
}