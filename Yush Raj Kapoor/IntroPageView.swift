//
//  IntroPageView.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/14/21.
//

import UIKit

class IntroPageView: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
   
    private(set) lazy var viewControllerArr: [UIViewController] = {
        return [self.moveToNewViewController(storyboardID: "Hello"),self.moveToNewViewController(storyboardID: "AboutMe")]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.tertiaryLabel
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.secondaryLabel
        dataSource = self
        
        if let firstViewController = viewControllerArr.first {
                setViewControllers([firstViewController],
                                   direction: .forward,
                    animated: true,
                    completion: nil)
            }
    }
    

    private func moveToNewViewController(storyboardID: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyboardID)
    }
    
  
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return viewControllerArr.count
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerArr.count
        }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = viewControllerArr.firstIndex(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
        }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = viewControllerArr.firstIndex(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerArr.firstIndex(of: viewController) else {
                   return nil
               }
               
               let prev = viewControllerIndex - 1
               
               guard prev >= 0 else {
                   return nil
               }
               
               guard viewControllerArr.count > prev else {
                   return nil
               }
               
               return viewControllerArr[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerArr.firstIndex(of: viewController) else {
              return nil
          }
        
          let next = viewControllerIndex + 1
          let ct = viewControllerArr.count

          guard ct != next else {
              return nil
          }
          
          guard ct > next else {
              return nil
          }
          
          return viewControllerArr[next]
    }
    
    override func viewDidLayoutSubviews() {
        for subView in self.view.subviews {
            if subView is UIScrollView {
                subView.frame = self.view.bounds
            }
        }
        super.viewDidLayoutSubviews()
    }

}
