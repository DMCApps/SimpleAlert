//
//  SimpleAlert.swift
//  SimpleAlert
//
//  Created by Daniel Carmo on 2018-08-24.
//  Copyright © 2018 DMCApps. All rights reserved.
//

import Foundation

fileprivate func unwrapStringAndLocalize(_ value:String?) -> String? {
    if var value = value {
        value = NSLocalizedString(value, comment: "")
    }
    return value
}

public enum AvailableActionType {
    case cancel(String), `default`(String), destructive(String)
    
    fileprivate func asUIAlertActionStyle() -> UIAlertActionStyle {
        switch self {
        case .destructive(_):
            return .destructive
        case .cancel(_):
            return .cancel
        default:
            return .default
        }
    }
    
    fileprivate func title() -> String? {
        switch self {
        case .cancel(let title), .default(let title), .destructive(let title):
            return unwrapStringAndLocalize(title)
        }
    }
}

public indirect enum AlertParam {
    case title(String?),
    message(String?),
    style(UIAlertControllerStyle),
    action(AvailableActionType, ((UIAlertAction) -> Swift.Void)?),
    `if`(Bool, AlertParam, AlertParam?)
    
    fileprivate func createAction() -> UIAlertAction? {
        guard case let .action(style, handler) = self else { return nil }
        return UIAlertAction(title: style.title(), style: style.asUIAlertActionStyle(), handler: handler)
    }
}

public extension UIViewController {
    public var alert: UIAlertController.Builder {
        return UIAlertController.Builder(viewController: self)
    }
}

public extension UIAlertController {
    
    public func show(in viewController: UIViewController, animated: Bool = true, completion: (() -> Swift.Void)? = nil) {
        viewController.present(self, animated: animated, completion: completion)
    }

    public class Builder {
        private var preferredStyle: UIAlertControllerStyle = .alert
        private var title: String? = nil
        private var message: String? = nil
        private var actions: [UIAlertAction] = [UIAlertAction]()
        private weak var weakViewController: UIViewController? = nil
        
        public init() { }
        
        public init(viewController: UIViewController) {
            self.weakViewController = viewController
        }
        
        public func with(_ alertParams: AlertParam...) -> Self {
            for alertParam in alertParams {
                resolveAlertParam(alertParam)
            }
            return self
        }
        
        public func show(in paramViewController: UIViewController? = nil, animated: Bool = true, completion: (() -> Swift.Void)? = nil) {
            var showInViewController: UIViewController
            if paramViewController == nil {
                guard let viewController = self.weakViewController else {
                    print("Unable to perform show()! You must use show(in:) or use UIAlertController.Builder(viewController:) initialization")
                    return
                }
                showInViewController = viewController
            } else {
                showInViewController = paramViewController!
            }
            
            build().show(in: showInViewController)
        }
        
        public func build() -> UIAlertController {
            let alert = UIAlertController(title: self.title, message: self.message, preferredStyle: self.preferredStyle)
            
            actions.forEach { (action) in
                alert.addAction(action)
            }
            
            return alert
        }
        
        private func resolveAlertParam(_ alertParam: AlertParam) {
            switch(alertParam) {
            case .title(let paramTitle):
                self.title = unwrapStringAndLocalize(paramTitle)
            case .message(let paramMessage):
                self.message = unwrapStringAndLocalize(paramMessage)
            case .style(let paramStyle):
                self.preferredStyle = paramStyle
            case .action(_, _):
                self.actions.append(alertParam.createAction()!)
            case .if(let condition, let paramAlertActionTrue, let paramAlertActionElse):
                if condition {
                    self.resolveAlertParam(paramAlertActionTrue)
                } else if let paramAlertActionElse = paramAlertActionElse {
                    self.resolveAlertParam(paramAlertActionElse)
                }
            }
        }

    }
}
