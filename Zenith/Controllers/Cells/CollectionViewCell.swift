//
//  CollectionViewCell.swift
//  Zenith
//
//  Created by Alex173 on 15.03.2022.
//

import UIKit
import SceneKit

class CollectionViewCell: UICollectionViewCell, SCNSceneRendererDelegate {

    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var cardViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconImage2: UIImageView!
    @IBOutlet weak var planetLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var planetTypeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var diameterLabel: UILabel!
    
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var temperatureView: UIView!
    @IBOutlet weak var massView: UIView!
    @IBOutlet weak var diameterView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    

    func renderPlanet(with name: String) {
        sceneView.delegate = self
        let scene = SCNScene()
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
            material.diffuse.contents = UIImage(named: name)
        sphere.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0, z: 0)
        node.geometry = sphere
        sceneView.scene = scene
        sceneView.scene?.rootNode.addChildNode(node)
        if name == "Saturn_2k" {
            
            print("Lets make the rings!")
            let ring = SCNTorus(ringRadius: 0.30, pipeRadius: 0.07)
            
            let ringMaterial = SCNMaterial()
            ringMaterial.diffuse.contents = UIImage(named: "SaturnRing_2k")
            let translation = SCNMatrix4MakeTranslation(0, -1, 0)
            let rotation = SCNMatrix4MakeRotation(Float.pi / 2, 0, 0, 1)
            let transform = SCNMatrix4Mult(translation, rotation)
            ringMaterial.diffuse.contentsTransform = transform
            ring.materials = [ringMaterial]
            
            let ringNode = SCNNode()
            ringNode.position = SCNVector3(x: 0, y: 0, z: 0)
            ringNode.geometry = ring
            ringNode.transform.m22 = 0.1
            ringNode.eulerAngles = SCNVector3(x: 0.2, y: 0, z: 0.2)
            node.eulerAngles = SCNVector3(x: 0.2, y: 0, z: 0.2)
            sceneView.scene?.rootNode.addChildNode(ringNode)
            sceneView.scene?.rootNode.position.z = 0.27
        }
        scene.rootNode.runAction(SCNAction.rotate(by: -.pi * 120, around: SCNVector3(0, 1, 0), duration: 10000))
        
        sceneView.backgroundColor = .clear
    }
}
