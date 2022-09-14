// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:task/app/functions.dart';

class ServicesItemResponse {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final String? category;
  final double? price;
  ServicesItemResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
  });

  factory ServicesItemResponse.fromJson(Map<String, dynamic> json) {
    return ServicesItemResponse(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
      category: json["category"],
      price: json["price"],
    );
  }
}

class ServicesResponse {
  final List<ServicesItemResponse?>? servicesList;
  final bool? status;
  final String? message;
  ServicesResponse({
    required this.servicesList,
    required this.status,
    required this.message,
  });

  factory ServicesResponse.fromJson(Map<String, dynamic> json) {
    return ServicesResponse(
        servicesList: json["data"] != null
            ? (json["data"] as List<Map<String, dynamic>>)
                .map(
                    (serviceItem) => ServicesItemResponse.fromJson(serviceItem))
                .toList()
            : null,
        status: statusBool(json["status"]),
        message: json["message"]);
  }
}
/*
{
    "data": [
        {
            "id": 1,
            "title": "تنظيف الواجهات الزجاجية",
            "description": "نظراً لأن تنظيف الواجهات الـزجاجـيـة للمـبـانـي والشـركات لا يمكن أن يتم بـدون الاستعانة بمتخصـصيـن لوجود الـكـثـيـر من المخاطـر ولحاجته لعمالة مـدربة على العمل في الارتفاعات الكبيرة من خـلال الرافعات المعـدة خصيصاً لهـذا الغرض لذلك نقدم لكم خـدمة تنظيف الواجـهـات الــزجـــاجــية بمنتهى الدقة والجودة.",
            "image": "https://mawasims.com.sa/storage/service/news-service.png",
            "category": "نظافة مباني",
            "price": 1
        },
    ],
    "message": "success",
    "status": true
}
*/