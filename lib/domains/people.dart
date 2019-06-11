class People {
  final String name;
  final String profileUrl;
  final List<String> films;

  People({this.name, this.profileUrl, this.films});

  String filmToString() {
    String str = '';
    films.forEach((title) => str+='$title, ');
    return str;
  }
}
