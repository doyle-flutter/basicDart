void main(){
  
  print("// Assignment operator --");
  String value = "VALUE";
  print(value);
  int value2 = (((1+1)*3)/2).floor();
  print(value2);
  
  int value3 = ((){
    // print(value3); // * 주석을 지우면 오류가 발생합니다 
    // 좌항이 먼저 생성되는 순서라면 해당 부분에 오류가 없어야 합니다.
    // 하지만 늘 대입 연산자를 기준으로 우항부터 진행됩니다.
    // 사소하게 보실 수 있지만 기억하지 못하면 코드를 읽을 때 혼란스러울 수 있습니다.
    return 1234;
    })();
  print(value3);
  
  
//   print("// Future 를 처음 보신다면 아래 내용부터 입력해서 봐주세요");  
//   Future<int> fValue = Future.value(3);
//   print("fValue 1-1 : $fValue");
//   fValue.then((int value) => print("fValue 1-2 : $value"));

//   int? fValueCopy;
//   fValue.then((int value2) => fValueCopy = value2);
//   print("fValueCopy ? : $fValueCopy");
  
//   Future(() async{
//     int thr = await fValue;
//     print("thr1-1 : $thr");
//     return;
//   });
//   Future.microtask(() async{
//     int thr = await fValue;
//     print("thr1-2 : $thr");
//     return;
//   });
  
//   Future<int> fValue2() async => 333;
//   Future(() async{
//     int thr2 = await fValue2();
//     print("thr2-1 : $thr2");
//     return;
//   });
//   Future.microtask(() async{
//     int thr2 = await fValue2();
//     print("thr2-2 : $thr2");
//     return;
//   });
//   --- 
    
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
          print("(4-1) ---");
          return time;
        })())
        .then((JamesTime time) => print(time.showTime())));
  
  Future.microtask(() async {
    JamesTime time = await nowDate();
    print("(4-2) ---");
    print(time.showTime());
  });
  
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
