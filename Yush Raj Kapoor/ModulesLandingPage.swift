//
//  ModulesLandingPage.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 11/12/21.
//

import Foundation
import UIKit

class ModulesLandingPage:UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var modules = ["MorseCodeFlasher", "ColorPicker"]
    var readableModules = ["Morse Code Flasher", "Camera Color Picker"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpModuleList()
    }
    
    func setUpModuleList() {
        let generalStack = UIStackView()
        generalStack.axis = .vertical
        generalStack.spacing = 20
        generalStack.distribution = .fillProportionally
        
        for (ind, i) in modules.enumerated() {
            let button = UIButton()
            button.setTitle(readableModules[ind], for: .normal)
            setButton(button: button)
            button.addAction(UIAction(handler: { [self] _ in
                goToModule(moduleID: i)
            }), for: .touchUpInside)
            generalStack.addArrangedSubview(button)
        }
        generalStack.refactor(withWidth: UIScreen.main.bounds.width - 80)
        
        scrollView.addSubview(generalStack)
        generalStack.constrain(reference: scrollView, top: 20, bottom: 0, leading: 0, trailing: 0)
        scrollView.center = view.center
        generalStack.center.x = scrollView.center.x
    }
    
    func setButton(button:UIButton) {
        let buttHeight = 34.5
        button.backgroundColor = .label
        button.title(for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.widthAnchor.constraint(equalToConstant: (button.titleLabel?.textWidth(withHeight: 17) ?? 0) + 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: buttHeight).isActive = true
        button.layer.cornerRadius = buttHeight/2
    }
    
    func goToModule(moduleID: String) {
        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(identifier: moduleID)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
