public enum Value {
  case Ace
  case Dos
  case Trace
  case Quatro
  case Cinco
  case Seis
  case Siete
  case Sota
  case Caball
  case Rey


  /// Returns all possible values
  static var all: [Value] {
    return [
      .Ace, .Dos, .Trace, .Quatro, .Cinco, .Seis, .Siete, .Sota, .Caball, .Rey,
    ]
  }
}

extension Value : CustomStringConvertible {
  public var description: String {
    switch self {
    case Ace:
      return "1"
    case Dos:
      return "2"
    case .Trace:
      return "3"
    case .Quatro:
      return "4"
    case .Cinco:
      return "5"
    case .Seis:
      return "6"
    case .Siete:
      return "7"
    case .Sota:
      return "10"
    case .Caball:
      return "11"
    case .Rey:
      return "12"
    }
  }
}
