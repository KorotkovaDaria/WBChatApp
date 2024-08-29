import Foundation
import UIKit

class NetworkManager {
    func loadPicture(httpCode: Int, completion: @escaping (UIImage?) -> Void) {
        let urlString = "https://http.cat/\(httpCode)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to load image: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("No data or unable to create image")
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}
