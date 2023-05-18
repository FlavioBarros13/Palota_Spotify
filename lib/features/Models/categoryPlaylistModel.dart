class CategoryPlaylistModel {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<dynamic>? items;

  CategoryPlaylistModel(
      {this.href,
        this.limit,
        this.next,
        this.offset,
        this.previous,
        this.total,
        this.items});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['limit'] = limit;
    data['next'] = next;
    data['offset'] = offset;
    data['previous'] = previous;
    data['total'] = total;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'href': this.href,
      'limit': this.limit,
      'next': this.next,
      'offset': this.offset,
      'previous': this.previous,
      'total': this.total,
      'items': this.items,
    };
  }

  factory CategoryPlaylistModel.fromMap(Map<String, dynamic> map) {
    return CategoryPlaylistModel(
      href: map['href'] ,
      limit: map['limit'] ,
      next: map['next'] ,
      offset: map['offset'] ,
      previous: map['previous'] ,
      total: map['total'] ,
      items: map['items'] ,
    );
  }
}

class Items {
  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  Owner? owner;
  bool? public;
  String? snapshotId;
  Followers? tracks;
  String? type;
  String? uri;






  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collaborative'] = collaborative;
    data['description'] = description;
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    data['href'] = href;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['public'] = public;
    data['snapshot_id'] = snapshotId;
    if (tracks != null) {
      data['tracks'] = tracks!.toJson();
    }
    data['type'] = type;
    data['uri'] = uri;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'collaborative': this.collaborative,
      'description': this.description,
      'externalUrls': this.externalUrls,
      'href': this.href,
      'id': this.id,
      'images': this.images,
      'name': this.name,
      'owner': this.owner,
      'public': this.public,
      'snapshotId': this.snapshotId,
      'tracks': this.tracks,
      'type': this.type,
      'uri': this.uri,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      collaborative: map['collaborative'] as bool,
      description: map['description'] as String,
      externalUrls: map['externalUrls'] as ExternalUrls,
      href: map['href'] as String,
      id: map['id'] as String,
      images: map['images'] as List<Images>,
      name: map['name'] as String,
      owner: map['owner'] as Owner,
      public: map['public'] as bool,
      snapshotId: map['snapshotId'] as String,
      tracks: map['tracks'] as Followers,
      type: map['type'] as String,
      uri: map['uri'] as String,
    );
  }

  Items({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spotify'] = spotify;
    return data;
  }
}

class Images {
  String? url;
  int? height;
  int? width;

  Images({this.url, this.height, this.width});
  Images.name();

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}

class Owner {
  ExternalUrls? externalUrls;
  Followers? followers;
  String? href;
  String? id;
  String? type;
  String? uri;
  String? displayName;

  Owner(
      {this.externalUrls,
        this.followers,
        this.href,
        this.id,
        this.type,
        this.uri,
        this.displayName});

  Owner.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    followers = json['followers'] != null
        ? Followers.fromJson(json['followers'])
        : null;
    href = json['href'];
    id = json['id'];
    type = json['type'];
    uri = json['uri'];
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    if (followers != null) {
      data['followers'] = followers!.toJson();
    }
    data['href'] = href;
    data['id'] = id;
    data['type'] = type;
    data['uri'] = uri;
    data['display_name'] = displayName;
    return data;
  }
}

class Followers {
  String? href;
  int? total;

  Followers({this.href, this.total});

  Followers.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['total'] = total;
    return data;
  }
}
