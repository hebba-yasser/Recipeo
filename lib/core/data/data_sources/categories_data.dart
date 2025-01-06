import 'package:recpie_app/core/utils/assets.dart';

import '../models/categories_model/category_model.dart';
import '../models/categories_model/sub_category_model.dart';

class CategoriesDataSource {
  static List<CategoryModel> categoriesList = [
    CategoryModel(
      categoryName: 'Courses',
      imagePath: CoursesAssets.courses, // Main category image path
      subCategories: [
        SubCategoryModel(
            subCategoryName: 'Main Course',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.mainCourse),
        SubCategoryModel(
            subCategoryName: 'Side Dish',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.sideDish),
        SubCategoryModel(
            subCategoryName: 'Dessert',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.dessert),
        SubCategoryModel(
            subCategoryName: 'Appetizer',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.appetizer),
        SubCategoryModel(
            subCategoryName: 'Salad',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.salad),
        SubCategoryModel(
            subCategoryName: 'Bread',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.bread),
        SubCategoryModel(
            subCategoryName: 'Breakfast',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.breakfast),
        SubCategoryModel(
            subCategoryName: 'Soup',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.soup),
        SubCategoryModel(
            subCategoryName: 'Marinade',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.marinade),
        SubCategoryModel(
            subCategoryName: 'Finger Food',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.fingerFood),
        SubCategoryModel(
            subCategoryName: 'Snack',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.snack),
        SubCategoryModel(
            subCategoryName: 'Sauce',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.sauces),
        SubCategoryModel(
            subCategoryName: 'Beverage',
            categoryName: 'Courses',
            subCategoryImagePath: CoursesAssets.beverages),
      ],
    ),
    CategoryModel(
      categoryName: 'Cuisines',
      imagePath: AppAssets.authImg, // Main category image path
      subCategories: [
        SubCategoryModel(
          subCategoryName: 'African',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.african,
        ),
        SubCategoryModel(
          subCategoryName: 'Asian',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.asian,
        ),
        SubCategoryModel(
          subCategoryName: 'American',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.american,
        ),
        SubCategoryModel(
          subCategoryName: 'British',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.british,
        ),
        SubCategoryModel(
          subCategoryName: 'Cajun',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.cajun,
        ),
        SubCategoryModel(
          subCategoryName: 'Caribbean',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.caribbean,
        ),
        SubCategoryModel(
          subCategoryName: 'Chinese',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.chinese,
        ),
        SubCategoryModel(
          subCategoryName: 'Eastern European',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.easternEuropean,
        ),
        SubCategoryModel(
          subCategoryName: 'European',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.european,
        ),
        SubCategoryModel(
          subCategoryName: 'French',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.french,
        ),
        SubCategoryModel(
          subCategoryName: 'German',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.german,
        ),
        SubCategoryModel(
          subCategoryName: 'Greek',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.greek,
        ),
        SubCategoryModel(
          subCategoryName: 'Indian',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.indian,
        ),
        SubCategoryModel(
          subCategoryName: 'Irish',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.irish,
        ),
        SubCategoryModel(
          subCategoryName: 'Italian',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.italian,
        ),
        SubCategoryModel(
          subCategoryName: 'Japanese',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.japanese,
        ),
        SubCategoryModel(
          subCategoryName: 'Korean',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.korean,
        ),
        SubCategoryModel(
          subCategoryName: 'Latin American',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.latinAmerican,
        ),
        SubCategoryModel(
          subCategoryName: 'Mexican',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.mexican,
        ),
        SubCategoryModel(
          subCategoryName: 'Middle Eastern',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.middleEastern,
        ),
        SubCategoryModel(
          subCategoryName: 'Nordic',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.nordic,
        ),
        SubCategoryModel(
          subCategoryName: 'Southern',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.southern,
        ),
        SubCategoryModel(
          subCategoryName: 'Spanish',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.spanish,
        ),
        SubCategoryModel(
          subCategoryName: 'Thai',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.thai,
        ),
        SubCategoryModel(
          subCategoryName: 'Vietnamese',
          categoryName: 'Cuisines',
          subCategoryImagePath: CuisinesAssets.vietnamese,
        ),
      ],
    ),
    CategoryModel(
      categoryName: 'Dishes',
      imagePath: DishesAssets.dishes,
      subCategories: [
        SubCategoryModel(
            subCategoryName: 'Pizza',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.pizza),
        SubCategoryModel(
            subCategoryName: 'Pasta',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.pasta),
        SubCategoryModel(
            subCategoryName: 'Burger',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.burger),
        SubCategoryModel(
            subCategoryName: 'Salad',
            categoryName: 'Dishes',
            subCategoryImagePath: CoursesAssets.salad),
        SubCategoryModel(
            subCategoryName: 'Cake',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.cake),
        SubCategoryModel(
            subCategoryName: 'Cookie',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.cookie),
        SubCategoryModel(
            subCategoryName: 'Pie',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.pie),
        SubCategoryModel(
            subCategoryName: 'Casserole',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.casserole),
        SubCategoryModel(
            subCategoryName: 'Cheesecake',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.cheesecake),
        SubCategoryModel(
            subCategoryName: 'Ice Cream',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.iceCream),
        SubCategoryModel(
            subCategoryName: 'Taco',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.tacos),
        SubCategoryModel(
            subCategoryName: 'Curry',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.curry),
        SubCategoryModel(
            subCategoryName: 'Brownie',
            categoryName: 'Dishes',
            subCategoryImagePath: DishesAssets.brownies),
      ],
    ),
    CategoryModel(
      categoryName: 'Diets',
      imagePath: DietsAssets.diets,
      subCategories: [
        SubCategoryModel(
            subCategoryName: 'Gluten Free',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.glutenFree),
        SubCategoryModel(
            subCategoryName: 'Vegetarian',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.vegetarian),
        SubCategoryModel(
            subCategoryName: 'Vegan',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.vegan),
        SubCategoryModel(
            subCategoryName: 'Keto',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.keto),
        SubCategoryModel(
            subCategoryName: 'Lacto-Vegetarian',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.lactoVegetarian),
        SubCategoryModel(
            subCategoryName: 'Ovo-Vegetarian',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.ovoVegetarian),
        SubCategoryModel(
            subCategoryName: 'Pescetarian',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.pescetarian),
        SubCategoryModel(
            subCategoryName: 'Paleo',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.paleo),
        SubCategoryModel(
            subCategoryName: 'Primal',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.primal),
        SubCategoryModel(
            subCategoryName: 'Low FODMAP',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.lowFodMap),
        SubCategoryModel(
            subCategoryName: 'Whole30',
            categoryName: 'Diets',
            subCategoryImagePath: DietsAssets.whole30),
      ],
    ),
    CategoryModel(
      categoryName: 'Intolerance Free',
      imagePath: DietsAssets.intolerance,
      subCategories: [
        SubCategoryModel(
            subCategoryName: 'Dairy',
            categoryName: 'Intolerance Free',
            subCategoryImagePath:
                DietsAssets.lactoseFree), // Add your image path
        SubCategoryModel(
            subCategoryName: 'Egg',
            categoryName: 'Intolerance Free',
            subCategoryImagePath: DietsAssets.eggFree), // Add your image path
        SubCategoryModel(
            subCategoryName: 'Gluten',
            categoryName: 'Intolerance Free',
            subCategoryImagePath:
                DietsAssets.glutenFree), // Add your image path
        SubCategoryModel(
            subCategoryName: 'Peanut',
            categoryName: 'Intolerance Free',
            subCategoryImagePath:
                DietsAssets.peanutFree), // Add your image path
        SubCategoryModel(
            subCategoryName: 'Seafood',
            categoryName: 'Intolerance Free',
            subCategoryImagePath: DietsAssets.fishFree), // Add your image path
        SubCategoryModel(
            subCategoryName: 'Sesame',
            categoryName: 'Intolerance Free',
            subCategoryImagePath:
                DietsAssets.sesameFree), // Add your image path
        SubCategoryModel(
            subCategoryName: 'Shellfish',
            categoryName: 'Intolerance Free',
            subCategoryImagePath: DietsAssets.shellfish), // Add your image path
        SubCategoryModel(
            subCategoryName: 'Soy',
            categoryName: 'Intolerance Free',
            subCategoryImagePath: DietsAssets.soyFree), // Add your image path
        SubCategoryModel(
            subCategoryName: 'Sulfite',
            categoryName: 'Intolerance Free',
            subCategoryImagePath:
                DietsAssets.sulfiteFree), // Add your image path
        SubCategoryModel(
            subCategoryName: 'Tree Nut',
            categoryName: 'Intolerance Free',
            subCategoryImagePath: DietsAssets.nutFree), // Add your image path
      ],
    ),
    // New Drinks Categories
    CategoryModel(
      categoryName: 'Cocktails',
      imagePath: CocktailAssets.cocktails, // Main category image path
      subCategories: [
        SubCategoryModel(
            subCategoryName: 'Mojito',
            categoryName: 'Cocktails',
            subCategoryImagePath: CocktailAssets.mojito),
        SubCategoryModel(
            subCategoryName: 'Margarita',
            categoryName: 'Cocktails',
            subCategoryImagePath: CocktailAssets.margarita),
        SubCategoryModel(
            subCategoryName: 'Martini',
            categoryName: 'Cocktails',
            subCategoryImagePath: CocktailAssets.martini),
        SubCategoryModel(
            subCategoryName: 'Daiquiri',
            categoryName: 'Cocktails',
            subCategoryImagePath: CocktailAssets.daiquiri),
      ],
    ),
    CategoryModel(
      categoryName: 'Non-Alcoholic Drinks',
      imagePath: NonAlcoholicDrinksAssets.nonAlcoholicDrinks,
      subCategories: [
        SubCategoryModel(
            subCategoryName: 'Juices',
            categoryName: 'Non-Alcoholic Drinks',
            subCategoryImagePath: NonAlcoholicDrinksAssets.freshJuices),
        SubCategoryModel(
            subCategoryName: 'Smoothies',
            categoryName: 'Non-Alcoholic Drinks',
            subCategoryImagePath: NonAlcoholicDrinksAssets.smoothie),
        SubCategoryModel(
            subCategoryName: 'Lemonade',
            categoryName: 'Non-Alcoholic Drinks',
            subCategoryImagePath: NonAlcoholicDrinksAssets.lemonade),
      ],
    ),
    CategoryModel(
      categoryName: 'Smoothies',
      imagePath: SmoothiesAssets.smoothie,
      subCategories: [
        SubCategoryModel(
          subCategoryName: 'Fruit Smoothie',
          categoryName: 'Smoothies',
          subCategoryImagePath: SmoothiesAssets.smoothie,
        ),
        SubCategoryModel(
            subCategoryName: 'Green Smoothie',
            categoryName: 'Smoothies',
            subCategoryImagePath: SmoothiesAssets.greenSmoothie),
        SubCategoryModel(
            subCategoryName: 'Protein Smoothie',
            categoryName: 'Smoothies',
            subCategoryImagePath: SmoothiesAssets.protienSmoothie),
      ],
    ),
    CategoryModel(
      categoryName: 'Coffee and Tea',
      imagePath: CoffeeAndTeaAssets.coffeeAndTea,
      subCategories: [
        SubCategoryModel(
          subCategoryName: 'Espresso',
          categoryName: 'Coffee and Tea',
          subCategoryImagePath: CoffeeAndTeaAssets.espresso,
        ),
        SubCategoryModel(
          subCategoryName: 'Latte',
          categoryName: 'Coffee and Tea',
          subCategoryImagePath: CoffeeAndTeaAssets.latte,
        ),
        SubCategoryModel(
          subCategoryName: 'Green Tea',
          categoryName: 'Coffee and Tea',
          subCategoryImagePath: CoffeeAndTeaAssets.greenTea,
        ),
      ],
    ),
    CategoryModel(
      categoryName: 'Milkshakes and Shakes',
      imagePath: MilkShakesAssets.milkshakes,
      subCategories: [
        SubCategoryModel(
          subCategoryName: 'Chocolate Milkshake',
          categoryName: 'Milkshakes and Shakes',
          subCategoryImagePath: MilkShakesAssets.chocolateMilkshakes,
        ),
        SubCategoryModel(
          subCategoryName: 'Vanilla Milkshake',
          categoryName: 'Milkshakes and Shakes',
          subCategoryImagePath: MilkShakesAssets.vanillaMilkshake,
        ),
        SubCategoryModel(
          subCategoryName: 'Strawberry Shake',
          categoryName: 'Milkshakes and Shakes',
          subCategoryImagePath: MilkShakesAssets.strawberryMilkshake,
        ),
      ],
    ),
  ];
}
