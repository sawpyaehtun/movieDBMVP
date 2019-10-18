//
//  MovieDetailViewController.swift
//  Movie
//
//  Created by saw pyaehtun on 27/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailViewController: BaseViewController {
    
    //    @IBOutlet weak var imgBlurViewHeigh: NSLayoutConstraint!
    @IBOutlet weak var imgBlurView: UIImageView!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblReleaseDateAdultMovieTime: UILabel!
    @IBOutlet weak var lblOverView: UILabel!
    @IBOutlet weak var collectionViewSimilarMovieList: UICollectionView!
    @IBOutlet weak var viewTopView: UIView!
    @IBOutlet weak var scrollViewMovieDetail: UIScrollView!
    @IBOutlet weak var imgMyList: UIImageView!
    @IBOutlet weak var imgRate: UIImageView!
    
    let movieDetailPresenterImpl = MovieDetailPresenterImpl()
    
    var movieVO : MovieVO?
    
    var movie : MovieVO?
    
    var similarMovieList : [MovieVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar()
    }
    
    override func setUpPresenter() {
        movieDetailPresenterImpl.onAttach(view: self)
        movieDetailPresenterImpl.onUIReady(movieID: movieVO?.id ?? 0)
    }
    
    override func setUpUIs() {
        setupCollectionView()
        setupScrollview()
        guard let movieVO = movieVO else {return}
        imgPoster.sd_setImage(with: URL(string: "\(NetworkConfiguration.BASE_IMG_URL)\(movieVO.posterPath ?? "")"), completed: nil)
        imgBlurView.image = imgPoster.image
    }
    
    private func setupScrollview(){
        scrollViewMovieDetail.contentInsetAdjustmentBehavior = .never
    }
    
    private func displayInformation(){
        lblOverView.text = movie?.overview
        imgBlurView.frame.size.height = viewTopView.frame.height
        let adultText : String = (movie?.adult!)! ? "18+" : ""
        lblReleaseDateAdultMovieTime.text = "\(movie?.releaseDate ?? "") \(adultText) \(movie?.runtime ?? 0)"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgBlurView.heightConstaint?.constant = viewTopView.frame.height
    }
    
    private func setupCollectionView(){
        collectionViewSimilarMovieList.delegate = self
        collectionViewSimilarMovieList.dataSource = self
        
        collectionViewSimilarMovieList.registerForCell(strID: String(describing: MoviePosetCollectionViewCell.self))
        
        let layout = collectionViewSimilarMovieList.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: 130, height: 180)
    }
    
}
//MARK:- User Interaction
extension MovieDetailViewController {
    
    @IBAction func btnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapRate(_ sender: Any) {
           if imgRate.tintColor == UIColor.white {
               let vc = RateMovieViewController.init()
               vc.movieTitle = (movie?.title) ?? ""
               vc.rateMovieDelegate = self
               hl_addChildViewController(vc, toContainerView: self.view)
           } else {
            movieDetailPresenterImpl.removeFromRatedListMovie(movieID: movie?.id ?? 0)
           }
       }
       
       @IBAction func didTapMyList(_ sender: Any) {
           if imgMyList.tintColor == UIColor.white {
            movieDetailPresenterImpl.addToWatchListMovie(movieID: movie?.id ?? 0)
           } else {
            movieDetailPresenterImpl.removeFromWatchListMovie(movieID: movie?.id ?? 0)
           }
       }
       
       @IBAction func btnPlay(_ sender: Any) {
           let vc = PlayTraillerViewController.init()
           vc.movieID = (movie?.id)!
           hl_addChildViewController(vc, toContainerView: self.view)
       }
}

//MARK:- Similar Movie Delegate and DataSource
extension MovieDetailViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieDetailViewController.init()
        vc.movieVO = similarMovieList[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension MovieDetailViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarMovieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MoviePosetCollectionViewCell.self), for: indexPath) as? MoviePosetCollectionViewCell
        item?.movieVO = similarMovieList[indexPath.row]
        return item!
    }
    
    
}

//MARK:- Rate movie Delegate
extension MovieDetailViewController : RateMovieDelegate{
    func didRateMovie(value: Double) {
        movieDetailPresenterImpl.addToRatedListMovie(movieID: movie?.id ?? 0, value: value)
    }
}

//MARK:- Display View
extension MovieDetailViewController : MovieDetailView{
    func startLoading() {
        showLoading()
    }
    
    func finishLoading() {
        hideLoading()
    }
    
    func showError(errorMessage: String) {
        displayError(errorMessage: errorMessage)
    }
    
    func showSimilarMovies(movieList: [MovieVO]) {
        similarMovieList = movieList
        collectionViewSimilarMovieList.reloadData()
    }
    
    func showMovieDetail(movie : MovieVO){
        self.movie = movie
        displayInformation()
    }
    
    func showAddWatchListBtn(isAdded : Bool){
        imgMyList.tintColor = isAdded ? UIColor.red : UIColor.white
    }
    
    func showRateBtn(isAdded : Bool){
        imgRate.tintColor = isAdded ? UIColor.red : UIColor.white
    }
}
