import Foundation

class SubwayService {
    static let shared = SubwayService()
    private init() {}

    private let apiKey = "YOUR_API_KEY" // API 키를 여기에 입력하세요

    func fetchArrivalInfo(for station: String, completion: @escaping ([ArrivalInfo]) -> Void) {
        let encoded = station.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? station
        let urlString = "https://swopenAPI.seoul.go.kr/api/subway/\(apiKey)/json/realtimeStationArrival/0/2/\(encoded)"
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion([])
                return
            }
            do {
                let response = try JSONDecoder().decode(ArrivalResponse.self, from: data)
                let infos = response.realtimeArrivalList.map { ArrivalInfo.from($0) }
                completion(infos)
            } catch {
                completion([])
            }
        }
        task.resume()
    }
}
