import Foundation

class Word {
    let id: Int
    let word: String
    let picture: String
    let translation: String
    
    init(id: Int, word: String, picture: String, translation: String)
    {
        self.id = id
        self.word = word
        self.picture = picture
        self.translation = translation
    }
}
