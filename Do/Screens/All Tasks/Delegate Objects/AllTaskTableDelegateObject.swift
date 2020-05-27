//
//  AllTaskTableDelegateObject.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class AllTaskTableDelegateObject: NSObject, TaskTableDelegate {
  unowned var viewModel: AllTaskViewModelable
  
  init(viewModel: AllTaskViewModelable) {
    self.viewModel = viewModel
    super.init()
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableCell(withIdentifier: TaskSectionHeaderCell.identifier()) as? TaskSectionHeaderCell
    header?.selectAction = { [weak self] in
      self?.viewModel.daysSectionTapActin(section: section)
    }
    header?.configure(data: viewModel.cellModel(indexPath: IndexPath(row: 0, section: section)))
    return header
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 55
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detail = ViewControllers.taskDetail
    detail.viewModel.task = viewModel.cellModel(indexPath: indexPath)
    viewModel.pushViewController?(detail)
  }
}
