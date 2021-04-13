class users_list {
  String context;
  String id;
  String type;
  List<User> hydraMember;
  int hydraTotalItems;
  HydraSearch hydraSearch;

  users_list(
      {this.context,
        this.id,
        this.type,
        this.hydraMember,
        this.hydraTotalItems,
        this.hydraSearch});

  users_list.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    id = json['@id'];
    type = json['@type'];
    if (json['hydra:member'] != null) {
      hydraMember = new List<User>();
      json['hydra:member'].forEach((v) {
        hydraMember.add(new User.fromJson(v));
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

class User {
  String url;
  int id;
  String username;
  String password;
  String type;

  User(
      {this.url,  this.id, this.username, this.password, this.type});

  User.fromJson(Map<String, dynamic> json) {
    url= json['@id'];
    id = json['id'];
    username = json['username'];
    password = json['password'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.url;
    data['@type'] = this.type;
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['type'] = this.type;
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
  Null property;
  bool required;

  HydraMapping({this.type, this.variable, this.property, this.required});

  HydraMapping.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    variable = json['variable'];
    //property = json['property'];
   // required = json['required'];
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
