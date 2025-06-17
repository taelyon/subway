import Foundation

struct Station: Identifiable, Codable {
    let id = UUID()
    var name: String
    var direction: String
}
