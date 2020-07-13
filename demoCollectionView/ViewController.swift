//
//  ViewController.swift
//  demoCollectionView
//
//  Created by Apple on 7/10/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var myCV: UICollectionView!
    var deviceWidth:CGFloat!
    var deviceHeight:CGFloat!
    var spacing:CGFloat = 3
    
    var dataImage:[Image] = [
        Image(pathURL: "https://s3.amazonaws.com/com.marvel.terrigen/prod/captainmarvel_lob_crd_06.jpg"),
        Image(pathURL: "https://i.annihil.us/u/prod/marvel/i/mg/f/00/5ee2a0bcdf590.jpg"),
        Image(pathURL: "https://nie.res.netease.com/r/pic/20190527/3abb27b4-0506-4961-981c-94b029157ce2.jpg"),
        Image(pathURL: "https://cdn.mos.cms.futurecdn.net/xGwDeehYUPAaTZqSeuHUv8.jpg"),
        Image(pathURL: "https://s3.amazonaws.com/com.marvel.terrigen/prod/captainmarvel_lob_crd_06.jpg"),
        Image(pathURL: "https://i.annihil.us/u/prod/marvel/i/mg/f/00/5ee2a0bcdf590.jpg"),
        Image(pathURL: "https://nie.res.netease.com/r/pic/20190527/3abb27b4-0506-4961-981c-94b029157ce2.jpg"),
        Image(pathURL: "https://cdn.mos.cms.futurecdn.net/xGwDeehYUPAaTZqSeuHUv8.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        deviceWidth = view.layer.frame.width
        deviceHeight = view.layer.frame.height
        
        myCV.delegate = self
        myCV.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = spacing
        myCV!.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! itemCollectionViewCell
        let queue = DispatchQueue(label: "loadImage")
        queue.async {
            let url = URL(string: self.dataImage[indexPath.row].pathURL!)
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    cell.myIMG.image = UIImage(data: data)
                }
            }catch{
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = (deviceWidth - 4 * spacing)/3
        let height:CGFloat = (deviceWidth - 3 * spacing)/3
        let size  = CGSize(width: width, height: height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let screenDetail = sb.instantiateViewController(withIdentifier: "IMAGE_DETAIL") as! ImageDetailViewController
        self.navigationController?.pushViewController(screenDetail, animated: true)
        screenDetail.imageURL = dataImage[indexPath.row].pathURL!
    }
}

