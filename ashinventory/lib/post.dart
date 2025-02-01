import 'dart:collection';

import 'package:darq/darq.dart';
// import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Post {
  final int id;
  String name;
  String link;
  Widget actions;
  bool isEnabled;
  int stockNumber;
  // Gender nameGender;

  Post({
    required this.id,
    required this.name,
    required this.link,
    required this.actions,
    required this.isEnabled,
    required this.stockNumber,
    // required this.nameGender,
  });

  // static final Faker _faker = Faker();
  factory Post.random({required int id}) {
    return Post(
      id: id,
      name: "Test name",
      link: "Test link",
      actions: FilledButton(onPressed: () {}, child: Text("data")),
      isEnabled: true,
      stockNumber: 500,
      // nameGender: Gender.values[2],
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) => other is Post ? other.id == id : false;

  @override
  String toString() =>
      "Post(id: $id, name: $name, link: ${link.length > 50 ? link.substring(0, 50) + '...' : link},  isEnabled: $isEnabled, stockNumber: $stockNumber, ";
}

// enum Gender {
//   male("Male"),
//   female("Female"),
//   unespecified("Unspecified");

//   const Gender(this.name);

//   final String name;
// }

class PostsRepository {
  PostsRepository._();

  static final List<Post> _backend = [];

  static void generate(int count) {
    _backend.clear();
    _backend.addAll(List.generate(count, (index) => Post.random(id: index)));
  }

  static Future<PaginatedList<Post>> getPosts(
      {required int pageSize,
      required String? pageToken,
      bool? status,
      // Gender? gender,
      DateTimeRange? between,
      // String? nameName,
      String? searchQuery,
      // String? sortBy,
      bool sortDescending = false}) async {
    await Future.delayed(const Duration(seconds: 1));

    // Decode page token
    int nextId = pageToken == null ? 0 : int.tryParse(pageToken) ?? 1;

    Iterable<Post> query = _backend;

    // if (sortBy == null) {
      query = query.orderBy((element) => element.id);
    // } else {
    //   switch (sortBy) {
    //     // case "createdAt":
    //     //   query = sortDescending
    //     //       ? query.orderByDescending(
    //     //           (element) => element.createdAt.millisecondsSinceEpoch)
    //     //       : query.orderBy(
    //     //           (element) => element.createdAt.millisecondsSinceEpoch);
    //     //   break;

    //     case "stockNumber":
    //       query = sortDescending
    //           ? query.orderByDescending((element) => element.stockNumber)
    //           : query.orderBy((element) => element.stockNumber);
    //       break;

    //     case "name":
    //       query = sortDescending
    //           ? query.orderByDescending((element) => element.name)
    //           : query.orderBy((element) => element.name);
    //       break;

    //     // case "nameGender":
    //     //   query = sortDescending
    //     //       ? query.orderByDescending((element) => element.nameGender.name)
    //     //       : query.orderBy((element) => element.nameGender.name);
    //     //   break;
    //   }
    // }

    query = query.where((element) => element.id >= nextId);
    // if (status != null) {
    //   query = query.where((element) => element.isEnabled == status);
    // }

    // if (gender != null) {
    //   query = query.where((element) => element.nameGender == gender);
    // }

    // if (between != null) {
    //   query = query.where((element) =>
    //       between.start.isBefore(element.createdAt) &&
    //       between.end.isAfter(element.createdAt));
    // }

    // if (nameName != null) {
    //   query = query.where((element) =>
    //       element.name.toLowerCase().contains(nameName.toLowerCase()));
    // }

    if (searchQuery != null) {
      searchQuery = searchQuery.toLowerCase();
      query = query.where((element) =>
          element.name.toLowerCase().startsWith(searchQuery!) ||
          element.link.toLowerCase().contains(searchQuery));
    }

    var resultSet = query.take(pageSize + 1).toList();
    String? nextPageToken;
    if (resultSet.length == pageSize + 1) {
      Post lastPost = resultSet.removeLast();
      nextPageToken = lastPost.id.toString();
    }

    return PaginatedList(items: resultSet, nextPageToken: nextPageToken);
  }
}

class PaginatedList<T> {
  final Iterable<T> _items;
  final String? _nextPageToken;

  List<T> get items => UnmodifiableListView(_items);
  String? get nextPageToken => _nextPageToken;

  PaginatedList({required Iterable<T> items, String? nextPageToken})
      : _items = items,
        _nextPageToken = nextPageToken;
}
