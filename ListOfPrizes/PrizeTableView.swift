//
//  PrizeTableView.swift
//  ListOfPrizes
//
//  Created by Sergey Lukaschuk on 17.06.2021.
//

import UIKit
import CoreData

/// public
var prizesList = [Prize]()

class PrizeTableView: UITableViewController {
    
    var firstLoad = true
    
    override func viewDidLoad() {
        if firstLoad {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Prize")
            
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let prize = result as! Prize
                    prizesList.append(prize)
                }
            } catch  {
                fatalError("Fetch Failed")
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prizeCell = tableView.dequeueReusableCell(withIdentifier: "prizeCellID", for: indexPath) as! PrizeCell
        let thisCell: Prize!
        thisCell = prizesList[indexPath.row]
        prizeCell.titleLabel.text = thisCell.title as String?
        prizeCell.priceLabel.text = thisCell.price as String?
        return prizeCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prizesList.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
