//
//  TaskCategoriesViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskCategoriesView: MainBaseXibView {
  
  @IBOutlet weak private var flowLayout: UICollectionViewFlowLayout!
  @IBOutlet weak private var collectionView: UICollectionView!
  var lastSelected: TaskCategoriesCell?

  weak var parent: TaskDetailViewController?

  override func viewDidLoad() {
    super.viewDidLoad()
    setDefaultUI()
  }
  
  func setDefaultUI() {
    DispatchQueue.main.async {
      self.collectionView.register(UINib(nibName: TaskCategoriesCell.identifier(), bundle: nil), forCellWithReuseIdentifier: TaskCategoriesCell.identifier())
      self.flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
      self.collectionView.delegate = self
      self.collectionView.dataSource = self
      self.collectionView.reloadData()
      self.setInitialIndicator()
    }
  }
  
  private func setInitialIndicator() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      if let type = self.parent?.viewModel.task.taskCategory, let index = TaskCategories.allCases.firstIndex(of: type) {
        self.collectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
      }
    }
  }
}

extension TaskCategoriesView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    lastSelected?.isSelected = false
    self.parent?.viewModel.setTaskCategories(category: TaskCategories.allCases[indexPath.row])
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return TaskCategories.allCases.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCategoriesCell.identifier(), for: indexPath) as? TaskCategoriesCell else {
      fatalError("Cell not convertable.")
    }
    
    let taskCategory = TaskCategories(rawValue: TaskCategories.allCases[indexPath.row].rawValue)
    cell.configure(data: taskCategory)

    return cell
  }
}
