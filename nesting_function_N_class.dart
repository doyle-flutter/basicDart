void main(){
  // 중첩 관계에서 실행 순서(예제)
  
  print("// Function --- ");
  void fir(void f){
    print("1-1. Fir");
    print("1-2. Fir");
    return;
  }
  void sec(void f2){
    print("2-1. Sec");
    print("2-2. Sec");
    return;
  }
  void thr(String data){
    print("3-1. Sec");
    print("data : $data");
    print("3-2. Sec");
    return;
  }
  
  fir(
    sec(
      thr("안녕하세요")
    )
  );
  
  print("// Class --- ");
  First(
    child: Sec(
      child: Thr("안녕하세요")
    )
  );
}

class Widget{}

class First extends Widget{
  Widget child;
  First({required this.child}){
    print("1.First");
  }
}

class Sec extends Widget{
  Widget child;
  Sec({required this.child}){
    print("2. Sec");
  }
}

class Thr extends Widget{
  String data;
  Thr(this.data){
    print("3. Thr : ${this.data}");
  }
}
