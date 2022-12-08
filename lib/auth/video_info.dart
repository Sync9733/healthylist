class Video {
  final String name;
  final String url;
  final String thumbnail;
  const Video({
    required this.name,
    required this.url,
    required this.thumbnail,
  });
}

const videos = [
  Video(
    name: "Squat and Walk",
    url:
        "https://firebasestorage.googleapis.com/v0/b/healthy-list-33c69.appspot.com/o/MonsterWalk.mp4?alt=media&token=8235a1ab-4e7a-4e07-8f1f-521e4a46b7c4",
    thumbnail:
        "https://www.gofitnessplan.com/images/exercises/female/squat-side-lateral-walk.jpg",
  ),
  Video(
    name: "Knee Push up",
    url:
        "https://firebasestorage.googleapis.com/v0/b/healthy-list-33c69.appspot.com/o/KneePushUp.mp4?alt=media&token=fde84d4a-0124-4f7e-8d39-6addab74816b",
    thumbnail:
        "https://media.istockphoto.com/id/1281672729/vector/woman-doing-exercise-with-knee-push-up-in-2-steps.jpg?s=612x612&w=0&k=20&c=8b9jCCJrmX9KYATzg5XDE717PQb8S4Hk1yRyAky0gXA=",
  ),
  Video(
    name: "Squat Kickback",
    url:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    thumbnail:
        "https://static.vecteezy.com/system/resources/previews/005/178/401/original/woman-doing-single-leg-squat-kickback-exercise-free-vector.jpg",
  ),
];
