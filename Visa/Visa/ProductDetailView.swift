import SwiftUI

struct ProductDetailView: View {
    let productName: String
    @State private var quantity: Int = 1
    @State private var cart: [CartItem] = []

    var body: some View {
        VStack {
            Text(productName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                .padding()

            Button(action: {
                let item = CartItem(name: productName, quantity: quantity, price: 5.0) // Set appropriate price
                cart.append(item)
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom, 20)

            NavigationLink(destination: CartView(cart: $cart)) {
                Text("View Cart")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal)
                }
                }
                .navigationTitle(productName)
                }
                }

                struct CartItem: Identifiable {
                let id = UUID()
                let name: String
                let quantity: Int
                let price: Double
                }

                struct ProductDetailView_Previews: PreviewProvider {
                static var previews: some View {
                ProductDetailView(productName: "Sample Product")
                }
                }


