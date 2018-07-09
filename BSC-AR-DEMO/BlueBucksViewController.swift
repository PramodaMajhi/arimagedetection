//
//  BlueBucksViewController.swift
//  BSC-AR-DEMO
//
//  Created by Pramoda Majhi on 7/9/18.
//  Copyright © 2018 BSC. All rights reserved.
//

import UIKit

class BlueBucksViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageView.image = UIImage(named: "Blue Bucks Increase-2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tappedBlue(_ sender: UITapGestureRecognizer) {
        print("Blue Bucks Increase")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController")
        self.present(nextViewController, animated:true, completion:nil)
        
        print("Redirected to main screen")
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
