//
//  ImagePickerViewTableViewController.swift
//  ImagePickerView
//
//  Created by Ron Yi on 2019/1/17.
//  Copyright © 2019 Ron Yi. All rights reserved.
//

import UIKit
import ImagePicker

protocol ImagePickerViewDelegate: AnyObject {

    func imagePicker(_ imagePicker: ImagePickerViewTableViewController, didFetch pictures: [Picture])

}

class ImagePickerViewTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    weak var delegate: ImagePickerViewDelegate?

    @IBOutlet weak var tableView: UITableView!

    let imagePickerController = ImagePickerController()

    let tapGestureRecognizer = UITapGestureRecognizer()

    var image = UIImage()

    var picture = Picture(title: "", content: "", image: UIImage())

    var pictures: [Picture] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableViewCell()

        configImagePicker()

    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {

        return 3

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {

        case 0:

            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: "ImagePickerImageViewTableViewCell", for: indexPath) as? ImagePickerImageViewTableViewCell
                else { fatalError("As ImagePickerImageViewTableViewCell error.")
            }

            cell.pictureImageView.addGestureRecognizer(tapGestureRecognizer)
            cell.pictureImageView.isUserInteractionEnabled = true
            tapGestureRecognizer.addTarget(self, action: #selector(pickImageView))

            cell.pictureImageView.image = image

            return cell

        case 1:

            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: "ImagePickerTitleTableViewCell", for: indexPath) as? ImagePickerTitleTableViewCell
                else { fatalError("As ImagePickerTitleTableViewCell error.")
            }

            picture.title = cell.titleTextField.text ?? ""

            return cell

        case 2:

            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: "ImagePickerContentTableViewCell", for: indexPath) as? ImagePickerContentTableViewCell
                else { fatalError("As ImagePickerContentTableViewCell error.")
            }

            picture.content = cell.contentTextView.text

            return cell

        default: fatalError("Invalid section.")

        }

    }

    @objc func pickImageView() {

        present(imagePickerController, animated: true, completion: nil)

    }

    func registerTableViewCell() {

        tableView.register(UINib(nibName: "ImagePickerImageViewTableViewCell", bundle: nil), forCellReuseIdentifier: "ImagePickerImageViewTableViewCell")

        tableView.register(UINib(nibName: "ImagePickerTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "ImagePickerTitleTableViewCell")

        tableView.register(UINib(nibName: "ImagePickerContentTableViewCell", bundle: nil), forCellReuseIdentifier: "ImagePickerContentTableViewCell")

    }

    @IBAction func saveImageData(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        guard
            let homePageTableViewController = storyboard.instantiateViewController(withIdentifier: "HomePageTableViewController") as? HomePageTableViewController
            else { print("As HomePageTableViewController error")
                return
        }

        pictures.append(self.picture)

        self.delegate = homePageTableViewController

        self.delegate?.imagePicker(self, didFetch: pictures)

        //homePageTableViewController.pictures = pictures

        //homePageTableViewController.tableView.reloadData()

        navigationController?.popViewController(animated: true)

        print("pictures in ImagePickerViewTableViewController: ", pictures)

    }

}

extension ImagePickerViewTableViewController: ImagePickerDelegate {

    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {

    }

    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {

        guard
            let firstImage = images.first
            else { print("firstImage is nil.")
                return
        }

        image = firstImage

        picture.image = firstImage

        tableView.reloadData()

        dismiss(animated: true, completion: nil)

    }

    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {

        dismiss(animated: true, completion: nil)

    }

    func configImagePicker() {

        imagePickerController.delegate = self
        imagePickerController.imageLimit = 1

    }

}
