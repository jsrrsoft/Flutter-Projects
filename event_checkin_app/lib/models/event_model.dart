class EventModel {
  final String id;
  final String name;
  final String location;
  final String createdBy;
  final List<String> attendees;
  final List<String> checkedIn;

  EventModel({
    required this.id,
    required this.name,
    required this.location,
    required this.createdBy,
    required this.attendees,
    required this.checkedIn,
  });

  factory EventModel.fromFirestore(String docId, Map<String, dynamic> data) {
    return EventModel(
      id: docId,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      createdBy: data['createdBy'] ?? '',
      attendees: List<String>.from(data['attendees'] ?? []),
      checkedIn: List<String>.from(data['checkedIn'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'createdBy': createdBy,
      'attendees': attendees,
      'checkedIn': checkedIn,
    };
  }
}
