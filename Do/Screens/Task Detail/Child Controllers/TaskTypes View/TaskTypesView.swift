//
//  TaskTypesViewControler.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskTypesView: MainBaseXibView {
  
  @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
  @IBOutlet weak var collectionView: UICollectionView!
  var lastSelected: TaskTypesCell?
  
  weak var parent: TaskDetailViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setDefultUI()
  }
  
  func setDefultUI() {
    DispatchQueue.main.async {
      self.collectionView.register(UINib(nibName: TaskTypesCell.identifier(), bundle: nil), forCellWithReuseIdentifier: TaskTypesCell.identifier())
      self.flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
      self.collectionView.delegate = self
      self.collectionView.dataSource = self
      self.setInitialIndicator()
    }
  }
  
  func setInitialIndicator() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      if let type = self.parent?.viewModel.task.taskType, let index = TaskTypes.allCases.firstIndex(of: type) {
        self.collectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: .centeredHorizontally)
      }
    }
  }
}

extension TaskTypesView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    lastSelected?.isSelected = false
    parent?.viewModel.setTaskType(type: TaskTypes.allCases[indexPath.row])
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return TaskTypes.allCases.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskTypesCell.identifier(), for: indexPath) as? TaskTypesCell else {
      fatalError("Cell not convertable.")
    }
    
    let taskType = TaskTypes(rawValue: TaskTypes.allCases[indexPath.row].rawValue)
    if parent?.viewModel.task.taskType == taskType {
      lastSelected = cell
      cell.isSelected = true
    }
    
    cell.configure(data: taskType)
    return cell
  }
}
