//
//  TaskDetailViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import FSCalendar

class TaskDetailViewController: BaseViewController {
  
  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var descPlaceholder: UILabel!
  @IBOutlet weak var descTextView: UITextView!
  @IBOutlet weak var selectedDateLabel: UILabel!
  
  var viewModel: TaskDetailViewModelable = TaskDetailViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindActions()
    setDefaultUI()
  }
  
  func bindActions() {
    viewModel.changedSelectedDataLabel = changedSelectedDataLabel()
  }
  
  func setDefaultUI() {
    selectedDateLabel.text = Date().dateToStirng()
  }

  final func changedSelectedDataLabel() -> (_ date: String) -> Void {
    return { [weak self] date in
      DispatchQueue.main.async {
        self?.selectedDateLabel.text = date
      }
    }
  }
  
  @IBAction func tapActionDateArea(_ sender: Any) {
    DispatchQueue.main.async {
      let pickerPop = ViewControllers.calenderPopup
      pickerPop.delegate = self.viewModel
      self.present(pickerPop, animated: true, completion: nil)
    }
  }
  
  @IBAction func tapDeleteAction(_ sender: Any) {
    print("Delete")
  }
  
  @IBAction func tapSaveAction(_ sender: Any) {
    print("Save")
  }
  
}

extension TaskDetailViewController: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    DispatchQueue.main.async {
      self.descPlaceholder.isHidden = !textView.text.isEmpty
    }
  }
}
