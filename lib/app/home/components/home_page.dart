import 'package:flutter/material.dart';
import 'package:somass_app/app/home/components/event_card.dart';
import 'package:somass_app/app/home/components/name_edit_dialog.dart';
import 'package:somass_app/app/home/components/section_title.dart';
import 'package:somass_app/app/shared/components/confirm_dialog.dart';
import 'package:somass_app/app/shared/components/lazy_load_blurred.dart';
import 'package:somass_app/app/shared/constants/constant.dart';
import 'package:somass_app/app/shared/constants/style.dart';
import 'package:somass_app/app/shared/helpers/helper.dart';
import 'package:somass_app/app/shared/models/day_of_week.dart';
import 'package:somass_app/app/shared/models/public_event.dart';
import "package:collection/collection.dart";

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

  HomePage(
      {this.exitFromApp,
      this.fullName,
      this.escorts,
      this.events,
      this.onEditFullName,
      this.onDeleteEscort,
      this.onAddEscort,
      this.onUpdateEscort,
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

  @override
  Widget build(BuildContext context) {
    final groupedEvents =
        groupBy(widget.events, (PublicEvent obj) => obj.location.trim());

    List<Widget> eventTiles = [];

    groupedEvents.forEach((String key, List<PublicEvent> value) {
      value.sort((a, b) =>
          a.dayOfWeek.index.toString().compareTo(b.dayOfWeek.index.toString()));

      final sundayDays = <PublicEvent>[];
      final otherDays = <PublicEvent>[];

      for(PublicEvent publicEvent in value) {
        if(publicEvent.dayOfWeek == DayOfWeek.Sunday) { sundayDays.add(publicEvent); }
        else { otherDays.add(publicEvent); }
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
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
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
              icon: Icon(Icons.exit_to_app),
              tooltip: "Sair do Aplicativo",
              onPressed: widget.load ? null : onExitClick,
            )
          ],
        ),
        body: LazyLoadBlurred(
          show: widget.load,
          child: Container(
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
                        color: Theme.of(context).primaryColor,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        splashRadius: 20,
                        color: Colors.blueAccent,
                        onPressed: onFullNameEdit,
                      )),
                ),
                SizedBox(
                  height: 18,
                ),
                SectionTitle(
                  title: "Acompanhantes",
                  badgeText: "${widget.escorts.length}/${Constant.ESCORTS_MAX}",
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
                                color: Theme.of(context).primaryColor,
                              ),
                              trailing: Wrap(
                                spacing: -8,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    splashRadius: 20,
                                    onPressed: () => onEscortDelete(index),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blueAccent,
                                    ),
                                    splashRadius: 20,
                                    onPressed: () => onEscortUpdate(index),
                                  )
                                ],
                              ));
                        },
                      ),
                      if (this.widget.escorts.length > 0 &&
                          this.widget.escorts.length < Constant.ESCORTS_MAX)
                        Divider(color: Colors.grey[400]),
                      if (this.widget.escorts.length < Constant.ESCORTS_MAX)
                        ListTile(
                            title: Text("Adicionar Outra Pessoa"),
                            onTap: onEscortAdd,
                            leading: Icon(
                              Icons.person_add,
                              color: Colors.green,
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
              ],
            ),
          ),
        ));
  }
}
