//
//  HomePageTableViewController.swift
//  ImagePickerView
//
//  Created by Ron Yi on 2019/1/17.
//  Copyright © 2019 Ron Yi. All rights reserved.
//

import UIKit

class HomePageTableViewController: UITableViewController {

    var pictures: [Picture] = []

    var testArray = ["1", "2", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableViewCell()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTableViewCell", for: indexPath) as? HomePageTableViewCell
            else { fatalError("As HomePageTableViewCell error.")
        }

        return cell

    }

    func registerTableViewCell() {

        tableView.register(UINib(nibName: "HomePageTableViewCell", bundle: nil), forCellReuseIdentifier: "HomePageTableViewCell")

    }

}
