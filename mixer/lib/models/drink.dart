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
}
