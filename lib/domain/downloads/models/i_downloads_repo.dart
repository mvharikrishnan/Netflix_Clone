import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/models/downloadsModel.dart';

abstract class IDownloadsRepo{
  Future <Either<MainFailure,List<Downloads>>>getDownloadsImages();
}