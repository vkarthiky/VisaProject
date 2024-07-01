import SwiftUI
import MapKit

struct SearchBar: View {
    @Binding var text: String
    @Binding var isSearching: Bool
    @Binding var region: MKCoordinateRegion

    var body: some View {
        HStack {
            TextField("Search for an address", text: $text, onCommit: {
                isSearching = false
                searchForAddress()
            })
            .padding(.horizontal)
            .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Cancel") {
                isSearching = false
            }
            .padding(.trailing)
        }
        .background(Color.white)
        .padding(.top)
    }

    func searchForAddress() {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard let response = response, let mapItem = response.mapItems.first else { return }
            let placemark = mapItem.placemark
            region = MKCoordinateRegion(center: placemark.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
    }
}
