import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("stationName") private var stationName: String = "서울역"
    @AppStorage("direction") private var direction: String = "상행"

    var onSave: (() -> Void)?

    @State private var tempStation: String = ""
    @State private var tempDirection: String = "상행"

    var body: some View {
        Form {
            Section(header: Text("지하철역")) {
                TextField("역 이름", text: $tempStation)
            }
            Section(header: Text("방향")) {
                Picker("방향", selection: $tempDirection) {
                    Text("상행").tag("상행")
                    Text("하행").tag("하행")
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Button("저장") {
                stationName = tempStation
                direction = tempDirection
                onSave?()
                presentationMode.wrappedValue.dismiss()
            }
        }
        .onAppear {
            tempStation = stationName
            tempDirection = direction
        }
        .navigationBarTitle("설정", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
