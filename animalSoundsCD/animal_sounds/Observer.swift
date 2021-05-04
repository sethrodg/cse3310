//
//  Observer.swift
//  animal_sounds
//
//  Created by Brian Quintero on 5/1/21.
//


import Foundation
import SoundAnalysis

// Observer object that is called as analysis results are found.
class ResultsObserver : NSObject, SNResultsObserving {
    
    var classificationResult = String()
    var classificationConfidence = Double()
    
    func request(_ request: SNRequest, didProduce result: SNResult) {
        
        // Get the top classification.
        guard let result = result as? SNClassificationResult,
            let classification = result.classifications.first else { return }
        
        // Determine the time of this result.
        let formattedTime = String(format: "%.2f", result.timeRange.start.seconds)
        print("Analysis result for audio at time: \(formattedTime)")
        
        let confidence = classification.confidence * 100.0
        let percent = String(format: "%.2f%%", confidence)

        // Print the result as Sound: percentage confidence.
        print("\(classification.identifier): \(percent) confidence.\n")
        
        classificationResult = classification.identifier
        classificationConfidence = confidence
    }
    
    func request(_ request: SNRequest, didFailWithError error: Error) {
        print("The the analysis failed: \(error.localizedDescription)")
    }
    
    func requestDidComplete(_ request: SNRequest) {
        print("The request completed successfully!")
    }
}
