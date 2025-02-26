abstract class Singleton {
  Singleton._privateConstructor();
  //Abstract class for creating a singleton class.
}

class SequenceGenerator extends Singleton {
  SequenceGenerator._privateConstructor() : super._privateConstructor();
  //Private consturctor that is only accessible within the class and its subclaesses;

  static final SequenceGenerator _instance =
      SequenceGenerator._privateConstructor();
  //static instance of

  factory SequenceGenerator() {
    return _instance;
  }

  int _counter = 0;
  //counter variable to keep track

  int getNextNumber() {
    _counter++;
    return _counter;

    //Method to get the next number
  }
}

class FileAuditManager {
  static final FileAuditManager _singleton = FileAuditManager._internal();

  FileAuditManager._internal();

  factory FileAuditManager() {
    return _singleton;
  }
}
