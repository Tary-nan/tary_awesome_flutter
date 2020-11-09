import 'dart:async';

mixin Validation {

  static bool isEmail(String email) => email.contains('@');


  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink){
      print(value);
      if(isEmail(value)) {
        sink.add(value);
      }else{
        sink.addError("invalidate email");
      }

    }
  );

  final validateSubject = StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink){

      int len = value.length;
      if(len == 0){
        return sink.addError("le champs ne doit pas etre vide");
      }else if(len < 4 ){
        return sink.addError("plus de 4 lettre");
      }else{
        print(value);
        return sink.add(value);
      }
    }
  );

  final validateBody = StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink){

      int len = value.length;
      if(len == 0){
        return sink.addError("le champs ne doit pas etre vide");
      }else if(len < 10 ){
        return sink.addError("plus de 10 lettre");
      }else{

        print(value);
        return sink.add(value);
      }
    }
  );
  
}
//validateBody
