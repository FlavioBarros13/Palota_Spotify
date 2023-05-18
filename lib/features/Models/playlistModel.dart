class PlaylistModel {
  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  Followers? followers;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  Owner? owner;
  bool? public;
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  PlaylistModel({this.collaborative, this.description, this.externalUrls, this.followers, this.href, this.id, this.images, this.name, this.owner, this.public, this.snapshotId, this.tracks, this.type, this.uri});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collaborative'] = collaborative;
    data['description'] = description;
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    if (followers != null) {
      data['followers'] = followers!.toJson();
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
      'followers': this.followers,
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

  factory PlaylistModel.fromMap(Map<dynamic, dynamic> map) {
    return PlaylistModel(
      collaborative: map['collaborative'] ,
      description: map['description'],
      externalUrls: map['externalUrls'] ,
      followers: map['followers'],
      href: map['href'],
      id: map['id'] ,
      images: map['images'],
      name: map['name'],
      owner: map['owner'],
      public: map['public'],
      snapshotId: map['snapshotId'],
      tracks: map['tracks'],
      type: map['type'] ,
      uri: map['uri'] ,
    );
  }
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

  Map<String, dynamic> toMap() {
    return {
      'spotify': this.spotify,
    };
  }

  factory ExternalUrls.fromMap(Map<String, dynamic> map) {
    return ExternalUrls(
      spotify: map['spotify'] as String,
    );
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

  Map<String, dynamic> toMap() {
    return {
      'href': this.href,
      'total': this.total,
    };
  }

  factory Followers.fromMap(Map<String, dynamic> map) {
    return Followers(
      href: map['href'] as String,
      total: map['total'] as int,
    );
  }
}

class Images {
  String? url;
  int? height;
  int? width;

  Images({this.url, this.height, this.width});



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

  Map<String, dynamic> toMap() {
    return {
      'url': this.url,
      'height': this.height,
      'width': this.width,
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      url: map['url'] as String,
      height: map['height'] as int,
      width: map['width'] as int,
    );
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

  Owner({this.externalUrls, this.followers, this.href, this.id, this.type, this.uri, this.displayName});

  Owner.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    followers = json['followers'] != null ? Followers.fromJson(json['followers']) : null;
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

class Tracks {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<Items>? items;

  Tracks({this.href, this.limit, this.next, this.offset, this.previous, this.total, this.items});


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

  factory Tracks.fromMap(Map<String, dynamic> map) {
    return Tracks(
      href: map['href'] as String,
      limit: map['limit'] as int,
      next: map['next'] as String,
      offset: map['offset'] as int,
      previous: map['previous'] as String,
      total: map['total'] as int,
      items: map['items'] as List<Items>,
    );
  }
}

class Items {
  String? addedAt;
  AddedBy? addedBy;
  bool? isLocal;
  Track? track;

  Items({this.addedAt, this.addedBy, this.isLocal, this.track});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['added_at'] = addedAt;
    if (addedBy != null) {
      data['added_by'] = addedBy!.toJson();
    }
    data['is_local'] = isLocal;
    if (track != null) {
      data['track'] = track!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'addedAt': this.addedAt,
      'addedBy': this.addedBy,
      'isLocal': this.isLocal,
      'track': this.track,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      addedAt: map['addedAt'] as String,
      addedBy: map['addedBy'] as AddedBy,
      isLocal: map['isLocal'] as bool,
      track: map['track'] as Track,
    );
  }
}

class AddedBy {
  ExternalUrls? externalUrls;
  Followers? followers;
  String? href;
  String? id;
  String? type;
  String? uri;

  AddedBy({this.externalUrls, this.followers, this.href, this.id, this.type, this.uri});

  AddedBy.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    followers = json['followers'] != null ? Followers.fromJson(json['followers']) : null;
    href = json['href'];
    id = json['id'];
    type = json['type'];
    uri = json['uri'];
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
    return data;
  }
}

class Track {
  Album? album;
  List<Artists>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isPlayable;
  LinkedFrom? linkedFrom;
  Restrictions? restrictions;
  String? name;
  int? popularity;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;
  bool? isLocal;


  Track.name();

  Track({this.album, this.artists, this.availableMarkets, this.discNumber, this.durationMs, this.explicit, this.externalIds, this.externalUrls, this.href, this.id, this.isPlayable, this.linkedFrom, this.restrictions, this.name, this.popularity, this.previewUrl, this.trackNumber, this.type, this.uri, this.isLocal});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (album != null) {
      data['album'] = album!.toJson();
    }
    if (artists != null) {
      data['artists'] = artists!.map((v) => v.toJson()).toList();
    }
    data['available_markets'] = availableMarkets;
    data['disc_number'] = discNumber;
    data['duration_ms'] = durationMs;
    data['explicit'] = explicit;
    if (externalIds != null) {
      data['external_ids'] = externalIds!.toJson();
    }
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    data['href'] = href;
    data['id'] = id;
    data['is_playable'] = isPlayable;
    if (linkedFrom != null) {
      data['linked_from'] = linkedFrom!.toJson();
    }
    if (restrictions != null) {
      data['restrictions'] = restrictions!.toJson();
    }
    data['name'] = name;
    data['popularity'] = popularity;
    data['preview_url'] = previewUrl;
    data['track_number'] = trackNumber;
    data['type'] = type;
    data['uri'] = uri;
    data['is_local'] = isLocal;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'album': this.album,
      'artists': this.artists,
      'availableMarkets': this.availableMarkets,
      'discNumber': this.discNumber,
      'durationMs': this.durationMs,
      'explicit': this.explicit,
      'externalIds': this.externalIds,
      'externalUrls': this.externalUrls,
      'href': this.href,
      'id': this.id,
      'isPlayable': this.isPlayable,
      'linkedFrom': this.linkedFrom,
      'restrictions': this.restrictions,
      'name': this.name,
      'popularity': this.popularity,
      'previewUrl': this.previewUrl,
      'trackNumber': this.trackNumber,
      'type': this.type,
      'uri': this.uri,
      'isLocal': this.isLocal,
    };
  }

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      album: map['album'] as Album,
      artists: map['artists'] as List<Artists>,
      availableMarkets: map['availableMarkets'] as List<String>,
      discNumber: map['discNumber'] as int,
      durationMs: map['durationMs'] as int,
      explicit: map['explicit'] as bool,
      externalIds: map['externalIds'] as ExternalIds,
      externalUrls: map['externalUrls'] as ExternalUrls,
      href: map['href'] as String,
      id: map['id'] as String,
      isPlayable: map['isPlayable'] as bool,
      linkedFrom: map['linkedFrom'] as LinkedFrom,
      restrictions: map['restrictions'] as Restrictions,
      name: map['name'] as String,
      popularity: map['popularity'] as int,
      previewUrl: map['previewUrl'] as String,
      trackNumber: map['trackNumber'] as int,
      type: map['type'] as String,
      uri: map['uri'] as String,
      isLocal: map['isLocal'] as bool,
    );
  }
}

class Album {
  String? albumType;
  int? totalTracks;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  Restrictions? restrictions;
  String? type;
  String? uri;
  List<Copyrights>? copyrights;
  ExternalIds? externalIds;
  List<String>? genres;
  String? label;
  int? popularity;
  String? albumGroup;
  List<Artists>? artists;

  Album({this.albumType, this.totalTracks, this.availableMarkets, this.externalUrls, this.href, this.id, this.images, this.name, this.releaseDate, this.releaseDatePrecision, this.restrictions, this.type, this.uri, this.copyrights, this.externalIds, this.genres, this.label, this.popularity, this.albumGroup, this.artists});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['album_type'] = albumType;
    data['total_tracks'] = totalTracks;
    data['available_markets'] = availableMarkets;
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    data['href'] = href;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['release_date'] = releaseDate;
    data['release_date_precision'] = releaseDatePrecision;
    if (restrictions != null) {
      data['restrictions'] = restrictions!.toJson();
    }
    data['type'] = type;
    data['uri'] = uri;
    if (copyrights != null) {
      data['copyrights'] = copyrights!.map((v) => v.toJson()).toList();
    }
    if (externalIds != null) {
      data['external_ids'] = externalIds!.toJson();
    }
    data['genres'] = genres;
    data['label'] = label;
    data['popularity'] = popularity;
    data['album_group'] = albumGroup;
    if (artists != null) {
      data['artists'] = artists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restrictions {
  String? reason;

  Restrictions({this.reason});

  Restrictions.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reason'] = reason;
    return data;
  }
}

class Copyrights {
  String? text;
  String? type;

  Copyrights({this.text, this.type});

  Copyrights.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['type'] = type;
    return data;
  }
}

class ExternalIds {
  String? isrc;
  String? ean;
  String? upc;

  ExternalIds({this.isrc, this.ean, this.upc});

  ExternalIds.fromJson(Map<String, dynamic> json) {
    isrc = json['isrc'];
    ean = json['ean'];
    upc = json['upc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isrc'] = isrc;
    data['ean'] = ean;
    data['upc'] = upc;
    return data;
  }
}

class Artists1 {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artists1({this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  Artists1.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    data['href'] = href;
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['uri'] = uri;
    return data;
  }
}

class Artists {
  ExternalUrls? externalUrls;
  Followers? followers;
  List<String>? genres;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  int? popularity;
  String? type;
  String? uri;

  Artists({this.externalUrls, this.followers, this.genres, this.href, this.id, this.images, this.name, this.popularity, this.type, this.uri});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    if (followers != null) {
      data['followers'] = followers!.toJson();
    }
    data['genres'] = genres;
    data['href'] = href;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['popularity'] = popularity;
    data['type'] = type;
    data['uri'] = uri;
    return data;
  }
}

class LinkedFrom {


  LinkedFrom();

LinkedFrom.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
return data;
}
}
