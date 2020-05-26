//
//  TaskTypesViewControler.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskTypesViewControler: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension TaskTypesViewControler: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    (self.parent as? TaskDetailViewController)?.viewModel.setTaskType(type: TaskTypes.allCases[indexPath.row])
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return TaskTypes.allCases.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskTypesCell.identifier(), for: indexPath) as? TaskTypesCell else {
      fatalError("Cell not convertable.")
    }
    
    cell.configure(data: TaskTypes(rawValue: TaskTypes.allCases[indexPath.row].rawValue))
    return cell
  }
}
