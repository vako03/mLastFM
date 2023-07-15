//
//  ExploreViewController.swift
//  LastFM
//
//  Created by valeri mekhashishvili on 13.07.23.
//

import UIKit


class ExploreViewController: UIViewController {
    
    private var dataService: DataService!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private var tags: [Tag] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            dataService = DataService(webServiceManaging: WebServiceManager())
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "ColorCell", bundle: nil), forCellWithReuseIdentifier: ColorCell.identifier)
            
            dataService.fetchData { [weak self] tags in
                self?.tags = tags
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
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
