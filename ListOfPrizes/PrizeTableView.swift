//
//  PrizeTableView.swift
//  ListOfPrizes
//
//  Created by Sergey Lukaschuk on 17.06.2021.
//

import UIKit

/// public
var prizesList = [Prize]()

class PrizeTableView: UITableViewController {

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
}
