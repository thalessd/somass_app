import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:somass_app/app/home/components/home_page.dart';
import 'package:somass_app/app/shared/dto/client_data_dto.dart';
import 'package:somass_app/app/shared/helpers/helper.dart';
import 'package:somass_app/app/shared/models/public_event.dart';
import 'package:somass_app/app/shared/services/client_service.dart';
import 'package:somass_app/app/shared/services/local_data.dart';
import 'package:snack/snack.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _fullName = "";
  List<String> _escorts = [];

  List<PublicEvent> _events = [];

  bool _load = false;

  void toggleLoad(load) {
    setState(() {
      _load = load;
    });
  }

  exitFromApp() {
    Helper.exitFromApp(context);
  }

  Future<bool> setClientData(ClientDataDto clientDataDto) async {
    toggleLoad(true);

    try {
      await ClientService.set(clientDataDto);

      return true;
    } catch (e) {
      final dioError = e as DioError;

      if (dioError?.response?.statusCode == 403) {
        SnackBar(
          content: Text("Identificação Inválida"),
        ).show(context);

        return false;
      }

      SnackBar(
        content: Text("Erro, Verifique sua Internet"),
      ).show(context);

      return false;
    } finally {
      toggleLoad(false);
    }
  }

  onEditFullName(String fullName) async {
    final clientDataDto = ClientDataDto(fullName: fullName);

    final isChangedData = await setClientData(clientDataDto);

    if (isChangedData) {
      setState(() {
        _fullName = fullName;
      });

      SnackBar(
        content: Text("Seu nome foi alterado"),
      ).show(context);
    }
  }

  onDeleteEscort(int escortId) async {
    final newEscortsList = _escorts.map((e) => e).toList();

    newEscortsList.removeAt(escortId);

    final clientDataDto = ClientDataDto(escorts: newEscortsList);

    final isChangedData = await setClientData(clientDataDto);

    if (isChangedData) {
      SnackBar(
        content: Text("${_escorts[escortId]} foi deletado!"),
      ).show(context);

      setState(() {
        _escorts = newEscortsList;
      });
    }
  }

  onAddEscort(String fullName) async {
    if (_escorts.contains(fullName)) {
      return SnackBar(
        content: Text("$fullName já se encontra nos acompanhantes"),
      ).show(context);
    }

    final newEscortsList = _escorts.map((e) => e).toList();

    newEscortsList.add(fullName);

    final clientDataDto = ClientDataDto(escorts: newEscortsList);

    final isChangedData = await setClientData(clientDataDto);

    if (isChangedData) {
      SnackBar(
        content: Text("$fullName foi adicionado!"),
      ).show(context);

      setState(() {
        _escorts = newEscortsList;
      });
    }
  }

  onUpdateEscort(String fullName, int escortId) async {
    if (_escorts.contains(fullName)) {
      return SnackBar(
        content: Text("$fullName já se encontra nos acompanhantes"),
      ).show(context);
    }

    final newEscortsList = _escorts.map((e) => e).toList();

    newEscortsList[escortId] = fullName;

    final clientDataDto = ClientDataDto(escorts: newEscortsList);

    final isChangedData = await setClientData(clientDataDto);

    if (isChangedData) {
      SnackBar(
        content: Text("${_escorts[escortId]} foi atualizado para $fullName!"),
      ).show(context);

      setState(() {
        _escorts = newEscortsList;
      });
    }
  }

  populateEvents() async {
    try {
      toggleLoad(true);

      final events = await ClientService.events();

      setState(() {
        _events = events;
      });
    } catch (e) {
      SnackBar(
        content:
            Text("Não foi possível listar as missas, verifique sua internet"),
        action: SnackBarAction(
          label: "Tentar Novamente",
          onPressed: () {
            this.populateEvents();
          },
        ),
      ).show(context);
    } finally {
      toggleLoad(false);
    }
  }

  onSubscribe(PublicEvent event) {
    final eventIndex = _events.indexOf(event);

    setState(() {
      _events[eventIndex].occupiedVacancies += _escorts.length + 1;
      _events[eventIndex].hasParticipation = true;
    });
  }

  onUnsubscribe(PublicEvent event) {
    final eventIndex = _events.indexOf(event);

    setState(() {
      _events[eventIndex].occupiedVacancies -= _escorts.length + 1;
      _events[eventIndex].hasParticipation = false;
    });
  }

  @override
  void initState() {
    super.initState();

    final localData = LocalData();

    localData.getFullName().then((String fullName) => {
          setState(() {
            _fullName = fullName;
          })
        });

    localData.getEscorts().then((List<String> escorts) => {
          setState(() {
            _escorts = escorts;
          })
        });

    populateEvents();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      load: _load,
      fullName: _fullName,
      escorts: _escorts,
      events: _events,
      exitFromApp: exitFromApp,
      onEditFullName: onEditFullName,
      onDeleteEscort: onDeleteEscort,
      onAddEscort: onAddEscort,
      onUpdateEscort: onUpdateEscort,
      onRefresh: populateEvents,
      onSubscribe: onSubscribe,
      onUnsubscribe: onUnsubscribe,
    );
  }
}
