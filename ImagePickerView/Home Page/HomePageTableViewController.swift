//
//  HomePageTableViewController.swift
//  ImagePickerView
//
//  Created by Ron Yi on 2019/1/17.
//  Copyright © 2019 Ron Yi. All rights reserved.
//

import UIKit

class HomePageTableViewController: UITableViewController, ImagePickerViewDelegate {

    var pictures: [Picture] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configDelegation()

        registerTableViewCell()

        tableView.reloadData()

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

        if pictures.count > 1, pictures.first != nil {

            cell.pictureImageView.image = pictures[indexPath.row].image
            cell.titleLabel.text = pictures[indexPath.row].title

        } else {

            print("pictures is nil")

        }

        return cell

    }

    func imagePicker(_ imagePicker: ImagePickerViewTableViewController, didFetch pictures: [Picture]) {

        print("pictures:", pictures)

        DispatchQueue.main.async {

            self.pictures = pictures

            self.tableView.reloadData()

        }

    }

    func registerTableViewCell() {

        tableView.register(UINib(nibName: "HomePageTableViewCell", bundle: nil), forCellReuseIdentifier: "HomePageTableViewCell")

    }

    func configDelegation() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        guard
            let imagePickerViewTableViewController = storyboard.instantiateViewController(withIdentifier: "ImagePickerViewTableViewController") as? ImagePickerViewTableViewController
            else { print("As ImagePickerViewTableViewController error")
                return
        }

        imagePickerViewTableViewController.delegate = self

    }

}
