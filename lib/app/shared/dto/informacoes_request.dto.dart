class InformacoesRequestDTO {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const InformacoesRequestDTO({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  factory InformacoesRequestDTO.fromMap(Map<String, dynamic> map) {
    return InformacoesRequestDTO(
      count: map['count'] as int,
      pages: map['pages'] as int,
      next: map['next'] != null ? map['next'] as String : null,
      prev: map['prev'] != null ? map['prev'] as String : null,
    );
  }
}
