//
//  ImagePickerViewModel.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 06/04/25.
//

import Foundation
import UIKit

import UIKit

class ImagePickerViewModel {
    var selectedImage: ((UIImage) -> Void)?

    // Retain the coordinator
    private var coordinator: ImagePickerCoordinator?

    func openGallery(from controller: UIViewController) {
        coordinator = ImagePickerCoordinator()  // hold strong reference
        coordinator?.start(from: controller) { [weak self] image in
            self?.selectedImage?(image)
            self?.coordinator = nil  // release after use
        }
    }
}

