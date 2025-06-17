import Foundation

struct ArrivalInfo: Identifiable, Decodable {
    let id = UUID()
    let trainLineName: String
    let arrivalMessage: String
}

struct ArrivalResponse: Decodable {
    let realtimeArrivalList: [ArrivalItem]
}

struct ArrivalItem: Decodable {
    let trainLineNm: String
    let arvlMsg2: String
}

extension ArrivalInfo {
    static func from(_ item: ArrivalItem) -> ArrivalInfo {
        return ArrivalInfo(trainLineName: item.trainLineNm, arrivalMessage: item.arvlMsg2)
    }
}
