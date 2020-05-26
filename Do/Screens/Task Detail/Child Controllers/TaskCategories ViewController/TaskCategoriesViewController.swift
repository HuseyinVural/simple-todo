//
//  TaskCategoriesViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskCategoriesViewController: UIViewController {
  
  @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension TaskCategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return TaskCategories.allCases.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCategoriesCell.identifier(), for: indexPath) as? TaskCategoriesCell else {
      fatalError("Cell not convertable.")
    }

    cell.configure(data: TaskCategories(rawValue: TaskCategories.allCases[indexPath.row].rawValue))
    return cell
  }
}
