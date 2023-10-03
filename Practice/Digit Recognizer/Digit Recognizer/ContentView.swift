//
//  ContentView.swift
//  Digit recognizer
//
//  Created by 송영훈 on 2023/09/27.
//

import SwiftUI
import RealityKit
import ARKit
import CoreML

class ARFrameRequest: ARView, ARSessionDelegate {
    func setup() {
        self.session.delegate = self
        let config = ARWorldTrackingConfiguration()
        self.session.run(config)
    }
    
    func getPrediction(didUpdate frame: ARFrame) {
        // 프레임 업데이트마다 호출됨
        let framePixelBuffer = frame.capturedImage
        
        // MNIST model 을 model 변수에 할당
        guard let model = try? MNISTClassifier(configuration: MLModelConfiguration())
        else {
            print("DEBUG: load model errer")
            return
        }
        
        // model의 prediction 함수를 이용하여 frame과 shape을 입력받음
        guard let output = try? model.prediction(image: framePixelBuffer)
        else {
            print("DEBUG: Load Output Error")
            return
        }
        
        print(output.classLabel)
        
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        getPrediction(didUpdate: frame)
    }
}

struct ARContainerView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARFrameRequest {
        let arView = ARFrameRequest(frame: .zero)
        arView.setup()
        
        
        return arView
    }
    
    func updateUIView(_ uiView: ARFrameRequest, context: Context) { }
    
}

struct ContentView: View {
    var body: some View {
        ARContainerView().edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    ContentView()
}
