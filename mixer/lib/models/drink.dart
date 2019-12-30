import 'package:collection/collection.dart';

class Drink {
    String uuid; String name;
    String primary_alcohol;
    String preferred_glass;
    List<String> ingredients;
    String instructions;

    Drink(
        this.uuid,
        this.name,
        this.primary_alcohol, this.preferred_glass, this.ingredients,
        this.instructions,
    );

    void from(Drink other) {
        this.uuid = other.uuid;
        this.name = other.name;
        this.primary_alcohol = other.primary_alcohol;
        this.preferred_glass = other.preferred_glass;
        this.ingredients = other.ingredients;
        this.instructions = other.instructions;
    }

    Map<String, Object> toJson() {
        return {
            'uuid': this.uuid,
            'name': this.name,
            'primary_alcohol': this.primary_alcohol,
            'preferred_glass': this.preferred_glass,
            'ingredients': this.ingredients,
            'instructions': this.instructions,
        };
    }

    static Drink fromJson(Map<String, dynamic> json) {
        return Drink(
            json['uuid'] as String,
            json['name'] as String,
            json['primary_alcohol'] as String,
            json['preferred_glass'] as String,
            List.from(json['ingredients']),
            json['instructions'] as String,
        );
    }

    @override
    String toString() {
        return 'Drink(uuid: $uuid, name: $name)';
    }

    @override
    bool operator ==(dynamic other) {
        if (identical(this, other)) {
            return true;
        }
        if (runtimeType != other.runtimeType) {
            return false;
        }

        final Drink typedOther = other;
        return (
            this.uuid == typedOther.uuid
            && this.name == typedOther.name
            && this.primary_alcohol == typedOther.primary_alcohol
            && this.preferred_glass == typedOther.preferred_glass
            && IterableEquality().equals(this.ingredients, typedOther.ingredients)
            && this.instructions == typedOther.instructions
        );
    }

    @override
    int get hashCode {
        return this.uuid.hashCode;
    }
}
