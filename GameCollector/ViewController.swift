//
//  ViewController.swift
//  GameCollector
//
//  Created by 柯文財 on 2016/9/26.
//  Copyright © 2016年 mylab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var games : [Game] = [] //Game definded in GameCollector datamodeld. has two attributes: title and image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let game = games[indexPath.row]
        cell.textLabel?.text = game.title
 //       cell.imageView?.image = UIImage(data: Data)
        cell.imageView?.image = UIImage(data: game.image as! Data)

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            games = try context.fetch(Game.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
    }

}

