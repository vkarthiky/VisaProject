import SwiftUI

struct GroceryCategoriesView: View {
    let localPartnerName: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Welcome to \(localPartnerName)'s Grocery Store")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                Text("Shop by Category")
                    .font(.headline)
                    .padding(.horizontal)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(["Dals & Pulses", "Fruits", "Vegetables", "Oils", "Dry Fruits", "Flour"], id: \.self) { category in
                        CategoryButton(category: category)
                    }
                }
                .padding(.horizontal)
                
                Text("Organic Fruits")
                    .font(.headline)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(["Apple", "Banana", "Orange", "Strawberry", "Grapes", "Mango"], id: \.self) { fruit in
                            FruitButton(fruit: fruit)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Text("Shop by Brand")
                    .font(.headline)
                    .padding(.horizontal)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(["Brand A", "Brand B", "Brand C", "Brand D", "Brand E", "Brand F"], id: \.self) { brand in
                        BrandButton(brand: brand)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Grocery Categories")
    }
}

struct CategoryButton: View {
    let category: String

    var body: some View {
        NavigationLink(destination: ProductDetailView(productName: category)) {
            Text(category)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal, 4)
        }
    }
}

struct FruitButton: View {
    let fruit: String

    var body: some View {
        NavigationLink(destination: ProductDetailView(productName: fruit)) {
            Text(fruit)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 100)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal, 4)
        }
    }
}

struct BrandButton: View {
    let brand: String

    var body: some View {
        NavigationLink(destination: ProductDetailView(productName: brand)) {
            Text(brand)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .cornerRadius(10)
                .padding(.horizontal, 4)
        }
    }
}

struct GroceryCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryCategoriesView(localPartnerName: "Local Partner")
    }
}
