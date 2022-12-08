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
        "https://firebasestorage.googleapis.com/v0/b/healthy-list-33c69.appspot.com/o/Y2Mate.is%20-%20Monster%20Walk%20Squats%20%20Glute%20Med%20Strengthening%20Exercise-h7dNt3pPFGo-720p-1656489946064.mp4?alt=media&token=51aee026-2ef4-4114-a30f-6966c5a21924",
    thumbnail:
        "https://www.gofitnessplan.com/images/exercises/female/squat-side-lateral-walk.jpg",
  ),
  Video(
    name: "Knee Push up",
    url:
        "https://firebasestorage.googleapis.com/v0/b/healthy-list-33c69.appspot.com/o/Y2Mate.is%20-%20The%20Knee%20Push%20Up%20%20How%20To%20Perform%20Without%20Shoulder%20Pain-lFR1GWy1Dcs-720p-1654212988333.mp4?alt=media&token=e9630125-a250-4144-811f-44a611ec1e64",
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
