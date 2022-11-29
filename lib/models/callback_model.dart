class Response{
  bool success=false;
  String message="";


  Response(this.success,this.message);


  static Response Ok({String message=""}){
    return Response(
      true,
      message
    );
  }

  static Response Failed({String message=""}){
    return Response(false, message);
  }
}

