//
//  FeedViewController.swift
//  AllTech
//
//  Created by Serxhio Gugo on 9/16/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit
import Kingfisher
import SafariServices

class FeedViewController: UIViewController{
    
    
    //Objects from CVmodel
    var cvModel: CVModel?
    var cvArticles = [Article]()
    var tvModel: TVModel?
    var tvArticles = [TVArticle]()
    
    //Cells ID
    let cvCellId = "cvCellId"
    let tvCellId = "tvCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoaderController.sharedInstance.showLoader()
        setupNavController()
        setupUI()
        fetchJSON()
        fetchJsonForTV()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.register(CVCell.self, forCellWithReuseIdentifier: cvCellId)
        tableView.register(TVCell.self, forCellReuseIdentifier: tvCellId)
    }
    
    //Fetching JSON CollectionView
    fileprivate func fetchJSON() {
        CVService.shared.fetchNews { (cvModel, error) in
            if let error = error {
                print("Failed to fetch the news", error)
            }
            self.cvModel = cvModel
            self.cvArticles = (cvModel?.articles ?? [])
            self.collectionView.reloadData()
            
        }
    }
    
    //Fetching JSON TableView
    fileprivate func fetchJsonForTV() {
        TVService.shared.fetchNewsForTV { (tvModel, error) in
            if let error = error {
                print("Failed to fetch the news for tv", error)
            }
            self.tvModel = tvModel
            self.tvArticles = (tvModel?.articles ?? [])
            self.tableView.reloadData()
            LoaderController.sharedInstance.removeLoader()
        }
    }
    
    //NavBar
    private func setupNavController() {
        view.backgroundColor = .white
        navigationItem.title = "Technology Now"
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 0, green: 0.6471, blue: 0.3843, alpha: 1.0)]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    //Setting up UICollectionView
    
    let topContainer: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .clear        
        return topView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UPCarouselFlowLayout()
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.sideItemScale = 0.9
        layout.sideItemAlpha = 1.4
        layout.spacingMode = .fixed(spacing: 1.0)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        cv.showsHorizontalScrollIndicator = true
        return cv
        }()
    
    let bottomContainer: UIView = {
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .clear
        return bottomView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = UIColor(red: 0, green: 0.6471, blue: 0.3843, alpha: 1.0)
        tableView.separatorStyle = .singleLine
        tableView.tableHeaderView = TableViewHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        return tableView
    }()
        
    //Constrains for UICollectionView
    private func setupUI() {
        view.addSubview(topContainer)
        view.addSubview(collectionView)
        view.addSubview(bottomContainer)
        bottomContainer.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            topContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            topContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            topContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            collectionView.topAnchor.constraint(equalTo: topContainer.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: topContainer.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: topContainer.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor),
            
            bottomContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor),
            bottomContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: bottomContainer.topAnchor),
            tableView.leftAnchor.constraint(equalTo: bottomContainer.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: bottomContainer.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor),
            
        ])
    }
}

extension FeedViewController:  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate  {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cvArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvCellId, for: indexPath) as! CVCell
        cell.backgroundColor = .clear
        cell.titleLabel.text = cvArticles[indexPath.row].title
        let resource = ImageResource(downloadURL: URL(string: cvArticles[indexPath.row].urlToImage)!, cacheKey: cvArticles[indexPath.row].urlToImage)
        cell.imageView.kf.setImage(with: resource)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let articlesURL = URL(string: self.cvArticles[indexPath.row].url)
        
        let safariVC = SFSafariViewController(url: articlesURL!)
        safariVC.delegate = self as? SFSafariViewControllerDelegate
        safariVC.preferredControlTintColor = UIColor(red: 0, green: 0.6471, blue: 0.3843, alpha: 1.0)
        self.present(safariVC, animated: true , completion: nil)

    }
    
    //UICollectionViewDelegateFlowLayout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width) - 70 , height: collectionView.bounds.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}


extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tvCellId, for: indexPath) as! TVCell
    
        cell.titleLabel.text = tvArticles[indexPath.row].title
        cell.descLabel.text = tvArticles[indexPath.row].description
        let resource = ImageResource(downloadURL: URL(string: tvArticles[indexPath.row].urlToImage)!, cacheKey: tvArticles[indexPath.row].urlToImage)
        cell.mainImageView.kf.setImage(with: resource)
        let stringDateFormServer:String = tvArticles[indexPath.row].publishedAt
        let dateToShowOnUI:String =  DateManager.methodStringFromDate(dateFromString: DateManager.methodDateFromString(stringDate: stringDateFormServer) as NSDate)
            cell.dateLabel.text = dateToShowOnUI
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articlesURL = URL(string: self.tvArticles[indexPath.row].url)
        
        let safariVC = SFSafariViewController(url: articlesURL!)
        safariVC.delegate = self as? SFSafariViewControllerDelegate
        safariVC.preferredControlTintColor = UIColor(red: 0, green: 0.6471, blue: 0.3843, alpha: 1.0)
        self.present(safariVC, animated: true , completion: nil)
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
