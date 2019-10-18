//
//  GenreViewController.swift
//  Movie
//
//  Created by saw pyaehtun on 26/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class GenreViewController: BaseViewController {
    @IBOutlet weak var tableViewGenreList: UITableView!
    
    var genreList : [GenreVO] = []
    let genrePresenterImpl = GenrePresenterImpl()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpUIs() {
        super.setUpUIs()
        setUpTableView()
    }
    
    override func setUpPresenter() {
        genrePresenterImpl.onAttach(view: self)
        genrePresenterImpl.onUIReady()
    }
    
    private func setUpTableView(){
        tableViewGenreList.delegate = self
        tableViewGenreList.dataSource = self
        tableViewGenreList.registerForCell(strID: String(describing: GenreItemTableViewCell.self))
        tableViewGenreList.separatorColor = UIColor.white
    }
    
}

extension GenreViewController : UITableViewDelegate {
    
}

extension GenreViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GenreItemTableViewCell.self), for: indexPath) as! GenreItemTableViewCell
        
        cell.genreVO = genreList[indexPath.row]
        return cell
    }
    
}

//MARK:- Display View
extension GenreViewController : GenreView{
    func showGenreList(genreList: [GenreVO]) {
        self.genreList = genreList
        tableViewGenreList.reloadData()
    }
    
    func startLoading() {
        showLoading()
    }
    
    func finishLoading() {
        hideLoading()
    }
    
    func showError(errorMessage: String) {
        displayError(errorMessage: errorMessage)
    }
    
    
}
