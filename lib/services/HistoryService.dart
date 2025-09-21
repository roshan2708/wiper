import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_wipher/models/WipeHistory.dart';

class HistoryService {
  static const String _key = 'wipe_history';

  static Future<void> addHistory(WipeHistory history) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> historyList = prefs.getStringList(_key) ?? [];
    historyList.add(json.encode(history.toJson()));
    await prefs.setStringList(_key, historyList);
  }

  static Future<List<WipeHistory>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> historyList = prefs.getStringList(_key) ?? [];
    return historyList.map((str) => WipeHistory.fromJson(json.decode(str))).toList();
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}