class SliderModel {
  SliderModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    final dataMap = json['data'] as Map<String, dynamic>? ?? {};
    return SliderModel(
      data: SliderData.fromJson(dataMap),
      message: (json['message'] ?? '').toString(),
      status: (json['status'] as num?)?.toInt() ?? 0,
    );
  }

  final SliderData data;
  final String message;
  final int status;
}

class SliderData {
  SliderData({required this.sliders});

  factory SliderData.fromJson(Map<String, dynamic> json) {
    final slidersList = json['sliders'] as List<dynamic>? ?? <dynamic>[];
    return SliderData(
      sliders: slidersList
          .whereType<Map<String, dynamic>>()
          .map(SliderItem.fromJson)
          .toList(),
    );
  }

  final List<SliderItem> sliders;
}

class SliderItem {
  SliderItem({required this.image});

  factory SliderItem.fromJson(Map<String, dynamic> json) =>
      SliderItem(image: (json['image'] ?? '').toString());

  final String image;
}
