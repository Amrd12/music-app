import 'package:hive/hive.dart';
import 'package:musicapp/enums/model_type.dart';
import 'package:musicapp/models/main_model.dart';

// part 'info_music_model.g.dart';

@HiveType(typeId: 0)
class InfoMusicModel extends MainModel with HiveObjectMixin {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String thumbnail;

  @HiveField(4)
  late final String typeString;

  @HiveField(5)
  final String channelId;

  @HiveField(6)
  int startFrom = 0;
  @HiveField(7)
  final int seceunds;

  InfoMusicModel(
      {required this.id,
      required this.title,
      required this.author,
      required this.thumbnail,
      required this.channelId,
      required this.seceunds})
      : super(id: id, title: title, thumbnail: thumbnail) {
    typeString = type.toString();
  }

  @override
  ModelType get type => ModelType.video;
}

// Challenge
// Create a class Customer with three properties: name, age, and phone.
// The class should have one constant constructor. The constructor should

//  initialize the values of the three properties. Create an object of the
//   class Customer and print the values of the three properties.
class Customer {
  final String name;
  final int age;
  final int phone;

  const Customer(this.name, this.age, this.phone);
}

void main(List<String> args) {
  const Customer cus = Customer("name", 13, 313);
  print("name ${cus.name} age: ${cus.age} , phone: ${cus.phone}");
}
