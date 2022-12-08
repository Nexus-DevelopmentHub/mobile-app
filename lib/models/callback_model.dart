class Response{
  bool success=false;
  bool shouldCompleteProfile = false;
  String message="";
  Map<String,String> arg = {};


  Response(this.success,this.message,this.shouldCompleteProfile,this.arg);


  static Response Ok({String message=""}){
    return Response(
      true,
      message,
      false,
        {}
    );
  }

  static Response Failed({String message=""}){
    return Response(false, message,false,{});
  }

  static Response OkCompleteProfile({String message=""}){
    return Response(true, message,true,{});
  }

  static Response FailedCompleteProfile({String message=""}){
    return Response(false, message,true,{});
  }

  static OkWithArg({String message="",Map<String,String>? arg}){
    return Response(true, message, false,arg!);
  }
}

