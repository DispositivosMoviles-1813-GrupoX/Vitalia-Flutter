class NotificationResponse {
  final int id;
  final String title;
  final String content;
  final String status;
  final int userId;

  NotificationResponse({
    required this.id,
    required this.title,
    required this.content,
    required this.status,
    required this.userId,
  });

  static NotificationResponse objJason(Map<String, dynamic> json) {
    return NotificationResponse(
        id: json['id'] as int,
        title: json['title'] as String,
        content: json['content'] as String,
        status: json['status'] as String,
        userId: json['userId'] as int,
    );
  }
}