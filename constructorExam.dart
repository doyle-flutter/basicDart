void main(){
  Path p = Path.add('main',MainPage(), CuMainPage());
  // Path p2 = Path(); // -> 생성자가 없어서 사용 할 수 없음
  // Path p3 = Path._(); // -- > _ 생성자를 직접 사용할 수 없음
}

class Widget{}
class MainPage extends Widget{}
class CuMainPage extends Widget{}

class Path{
  static bool check() => false;
  Path.add(String path, Widget and, Widget ios){
    print("CHECK : ${Path.check()}");
  }
  
  Path._(){
    throw 'error : Use Path.add()';
  }
 
  
}
