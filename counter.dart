class CounterList {
  String context;
  String id;
  String type;
  List<Counter> hydraMember;
  int hydraTotalItems;
  HydraSearch hydraSearch;

  CounterList(
      {this.context,
        this.id,
        this.type,
        this.hydraMember,
        this.hydraTotalItems,
        this.hydraSearch});

  CounterList.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    id = json['@id'];
    type = json['@type'];
    if (json['hydra:member'] != null) {
      hydraMember = new List<Counter>();
      json['hydra:member'].forEach((v) {
        hydraMember.add(new Counter.fromJson(v));
      });
    }
    hydraTotalItems = json['hydra:totalItems'];
    hydraSearch = json['hydra:search'] != null
        ? new HydraSearch.fromJson(json['hydra:search'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    data['@id'] = this.id;
    data['@type'] = this.type;
    if (this.hydraMember != null) {
      data['hydra:member'] = this.hydraMember.map((v) => v.toJson()).toList();
    }
    data['hydra:totalItems'] = this.hydraTotalItems;
    if (this.hydraSearch != null) {
      data['hydra:search'] = this.hydraSearch.toJson();
    }
    return data;
  }
}

class Counter {
  String url;
  int id;
  String counterNumber;
  double lastIndex;
  double newIndex;
  String type;
  String company;
  String owner;
  String compagnyName;

  Counter(
      {this.url,
        this.type,
        this.id,
        this.counterNumber,
        this.lastIndex,
        this.newIndex,
        this.company,
        this.compagnyName,
        this.owner});

  Counter.fromJson(Map<String, dynamic> json) {
    url = json['@id'];
    id = json['id'];
    counterNumber = json['counterNumber'];
    lastIndex = checkDouble(json['lastIndex']);
    newIndex = checkDouble(json['newIndex']);
    type = json['type'];
    company = json['company'];
    owner = json['owner'];
    compagnyName = json['compagnyName'];
  }

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is int){
      return value.toDouble();
    }
    else{
      return value;
    }

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.url;
    data['id'] = this.id;
    data['counterNumber'] = this.counterNumber;
    data['lastIndex'] = this.lastIndex;
    data['newIndex'] = this.newIndex;
    data['type'] = this.type;
    data['company'] = this.company;
    data['owner'] = this.owner;
    data['compagnyName'] = this.compagnyName;
    return data;
  }
}

class HydraSearch {
  String type;
  String hydraTemplate;
  String hydraVariableRepresentation;
  List<HydraMapping> hydraMapping;

  HydraSearch(
      {this.type,
        this.hydraTemplate,
        this.hydraVariableRepresentation,
        this.hydraMapping});

  HydraSearch.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    hydraTemplate = json['hydra:template'];
    hydraVariableRepresentation = json['hydra:variableRepresentation'];
    if (json['hydra:mapping'] != null) {
      hydraMapping = new List<HydraMapping>();
      json['hydra:mapping'].forEach((v) {
        hydraMapping.add(new HydraMapping.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['hydra:template'] = this.hydraTemplate;
    data['hydra:variableRepresentation'] = this.hydraVariableRepresentation;
    if (this.hydraMapping != null) {
      data['hydra:mapping'] = this.hydraMapping.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HydraMapping {
  String type;
  String variable;
  String property;
  bool required;

  HydraMapping({this.type, this.variable, this.property, this.required});

  HydraMapping.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    variable = json['variable'];
    property = json['property'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['variable'] = this.variable;
    data['property'] = this.property;
    data['required'] = this.required;
    return data;
  }
}
