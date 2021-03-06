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
    var arrayOfStudents: [Student] = []

    //инициализация VC из storyboard и инициализация CollectionView в нем
    required init?(coder: NSCoder) {
        let layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Students List"
        
        view.addSubview(collectionView)
        collectionViewLayout()
        //дата сорсом и делегатом делаем viewController
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseID)
        
        
        // загрузка из Network
        ParseHandler().getData() { [weak self] (studentsAPI) in
            studentsAPI.forEach { (one) in
                self?.arrayOfStudents.append(Student(name: one.name))
            }
            self?.collectionView.reloadData()

            //сохранение в файл массива студентов (в виде массива словарей)
            StorageHandler(storage: .fileStorage).handle(array: self?.arrayOfStudents ?? [])

            //сохранение через coreData
            StorageHandler(storage: .coredataStorage).handle(array: self?.arrayOfStudents ?? [])
            //вытягивание данных из coreData
            DatabaseManager().fetchCoreData()
        }
    }
    }
        //добавить сюда unwindSegue
   // }


//MARK: - Data Source
extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfStudents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseID, for: indexPath) as! CollectionViewCell
        
        //cellDesign(cell: cell)
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2

        cell.nameLabel.text = arrayOfStudents[indexPath.row].name
        
        return cell
    }
}

//MARK: - Layout, Design, ActivityIndicator
extension CollectionViewController {
    func collectionViewLayout() {
        collectionView.backgroundColor = UIColor(named: "BackgroundColor")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        //чтобы ячейки не доставали до краев collectionview на 10
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

}

//MARK: - Delegate
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.width - 20 - 20 - 10/2)/2
        return CGSize(width: itemWidth, height: 250)
    }
}

//MARK: - DidSelect method
extension CollectionViewController {
    //метод говорит делегату, какой выбран пользователем ряд (нажатием на ряд пользователем). здесь можно модифицировать ряд
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ProfileManager.shared.name = arrayOfStudents[indexPath.row].name

        performSegue(withIdentifier: "profileVC", sender: nil)
    }
}

