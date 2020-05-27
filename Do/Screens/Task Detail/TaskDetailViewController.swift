//
//  TaskDetailViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import FSCalendar
import PopupDialog

class TaskDetailViewController: BaseViewController {
  
  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var descPlaceholder: UILabel!
  @IBOutlet weak var descTextView: UITextView!
  @IBOutlet weak var selectedDateLabel: UILabel!
  @IBOutlet weak var taskCategoriesView: TaskCategoriesView!
  @IBOutlet weak var taskTypeView: TaskTypesView!
  @IBOutlet weak var confirmButton: UIButton!
  
  var viewModel: TaskDetailViewModelable = TaskDetailViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindActions()
    setDefaultUI()
  }
  
  func bindActions() {
    viewModel.changedSelectedDataLabel = changedSelectedDataLabel()
    taskCategoriesView.parent = self
    taskTypeView.parent = self
  }
  
  func setDefaultUI() {
    DispatchQueue.main.async {
      self.titleField.text = self.viewModel.task.title
      self.descTextView.text = self.viewModel.task.desc
      self.descPlaceholder.isHidden = !self.descTextView.text.isEmpty
      self.selectedDateLabel.text = self.viewModel.task.date.dateToStirng()
      self.title = self.viewModel.title
      self.confirmButton.setTitle(self.viewModel.confirmTitle, for: .normal)
    }
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
    viewModel.delete {
      self.showSuccessHud()
      self.navigationController?.popViewController(animated: true)
    }
  }
  
  @IBAction func tapSaveAction(_ sender: Any) {
    viewModel.save(title: titleField.text,
                   desc: descTextView.text,
                   success: {
                    showSuccessHud()
    }, error: { message in
      let popup = PopupDialog(title: Strings.Errors.genericTitle, message: message)
      popup.addButtons([CancelButton(title: Strings.Buttons.okey) {}])
      self.present(popup, animated: true, completion: nil)
    })
  }
  
}

extension TaskDetailViewController: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    DispatchQueue.main.async {
      self.descPlaceholder.isHidden = !textView.text.isEmpty
    }
  }
}
