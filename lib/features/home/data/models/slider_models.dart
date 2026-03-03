class SliderModel {
  SliderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] == null ? null : SliderData.fromJson(json['data']);
  }

  SliderData? data;
  String? message;
  int? status;
}

class SliderData {
  SliderData.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <SliderImage>[];
      for (var e in json['sliders']) {
        sliders!.add(SliderImage.fromJson(e));
      }
    }
  }

  List<SliderImage>? sliders;
}

class SliderImage {
  SliderImage.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  String? image;
}
