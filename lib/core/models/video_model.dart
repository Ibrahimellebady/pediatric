class VideoModel {
  String? id;
  String? imageUrl;
  String? videoUrl;
  String? fileUrl;
  String? fileName;
  String? lectureName;
  String? lectureDescription;
  String? presenter;
  int? lectureNum;

  VideoModel({
    this.id,
    this.imageUrl,
    this.videoUrl,
    this.fileUrl,
    this.fileName,
    this.lectureName,
    this.lectureDescription,
    this.presenter,
    this.lectureNum,
  });

  // NamedConstructor => I will used it when i get Data from fireStore and save it on this model
  // refactoring map | json
  VideoModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    imageUrl = data['imageUrl'];
    videoUrl = data['videoUrl'];
    fileUrl = data['fileUrl'];
    fileName = data['fileName'];
    lectureName = data['lectureName'];
    lectureDescription = data['lectureDescription'];
    presenter = data['presenter'];
    lectureNum = data['lectureNum'];
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'fileUrl': fileUrl,
      'fileName': fileName,
      'lectureName': lectureName,
      'lectureDescription': lectureDescription,
      'presenter': presenter,
      'lectureNum': lectureNum,
    };
  }
}
