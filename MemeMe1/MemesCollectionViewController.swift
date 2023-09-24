//
//  MemeCollectionViewController.swift
//  MemeMe1
//
//  Created by Wadah Esam on 24/09/2023.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        return ((UIApplication.shared.delegate) as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        collection.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(memes.count)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addButton
        
        collection.reloadData()
    }
    
    @objc func addTapped() {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeViewController") as! CreateMemeViewController;
        createMemeViewController.modalPresentationStyle = .fullScreen
        self.present(createMemeViewController, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionCell", for: indexPath) as! MemeCollectionViewCell
        
        cell.memedImage.image = memes[indexPath.row].croppedMemedImage
        cell.memedImage.contentMode = .scaleToFill
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeViewController") as! CreateMemeViewController
        createMemeViewController.meme = memes[indexPath.row]
        createMemeViewController.modalPresentationStyle = .fullScreen
        present(createMemeViewController, animated: true, completion: nil)
    }
}
