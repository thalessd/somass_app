import 'package:flutter/material.dart';
import 'package:somass_app/app/home/components/event_card.dart';
import 'package:somass_app/app/home/components/event_dialog.dart';
import 'package:somass_app/app/home/components/name_edit_dialog.dart';
import 'package:somass_app/app/home/components/section_title.dart';
import 'package:somass_app/app/shared/components/confirm_dialog.dart';
import 'package:somass_app/app/shared/components/devdes_info.dart';
import 'package:somass_app/app/shared/components/info_dialog.dart';
import 'package:somass_app/app/shared/components/lazy_load_blurred.dart';
import 'package:somass_app/app/shared/constants/constant.dart';
import 'package:somass_app/app/shared/constants/style.dart';
import 'package:somass_app/app/shared/models/day_of_week.dart';
import 'package:somass_app/app/shared/models/public_event.dart';
import "package:collection/collection.dart";
import 'package:snack/snack.dart';

class HomePage extends StatefulWidget {
  final Function exitFromApp;
  final bool load;
  final String fullName;
  final List<String> escorts;
  final List<PublicEvent> events;

  final Function(String) onEditFullName;
  final Function(String) onAddEscort;
  final Function(int) onDeleteEscort;
  final Function(String, int) onUpdateEscort;
  final Function() onRefresh;
  final Function(PublicEvent) onSubscribe;
  final Function(PublicEvent) onUnsubscribe;

  HomePage(
      {this.exitFromApp,
      this.fullName,
      this.escorts,
      this.events,
      this.onEditFullName,
      this.onDeleteEscort,
      this.onAddEscort,
      this.onUpdateEscort,
      this.onRefresh,
      this.onSubscribe,
      this.onUnsubscribe,
      this.load = false});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onExitClick() {
    final confirmDialog = ConfirmDialog(
      title: "Sair do Aplicativo",
      contentText: "Deseja sair do aplicativo?",
      onCancel: () {},
      onConfirm: widget.exitFromApp,
    );

    showDialog(context: context, builder: (_) => confirmDialog);
  }

  void onFullNameEdit() {
    final nameEditDialog = NameEditDialog(
      title: "Alterar Seu Nome",
      inputTitle: "Seu Nome Completo",
      initialValue: widget.fullName,
      onConfirm: this.widget.onEditFullName,
      onCancel: () {},
    );

    showDialog(context: context, builder: (_) => nameEditDialog);
  }

  void onEscortDelete(int escortId) {
    final confirmDialog = ConfirmDialog(
      title: "Remover",
      contentText: "Remover ${this.widget.escorts[escortId]}",
      onCancel: () {},
      onConfirm: () => this.widget.onDeleteEscort(escortId),
    );

    showDialog(context: context, builder: (_) => confirmDialog);
  }

  void onEscortAdd() {
    final nameEditDialog = NameEditDialog(
      title: "Adicionar Acompanhante",
      inputTitle: "Nome Completo do Acompanhante",
      onConfirm: this.widget.onAddEscort,
      onCancel: () {},
    );

    showDialog(context: context, builder: (_) => nameEditDialog);
  }

  void onEscortUpdate(int escortId) {
    final nameEditDialog = NameEditDialog(
      title: "Editar ${this.widget.escorts[escortId]}",
      inputTitle: "Nome Completo do Acompanhante",
      initialValue: this.widget.escorts[escortId],
      onConfirm: (String name) => this.widget.onUpdateEscort(name, escortId),
      onCancel: () {},
    );

    showDialog(context: context, builder: (_) => nameEditDialog);
  }

  void onEventTap(PublicEvent event) {
    final peopleQty = widget.escorts.length + 1;

    if ((peopleQty + event.occupiedVacancies) > event.totalVacancies) {
      return SnackBar(
        content: Text(
            "Não a vagas suficientes para você e seus acompanhantes, tente remover algum acompanhante para proseguir com o agendamento."),
      ).show(context);
    }

    final eventDialog = EventDialog(
      event: event,
      onSubscribe: this.widget.onSubscribe,
      onUnsubscribe: this.widget.onUnsubscribe,
    );

    showDialog(context: context, builder: (_) => eventDialog);
  }

  void onInfoEditClientData() {
    final infoDialog = InfoDialog(
      title: "Como Editar Minhas Informações?",
      contentText:
          "Você tem uma missa agendada, caso você queira editar seu nome, ou adicionar um novo acompanhante, desagende os atuais, e agende novamente após alterar tudo que necessitar.",
      confirmButtonText: "Entendi",
      onConfirm: () {},
    );

    showDialog(context: context, builder: (_) => infoDialog);
  }

  @override
  Widget build(BuildContext context) {
    final hasSubscribed =
        !widget.events.every((element) => element.hasPassed ? true : !element.hasParticipation);

    final groupedEvents =
        groupBy(widget.events, (PublicEvent obj) => obj.location.trim());

    List<Widget> eventTiles = [];

    groupedEvents.forEach((String key, List<PublicEvent> value) {
      value.sort((a, b) =>
          a.dayOfWeek.index.toString().compareTo(b.dayOfWeek.index.toString()));

      value.sort((a,b) {
        return a.date.compareTo(b.date);
      });

      final sundayDays = <PublicEvent>[];
      final otherDays = <PublicEvent>[];

      for (PublicEvent publicEvent in value) {
        if (publicEvent.dayOfWeek == DayOfWeek.Sunday) {
          sundayDays.add(publicEvent);
        } else {
          otherDays.add(publicEvent);
        }
      }

      final formatedList = [...otherDays, ...sundayDays];

      final tile = Column(
        children: [
          SectionTitle(
            title: "Missa: $key",
          ),
          GridView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 18),
              itemCount: formatedList.length,
              itemBuilder: (context, index) {
                return EventCard(
                  event: formatedList[index],
                  onOpenEvent: onEventTap,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
              ),
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics()),
        ],
      );

      eventTiles.add(tile);
    });

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Agendamento de Missas"),
          leading: IconButton(
            icon: Icon(Icons.info_outline),
            tooltip: "Informações",
            onPressed: widget.load ? null : () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: "Atualizar",
              onPressed: widget.load ? null : widget.onRefresh,
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              tooltip: "Sair do Aplicativo",
              onPressed: widget.load ? null : onExitClick,
            )
          ],
        ),
        body: LazyLoadBlurred(
          show: widget.load,
          child: Container(
            child: Column(
              children: [
                if (hasSubscribed)
                  Container(
                    color: Colors.blueAccent,
                    child: ListTile(
                      onTap: onInfoEditClientData,
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      // dense: true,
                      title: Text(
                          "Deseja editar suas informações ou alterar seus acompanhantes?",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .fontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(Style.APP_MARGIN),
                    children: [
                      SectionTitle(
                        title: "Você",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 3,
                        margin: EdgeInsets.all(0),
                        color: Colors.white,
                        child: ListTile(
                            title: Text(widget.fullName),
                            leading: Icon(
                              Icons.person,
                              color: hasSubscribed
                                  ? Colors.grey
                                  : Theme.of(context).primaryColor,
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              splashRadius: 20,
                              color: hasSubscribed
                                  ? Colors.grey
                                  : Colors.blueAccent,
                              onPressed: hasSubscribed ? null : onFullNameEdit,
                            )),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      SectionTitle(
                        title: "Acompanhantes",
                        badgeText:
                            "${widget.escorts.length}/${Constant.ESCORTS_MAX}",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 3,
                        margin: EdgeInsets.all(0),
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: widget.escorts.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(widget.escorts[index]),
                                    leading: Icon(
                                      Icons.person,
                                      color: hasSubscribed
                                          ? Colors.grey
                                          : Theme.of(context).primaryColor,
                                    ),
                                    trailing: Wrap(
                                      spacing: -8,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: hasSubscribed
                                                ? Colors.grey
                                                : Colors.redAccent,
                                          ),
                                          splashRadius: 20,
                                          onPressed: hasSubscribed
                                              ? null
                                              : () => onEscortDelete(index),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: hasSubscribed
                                                ? Colors.grey
                                                : Colors.blueAccent,
                                          ),
                                          splashRadius: 20,
                                          onPressed: hasSubscribed
                                              ? null
                                              : () => onEscortUpdate(index),
                                        )
                                      ],
                                    ));
                              },
                            ),
                            if (this.widget.escorts.length > 0 &&
                                this.widget.escorts.length <
                                    Constant.ESCORTS_MAX)
                              Divider(color: Colors.grey[400]),
                            if (this.widget.escorts.length <
                                Constant.ESCORTS_MAX)
                              ListTile(
                                  title: Text("Adicionar Outra Pessoa"),
                                  onTap: hasSubscribed ? null : onEscortAdd,
                                  leading: Icon(
                                    Icons.person_add,
                                    color: hasSubscribed
                                        ? Colors.grey
                                        : Colors.green,
                                  ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: eventTiles.length,
                        itemBuilder: (context, index) {
                          return eventTiles[index];
                        },
                      ),
                      DevdesInfo()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
