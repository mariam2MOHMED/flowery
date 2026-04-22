import 'package:dio/dio.dart';
import 'package:flowerecommeric/core/constants/end_point_constants.dart';
import 'package:flowerecommeric/feature/home/api/models/home/home_products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_services.g.dart';
@RestApi()
@injectable
abstract class HomeClient{
 @factoryMethod
  factory HomeClient(Dio dio)=_HomeClient;
 @GET(ApiEndPoints.home)
 Future<HomeProductsResponse>getHome();
}