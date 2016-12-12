//
//  FIB_D_VC.swift
//  Navigate Pass Data
//
//  Created by steve on 12/11/16.
//  Copyright © 2016 sb. All rights reserved.
//

import UIKit

class FIB_D_VC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var widthTextfield: UITextField!
    @IBOutlet weak var depthTextfield: UITextField!
    @IBOutlet weak var compressTextfield: UITextField!

    var fibD_Beam = CustomBeamClass()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("New FIB_D VC")
        widthTextfield.delegate = self
        depthTextfield.delegate = self
        compressTextfield.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Return to FIB_D VC")
        widthTextfield.text = String(fibD_Beam.width)
        depthTextfield.text = String(fibD_Beam.depth)
        compressTextfield.text = String(fibD_Beam.compressive_Strength)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fibD_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
        super.touchesBegan(touches, with: event)
    }

    func textFieldShouldReturn(_ txtField: UITextField) -> Bool {
        fibD_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
        //following dismisses keyboard for any textField on page
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        fibD_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
    // load beam values before exiting Controller
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
