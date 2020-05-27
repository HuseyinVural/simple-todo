//
//  TaskListTableDataSourceObjecte.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskListTableDataSourceObjecte: BaseTaskTableDataSourceObject {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskListTaskCell.identifier(), for: indexPath) as? TaskListTaskCell else {
      fatalError("Cell not convertable")
    }
    cell.configure(data: viewModel.cellModel(indexPath: indexPath))
    return cell
  }
}
