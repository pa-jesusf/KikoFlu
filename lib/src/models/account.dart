import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final int? id;
  final String username;
  final String password;
  final String host;
  final bool isActive;
  final bool isGuestConnect;
  final String? serverCookie;
  final DateTime? createdAt;
  final DateTime? lastUsedAt;

  const Account({
    this.id,
    required this.username,
    required this.password,
    required this.host,
    this.isActive = false,
    this.isGuestConnect = false,
    this.serverCookie,
    this.createdAt,
    this.lastUsedAt,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as int?,
      username: map['username'] as String,
      password: map['password'] as String,
      host: map['host'] as String,
      isActive: (map['isActive'] as int) == 1,
      isGuestConnect: (map['isGuestConnect'] as int? ?? 0) == 1,
      serverCookie: map['serverCookie'] as String?,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'] as String)
          : null,
      lastUsedAt: map['lastUsedAt'] != null
          ? DateTime.parse(map['lastUsedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'host': host,
      'isActive': isActive ? 1 : 0,
      'isGuestConnect': isGuestConnect ? 1 : 0,
      'serverCookie': serverCookie,
      'createdAt': createdAt?.toIso8601String(),
      'lastUsedAt': lastUsedAt?.toIso8601String(),
    };
  }

  Account copyWith({
    int? id,
    String? username,
    String? password,
    String? host,
    bool? isActive,
    bool? isGuestConnect,
    String? serverCookie,
    DateTime? createdAt,
    DateTime? lastUsedAt,
  }) {
    return Account(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      host: host ?? this.host,
      isActive: isActive ?? this.isActive,
      isGuestConnect: isGuestConnect ?? this.isGuestConnect,
      serverCookie: serverCookie ?? this.serverCookie,
      createdAt: createdAt ?? this.createdAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        username,
        password,
        host,
        isActive,
        isGuestConnect,
        serverCookie,
        createdAt,
        lastUsedAt,
      ];

  @override
  String toString() =>
      'Account(id: $id, username: $username, host: $host, isActive: $isActive, isGuestConnect: $isGuestConnect, serverCookie: $serverCookie)';
}
