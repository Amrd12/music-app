enum ModelType {
  video,
  playlist,
  author,
  album,
  podcast;

  @override
  String toString() {
    switch (this) {
      case ModelType.video:
        return "video";
      case ModelType.playlist:
        return "playlist";
      case ModelType.author:
        return "author";
      case ModelType.album:
        return "album";
      case ModelType.podcast:
        return "podcast";
    }
  }
}

extension ToModelType on String {
  ModelType? toModelType() {
    switch (this) {
      case "video":
        return ModelType.video;
      case "playlist":
        return ModelType.playlist;
      case "author":
        return ModelType.author;
      case "album":
        return ModelType.album;
      case "podcast":
        return ModelType.podcast;
      default:
        return null;
    }
  }
}

void main(List<String> args) {
  // Example usage:
  String modelString = "video";
  ModelType? modelType = modelString.toModelType();
  print(modelType); // Output: ModelType.video
  print(modelType.toString()); // Output: video
}
