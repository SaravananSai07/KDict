import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
    
class Dictionary {

  late dynamic dictionary;

  Future<void> initializeData() async {
    final ymlString = await rootBundle.loadString('./../../assets/yml/alar.yml');
    dictionary = loadYaml(ymlString);
  }

}