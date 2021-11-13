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
        
        data = ProjectsData.shared.projects
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "buffer")
        tableView.layer.masksToBounds = false
        
    }
    
    //Using multiple sections to make a spacing between the cells
    func numberOfSections(in tableView: UITableView) -> Int {
        return (data?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clear
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if data?.count == indexPath.section {
            //This is the buffer at the bottom of the tableView
            let cell = tableView.dequeueReusableCell(withIdentifier: "buffer")
            //height cannot be 0 :(
            cell?.heightAnchor.constraint(equalToConstant: 1).isActive = true
            return cell!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProjectsTableViewCell
        let indexedCell = data?[indexPath.section]
        cell.desc.text = indexedCell?.shortDescription
        cell.titl.text = indexedCell?.name
        cell.img = UIImage(named: indexedCell?.appIconName ?? "null")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(identifier: "ProjectsLandingPage") as! ProjectsLandingPage
        
        let indexedCell = data?[indexPath.section]
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
