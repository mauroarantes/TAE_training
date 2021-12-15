//
//  LaunchViewController.swift
//  BecomeAPresenter1
//
//  Created by Mauro Arantes on 14/12/2021.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

private extension LaunchViewController {
    func setupViews() {
        addRequestCameraAuthorizationView()
    }
    
    func addRequestCameraAuthorizationView() {
        let requestCameraAuthorizationView = RequestCameraAuthorizationView()
        requestCameraAuthorizationView.translatesAutoresizingMaskIntoConstraints = false
        requestCameraAuthorizationView.delegate = self
        view.addSubview(requestCameraAuthorizationView)
        NSLayoutConstraint.activate([
            requestCameraAuthorizationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            requestCameraAuthorizationView.topAnchor.constraint(equalTo: view.topAnchor),
            requestCameraAuthorizationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            requestCameraAuthorizationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func requestCameraAuthorization() {
        RequestCameraAuthorizationController.requestCameraAuthorization(completionHandler: { status in
            switch status {
            case .granted:
                print("granted")
            case .notRequested:
                break
            case .unauthorized:
                print("unauthorized")
            }
        })
    }
}

extension LaunchViewController: RequestCameraAuthorizationViewDelegate {
    func requestCameraAuthorizationActionButtonTapped() {
        requestCameraAuthorization()
    }
}

