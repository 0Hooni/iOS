import SwiftUI
import RealityKit
import ARKit
import CoreML

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView()
        arView.session.delegate = context.coordinator
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer
        var model: MNISTClassifier?
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
            super.init()
            
            do {
                model = try MNISTClassifier(configuration: MLModelConfiguration())
            } catch {
//                print("Failed to load MNIST model: \(error)")
            }
        }
        
        func session(_ session: ARSession, didUpdate frame: ARFrame) {
            // 이미지 데이터는 frame.capturedImage에서 가져올 수 있습니다.
            let pixelBuffer = frame.capturedImage
            

            // Core ML 모델로 예측 실행
            if let model = self.model {
                do {
                    // 오류로 예상됨(입력 타입과 변환된 타입이 일치하지 않음)
                    let prediction = try model.prediction(image: pixelBuffer)
                    // prediction 클래스를 사용하여 결과를 처리
                    // 예를 들면, prediction.label은 인식된 숫자의 문자열 표현을 반환합니다.
                    print("Predicted number: \(prediction.labelProbabilities)")
                } catch {
//                    print("Error predicting number: \(error)")
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}
