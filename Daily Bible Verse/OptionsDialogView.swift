import SwiftUI

struct OptionsDialogView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                // Handle the action for Option 1
            }) {
                HStack {
                    Image(systemName: "option1Icon")
                    Text("Option 1")
                }
            }
            
            Divider()
            
            Button(action: {
                // Handle the action for Option 2
            }) {
                HStack {
                    Image(systemName: "option2Icon")
                    Text("Option 2")
                }
            }
            
            Divider()
            
            // Add more buttons for additional options as needed
            
            Spacer()
            
            Button(action: {
                isPresented = false
            }) {
                HStack {
                    Image(systemName: "chevron.down")
                    Text("") // Empty Text for spacing
                }
                .foregroundColor(.blue)
            }
        }
        .padding()
    }
}
