//
//  MenuViewController.swift
//  VerticalPlaneDetection
//
//  Created by Pramoda Majhi on 6/12/18.
//  Copyright © 2018 Gregory Chiste. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIScrollViewDelegate {

   
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var contentWidth:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        scrollView.delegate = self
//        var images: [String] = ["StuffedBellPeppers@2x", "Grilled Chicken Salad@2x", "Salmon Salad@2x"]
//
//        pageControl.numberOfPages = images.count
//
//        for image in 0...2 {
//
//            let imageToDisplay = UIImage(named: images[image])
//            let imageView = UIImageView(image: imageToDisplay)
//            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(image)
//            contentWidth += view.frame.width
//            scrollView.addSubview(imageView)
//            imageView.frame = CGRect(x: xCoordinate - 50 , y: (view.frame.height/2) - 50, width: 100, height: 100)
//        }
//
//        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
        
        self.scrollView.frame = CGRect(x:0, y:0, width:375, height:331)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
       // print(scrollViewWidth)
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
       // print(scrollViewHeight)
        
        let imgOne = UIImageView(frame: CGRect(x:33, y:0,width:309, height:scrollViewHeight))
        imgOne.image = UIImage(named: "Stuffed Bell Peppers")
        
        let imgTwo = UIImageView(frame: CGRect(x:33+scrollViewWidth, y:0,width:309, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "Grilled Chicken Salad")
        
        let imgThree = UIImageView(frame: CGRect(x:33+scrollViewWidth*2, y:0,width:309, height:scrollViewHeight))
        imgThree.image = UIImage(named: "Salmon Salad")
        
        
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
       // scrollView.addGestureRecognizer(<#T##gestureRecognizer: UIGestureRecognizer##UIGestureRecognizer#>)
        
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 3, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        
        self.pageControl.currentPage = 0

    }
    
    
    @IBAction func imageTap(_ sender: UITapGestureRecognizer) {
        
        print("Menu selected")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PayViewController")
        self.present(nextViewController, animated:true, completion:nil)
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       // print(pageControl.currentPage)
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
