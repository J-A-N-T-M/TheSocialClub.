//
//  ImageViewController.swift
//  TheSocialClub
//
//  Created by Tashiana Johnson on 4/18/22.
//


import UIKit
import Parse

struct APIResponse: Codable{
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable{
    let id:String
    let urls: URLS
}

struct URLS: Codable{
    let full:String
}


class ImageViewController: UIViewController, UICollectionViewDataSource {

    
    let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=office&client_id=Tygs02x-9ux7zxhL3_UnTqjkQYp4ITdd9c-qOBmkd7E"


    private var collectionView: UICollectionView?
    var results: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register( UICollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        // Do any additional setup after loading the view.
    }
    
     override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    
    func fetchPhotos() {
        guard let url = URL(string: urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data,_, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                    self?.collectionView?.reloadData()
                }
                
            }
            catch{
                print(error)
            }
            print("Got data!")
        }
        task.resume()
    }
    
    
    
    
    func collectionView(_ collectView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results[indexPath.row].urls.full
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(with: imageURLString)
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
