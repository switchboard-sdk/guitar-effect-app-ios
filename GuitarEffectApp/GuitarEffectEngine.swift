//
//  GuitarEffectEngine.swift
//  GuitarEffectApp
//
//  Created by Balazs Kiss on 2023. 06. 25..
//

import Foundation
import SwitchboardSDK
import SwitchboardSuperpowered

class GuitarEffectEngine {

    let audioEngine = SBAudioEngine()
    let audioGraph = SBAudioGraph()
    let gainNode = SBGainNode()

    let compressorNode = SBCompressorNode()
    let flangerNode = SBFlangerNode()
    let guitarDistortionNode = SBGuitarDistortionNode()
    let reverbNode = SBReverbNode()

    init() {
        audioGraph.addNode(gainNode)

        audioGraph.addNode(compressorNode)
        audioGraph.addNode(flangerNode)
        audioGraph.addNode(guitarDistortionNode)
        audioGraph.addNode(reverbNode)

        audioGraph.connect(audioGraph.inputNode, to: compressorNode)
        audioGraph.connect(compressorNode, to: flangerNode)
        audioGraph.connect(flangerNode, to: guitarDistortionNode)
        audioGraph.connect(guitarDistortionNode, to: reverbNode)
        audioGraph.connect(reverbNode, to: gainNode)
        audioGraph.connect(gainNode, to: audioGraph.outputNode)

        gainNode.gain = 0.8

        audioEngine.microphoneEnabled = true
    }

    func start() {
        audioEngine.start(audioGraph)
    }

    func stop() {
        audioEngine.stop()
    }
}
