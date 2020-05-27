//
//  AllTaskTableDataSourceObject.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class AllTaskTableDataSourceObject: BaseTaskTableDataSourceObject {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTaskCell.identifier(), for: indexPath) as? SimpleTaskCell else {
      fatalError("Cell not convertable")
    }
    cell.configure(data: viewModel.cellModel(indexPath: indexPath))
    return cell
  }
}
