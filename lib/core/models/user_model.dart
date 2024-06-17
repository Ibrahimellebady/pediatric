class UserModel {
  //required
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phoneNumber;

// optional
  String? image;
  String? chooseStatus;
  String? university;
  String? address;
  String? sex;
  String? birthDate;

// backend
  int? quizOneScore;
  int? quizTwoScore;
  int? quizThreeScore;
  int? quizFourScore;
  int? quizFiveScore;
  int? quizSixScore;
  int? quizSevenScore;
  int? quizEightScore;
  int? quizNineScore;
  int? quizTenScore;
  int? quizElevenScore;
  int? quizTwelveScore;
  int? finalExamScore;
  int? totalScore;

  UserModel({
    this.id,
    this.image,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.chooseStatus,
    this.university,
    this.address,
    this.phoneNumber,
    this.sex,
    this.quizOneScore,
    this.quizTwoScore,
    this.quizThreeScore,
    this.quizFourScore,
    this.quizFiveScore,
    this.quizSixScore,
    this.quizSevenScore,
    this.quizEightScore,
    this.quizNineScore,
    this.quizTenScore,
    this.quizElevenScore,
    this.quizTwelveScore,
    this.finalExamScore,
    this.totalScore,
    this.birthDate,
  });

  // From JSON
  UserModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    image = data['image'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    password = data['password'];
    chooseStatus = data['chooseStatus'];
    university = data['university'];
    address = data['address'];
    phoneNumber = data['phoneNumber'];
    sex = data['sex'];
    quizOneScore = data['quizOneScore'];
    quizTwoScore = data['quizTwoScore'];
    quizThreeScore = data['quizThreeScore'];
    quizFourScore = data['quizFourScore'];
    quizFiveScore = data['quizFiveScore'];
    quizSixScore = data['quizSixScore'];
    quizSevenScore = data['quizSevenScore'];
    quizEightScore = data['quizEightScore'];
    quizNineScore = data['quizNineScore'];
    quizTenScore = data['quizTenScore'];
    quizElevenScore = data['quizElevenScore'];
    quizTwelveScore = data['quizTwelveScore'];
    finalExamScore = data['finalExamScore'];
    totalScore = data['totalScore'];
    birthDate = data['birthDate'];
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'chooseStatus': chooseStatus,
      'university': university,
      'address': address,
      'phoneNumber': phoneNumber,
      'sex': sex,
      'quizOneScore': quizOneScore,
      'quizTwoScore': quizTwoScore,
      'quizThreeScore': quizThreeScore,
      'quizFourScore': quizFourScore,
      'quizFiveScore': quizFiveScore,
      'quizSixScore': quizSixScore,
      'quizSevenScore': quizSevenScore,
      'quizEightScore': quizEightScore,
      'quizNineScore': quizNineScore,
      'quizTenScore': quizTenScore,
      'quizElevenScore': quizElevenScore,
      'quizTwelveScore': quizTwelveScore,
      'finalExamScore': finalExamScore,
      'totalScore': totalScore,
      'birthDate': birthDate,
    };
  }
}
