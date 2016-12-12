//
//  ManualVC.swift
//  Navigate Pass Data
//
//  Created by steve on 12/12/16.
//  Copyright © 2016 sb. All rights reserved.
//

import UIKit

class ManualVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var widthTextfield: UITextField!
    @IBOutlet weak var depthTextfield: UITextField!
    @IBOutlet weak var compressTextfield: UITextField!

    var manual_Beam = CustomBeamClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("New Manual VC")
        widthTextfield.delegate = self
        depthTextfield.delegate = self
        compressTextfield.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        // puts beam values in textfields
        widthTextfield.text = String(manual_Beam.width)
        depthTextfield.text = String(manual_Beam.depth)
        compressTextfield.text = String(manual_Beam.compressive_Strength)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Keyboard and editing issues

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("ended editing")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        manual_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        manual_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
        super.touchesBegan(touches, with: event)
    }

    func textFieldShouldReturn(_ txtField: UITextField) -> Bool {
        manual_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
        //following dismisses keyboard for any textField on page
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        return true
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // load beam values before exiting Controller
        manual_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
        
    }
}
