import 'package:collection/collection.dart';

class Drink {
    int id;
    String name;
    String primary_alcohol;
    String preferred_glass;
    List<String> ingredients;
    String instructions;

    Drink(
        this.id,
        this.name,
        this.primary_alcohol,
        this.preferred_glass,
        this.ingredients,
        this.instructions,
    );

    void from(Drink other) {
        this.id = other.id;
        this.name = other.name;
        this.primary_alcohol = other.primary_alcohol;
        this.preferred_glass = other.preferred_glass;
        this.ingredients = other.ingredients;
        this.instructions = other.instructions;
    }

    Map<String, Object> toJson() {
        return {
            'id': this.id,
            'name': this.name,
            'primary_alcohol': this.primary_alcohol,
            'preferred_glass': this.preferred_glass,
            'ingredients': this.ingredients,
            'instructions': this.instructions,
        };
    }

    static Drink fromJson(Map<String, dynamic> json) {
        return Drink(
            json['id'] as int,
            json['name'] as String,
            json['primary_alcohol'] as String,
            json['preferred_glass'] as String,
            List.from(json['ingredients']),
            json['instructions'] as String,
        );
    }

    @override
    String toString() {
        return 'Drink(id: $id, name: $name)';
    }

    bool operator ==(Drink other) {
        return (
            this.id == other.id
            && this.name == other.name
            && this.primary_alcohol == other.primary_alcohol
            && this.preferred_glass == other.preferred_glass
            && IterableEquality().equals(this.ingredients, other.ingredients)
            && this.instructions == other.instructions
        );
    }
}
