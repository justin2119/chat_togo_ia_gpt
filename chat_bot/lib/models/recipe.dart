import 'package:flutter/foundation.dart';

@immutable
class Recipe {
  final String id;
  final String title;
  final List<String> ingredients;
  final String instructions;
  final String category;
  final String imageUrl;

  const Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.category,
    required this.imageUrl,
  });

  Recipe copyWith({
    String? id,
    String? title,
    List<String>? ingredients,
    String? instructions,
    String? category,
    String? imageUrl,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'ingredients': ingredients,
      'instructions': instructions,
      'category': category,
      'imageUrl': imageUrl,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as String,
      title: json['title'] as String,
      ingredients: List<String>.from(json['ingredients'] as List),
      instructions: json['instructions'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recipe &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          listEquals(ingredients, other.ingredients) &&
          instructions == other.instructions &&
          category == other.category &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      ingredients.hashCode ^
      instructions.hashCode ^
      category.hashCode ^
      imageUrl.hashCode;

  @override
  String toString() {
    return 'Recipe(id: $id, title: $title, category: $category)';
  }
}
