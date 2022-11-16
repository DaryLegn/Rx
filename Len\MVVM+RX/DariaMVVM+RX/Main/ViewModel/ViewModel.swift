//
//  ViewModel.swift
//  DariaMVVM+RX
//

import Foundation

import RxSwift
import RxCocoa

class ViewModel {

    // MARK: - Properties
    private let baseURL = "https://api.github.com/users"
    public var users: PublishSubject<[User]> = PublishSubject()

    // MARK: - API Request
    func getUserRequest() {
        guard let url = URL(string: baseURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error: \(error)")
            } else {
                if let data = data, let result = try? JSONDecoder().decode([User].self, from: data).compactMap({$0}) {
                    self.users.onNext(result)
                    self.users.onCompleted()
                }
            }
        }
        task.resume()
    }
}
