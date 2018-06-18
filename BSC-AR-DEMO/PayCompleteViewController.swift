//
//  PayCompleteViewController.swift
//  VerticalPlaneDetection
//
//  Created by Pramoda Majhi on 6/13/18.
//  Copyright © 2018 Gregory Chiste. All rights reserved.
//

import UIKit

class PayCompleteViewController: UIViewController {

   
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageView.image = UIImage(named: "paymentsuccess")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func tapClose(_ sender: UITapGestureRecognizer) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RewardViewController")
        self.present(nextViewController, animated:true, completion:nil)
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
