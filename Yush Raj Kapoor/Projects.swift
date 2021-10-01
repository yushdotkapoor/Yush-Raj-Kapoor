//
//  Projects.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import UIKit

class Projects: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    var data:[project]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = ProjectsData().getProjects()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "shell")
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProjectsTableViewCell
        let indexedCell = data?[indexPath.row]
        cell.desc.text = indexedCell?.shortDescription
        cell.titl.text = indexedCell?.name
        cell.img.image = UIImage(named: indexedCell?.appIconName ?? "null")
      
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(identifier: "ProjectsLandingPage") as! ProjectsLandingPage
        
        let indexedCell = data?[indexPath.row]
        vc.textDesc = indexedCell?.longDescription
        vc.textSkills = indexedCell?.skillsUsed
        vc.textChallenges = indexedCell!.challenges
        vc.textFeatures = indexedCell!.features
        vc.textLanguages = indexedCell!.languages
        vc.urls = indexedCell!.urls
        vc.thumbs = indexedCell?.thumbnails ?? 0
        vc.iconName = indexedCell?.appIconName
        vc.title = indexedCell?.name
        navigationController?.pushViewController(vc, animated: true)
        }
    



}
