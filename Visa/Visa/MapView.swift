import SwiftUI
import CoreLocation
import MapKit

struct MapView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @State private var searchText = ""
    @State private var isSearching = false

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    if isSearching {
                        SearchBar(text: $searchText, isSearching: $isSearching, region: $region)
                    } else {
                        Button(action: {
                            isSearching = true
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                }
            }

            Button("Continue") {
                // Handle continue action
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
            .padding()
        }
        .onAppear {
            locationManager.startUpdatingLocation()
        }
    }
}
