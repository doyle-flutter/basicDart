void main(){
  
  print("(1) ---");
  print(new JamesTime().showTime());
 
  nowDate()
    .then((JamesTime time){
      print("(3) ---");
      print(time.showTime());
      return;
    });
  
  Future(() async {
    print("(5) ---");
    JamesTime time = await nowDate();
    print(time.showTime());
    return;
  });
  
  Future.microtask(() async 
    => await nowDate()
        .then((JamesTime time) => (<JamesTime>(){
          print("(4) ---");
          return time;
        })())
        .then((JamesTime time) => print(time.showTime())));
  
  Future<String> time = Future(() async{
    print("(6 - 1) ---");
    String time = (await nowDate()).showTime();
    print(time);
    return time;
  });
  
  print("(2) --- *6 ");
  print(time);
  
  Future(() async{
    print("(6 - 2) ---");
    print(await time);
    return;
  });
  
}
  

class JamesTime{
  String? day;
  String? month;
  String? year;

  String showTime(){
    String result = "${this.year}.${this.month}.${this.day}";
    return result.length == 14 ? "NULL" : result;
  }
}

Future<JamesTime> nowDate() async{
  DateTime now = new DateTime.now();
  return new JamesTime()
    ..day = now.day.toString()
    ..month = now.month.toString()
    ..year = now.year.toString();
}
