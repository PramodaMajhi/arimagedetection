//
//  ViewController.swift
//  VerticalPlaneDetection
//
//  Created by Pramod Majhi on 06/09/18.
//  Copyright © 2018 Pramod Majhi. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, UIScrollViewDelegate {

   // @IBOutlet weak var ARView: ARSCNView!
    
    @IBOutlet weak var ARView: ARSCNView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ARView.delegate = self
        ARView.session.delegate = self
        ARView.showsStatistics = true
        ARView.autoenablesDefaultLighting = true
        let ARScene = SCNScene()
        ARView.scene = ARScene
        //ARView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin
        
       
    }
    
    
    
    
    //adding viewwillappear function
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // setting up our scene configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.vertical, .horizontal ]//iOS 11.3 beta ONLY!
        // running our configured session
        configuration.detectionImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)
        ARView.session.run(configuration)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let anchorNode = SCNNode()
        anchorNode.name = "anchor"
        ARView.scene.rootNode.addChildNode(anchorNode)
        return anchorNode
       
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else {return}
        if let imageName = imageAnchor.referenceImage.name {
            if imageName == "VegMenu1" {
                DispatchQueue.main.async {
               // let sphere = SCNNode()
               // sphere.geometry = SCNSphere(radius: 0.35)
               // sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.green.withAlphaComponent(0.6)
                //sphere.position = SCNVector3(0, 0 , 0)
                //node.addChildNode(sphere)
                let cube = SCNNode()
                cube.geometry = SCNBox(width: 0.10, height: 0.10, length: 0.10, chamferRadius: 0)
                cube.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "salman.png")
                    //UIColor.green.withAlphaComponent(0.6)
                cube.position = SCNVector3(0.20, 0, 0)
                node.addChildNode(cube)
                self.ARView.scene.rootNode.addChildNode(node)
                print("image defected " + imageName)
                
                let belPepper = SCNNode()
                belPepper.geometry = SCNBox(width: 0.10, height: 0.10, length: 0.10, chamferRadius: 0)
                belPepper.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Stuffed Bell Peppers.png")
                //UIColor.green.withAlphaComponent(0.6)
                belPepper.position = SCNVector3(0.05, 0.2, 0.1)
                node.addChildNode(belPepper)
                self.ARView.scene.rootNode.addChildNode(node)
               // print("image defected " + imageName)
                let chickenSalad = SCNNode()
                chickenSalad.geometry = SCNBox(width: 0.10, height: 0.10, length: 0.10, chamferRadius: 0)
                chickenSalad.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "grilledchickensald.png")
                //UIColor.green.withAlphaComponent(0.6)
                chickenSalad.position = SCNVector3(0, 0, 0)
                node.addChildNode(chickenSalad)
                self.ARView.scene.rootNode.addChildNode(node)
                    
                    
               }
            }
            
        }
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
        let planeGeometry = planeAnchor.geometry
        guard let device = MTLCreateSystemDefaultDevice() else {return}
        let plane = ARSCNPlaneGeometry(device: device)
        plane?.update(from: planeGeometry)
        node.geometry = plane
        node.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "mesh")
        node.geometry?.firstMaterial?.transparency = 0
        // node.geometry?.firstMaterial?.fillMode = SCNFillMode.lines
    }
    
    
    
    @IBAction func tapScreenGesture(_ sender: UIGestureRecognizer) {
        
        let touchPoint = sender.location(in: ARView)
        displayScroll(touchPoint: touchPoint)
    }
    
    
    func displayScroll (touchPoint: CGPoint) {
        //calling hitTest for our AR scene view and storing the results in "hitlocation", using .existingPlaneUsingExtent since we already set up image detection, this will yield better precission and accuracy of our hit test.
        let hitLocation = ARView.hitTest(touchPoint, types: .existingPlaneUsingExtent)
        
        if !hitLocation.isEmpty {
            print("tapped 3D icon")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MenuViewController")
            self.present(nextViewController, animated:true, completion:nil)
          
        }
        
        
    }

}

