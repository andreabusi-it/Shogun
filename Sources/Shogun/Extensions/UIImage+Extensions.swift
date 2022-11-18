//
//  UIImage+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import UIKit


extension UIImage {
    
    /// Resize the current image to a given size.
    ///
    /// - Parameters:
    ///    - size: Final size of the image.
    /// - Returns: Scaled image.
    public func resized(
        for size: CGSize
    ) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { [unowned self] _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: size))
        }
        return image
    }
    
    /// Returns a grayscaled version of the current image. If an error occours, nil is returned.
    /// Operations are performed on a background thread because it could takes time.
    ///
    /// - Parameters:
    ///    - completion: Completion called with grayscaled image.
    public func grayscaled(
        completion: @escaping (_ image: UIImage?) -> Void
    )  {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let context = CIContext(options: nil)
            guard let currentFilter = CIFilter(name: "CIPhotoEffectNoir"), let weakSelf = self else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            currentFilter.setValue(CIImage(image: weakSelf), forKey: kCIInputImageKey)
            if let output = currentFilter.outputImage,
               let cgImage = context.createCGImage(output, from: output.extent) {
                let image = UIImage(cgImage: cgImage, scale: weakSelf.scale, orientation: weakSelf.imageOrientation)
                DispatchQueue.main.async {
                    completion(image)
                }
                return
            }
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
    
    /// Fix orientation for the current image.
    /// This method is used to set the proper orientation on a taken photo.
    /// 
    /// - Returns: Image with fixed orientation
    public func fixOrientation() -> UIImage {
        if imageOrientation == UIImage.Orientation.up {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        if let normalizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return normalizedImage
        } else {
            return self
        }
    }
}
