//
//  MemesTableViewController.swift
//  MemeMe1
//
//  Created by Wadah Esam on 24/09/2023.
//

import UIKit

class MemesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var memes: [Meme]! {
        return ((UIApplication.shared.delegate) as! AppDelegate).memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(memes.count)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addButton
        tableView.reloadData()
    }
    
    @objc func addTapped() {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeViewController") as! CreateMemeViewController;
        createMemeViewController.modalPresentationStyle = .fullScreen
        self.present(createMemeViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meme = memes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableCell")!
        
        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 80, height: 980)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.image = meme.croppedMemedImage
        
        cell.textLabel?.text = "\(meme.topText!) \(meme.bottomText!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeViewController") as! CreateMemeViewController
        createMemeViewController.meme = memes[indexPath.row]
        createMemeViewController.modalPresentationStyle = .fullScreen
        present(createMemeViewController, animated: true, completion: nil)
    }
    
}
