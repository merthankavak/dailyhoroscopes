import 'package:vexana/vexana.dart';

import '../../../../product/constants/enum/horoscope_query_enums.dart';
import '../../../product/constants/enum/network_routes_enum.dart';
import '../../../product/utility/service_helper.dart';
import '../model/home_model.dart';
import '../model/home_response_model.dart';
import 'home_service_interface.dart';

class HomeService extends IHomeService with ServiceHelper {
  HomeService(super.manager, super.scaffoldKey);

  @override
  Future<HomeResponseModel?> fetchHoroscope(HomeModel homeModel) async {
    final response = await manager.send<HomeResponseModel, HomeResponseModel>(
        NetworkRoutesEnum.empty.routeName,
        parseModel: HomeResponseModel(),
        queryParameters: {
          HoroscopeQueryEnum.sign.query: homeModel.sign,
          HoroscopeQueryEnum.day.query: homeModel.day
        },
        method: RequestType.POST);

    showMessage(scaffoldKey, response.error);

    return response.data;
  }
}
