//
//  FIB_C_VC.swift
//  Navigate Pass Data
//
//  Created by steve on 12/11/16.
//  Copyright © 2016 sb. All rights reserved.
//

import UIKit

class FIB_C_VC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var widthTextfield: UITextField!
    @IBOutlet weak var depthTextfield: UITextField!
    @IBOutlet weak var compressTextfield: UITextField!

    var fibC_Beam = CustomBeamClass()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("New FIB_C VC")
        widthTextfield.delegate = self
        depthTextfield.delegate = self
        compressTextfield.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Return to FIB_C VC")
        widthTextfield.text = String(fibC_Beam.width)
        depthTextfield.text = String(fibC_Beam.depth)
        compressTextfield.text = String(fibC_Beam.compressive_Strength)
    }

    func textFieldShouldReturn(_ txtField: UITextField) -> Bool {
        fibC_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
        //following dismisses keyboard for any textField on page
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fibC_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
        super.touchesBegan(touches, with: event)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        fibC_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
