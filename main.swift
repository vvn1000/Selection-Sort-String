var unsortedArray: [String] = []

var a: Int

func swap(words: inout[String], firstIndex: Int, secondIndex: Int) {
    let temp = words[firstIndex]
    words[firstIndex] = words[secondIndex]
    words[secondIndex] = temp
}

func wordOneGreater(word1: String, word2: String) -> Bool {
    let shorterWordLength = min(word1.count, word2.count)
    for k in 0..<shorterWordLength {
        let char2 = word2[word2.index(word2.startIndex, offsetBy: k)]
        let char1 = word1[word1.index(word1.startIndex, offsetBy: k)]
        if char2 > char1 {
            return false
        } else if char2 < char1 {
            return true
        } else if k == (shorterWordLength - 1) {
            if word1.count > word2.count {
                return true
            }
        }
    }
    return false
}

func selectionSort() {
    for i in 0..<unsortedArray.count - 1 {
        var j = i
        var least = unsortedArray[i]
        for k in i..<unsortedArray.count {
            if !wordOneGreater(word1: unsortedArray[k], word2: least) {
                least = unsortedArray[k]
                j = k
            }
        }
        if !wordOneGreater(word1: unsortedArray[j], word2: unsortedArray[i]) {
            swap(words:&unsortedArray, firstIndex:j, secondIndex:i)
        }
    }
}
    
while let input = readLine() {
    unsortedArray.append(input.lowercased())
}

selectionSort()

a = 0

while a < unsortedArray.count {
    print("\(a + 1). \(unsortedArray[a])")
    a += 1
}
