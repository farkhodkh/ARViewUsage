//
//  AppetizerItemView.swift
//  Appetizers
//
//  Created by Farkhod Kh on 31.03.2023.
//
import RealityKit
import ARKit
import SwiftUI

struct ARCubeViewContainer : UIViewRepresentable {
    typealias UIViewType = ARView
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        
        arView.enableTapGesture()
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
}

extension UIColor {
    class func getRandomColor() -> UIColor {
        let colors:[UIColor] = [.white,.black,.blue,.brown,.gray,.orange,.red,.systemPink,.green]
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        
        return colors[randomIndex]
    }
}

extension ARView {
    
    func enableTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let tapLocation = recognizer.location(in: self)
        
        guard let rayResult = self.ray(through: tapLocation) else { return }
        
        let results = self.scene.raycast(origin: rayResult.origin, direction: rayResult.direction)
        
        if let firstResult = results.first {
            var position = firstResult.position
            
            position.y += 0.3/2
            placeCube(at: position)
        } else {
            let results = self.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .any)
            
            if let firstResult = results.first {
                let position = simd_make_float3(firstResult.worldTransform.columns.3)
                placeCube(at: position)
            }
        }
    }
    
    func placeCube(at position: SIMD3<Float>) {
        let mesh = MeshResource.generateBox(size: 0.1)
        
        let material = SimpleMaterial(color:UIColor.getRandomColor(), roughness: 0.3, isMetallic: true)
        
        let modelEntity = ModelEntity(mesh: mesh, materials:[material])
        modelEntity.generateCollisionShapes(recursive: true)
        
        let anchorEntity = AnchorEntity(world: position)
        anchorEntity.addChild(modelEntity)
        
        self.scene.addAnchor(anchorEntity)
        
        
    }
}

struct AppetizerItemView: View {
    var body: some View {
        ARCubeViewContainer()
    }
}
