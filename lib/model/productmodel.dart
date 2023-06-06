class ProductModel {
  ProductModel({
    required this.Images,
    required this.MobileName,
    required this.StockUpdate,
    required this.Storage,
    required this.RAM,
    required this.PreviousPrice,
    required this.Price,
    required this.Display,
    required this.Size,
    required this.Resolution,
    required this.Processor,
    required this.MainCamera,
    required this.FrontCamera,
    required this.Battery,
    required this.Charging,
    required this.DocId,
    required this.Status,
  });
  late final String Images;
  late final String MobileName;
  late final String StockUpdate;
  late final String Storage;
  late final String RAM;
  late final String PreviousPrice;
  late final String Price;
  late final String Display;
  late final String Size;
  late final String Resolution;
  late final String Processor;
  late final String MainCamera;
  late final String FrontCamera;
  late final String Battery;
  late final String Charging;
  late final String DocId;
  late final String Status;

  ProductModel.fromJson(Map<String, dynamic> json){
    Images = json['Images']??'';
    MobileName = json['MobileName']??'';
    StockUpdate = json['StockUpdate']??'';
    Storage = json['Storage']??'';
    RAM = json['RAM']??'';
    PreviousPrice = json['PreviousPrice']??'';
    Price = json['Price']??'';
    Display = json['Display']??'';
    Size = json['Size']??'';
    Resolution = json['Resolution']??'';
    Processor = json['Processor']??'';
    MainCamera = json['MainCamera']??'';
    FrontCamera = json['FrontCamera']??'';
    Battery = json['Battery']??'';
    Charging = json['Charging']??'';
    DocId = json['DocId']??'';
    Status = json['Status']??'';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Images'] = Images;
    data['MobileName'] = MobileName;
    data['StockUpdate'] = StockUpdate;
    data['Storage'] = Storage;
    data['RAM'] = RAM;
    data['PreviousPrice'] = PreviousPrice;
    data['Price'] = Price;
    data['Display'] = Display;
    data['Size'] = Size;
    data['Resolution'] = Resolution;
    data['Processor'] = Processor;
    data['MainCamera'] = MainCamera;
    data['FrontCamera'] = FrontCamera;
    data['Battery'] = Battery;
    data['Charging'] = Charging;
    data['DocId'] = DocId;
    data['Status'] = Status;
    return data;
  }
}