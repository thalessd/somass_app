import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:somass_app/app/home/components/name_page.dart';
import 'package:somass_app/app/shared/dto/client_data_dto.dart';
import 'package:somass_app/app/shared/helpers/helper.dart';
import 'package:somass_app/app/shared/services/client_service.dart';
import 'package:snack/snack.dart';
import 'package:device_info/device_info.dart';

class NameScreen extends StatefulWidget {
  NameScreen({Key key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  bool _load = false;

  void toggleLoad(load) {
    setState(() {
      _load = load;
    });
  }

  exitFromApp() {
    Helper.exitFromApp(context);
  }

  saveClientFullName(String fullName) async {
    toggleLoad(true);
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      final clientDataDto = ClientDataDto(
        fullName: fullName,
        deviceInfoBrand: androidInfo.brand,
        deviceInfoDisplay: androidInfo.display,
        deviceInfoModel: androidInfo.model,
        deviceInfoOs: androidInfo.version.baseOS,
        deviceInfoPhysicalDevice: androidInfo.isPhysicalDevice.toString(),
      );

      await ClientService.set(clientDataDto);

      Helper.toHomeNoBack(context);
    } catch (e) {
      final dioError = e as DioError;

      if (dioError?.response?.statusCode == 403) {
        SnackBar(
          content: Text("Identificação Inválida"),
        ).show(context);
      }

      SnackBar(
        content: Text("Erro, Verifique sua Internet"),
      ).show(context);

      Helper.toLoginNoBack(context);
    } finally {
      toggleLoad(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NamePage(
      exitFromApp: exitFromApp,
      onSave: saveClientFullName,
      load: _load,
    );
  }
}
