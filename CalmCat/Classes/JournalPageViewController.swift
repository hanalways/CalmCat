//
//  JournalPageViewController.swift
//  CalmCat
//
//  Created by Hana Clements on 7/29/19.
//  Copyright © 2019 Hana Clements. All rights reserved.
//


import UIKit

class JournalPageViewController: UIPageViewController
{
//    fileprivate lazy var pages: [UIViewController] = {
//        return [
//            self.getViewController(withIdentifier: "JournalFive"),
//            self.getViewController(withIdentifier: "JournalFour")
//        ]
//    }()
//
//    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
//    {
//        return UIStoryboard(name: "JournalFive", bundle: nil).instantiateViewController(withIdentifier: identifier)
//    }
    
    override func viewDidLoad()
    {
//        super.viewDidLoad()
//        self.dataSource = self
//        self.delegate   = self
//
//        if let firstVC = pages.first
//        {
//            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
//        }
    }
}

//extension PageViewController: UIPageViewControllerDataSource
//{
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//
//        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
//
//        let previousIndex = viewControllerIndex - 1
//
//        guard previousIndex >= 0          else { return pages.last }
//
//        guard pages.count > previousIndex else { return nil        }
//
//        return pages[previousIndex]
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
//    {
//        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
//
//        let nextIndex = viewControllerIndex + 1
//
//        guard nextIndex < pages.count else { return pages.first }
//
//        guard pages.count > nextIndex else { return nil         }
//
//        return pages[nextIndex]
//    }
//}
//
//extension PageViewController: UIPageViewControllerDelegate { }
