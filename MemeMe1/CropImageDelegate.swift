//
//  CropImageDelegate.swift
//  MemeMe1
//
//  Created by Wadah Esam on 22/09/2023.
//

import Foundation
import UIKit
import CropViewController

class CropImageDelegate: NSObject, CropViewControllerDelegate {
    weak var viewController: ViewController!
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        cropViewController.dismiss(animated: true)
        viewController?.shareAndSaveMeme(croppedImage: image)
    }
}
