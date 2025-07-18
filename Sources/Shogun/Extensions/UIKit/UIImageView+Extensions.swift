//
//  UIImageView+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

#if canImport(UIKit)
import UIKit


extension UIImageView {
    
    /// Asyncronously load the image for the current image view.
    ///
    /// - Parameters:
    ///   - url:            Image of URL to load.
    ///   - placeholder:    Placeholder image to show during the loading or if no image is retrieved.
    ///   - onFailure:      Callback called in case of image download failure.
    public func loadImage(
        with url: URL,
        placeholder: UIImage? = nil,
        onFailure: (() -> Void)? = nil
    ) {
        let request = URLRequest(url: url)
        loadImage(with: request, placeholder: placeholder, onFailure: onFailure)
    }
    
    /// Asyncronously load the image for the current image view.
    /// This method allows to pass an existing request,
    /// this helps when authentication or custom headers are needed to load the image.
    ///
    /// - Parameters:
    ///   - request:        Request to perform to obtain the image.
    ///   - placeholder:    Placeholder image to show during the loading or if no image is retrieved.
    ///   - onFailure:      Callback called in case of image download failure.
    public func loadImage(
        with request: URLRequest,
        placeholder: UIImage? = nil,
        onFailure: (() -> Void)? = nil
    ) {
        image = placeholder
        
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: request) { [weak self] (data, response, error) in
            guard let weakSelf = self else  { return }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    weakSelf.image = image
                }
                return
            }
            DispatchQueue.main.async {
                onFailure?()
            }
        }
        task.resume()
    }
}

#endif
