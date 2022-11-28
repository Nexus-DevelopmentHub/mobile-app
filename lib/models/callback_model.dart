class Response{
  bool success=false;
  String message="";


  Response(this.success,this.message);


  static Response Ok({String msg=""}){
    return Response(
      true,
      msg
    );
  }

  static Response Failed({String msg=""}){
    return Response(false, msg);
  }
}

