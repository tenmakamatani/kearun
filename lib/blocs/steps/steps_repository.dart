import 'package:kearun/models/steps.dart';

abstract class StepsRepository {
  Stream<List<Steps>> read();
}