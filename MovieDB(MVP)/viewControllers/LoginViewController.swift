//
//  LoginViewController.swift
//  MovieAsignWithRealm
//
//  Created by saw pyaehtun on 08/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol LoginViewControllerDelegate {
    func successLogin()
}
class LoginViewController: BaseViewController {
    
    @IBOutlet weak var lblErrorLogin: UILabel!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnPasswordShowHide: PasswordShowHideButton!
    
    var loginViewControllerDelegate : LoginViewControllerDelegate?
    let loginPresenterImpl = LoginPresenterImpl()
//    let viewModel = LoginViewModel()
    
    override func setUpPresenter() {
        loginPresenterImpl.onAttach(view: self)
        loginPresenterImpl.onUIReady()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK:- USER INTERACTIONS
extension LoginViewController{
    
    @IBAction func didTapBtnPasswordShowHide(_ sender: Any) {
        btnPasswordShowHide.isDisplaying = !btnPasswordShowHide.isDisplaying
        tfPassword.isSecureTextEntry = !btnPasswordShowHide.isDisplaying
    }
    
    @IBAction func didTapBtnSignIn(_ sender: Any) {
        loginPresenterImpl.login(username: tfUsername.text!, password: tfPassword.text!)
    }
}


//MARK:- Display Veiws
extension  LoginViewController : LoginView {
    func startLoading() {
        showLoading()
    }
    
    func finishLoading() {
        hideLoading()
    }
    
    func showError(errorMessage: String) {
        displayError(errorMessage: errorMessage)
    }
    
    func willShowLoginErrorMessage(isHidden: Bool) {
        lblErrorLogin.isHidden = isHidden
    }
    
    func loginSuccess() {
        loginViewControllerDelegate?.successLogin()
        CommonManger.shared.saveBoolToNSUserDefault(value: true, key: CommonManger.IS_USER_LOGIN)
        navigationController?.viewControllers.removeLast()
    }
}
