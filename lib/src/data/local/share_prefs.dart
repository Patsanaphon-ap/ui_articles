import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_articles/src/data/constants/local_key_const.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';

abstract class SharePreferenceData {
  Future<void> userInitial();
  Future<List<ArticlesModel>> getBookMarks();
  Future<void> setBookMarks(ArticlesModel articleData);
  Future<void> deleteBookMarks(String title);
  Future<void> removeBookMarks();
  Future<void> setArticles(
      {required String prefsKey, required List<ArticlesModel> articleData});
  Future<List<ArticlesModel>> getSavedArticles({required String prefsKey});
}

class SharePreferencesImp implements SharePreferenceData {
  SharedPreferences? _prefs;

  Future<SharedPreferences> get _db async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  @override
  Future<void> userInitial() async {
    getBookMarks();
  }

  @override
  Future<List<ArticlesModel>> getBookMarks() async {
    final prefs = await _db;
    final encodeList = prefs.getString(PrefKeyConst.bookmarks) ?? '';
    if (encodeList.isNotEmpty) {
      final List<dynamic> decodeList = jsonDecode(encodeList);
      final List<ArticlesModel> data =
          decodeList.map((e) => ArticlesModel.fromJson(e)).toList();
      return data;
    }

    return [];
  }

  @override
  Future<void> setBookMarks(ArticlesModel articleData) async {
    final prefs = await _db;
    List<Map<String, dynamic>> results = [];
    if (articleData.title.isNotEmpty) {
      final jsonBookMark = await getBookMarks();
      final dup =
          jsonBookMark.where((e) => e.title == articleData.title).toList();
      if (dup.isNotEmpty) {
        jsonBookMark.remove(dup.first);
      } else {
        jsonBookMark.add(articleData);
      }

      for (var pr in jsonBookMark) {
        results.add(pr.toJson());
      }
    }
    await prefs.setString(PrefKeyConst.bookmarks, jsonEncode(results));
  }

  @override
  Future<void> deleteBookMarks(String title) async {
    //
    final prefs = await _db;
    final jsonBookMark = await getBookMarks();
    final dup = jsonBookMark.where((e) => e.title == title).toList();
    if (dup.isNotEmpty) {
      jsonBookMark.remove(dup.first);
    }
    //
    //
    List<Map<String, dynamic>> results = [];
    for (var pr in jsonBookMark) {
      results.add(pr.toJson());
    }
    await prefs.setString(PrefKeyConst.bookmarks, jsonEncode(results));
  }

  @override
  Future<void> removeBookMarks() async {
    //
    final prefs = await _db;

    await prefs.setString(PrefKeyConst.bookmarks, '');
  }

  @override
  Future<void> setArticles(
      {required String prefsKey,
      required List<ArticlesModel> articleData}) async {
    final prefs = await _db;
    await prefs.remove(prefsKey);
    await prefs.setString(prefsKey, jsonEncode(articleData));
  }

  @override
  Future<List<ArticlesModel>> getSavedArticles(
      {required String prefsKey}) async {
    final prefs = await _db;
    final encodeList = prefs.getString(prefsKey) ?? '';
    if (encodeList.isNotEmpty) {
      final List<dynamic> decodeList = jsonDecode(encodeList);
      final List<ArticlesModel> data =
          decodeList.map((e) => ArticlesModel.fromJson(e)).toList();
      return data;
    }

    return [];
  }
}
