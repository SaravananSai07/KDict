class Item {

  late String id;
  late String head;
  late String entry;
  late String phone;
  late String origin;
  late String info;
  late List<Definition> definitions;

  Item(this.id, this.head, this.entry, this.phone, this.origin, this.info, this.definitions);

  Item.fromObj(dynamic obj) {
    id = obj['id'];
    head = obj['head'];
    entry = obj['entry'];
    phone = obj['phone'];
    origin = obj['origin'];
    info = obj['info'];
    definitions = (obj['defs'] as List).map((def) => Definition.fromObj(def)).toList();
  }

}

class Definition {

  late int id;
  late String entry;
  late String type;

  Definition(this.id, this.entry, this.type);

  Definition.fromObj(dynamic obj) {
    id = obj['id'];
    entry = obj ['entry'];
    type = obj['type'];
  }

}