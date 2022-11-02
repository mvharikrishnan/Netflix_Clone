import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/core/api_end_points.dart';
import 'package:netflix_clone/domain/downloads/models/downloadsModel.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/models/i_downloads_repo.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepositry implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.data);
       final downloadsList = (response.data['results'] as List).map((e){
          return Downloads.fromJson(e as Map<String, dynamic>);
        }).toList();

        
        // print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
