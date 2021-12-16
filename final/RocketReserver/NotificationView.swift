//
//  NotificationView.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 12/15/21.
//  Copyright © 2021 Apollo GraphQL. All rights reserved.
//

import UIKit

class NotificationView: UIView {
    
    private let label = UILabel()
    private static let padding: CGFloat = 10.0
    static func show(in view: UIView,
                     with text: String,
                     for duration: TimeInterval) {
        
        let notification = NotificationView(text: text)
        
        let fadeInOut = duration / 4
        
        view.addSubview(notification)
        notification.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints([
            notification.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Self.padding),
            notification.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Self.padding),
            notification.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Self.padding),
        ])
        view.layoutIfNeeded()

        notification.alpha = 0
        UIView.animate(withDuration: fadeInOut,
                       delay: 0.1,
                       options: [.curveEaseIn],
                       animations: {
            notification.alpha = 1
            view.layoutIfNeeded()
        })
        
        UIView.animate(withDuration: fadeInOut,
                       delay: duration - fadeInOut,
                       options: [.curveEaseOut],
                       animations: {
            notification.alpha = 0
        }) { _ in
            notification.removeFromSuperview()
        }
        
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        
        self.backgroundColor = .black
        self.setupLabel()
        self.label.text = text
        
        self.clipsToBounds = true
        self.layer.cornerRadius = Self.padding
    }
    
    private func setupLabel() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.textColor = .white
        self.label.textAlignment = .center
        self.label.font = .boldSystemFont(ofSize: self.label.font.pointSize)
        
        self.addSubview(self.label)

        self.addConstraints([
            self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: Self.padding),
            self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Self.padding),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Self.padding),
            self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Self.padding),
        ])
    }
}
