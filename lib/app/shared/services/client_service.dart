import 'package:dio/dio.dart';
import 'package:somass_app/app/shared/constants/constant.dart';
import 'package:somass_app/app/shared/dto/client_data_dto.dart';
import 'package:somass_app/app/shared/dto/enter_dto.dart';
import 'package:somass_app/app/shared/models/enter_response.dart';
import 'package:somass_app/app/shared/services/local_data.dart';

class ClientService {
  static Future<EnterResponse> enter(String cpf) async {
    try {
      Response response = await Dio().post(
          "${Constant.SERVER_URL}/client/enter",
          data: EnterDto(cpf: cpf).toMap());

      final enterResponse = EnterResponse.fromJson(response.data);

      final localData = LocalData();

      await localData.setCPF(cpf);
      await localData.setFullName(enterResponse.fullName);
      await localData.setEscorts(enterResponse.escorts);
      await localData.setToken(enterResponse.token);

      return enterResponse;
    } catch (e) {
      throw e;
    }
  }

  static set(ClientDataDto clientDataDto) async {
    try {
      final localData = LocalData();

      final token = await localData.getToken();

      await Dio().put("${Constant.SERVER_URL}/client/set/$token", data: clientDataDto.toMap());

      if(clientDataDto.fullName != null) {
        await localData.setFullName(clientDataDto.fullName);
      }

      if(clientDataDto.escorts != null) {
        await localData.setEscorts(clientDataDto.escorts);
      }

    } catch (e) {
      throw e;
    }
  }
}
