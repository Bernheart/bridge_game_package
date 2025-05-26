enum Room {
  open('open'),
  closed('closed');

  final String name;

  const Room(this.name);

  factory Room.fromString(String name) {
    switch (name.toLowerCase()) {
      case 'open':
      case 'o':
        return Room.open;
      case 'closed':
      case 'c':
        return Room.closed;
      default:
        throw ArgumentError('Unknown room: $name');
    }
  }
}
