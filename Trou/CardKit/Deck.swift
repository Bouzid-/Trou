import Darwin

extension CollectionType {
  /// Returns a shuffled array
  public func shuffled() -> [Generator.Element] {
    var array = Array(self)
    array.shuffle()
    return array
  }

    public func distribute(num: Int) -> [[Generator.Element]] {
        var array = Array(self)
        var list = Array<Array<Generator.Element>>()
        let count = array.count
        let cardsPerPlayer = count / num
        for i in 0 ..< num {
            let part: Array<Generator.Element> = Array(array[i*cardsPerPlayer ..< (i+1) * cardsPerPlayer])
            list.append(part)
        }
        return list
    }
}


extension MutableCollectionType where Index == Int {
  /// Shuffle elements in-place
  mutating public func shuffle() {
    for index in 0 ..< (count - 1) {
      let newIndex = Int(arc4random_uniform(UInt32(count - index))) + index

      if newIndex != index {
        swap(&self[index], &self[newIndex])
      }
    }
  }
}
