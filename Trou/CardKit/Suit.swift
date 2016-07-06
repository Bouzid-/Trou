public enum Suit {
  case Sife
  case Dheb
  case Zrawet
  case Cobas

  /// Returns all possible suits
  static var all: [Suit] {
    return [.Sife, .Dheb, .Zrawet, .Cobas]
  }
}

extension Suit : CustomStringConvertible {
  public var description: String {
    switch self {
    case Sife:
      return "Sife"
    case Dheb:
      return "Dheb"
    case Zrawet:
      return "Zrawet"
    case Cobas:
      return "Cobas"
    }
  }
}
