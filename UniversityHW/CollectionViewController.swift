//
//  CollectionViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    var collectionView: UICollectionView

    let activityIndicator = UIActivityIndicatorView(style: .large)

       //инициализация CollectionView
       required init?(coder: NSCoder) {
           let layout = UICollectionViewFlowLayout()
           //layout.itemSize = CGSize(width: 200, height: 300)
           //layout.minimumLineSpacing = 10
           self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           super.init(coder: coder)
       }


    override func viewDidLoad() {
        super.viewDidLoad()
        //почему не отображеется ???????????????????????
        title = "Students List"

        view.addSubview(collectionView)
        collectionViewLayout()
        //дата сорсом и делегатом делаем viewController
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseID)

//        collectionView.addSubview(activityIndicator)
//        activityIndicatorLayout()
//        activityIndicator.startAnimating()

        // добавить сюда загрузку из Network

        //добавить сюда unwindSegue
                }
    }


//MARK: - Data Source
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseID, for: indexPath) as! CollectionViewCell

        //cellDesign(cell: cell)
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2

        return cell
}
}

//MARK: - Layout, Design, ActivityIndicator
extension CollectionViewController {
    func collectionViewLayout() {
    collectionView.backgroundColor = .white
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    //чтобы ячейки не доставали до краев collectionview на 10
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

//        collectionView.topAnchor.constraint(equalTo: labelStudents.bottomAnchor, constant: 8).isActive = true
    }

//    func cellDesign(cell: CollectionViewCell) {
//    cell.backgroundColor = .white
//    cell.layer.borderColor = UIColor.black.cgColor
//    cell.layer.borderWidth = 2
//    }

    func activityIndicatorLayout() {
        activityIndicator.color = .systemBlue
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        activityIndicator.hidesWhenStopped = true
    }
}

//MARK: - Delegate
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.width - 20 - 20 - 10/2)/2
        return CGSize(width: itemWidth, height: 300)
    }
}

//MARK: - DidSelect method
extension CollectionViewController {
    //метод говорит делегату, какой выбран пользователем ряд (нажатием на ряд пользователем). здесь можно модифицировать ряд
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //достаем имя студента из ячейки (для дальнейшей передачи в ProfileVC)
//        ProfileManager.shared.name = NetworkManager.shared.swPeopleArray[indexPath.row].name

        //загружаются разные стили профилей в зависимости от пола студента
//        if NetworkManager.shared.swPeopleArray[indexPath.row].gender == "n/a" || NetworkManager.shared.swPeopleArray[indexPath.row].gender == "none" {
//            performSegue(withIdentifier: "profileVC", sender: nil)
//        }
    }
}

