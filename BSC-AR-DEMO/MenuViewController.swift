//
//  MenuViewController.swift
//  VerticalPlaneDetection
//
//  Created by Pramoda Majhi on 6/12/18.
//  Copyright © 2018 Gregory Chiste. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

  
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = UIImage(named: "Dinner Item Selected")
    }
    
    @IBAction func menuTapped(_ sender: UITapGestureRecognizer) {
        print("Menu selected")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AchievmentViewController")
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
