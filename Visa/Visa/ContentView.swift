import SwiftUI

struct ContentView: View {
    @State private var animateText = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Image("groc")
                        .resizable()
                        .scaledToFill()
                        .frame(height: geometry.size.height * 0.8)
                        .clipped()
                        .cornerRadius(20)
                        .padding()
                        .shadow(radius: 10)
                    
                    VStack {
                        ZStack {
                            Text("Bringing fresh groceries to your community.")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                                .opacity(animateText ? 0 : 1)
                                .offset(x: geometry.size.width + textWidth(for: "Bringing fresh groceries to your community.") / 2, y: 20)
                                .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: false), value: animateText)
                            
                            Text("Bringing fresh groceries to your community.")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                                .opacity(animateText ? 1 : 0)
                                .offset(y: 20)
                                .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: false), value: animateText)
                        }
                        .onAppear {
                            animateText = true
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: MapView()) {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(height: geometry.size.height * 0.2)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.horizontal)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemGray6), Color.white]), startPoint: .top, endPoint: .bottom)
                )
                .edgesIgnoringSafeArea(.all)
            }
        }
    }

    func textWidth(for text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
