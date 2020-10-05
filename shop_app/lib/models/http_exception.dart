
class HttpException implements Exception{
  final String message;
  HttpException(this.message);


  @override
  String toString(){//overriding
  return message;
  // return super.toString();//instance of httpexceptiom

  }

}