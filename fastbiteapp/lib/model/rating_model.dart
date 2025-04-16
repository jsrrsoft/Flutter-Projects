class RatingModel {
  final String userId;
  final String comment;
  final double rating;
  final DateTime timestamp;
  final double value;

  RatingModel({
    required this.userId,
    required this.comment,
    required this.rating,
    required this.timestamp,
    required this.value,
  });

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      userId: map['userId'] ?? '',
      comment: map['comment'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      timestamp: DateTime.tryParse(map['timestamp'] ?? '') ?? DateTime.now(),
      value: (map['value'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'comment': comment,
      'rating': rating,
      'timestamp': timestamp.toIso8601String(),
      'value': value,
    };
  }
}
