import 'package:vexana/vexana.dart';

import '../../../../product/constants/enum/horoscope_query_enums.dart';
import '../../../../product/constants/enum/network_routes_enum.dart';
import '../../../../product/model/horoscope_query_model.dart';
import '../../../../product/utility/service_helper.dart';
import '../model/home_model.dart';
import 'home_service_interface.dart';

class HomeService extends IHomeService with ServiceHelper {
  HomeService(super.manager, super.scaffoldKey);

  @override
  Future<HomeModel?> fetchHoroscope(HoroscopeQueryModel horoscopeQueryModel) async {
    final response = await manager.send<HomeModel, HomeModel>(NetworkRoutes.empty.rawValue,
        parseModel: HomeModel(),
        queryParameters: {
          HoroscopeQueryEnum.sign.rawValue: horoscopeQueryModel.sign,
          HoroscopeQueryEnum.day.rawValue: horoscopeQueryModel.day
        },
        method: RequestType.POST);
    showMessage(scaffoldKey, response.error);
    return response.data;
  }
}
