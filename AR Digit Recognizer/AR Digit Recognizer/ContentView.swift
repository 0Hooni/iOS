//
//  ContentView.swift
//  AR Digit Recognizer
//
//  Created by 송영훈 on 10/3/23.
//
import SwiftUI
import RealityKit
import ARKit
import CoreML

class ARFrameRequest: ARView, ARSessionDelegate {
    // 전역 변수로 model 추가
    let model: MNISTClassifier
    var result: Int64
    
    // MARK: - 모델 초기화 함수
    // 모델 초기화 로직을 별도의 메서드로 추출
    private static func initializeModel() -> MNISTClassifier {
        guard let modelInstance = try? MNISTClassifier(configuration: MLModelConfiguration()) 
        else {
            fatalError("DEBUG: Failed to initialize MNISTClassifier model")
        }
        return modelInstance
    }
    // MARK: - ARFrameRequest class의 생성자
    // 수퍼 클래스의 생성자
    required init?(coder: NSCoder) {
        self.model = ARFrameRequest.initializeModel()
        fatalError("DEBUG: init(coder:) has not been implemented") // 빌더의 사용을 방지하기 위함
    }
    required init(frame: CGRect) {
        self.model = ARFrameRequest.initializeModel()
        result = INT64_MAX
        super.init(frame: frame)
    }
    // 서브 클래스의 생성자
    init() {
        self.model = ARFrameRequest.initializeModel()
        result = INT64_MAX
        super.init()
    }

    func setup() {
        self.session.delegate = self
        let config = ARWorldTrackingConfiguration()
        self.session.run(config)
    }
    
    // 모델의 prediction을 통해 result를 얻어내는 함수
    func getPrediction(didUpdate frame: ARFrame) {
        let framePixelBuffer = frame.capturedImage
        guard let output = try? model.prediction(image: framePixelBuffer) else {
//            fatalError("DEBUG: Load Output Error")
            print("DEBUG: Load Output Error")
            return
        }
        result = output.classLabel
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        getPrediction(didUpdate: frame)
    }
}


struct ARContainerView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARFrameRequest {
        let arView = ARFrameRequest()
        arView.setup()
        return arView
    }
    
    func updateUIView(_ uiView: ARFrameRequest, context: Context) {
        
    }
    
}

struct ContentView: View {
    var body: some View {
        ARContainerView().edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
