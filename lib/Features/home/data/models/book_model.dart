// To parse this JSON data, do
//
//     final bookModelList = bookModelListFromJson(jsonString);

import 'dart:convert';

import 'package:bookly/Features/home/domain/entities/book_entity.dart';

BookModelList bookModelListFromJson(String str) =>
    BookModelList.fromJson(json.decode(str));

String bookModelListToJson(BookModelList data) => json.encode(data.toJson());

class BookModelList {
  List<BookModel>? items;

  BookModelList({
    this.items,
  });

  BookModelList copyWith({
    List<BookModel>? items,
  }) =>
      BookModelList(
        items: items ?? this.items,
      );

  factory BookModelList.fromJson(Map<String, dynamic> json) => BookModelList(
        items: json["items"] == null
            ? []
            : List<BookModel>.from(
                json["items"]!.map((x) => BookModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class BookModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
            bookId: id!,
            authorName: volumeInfo?.authors?.first ?? "No Name",
            bookImage: volumeInfo?.imageLinks?.thumbnail ?? "",
            price: 0.0,
            rating: volumeInfo?.averageRating ?? 0.0);

  BookModel copyWith({
    String? kind,
    String? id,
    String? etag,
    String? selfLink,
    VolumeInfo? volumeInfo,
    SaleInfo? saleInfo,
    AccessInfo? accessInfo,
    SearchInfo? searchInfo,
  }) =>
      BookModel(
        kind: kind ?? this.kind,
        id: id ?? this.id,
        etag: etag ?? this.etag,
        selfLink: selfLink ?? this.selfLink,
        volumeInfo: volumeInfo ?? this.volumeInfo,
        saleInfo: saleInfo ?? this.saleInfo,
        accessInfo: accessInfo ?? this.accessInfo,
        searchInfo: searchInfo ?? this.searchInfo,
      );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: json["volumeInfo"] == null
            ? null
            : VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: json["saleInfo"] == null
            ? null
            : SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: json["accessInfo"] == null
            ? null
            : AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null
            ? null
            : SearchInfo.fromJson(json["searchInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo?.toJson(),
        "saleInfo": saleInfo?.toJson(),
        "accessInfo": accessInfo?.toJson(),
        "searchInfo": searchInfo?.toJson(),
      };
}

class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Epub? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  AccessInfo copyWith({
    String? country,
    String? viewability,
    bool? embeddable,
    bool? publicDomain,
    String? textToSpeechPermission,
    Epub? epub,
    Epub? pdf,
    String? webReaderLink,
    String? accessViewStatus,
    bool? quoteSharingAllowed,
  }) =>
      AccessInfo(
        country: country ?? this.country,
        viewability: viewability ?? this.viewability,
        embeddable: embeddable ?? this.embeddable,
        publicDomain: publicDomain ?? this.publicDomain,
        textToSpeechPermission:
            textToSpeechPermission ?? this.textToSpeechPermission,
        epub: epub ?? this.epub,
        pdf: pdf ?? this.pdf,
        webReaderLink: webReaderLink ?? this.webReaderLink,
        accessViewStatus: accessViewStatus ?? this.accessViewStatus,
        quoteSharingAllowed: quoteSharingAllowed ?? this.quoteSharingAllowed,
      );

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: json["epub"] == null ? null : Epub.fromJson(json["epub"]),
        pdf: json["pdf"] == null ? null : Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub?.toJson(),
        "pdf": pdf?.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

class Epub {
  bool? isAvailable;
  String? acsTokenLink;

  Epub({
    this.isAvailable,
    this.acsTokenLink,
  });

  Epub copyWith({
    bool? isAvailable,
    String? acsTokenLink,
  }) =>
      Epub(
        isAvailable: isAvailable ?? this.isAvailable,
        acsTokenLink: acsTokenLink ?? this.acsTokenLink,
      );

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink: json["acsTokenLink"],
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink,
      };
}

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  SaleInfoListPrice? listPrice;
  SaleInfoListPrice? retailPrice;
  String? buyLink;
  List<Offer>? offers;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  SaleInfo copyWith({
    String? country,
    String? saleability,
    bool? isEbook,
    SaleInfoListPrice? listPrice,
    SaleInfoListPrice? retailPrice,
    String? buyLink,
    List<Offer>? offers,
  }) =>
      SaleInfo(
        country: country ?? this.country,
        saleability: saleability ?? this.saleability,
        isEbook: isEbook ?? this.isEbook,
        listPrice: listPrice ?? this.listPrice,
        retailPrice: retailPrice ?? this.retailPrice,
        buyLink: buyLink ?? this.buyLink,
        offers: offers ?? this.offers,
      );

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
        listPrice: json["listPrice"] == null
            ? null
            : SaleInfoListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : SaleInfoListPrice.fromJson(json["retailPrice"]),
        buyLink: json["buyLink"],
        offers: json["offers"] == null
            ? []
            : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
        "listPrice": listPrice?.toJson(),
        "retailPrice": retailPrice?.toJson(),
        "buyLink": buyLink,
        "offers": offers == null
            ? []
            : List<dynamic>.from(offers!.map((x) => x.toJson())),
      };
}

class SaleInfoListPrice {
  double? amount;
  String? currencyCode;

  SaleInfoListPrice({
    this.amount,
    this.currencyCode,
  });

  SaleInfoListPrice copyWith({
    double? amount,
    String? currencyCode,
  }) =>
      SaleInfoListPrice(
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) =>
      SaleInfoListPrice(
        amount: json["amount"]?.toDouble(),
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };
}

class Offer {
  num? finskyOfferType;
  OfferListPrice? listPrice;
  OfferListPrice? retailPrice;

  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
  });

  Offer copyWith({
    num? finskyOfferType,
    OfferListPrice? listPrice,
    OfferListPrice? retailPrice,
  }) =>
      Offer(
        finskyOfferType: finskyOfferType ?? this.finskyOfferType,
        listPrice: listPrice ?? this.listPrice,
        retailPrice: retailPrice ?? this.retailPrice,
      );

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"],
        listPrice: json["listPrice"] == null
            ? null
            : OfferListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : OfferListPrice.fromJson(json["retailPrice"]),
      );

  Map<String, dynamic> toJson() => {
        "finskyOfferType": finskyOfferType,
        "listPrice": listPrice?.toJson(),
        "retailPrice": retailPrice?.toJson(),
      };
}

class OfferListPrice {
  num? amountInMicros;
  String? currencyCode;

  OfferListPrice({
    this.amountInMicros,
    this.currencyCode,
  });

  OfferListPrice copyWith({
    num? amountInMicros,
    String? currencyCode,
  }) =>
      OfferListPrice(
        amountInMicros: amountInMicros ?? this.amountInMicros,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice(
        amountInMicros: json["amountInMicros"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amountInMicros": amountInMicros,
        "currencyCode": currencyCode,
      };
}

class SearchInfo {
  String? textSnippet;

  SearchInfo({
    this.textSnippet,
  });

  SearchInfo copyWith({
    String? textSnippet,
  }) =>
      SearchInfo(
        textSnippet: textSnippet ?? this.textSnippet,
      );

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  DateTime? publishedDate;
  String? description;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingModes? readingModes;
  num? pageCount;
  String? prnumType;
  List<String>? categories;
  num? averageRating;
  num? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.prnumType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  VolumeInfo copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    String? publisher,
    DateTime? publishedDate,
    String? description,
    List<IndustryIdentifier>? industryIdentifiers,
    ReadingModes? readingModes,
    num? pageCount,
    String? prnumType,
    List<String>? categories,
    num? averageRating,
    num? ratingsCount,
    String? maturityRating,
    bool? allowAnonLogging,
    String? contentVersion,
    PanelizationSummary? panelizationSummary,
    ImageLinks? imageLinks,
    String? language,
    String? previewLink,
    String? infoLink,
    String? canonicalVolumeLink,
  }) =>
      VolumeInfo(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        authors: authors ?? this.authors,
        publisher: publisher ?? this.publisher,
        publishedDate: publishedDate ?? this.publishedDate,
        description: description ?? this.description,
        industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
        readingModes: readingModes ?? this.readingModes,
        pageCount: pageCount ?? this.pageCount,
        prnumType: prnumType ?? this.prnumType,
        categories: categories ?? this.categories,
        averageRating: averageRating ?? this.averageRating,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        maturityRating: maturityRating ?? this.maturityRating,
        allowAnonLogging: allowAnonLogging ?? this.allowAnonLogging,
        contentVersion: contentVersion ?? this.contentVersion,
        panelizationSummary: panelizationSummary ?? this.panelizationSummary,
        imageLinks: imageLinks ?? this.imageLinks,
        language: language ?? this.language,
        previewLink: previewLink ?? this.previewLink,
        infoLink: infoLink ?? this.infoLink,
        canonicalVolumeLink: canonicalVolumeLink ?? this.canonicalVolumeLink,
      );

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"] == null
            ? []
            : List<String>.from(json["authors"]!.map((x) => x)),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"] == null
            ? null
            : DateTime.parse(json["publishedDate"]),
        description: json["description"],
        industryIdentifiers: json["industryIdentifiers"] == null
            ? []
            : List<IndustryIdentifier>.from(json["industryIdentifiers"]!
                .map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: json["readingModes"] == null
            ? null
            : ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"],
        prnumType: json["prnumType"],
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        averageRating: json["averageRating"],
        ratingsCount: json["ratingsCount"],
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null
            ? null
            : PanelizationSummary.fromJson(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null
            ? null
            : ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "authors":
            authors == null ? [] : List<dynamic>.from(authors!.map((x) => x)),
        "publisher": publisher,
        "publishedDate":
            "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
        "description": description,
        "industryIdentifiers": industryIdentifiers == null
            ? []
            : List<dynamic>.from(industryIdentifiers!.map((x) => x.toJson())),
        "readingModes": readingModes?.toJson(),
        "pageCount": pageCount,
        "prnumType": prnumType,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary?.toJson(),
        "imageLinks": imageLinks?.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  ImageLinks copyWith({
    String? smallThumbnail,
    String? thumbnail,
  }) =>
      ImageLinks(
        smallThumbnail: smallThumbnail ?? this.smallThumbnail,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class IndustryIdentifier {
  String? type;
  String? identifier;

  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  IndustryIdentifier copyWith({
    String? type,
    String? identifier,
  }) =>
      IndustryIdentifier(
        type: type ?? this.type,
        identifier: identifier ?? this.identifier,
      );

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
      };
}

class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  PanelizationSummary copyWith({
    bool? containsEpubBubbles,
    bool? containsImageBubbles,
  }) =>
      PanelizationSummary(
        containsEpubBubbles: containsEpubBubbles ?? this.containsEpubBubbles,
        containsImageBubbles: containsImageBubbles ?? this.containsImageBubbles,
      );

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({
    this.text,
    this.image,
  });

  ReadingModes copyWith({
    bool? text,
    bool? image,
  }) =>
      ReadingModes(
        text: text ?? this.text,
        image: image ?? this.image,
      );

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
}
