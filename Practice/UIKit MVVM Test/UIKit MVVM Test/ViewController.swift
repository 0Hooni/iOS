import UIKit
import Combine

// 모델
struct User {
    var name: String
}

// 뷰모델
class UserViewModel {
    @Published private(set) var user: User?

    var name: String {
        return user?.name ?? ""
    }

    func updateName(_ name: String) {
        user = User(name: name)
    }
}

// 뷰
class UserViewController: UIViewController {
    private let viewModel = UserViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private let nameTextField = UITextField()
    private let displayLabel = UILabel()
    private let submitButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
    }

    private func setupViews() {
        view.backgroundColor = .white
        
        // nameTextField 설정
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "Enter your name"
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        // submitButton 설정
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        
        // displayLabel 설정
        displayLabel.textAlignment = .center
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(displayLabel)
        
        // 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            submitButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            displayLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            displayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            displayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    private func setupBindings() {
        // ViewModel의 user 프로퍼티를 구독
        viewModel.$user
            .compactMap { $0?.name }
            .assign(to: \.text, on: displayLabel)
            .store(in: &cancellables)
    }

    @objc private func submitButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        viewModel.updateName(name)
    }
}
