//
//  AddTaskViewController.swift
//  simpleNote
//
//  Created by Dora The Explorer on 24/10/17.
//  Copyright © 2017 Naufel. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    @IBOutlet weak var etNameTask: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnSaveTask(_ sender: Any) {
  //deklarasi context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //deklarasi task
        let nameTask = Task(context: context)
        nameTask.name_task = etNameTask.text
        //proses penyimpanan data ke core data
        if etNameTask.text == "" {
            let alert = UIAlertController(title: "warning", message: "task can't be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler:nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            //ketika kondisi task nya tidak kosong
            //dta disimpan ke core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            _ = navigationController?.popViewController(animated: true)
            print("data berhasil disimpan")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
