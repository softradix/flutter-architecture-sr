
// We will use this to handle the api failure scenerios.

abstract class Failure {
  final String? message;

  const Failure(this.message);
}

class GeneralFailure extends Failure {
  GeneralFailure(String message) : super(message);

  @override
  String get message => super.message!;
}