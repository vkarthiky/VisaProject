import SwiftUI

struct CartView: View {
    @Binding var cart: [CartItem]

    var body: some View {
        VStack {
            List(cart) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("x\(item.quantity)")
                    Spacer()
                    Text("$\(item.price * Double(item.quantity), specifier: "%.2f")")
                }
            }

            Text("Total: $\(totalPrice(), specifier: "%.2f")")
                .font(.title)
                .fontWeight(.bold)
                .padding()

        Button(action: {
            // Handle checkout process here
        }) {
            Text("Checkout")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
    .navigationTitle("Cart")
}

func totalPrice() -> Double {
    cart.reduce(0) { $0 + $1.price * Double($1.quantity) }
}
}

struct CartView_Previews: PreviewProvider {
static var previews: some View {
    CartView(cart: .constant([CartItem(name: "Sample Product", quantity: 1, price: 5.0)]))
}
}

