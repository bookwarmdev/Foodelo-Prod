class CartModel {
  Cart? cart;
  String? message;
  bool? success;

  CartModel({this.cart, this.message, this.success});

  CartModel.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    return data;
  }
}

class Cart {
  String? message;
  bool? success;
  int? statusCode;
  // Data? data;
  List<Data>? data;

  Cart({this.message, this.success, this.statusCode, this.data});

  Cart.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    statusCode = json['statusCode'];
    // data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    // if (this.data != null) {
    //   data['data'] = this.data!.toJson();
    // }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? orderId;
  int? total;
  String? status;
  String? sId;
  List<Items>? items;
  int? iV;

  Data(
      {this.userId,
      this.orderId,
      this.total,
      this.status,
      this.sId,
      this.items,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    orderId = json['orderId'];
    total = json['total'];
    status = json['status'];
    sId = json['_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['orderId'] = this.orderId;
    data['total'] = this.total;
    data['status'] = this.status;
    data['_id'] = this.sId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Items {
  String? productId;
  int? quantity;
  int? amount;
  String? sId;

  Items({this.productId, this.quantity, this.amount, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
    amount = json['amount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['_id'] = this.sId;
    return data;
  }
}
