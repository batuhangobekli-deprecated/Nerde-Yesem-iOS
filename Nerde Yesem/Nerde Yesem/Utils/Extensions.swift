//
//  NerdeYesemExtensions.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 22.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIColor {
    /**
     * Returns random color
     * ## Examples:
     * self.backgroundColor = UIColor.random
     */
    static var random: UIColor {
        let r:CGFloat  = .random(in: 0...1)
        let g:CGFloat  = .random(in: 0...1)
        let b:CGFloat  = .random(in: 0...1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

extension UIImageView {
    /**
     * Set Image
     * Add indicator when loading
     * Apply placeholder
     */
    func setImage(fromURL url: URL) {
        kf.setImage(with: url)
    }
    
    func setImage(fromURL url: URL!,
                  withPlaceholderImage placeholder: UIImage?,
                  animation: ImageAnimation? = nil,
                  duration: TimeInterval? = 0,
                  completion: CompletionHandler? = nil) {
        
        var options: KingfisherOptionsInfo? = nil
        if let animation = animation {
            options?.append(.transition(animation.convert(withDuration: duration ?? 0.2)))
        }
        let i = NerdeYesemUtils.MyIndicator()
        self.kf.indicatorType = .custom(indicator: i as Indicator)
        kf.setImage(with: url,
                    placeholder: placeholder,
                    options: options,
                    progressBlock: nil,
                    completionHandler: { (image, error, cacheType, imageUrl) in
                        if imageUrl == nil {
                            self.image = placeholder
                        }
        })
    }
    func cancelDownload() {
        kf.cancelDownloadTask()
    }
}
//MARK:IMAGE DOWNLOAD
public enum ImageAnimation {
    case flipFromLeft
    case flipFromRight
    case fade
    
    /// Kingfisher transition. This keeps all animation code together rather than distributed in the codebase.
    /// Makes it easier to hadle it and modify it in the future
    ///
    /// - Returns: current third party library animator. Currently: ImageTransition
    func convert(withDuration duration: TimeInterval) -> ImageTransition {
        switch self {
        case .flipFromLeft:
            return ImageTransition.flipFromLeft(duration)
        case .flipFromRight:
            return ImageTransition.flipFromRight(duration)
        case .fade:
            return ImageTransition.fade(duration)
        }
    }
}

