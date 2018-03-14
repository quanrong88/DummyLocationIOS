//
//  DetailViewController.swift
//  DummyLocations
//
//  Created by TaMinhQuan on 09/03/2018.
//  Copyright © 2018 TaMinhQuan. All rights reserved.
//

import UIKit
import SwaggerKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var commentsTableView: UITableView!
    var locationId: Int32 = -1
    var comments: [LocationDetailResponseComment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if locationId != -1 {
            LocationsAPI.requestLocationDetail(locationId: locationId, completion: { [unowned self] (response, error) in
                if let location = response {
                    self.titleLabel.text = location.location?.title
                    self.descriptionLabel.text = location.location?.subtitle
                    self.comments = location.comment ?? []
                    self.commentsTableView.reloadData()
                }
            })
        }
        
    }
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell")
        cell?.textLabel?.text = comments[indexPath.row].content
        cell?.detailTextLabel?.text = comments[indexPath.row].name
        let url = URL(string: comments[indexPath.row].imageUrl ?? "")
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            cell?.imageView?.image = image
        }
        return cell!
    }
}
