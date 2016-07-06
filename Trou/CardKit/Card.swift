import SpriteKit

class Card: SKSpriteNode {

    let frontTexture: SKTexture
    let backTexture: SKTexture
    var faceUp = true
    var enlarged = false
    var savedPosition = CGPoint.zero

    let suit: Suit
    let value: Value

    override var hashValue: Int {
        return suit.hashValue ^ value.hashValue
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(suit: Suit, value: Value) {
        self.suit = suit
        self.value = value

        backTexture = SKTexture(imageNamed: "card_back")

        let textureName = value.description + "-d-" + suit.description + ".png"
        frontTexture = SKTexture(imageNamed: textureName)
        super.init(texture: frontTexture, color: .clearColor(), size: frontTexture.size())
    }

  /// Returns all possible cards
    static func all() -> [Card] {
    return Suit.all.reduce([]) { accumulator, suit in
      accumulator + Value.all.map {
        Card(suit: suit, value: $0)
      }
    }
  }



    func flip() {
        let firstHalfFlip = SKAction.scaleXTo(0.0, duration: 0.4)
        let secondHalfFlip = SKAction.scaleXTo(1.0, duration: 0.4)

        setScale(1.0)

        if faceUp {
            runAction(firstHalfFlip) {
                self.texture = self.backTexture

                self.runAction(secondHalfFlip)
            }
        } else {
            runAction(firstHalfFlip) {
                self.texture = self.frontTexture

                self.runAction(secondHalfFlip)
            }
        }
        faceUp = !faceUp
    }
}
