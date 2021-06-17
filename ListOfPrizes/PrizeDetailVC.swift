//
//  ViewController.swift
//  ListOfPrizes
//
//  Created by Sergey Lukaschuk on 17.06.2021.
//

import UIKit
import CoreData

class PrizeDetailVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - IBAction
    @IBAction func saveAction(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Prize", in: context)
        let newPrize = Prize(entity: entity!, insertInto: context)
        
        newPrize.id = prizesList.count as NSNumber?
        newPrize.title = titleTF.text as NSString?
        newPrize.price = priceTF.text as NSString?
        
        do {
            try context.save()
            prizesList.append(newPrize)
            navigationController?.popViewController(animated: true)
        } catch {
            fatalError("")
        }
    }
}

