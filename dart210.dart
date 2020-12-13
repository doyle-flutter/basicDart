// 타입 변수명;
// 타입 변수명 = 초기화 값;

// 타입 변수명  =  값
String value;
String value2 = "문자열";

// 지역 변수 & 전역 변수
String value = "전역";
{
	print(value); // 전역 변수는 지역에서 사용 가능(중괄호{} 안으로)
	
	String value2 = "지역";
	print(value2);
}
print(value2); // 지역 변수는 전역으로 사용 할 수 없음(중괄호{} 밖에서)

// String : 문자열 : ' ' || " "
// int : 정수
// double : 소수 : 0.2 || 1.02 || ...
// num : 숫자 : int 및 double 포함
// bool : true || false
// null / void : 빈 값
// Function : 함수의 클로져( (){} )
// List 리스트(배열) : [ 요소, 요소 ... ] : 여러 값을 사용 할 경우
// Map : {}

// 모두 중요하지만 List 가장 중요
List li = [ 1, 2, 3];

// 리스트의 길이
print( li.length );

// 찾기
print( li.indexOf(1) );

// 요소마다 반복한 로직의 반환 값으로 새로운 배열을 생성
print( li.map<int>( (e) => e ).toList() ); 

// 요소의 반복만 사용
li.forEach( (e) => print(e) );

// 스프레드 연산자 ... || ...? null 예외처리
List<int> a = [1,2,3];
print([...?a]);

bool promoActive = true;
List<String> nav = [
  'Home',
  'Furniture',
  'Plants',
  if (promoActive) 'Outlet',
];
List<int> listOfInts = [1, 2, 3];
List<String> listOfStrings = [ 
	'#0',
  for (int i in listOfInts) '#$i'
];

// .. 등등 직접 List API를 테스트해보는 것을 추천합니다
// ... Dart 홈페이로 이동(클릭)

//  - 요소의 중복을 허용하지 않음
//  - class instance 중복 가능(양식은 같지만 출력물은 다르다)

void main(){
  Set<MyClass> sm = {
    new MyClass(),new MyClass(),new MyClass(),new  MyClass()
  };
  print(sm);
}

class MyClass{}

//표현식
Map<타입, 타입> 변수명 = { key(키) : value(값) };

// 다양한 API
void main(){
	// - insert
	Map<String, String> mapData = {"key":"value"};
	mapData.addAll({"key2" : "value2"});
	// legnth
	print(mapData.length);
	// key들을 반환(타입 Iterable)
  print(mapData.keys);
	// findValue : 존재하면 true / 없으면 false
	bool check = mapData.containsValue("value");
	// - remove Target / All
	mapData.remove("key2");
	mapData.clear();
	// ... Dart 홈페이로 이동(클릭)
}

// Map 고차함수
void main(){
	// Map .forEach
	Map<String, String> mapData = {"key" : "value"};
	  mapData.forEach((k, e) => print("$k : $e"));
	// Map .map
	Map<String, String> mapData = {"key" : "value"};
	Map<String,String> map2map = mapData.map<String, String>((String k, String e) => new MapEntry<String, String>(k, "$k to $e"));
	print(map2map);
}

//사용하는 값이 특정 위젯 또는 상황에서 필요한 '타입 형'으로 변환해야 하는 경우가 빈번히 발생합니다

// 숫자를 표시하는 텍스트위젯
int viewInt = 123;
Text( viewInt.toString() )

// - 모든 값은 문자열로 변환할 수 있습니다 : .toString()
// - String → int || String → double || int → double || double → int

// String -> int
int resultString2Int = int.parse("123");
// String -> double 
double resultString2Double = double.parse("123.456");
// double -> int
int resultDouble2Int = 567.890.toInt();
int resultDouble2IntFloor = 567.890.floor(); // 절대 값
// int -> double
double resultInt2Double = 123456.toDouble();

// 1
List<int> result = <int>[1,2,3].map((int e) => e+1).toList();
// 2
List<int> target = [4,5,6];
List<int> result2 = target.map<int>((int e) => e+1).toList();

List<int> li = [1,2,3,3];
List<int> result = new Set.of(li).toList();

// 타입T 함수명(인자, {인자 네이밍 : 값 }){  ... return T;}


String speak( int index, { String my, String u } ){
  return "$index $my $u";
}
speak( 1, my : " do ",  u : " j " );


// func 1 / 2 가 같이 동작한다고 하여 return 을 생략한다면 큰 문제가 발생할 수 있습니다
// 습관처럼 return 을 사용하여 함수의 끝(반환)을 작성해주세요
void func1(){
	print("PLAY 1");
}
void func2(){
	print("PLAY 2");	
	return;
}

// 함수의 결과 값만 명시하고, return 반환을 사용하지 않았을 때
String func3(){
	print("Play 3");
}

// 함수의 인자를 생략하는 의미 ' _ '
someFunc(_);

// Generic 제네릭 응용
// Type : 함수의 반환 값을 사용할 때 변경할 수 있도록
T func4 <T>({_}){
	
}

// 인자의 타입과 비교한 예제
T func4<T>(s){
	print("Type");
	return s.runtimeType == T ? s : throw "TYPE ERRRRRR!";
}
  
String v = "123";
print( func4<String>(v) );

int v1 = 456;
print( func4<String>(v1) );

// 익명함수 선언과 동시에 실행
((){
	print("noName 3");
})();
  
// CallBack 1
String Function(String) noName = (String v) => "noName $v";
print(noName("123"));

// CallBack 2
String Function({String v}) noName = ({String v}) => "noName $v";
print(noName(v:"123"));

// Generic 제네릭 응용 CallBack 3 ... 생략

// 재귀 ... 생략

// 함수를 값으로. Callback. 
  int callbackf(){
    print(1111);
    return 1;
  }
 
  int ff(int a){
    print(22222);
    return a;
  }
  
  ff(callbackf());
  
if( 비교 연산 또는 bool ){
	로직 ...
}

if( true ){
	print("T");
}
if( 0 == 0 ){
	print("T2");
	return; // 반환의 의미가 아닌 종료
}


// if 안에서 return은 if가 포함 된 context {} 를 종료합니다
// 두 함수의 차이를 비교하고 기억해주세요
String func({int value}){
	if(int == 0){
		print("value : 0");
		return "0";
	}
	print('value != 0');
	return "00000";
}

String func2({int value}){
	if(int == 0){
		print("value : 0");
	}
	print('value != 0');
	return "00000";
}

switch(target){
	case 비교 : {
		로직 ...
		break;
	}
	case 비교2 : {
		로직2 ...
		break;
	}
	default: {
		조건 만족하지 않을 경우 기본 로직 ... 
		// else 와 같은
		break;
	}
}

int value = 0;
switch(value){
	case 0: {
		print("value : 0");
		break;
	}
	default:{
		print("value");
		break;
	}
}

for(시작;종료조건;증감){
	로직 ...
}

for(int i = 0; i < 10; i ++){
	print(i);
}

// while문이 편리할 수 있지만 처음 사용할 때에는 무한루프에 빠지기 쉬우므로 for문 위주 사용
while(비고 연산 또는 bool){
	// 반드시 종료 분기 후 return 필요
	로직 ...
}

int i = 0;
while(true){
	if(i > 10) return;
	print(i);
	i++;
}

class 클래스명 {
	변수;
	함수(){};
	클래스명(); // 생성자 1 : 순서 지정
  클래스명({this.변수, ... }); // 생성자 2 : 생성자 이름 지정 / 순서와 상관없이 사용 가능
	클래스명([...]); // 생성자 3 : 생성자 생략 가능
}

클래스명 변수명 = new 클래스명(...);  // 변수를 인스턴스라고 부릅니다
변수명.함수명(); // 이 때 함수를 메서드라고 부릅니다

// 생성자 3 예시
void main(){
  MyClass m = new MyClass(1); // [생략가능]
  MyClass m2 = new MyClass(2,"순서 지정 / 네이밍과 혼합 불가능");
  print(m);
  print(m2.value);
}

class MyClass{
  String value;
  int value2;
  MyClass(this.value2, [this.value]);
}

// extends : 상속 & 확장 
// 만들어 있는  특정 class 내부 로직을 상속받은 뒤 내용을 추가 또는 수정할 때 사용

class Pclass{}
class Chclass extends Pclass{}

// 다형성 : 단순히 다른 형을 사용할 수 있는 것에 그칠 경우 MixIn에서 혼동이 생김
Pclass ch1 = new Chclass();
Chclass ch2 = new Chclass();

// 선언한 타입의 Class 기능만 부여 됨

void main(){
  
  Pclass2 ch1 = new Chclass2();
  Chclass2 ch2 = new Chclass2();
  
  print( ch1.value1() );
  print( ch2.value2(name:"James") );
  
}
class Pclass2{
  String value1() => "안녕하세요";
}
class Chclass2 extends Pclass2{
  String value2({String name}) => "${super.value1()}, $name 님";
}

//양식을 정의하는 '정의서' 

abstract class RuleClass{
	String valueFunc(){}
}
class FtfClass implements RuleClass{
  @override
  String valueFunc() {
    return "정의를 따르는 Class";
  }
}

// *차이점을 알고 사용해야합니다

abstract class RuleClass{
  String value(){}
	String valueFunc(){}
}
class OtherClass{
  String value() => "다른 기능";
}
class FtfClass extends OtherClass implements RuleClass{
  @override
  String valueFunc() {
    return "정의를 따르는 Class";
  }
}

// 결과를 확인하여 출력 값을 통해 확인해주세요
void main(){
  MainClass mainClass1 = new MainClass();
  OtherClass mainClass2 = new MainClass();
  OtherClass mainClass3 = new OtherClass();
  // MainClass mainClass4 = new OtherClass(); 불가능
  
  print( mainClass1.mValue() );
  // print( mainClass2.mValue() ); // 불가능
  // print( mainClass3.mValue() ); // 불가능
  
  print( mainClass1.oValue() );
  print( mainClass2.oValue() );
  print( mainClass3.oValue() );
}

class OtherClass{
  String oValue() => "안녕하세요";
}
class MainClass with OtherClass{
  String mValue() => "${this.oValue()}, MixIn 입니다";
}

// Future : 비동기 로직 구현,  앞 단의 처리 과정이 길거나 이벤트를 받아야할 때까지 기다려야 한다면 Future를 사용해야 합니다 / " 1 수행 완료 후 2 수행  "
// *Future는 Future로 실행 한다는 것을 기억하면 사용하기 수월합니다
// *Future - async/await

// 1. Future 생성과 실행
void main(){
  Future<String> ff() async => "안녕하세요";
  print( ff() );
  // Instance of '_Future<String>'
  // Future의 실행은 Future일 때 가능하며, 그렇지 않을 경우 원치않는 내용이 출력됩니다
  Future( () async => print( await ff() ) ); // 안녕하세요
}

// Future((){});
// Future.delayed(DUration(), (){});
// Future.microtask((){}); :
// ff함수로 처리가 오래 걸리거나 대기해야하는 경우를 가정하였습니다
// Dart TEST
void main(){
  Future<void> ff({String v}) async => await Future.delayed(
    Duration(seconds: 4),() async => print("FF 함수 실행 : $v")
  );
  Future(() async{
    print("Before");
    await ff(v:"before Task");
  });
  Future.microtask(() async{
    print("microtask : 순서와 상관없이 가장 우선 실행");
    await ff(v:"MicroTask(가장 결과를 먼저 받음)");
    return;
  });
  Future(() async {
    print("Later");
    await ff(v:"later Task");
  });
}

// Flutter TEST
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home:MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> ff({String v}) async => await Future.delayed(
    Duration(seconds: 4),
    () async => print("FF 함수 실행 : $v")
  );
  @override
  void initState(){
    Future(() async => await ff(v:"before Task"));
    Future.microtask(() async{
      print("Microtask 사용시 우선 실행 및 결과를 받을 수 있습니다");
      await ff(v:"MicroTask(가장 결과를 먼저 받음)");
      return;
    });
    Future(() async => await ff(v:"later Task"));
    super.initState();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Hi, Future !")),
      body: Center(child: Text("Start"))
    );
  }
}

void main(){
  Future<String> ff({String v}) async => await Future.delayed(
    Duration(seconds: 4),() async => "Future !"
  ); 

	// Future.microtask()도 사용해보세요
  Future(() async => await ff())
    .then((String ffValue) => print(ffValue));
}

// Time Out
Future<String> ff() => Future.delayed(Duration(seconds:10), () => "Time Out");
Future<String> errCheck = Future(() async => await ff()).timeout(Duration(seconds: 3), onTimeout: ()  async => "Time Out");
  
Future(() async => print(await errCheck));

// throw  
try{
  Future(() async => throw "ERR");
}
catch(e){
  print("Throw ERR");
}

// DartPad 기준
// DartPad NullSafety 적용시 하단 토글 활성화 필요
// Flutter 에서는 별도 버전 사용
void main() {
  int? data; // data 변수는 Null 일 수 있다
  print("data ${data}");
  
  try{
    int? a; // a는 Null 일 수 있다
    int b = a!; // a는 Null이면 안된다
    print("b ${b}"); // a는 Null이므로 catch로 이동
  }
  catch(e){
    print("b ERR");  
  }
  
  int aa(int? a){
    return a ?? 123;
  }
  
  print("aa ${aa(data)}");
  
}
