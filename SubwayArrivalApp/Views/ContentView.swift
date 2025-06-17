import SwiftUI

struct ContentView: View {
    @State private var arrivals: [ArrivalInfo] = []
    @AppStorage("stationName") private var stationName: String = "서울역"
    @AppStorage("direction") private var direction: String = "상행"

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(stationName) \(direction) 열차 도착 정보")
                    .font(.headline)
                    .padding()

                List(arrivals) { info in
                    VStack(alignment: .leading) {
                        Text(info.trainLineName)
                            .font(.subheadline)
                        Text(info.arrivalMessage)
                            .font(.caption)
                    }
                }
                .onAppear(perform: loadArrivals)
            }
            .navigationBarTitle("실시간 도착", displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink("설정", destination: SettingsView(onSave: loadArrivals))
            )
        }
    }

    private func loadArrivals() {
        SubwayService.shared.fetchArrivalInfo(for: stationName) { infos in
            DispatchQueue.main.async {
                self.arrivals = Array(infos.prefix(2))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
