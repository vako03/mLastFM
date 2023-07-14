//
//  ExploreViewController.swift
//  LastFM
//
//  Created by valeri mekhashishvili on 13.07.23.
//

import UIKit

class ExploreViewController: UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var tags: [Tag] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ColorCell", bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
        fetchData()
    }
    
    private func fetchData() {
        guard let url = URL(string: "https://ws.audioscrobbler.com/2.0/?method=tag.getTopTags&api_key=8a0e338471e81bb0dffeaa37600d414b&format=json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(TopTagsResponse.self, from: data)
                self.tags = response.toptags.tag
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

extension ExploreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.identifier, for: indexPath) as! ColorCell
        cell.configure(with: tags[indexPath.row])
        return cell
    }
}

extension ExploreViewController: UICollectionViewDelegate {}


