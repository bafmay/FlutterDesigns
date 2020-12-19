class User {
  final String photo;
  final String name;
  final String ocupation;
  final String location;
  final List<Activity> activity;
  final int conections;
  final int profile;
  User(
      {this.photo,
      this.name,
      this.ocupation,
      this.location,
      this.activity,
      this.conections,
      this.profile});
}

class Activity {
  final String name;
  final String title;
  final String description;
  final String image;
  final String date;

  Activity({this.name, this.title, this.description, this.image, this.date});
}
