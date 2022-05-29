import Foundation

class Word {
    var id: Int
    var word: String
    var translation: String
    
    init(id: Int, word: String, translation: String)
    {
        self.id = id
        self.word = word
        self.translation = translation
    }
}
