//
//  FaceIdViewController.swift
//  VerticalPlaneDetection
//
//  Created by Pramoda Majhi on 6/13/18.
//  Copyright © 2018 Gregory Chiste. All rights reserved.
//

import UIKit

class FaceIdViewController: UIViewController {
    
    

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         self.imageView.image = UIImage(named: "faceiddetection")
    }

    
    @IBAction func faceIdDetected(_ sender: UITapGestureRecognizer) {
        print("Face Id detected")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PayCompleteViewController")
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
