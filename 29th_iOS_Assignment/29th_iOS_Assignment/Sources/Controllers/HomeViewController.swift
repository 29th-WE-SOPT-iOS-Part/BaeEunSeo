//
//  HomeViewController.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    
    var feedList: [Feed] = []
    var categoryList: [Category] = []
    var channelList: [Channel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initChannelList()
        initFeedList()
        initCategory()
        setCollectionView()
        setTableView()
        regiserXib()
    }
    
    private func initChannelList() {
        channelList.append(contentsOf: [
            Channel(profileImageName: "ggamju1", channelName: "iOSPart"),
            Channel(profileImageName: "ggamju2", channelName: "AndroidPart"),
            Channel(profileImageName: "ggamju3", channelName: "ServerPart"),
            Channel(profileImageName: "ggamju4", channelName: "WebPart"),
            Channel(profileImageName: "ggamju5", channelName: "DesignPart"),
            Channel(profileImageName: "ggamju6", channelName: "PlanPart")
        ])
    }
    
    private func initFeedList() {
        feedList.append(contentsOf: [
            Feed(videoImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Feed(videoImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", title: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Feed(videoImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", title: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Feed(videoImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", title: "4차 iOS 세미나 : Cocoapods & Networking, REST API", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            Feed(videoImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", title: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화", description: "WE SOPT ・조회수 100만회 ・ 3주 전")
        ])
    }
    
    private func initCategory() {
        categoryList.append(contentsOf: [
            Category(name: "전체"),
            Category(name: "오늘"),
            Category(name: "이어서 시청하기"),
            Category(name: "시청하지 않음"),
            Category(name: "실시간"),
            Category(name: "게시물")
        ])
    }
    
    private func setTableView() {
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    private func setCollectionView() {
        [channelCollectionView, categoryCollectionView].forEach {
            $0?.delegate = self
            $0?.dataSource = self
        }
    }
    
    private func regiserXib() {
        channelCollectionView.register(UINib(nibName: ChannelCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChannelCollectionViewCell.identifier)
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        feedTableView.register(UINib(nibName: FeedTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: FeedTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier) as? FeedTableViewCell
        else { return UITableViewCell() }
        
        cell.setData(feedData: Feed(videoImageName: feedList[indexPath.row].videoImageName,
                                    profileImageName: feedList[indexPath.row].profileImageName,
                                    title: feedList[indexPath.row].title,
                                    description: feedList[indexPath.row].description))
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case channelCollectionView:
            return CGSize(width: 72, height: 104)
        case categoryCollectionView:
            return CGSize(width: 114, height: 32)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoryCollectionView {
            return 9
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case channelCollectionView:
            return channelList.count
        case categoryCollectionView:
            return categoryList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case channelCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath) as? ChannelCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(channelData: Channel(profileImageName: channelList[indexPath.item].profileImageName,
                                              channelName: channelList[indexPath.item].channelName))
            
            return cell
        case categoryCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(categoryData: Category(name: categoryList[indexPath.item].name))
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
