import 'package:vexana/vexana.dart';

import '../../../product/constants/enum/network_routes_enum.dart';
import '../../../product/utility/service_helper.dart';
import '../model/home_model.dart';
import '../model/horoscope.dart';
import 'home_service_interface.dart';

class HomeService extends IHomeService with ServiceHelper {
  HomeService(super.manager, super.scaffoldKey);

  @override
  Future<Horoscope?> fetchHoroscope(HomeModel homeModel) async {
    final response = await manager.send<Horoscope, Horoscope>(
        '${NetworkRoutesEnum.horoscope.routeName}${homeModel.day!}/${homeModel.sign!}',
        parseModel: Horoscope(),
        method: RequestType.GET);

    showMessage(scaffoldKey, response.error);

    return response.data;
  }
}
