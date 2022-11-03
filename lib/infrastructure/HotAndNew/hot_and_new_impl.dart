import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/New_and_hot/hot_and_new/hot_and_new.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/New_and_hot/hot_and_new/hot_and_new_services.dart';
import 'package:netflix_clone/domain/downloads/core/api_end_points.dart';

import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';
@LazySingleton(as:HotAndNewServices )
class HotAndNewImplementation implements HotAndNewServices{
  @override
  Future<Either<MainFailure, HotAndNew>> getHotAndNewMovieData()async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNew>> getHotAndNewTvData()async {
     try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

}