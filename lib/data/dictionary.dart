import 'package:flutter/services.dart';
import 'package:kdict/models/item.dart';
import 'package:yaml/yaml.dart';
import 'dart:math';
    
class Dictionary {

  late dynamic dictionary;

  Future<void> initializeData() async {
    final ymlString = await rootBundle.loadString('./../../assets/yml/alar.yml');
    dictionary = loadYaml(ymlString);
  }

  List<Item> findNWordsOfTheDay(int n) {
    List<Item> words = [];
    Iterable.generate(n).forEach((i) => words.add(Item.fromObj(dictionary[i])));
    return words;
  }

}