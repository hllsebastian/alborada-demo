class InitiativeInfo {
  const InitiativeInfo({
    this.type,
    this.title,
    this.description,
    this.location,
    this.addres,
    this.startDate,
    this.endDate,
    this.wishes,
    this.howWorks,
  });
  final String? type;
  final String? title;
  final String? description;
  final String? location;
  final String? addres;
  final String? startDate;
  final String? endDate;
  final String? wishes;
  final Map<String, String>? howWorks;
}
