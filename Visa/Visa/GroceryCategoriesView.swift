import SwiftUI

struct GroceryCategoriesView: View {
    let localPartnerName: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome to \(localPartnerName)'s Grocery Store")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                Text("Shop by Category")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 20) {
                    ForEach(["Dals & Pulses", "Fruits", "Vegetables", "Oils", "Dry Fruits", "Flour"], id: \.self) { category in
                        CategoryButton(category: category, imageName: categoryImageName(for: category))
                    }
                }
                .padding(.horizontal)
                
                Text("Organic Fruits")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(["Apple", "Banana", "Orange", "Strawberry", "Grapes", "Mango"], id: \.self) { fruit in
                            FruitButton(fruit: fruit, imageName: fruitImageName(for: fruit))
                        }
                    }
                    .padding(.horizontal)
                }
                
                Text("Shop by Brand")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 20) {
                    ForEach(["Brand A", "Brand B", "Brand C", "Brand D", "Brand E", "Brand F"], id: \.self) { brand in
                        BrandButton(brand: brand, imageName: brandImageName(for: brand))
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Grocery Categories")
        .background(Color(UIColor.systemGroupedBackground))
    }
}

struct CategoryButton: View {
    let category: String
    let imageName: String

    var body: some View {
        NavigationLink(destination: ProductDetailView(productName: category)) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Text(category)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 5)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 100)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
}

struct FruitButton: View {
    let fruit: String
    let imageName: String

    var body: some View {
        NavigationLink(destination: ProductDetailView(productName: fruit)) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Text(fruit)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 5)
            }
            .padding()
            .frame(width: 100, height: 100)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
}

struct BrandButton: View {
    let brand: String
    let imageName: String

    var body: some View {
        NavigationLink(destination: ProductDetailView(productName: brand)) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Text(brand)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 5)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 100)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
}

func categoryImageName(for category: String) -> String {
    switch category {
    case "Dals & Pulses":
        return "dals_pulses_image"  // Custom image name
    case "Fruits":
        return "fruits_image"  // Custom image name
    case "Vegetables":
        return "vegetables_image"  // Custom image name
    case "Oils":
        return "oils_image"  // Custom image name
    case "Dry Fruits":
        return "dry_fruits_image"  // Custom image name
    case "Flour":
        return "flour_image"  // Custom image name
    default:
        return "placeholder_image"  // Placeholder image name
    }
}

func fruitImageName(for fruit: String) -> String {
    switch fruit {
    case "Apple":
        return "apple_image"  // Custom image name
    case "Banana":
        return "banana_image"  // Custom image name
    case "Orange":
        return "orange_image"  // Custom image name
    case "Strawberry":
        return "strawberry_image"  // Custom image name
    case "Grapes":
        return "grapes_image"  // Custom image name
    case "Mango":
        return "mango_image"  // Custom image name
    default:
        return "placeholder_image"  // Placeholder image name
    }
}

func brandImageName(for brand: String) -> String {
    switch brand {
    case "groc":
        return "brand_a_image"  // Custom image name
    case "Brand B":
        return "brand_b_image"  // Custom image name
    case "Brand C":
        return "brand_c_image"  // Custom image name
    case "Brand D":
        return "brand_d_image"  // Custom image name
    case "Brand E":
        return "brand_e_image"  // Custom image name
    case "Brand F":
        return "brand_f_image"  // Custom image name
    default:
        return "placeholder_image"  // Placeholder image name
    }
}

struct GroceryCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryCategoriesView(localPartnerName: "Local Partner")
    }
}
