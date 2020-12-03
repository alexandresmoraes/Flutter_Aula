class Match {
  int id;
  Team1 team1;
  Team1 team2;
  Event event;
  String format;
  int stars;
  bool live;

  Match(
      {this.id,
      this.team1,
      this.team2,
      this.event,
      this.format,
      this.stars,
      this.live});

  Match.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    team1 = json['team1'] != null ? new Team1.fromJson(json['team1']) : null;
    team2 = json['team2'] != null ? new Team1.fromJson(json['team2']) : null;
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
    format = json['format'];
    stars = json['stars'];
    live = json['live'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.team1 != null) {
      data['team1'] = this.team1.toJson();
    }
    if (this.team2 != null) {
      data['team2'] = this.team2.toJson();
    }
    if (this.event != null) {
      data['event'] = this.event.toJson();
    }
    data['format'] = this.format;
    data['stars'] = this.stars;
    data['live'] = this.live;
    return data;
  }
}

class Team1 {
  String name;
  int id;

  Team1({this.name, this.id});

  Team1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Event {
  String name;

  Event({this.name});

  Event.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
