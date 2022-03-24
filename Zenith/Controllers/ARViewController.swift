//
//  ARViewController.swift
//  Zenith
//
//  Created by Alex173 on 16.03.2022.
//

import UIKit
import ARKit
import SceneKit

class ARViewController: UIViewController, ARSCNViewDelegate, AchievementAlertDelegate {
    
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    var info: PlanetData?
    var achievementsModel = AchievementsModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        achievementsModel.delegate = self
        achievementsModel.trackARViewsAchievement(id: (info?.id)!)
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        createPlanet()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    private func createPlanet() {
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        if AppDefaultsData.highResolutionPlanets == true {
            if let imageName = info?.imageName8k {
                material.diffuse.contents = UIImage(named: imageName)
            }
        } else {
            if let imageName = info?.imageName2k {
                material.diffuse.contents = UIImage(named: imageName)
            }
        }
        sphere.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0, z: -1)
        node.eulerAngles = SCNVector3(x: 0.2, y: 0, z: 0.2)
        node.geometry = sphere
        if info?.name == "Saturn" {
            createRings()
        }
        node.runAction(SCNAction.rotate(by: -.pi * 120, around: SCNVector3(0, 1, 0), duration: 10000))
        sceneView.scene.rootNode.addChildNode(node)
       
    }
    
    private func createRings() {
        let ring = SCNTorus(ringRadius: 0.30, pipeRadius: 0.07)
        let ringMaterial = SCNMaterial()
        ringMaterial.diffuse.contents = UIImage(named: "SaturnRing_2k")
        let translation = SCNMatrix4MakeTranslation(0, -1, 0)
        let rotation = SCNMatrix4MakeRotation(Float.pi / 2, 0, 0, 1)
        let transform = SCNMatrix4Mult(translation, rotation)
        ringMaterial.diffuse.contentsTransform = transform
        ring.materials = [ringMaterial]
        let ringNode = SCNNode()
        ringNode.position = SCNVector3(x: 0, y: 0, z: -1)
        ringNode.geometry = ring
        ringNode.transform.m22 = 0.03
        ringNode.eulerAngles = SCNVector3(x: 0.2, y: 0, z: 0.2)
        ringNode.runAction(SCNAction.rotate(by: -.pi * 120, around: SCNVector3(0, 1, 0), duration: 10000))
        sceneView.scene.rootNode.addChildNode(ringNode)
    }
    
    func presentAchievementAlert(model: AchievementsModel, title: String, message: String) {
        print("ALERT!!!!!!!!!!!!")
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
