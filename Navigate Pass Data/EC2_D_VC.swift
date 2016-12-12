//
//  EC2_D_VC.swift
//  Navigate Pass Data
//
//  Created by steve on 12/11/16.
//  Copyright © 2016 sb. All rights reserved.
//

import UIKit

class EC2_D_VC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var widthTextfield: UITextField!
    @IBOutlet weak var depthTextfield: UITextField!
    @IBOutlet weak var compressTextfield: UITextField!

    var ec2D_Beam = CustomBeamClass()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("New EC2_D VC")
        widthTextfield.delegate = self
        depthTextfield.delegate = self
        compressTextfield.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        // puts beam values in textfields
        widthTextfield.text = String(ec2D_Beam.width)
        depthTextfield.text = String(ec2D_Beam.depth)
        compressTextfield.text = String(ec2D_Beam.compressive_Strength)
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("ended editing")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        ec2D_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ec2D_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
        super.touchesBegan(touches, with: event)
    }

    func textFieldShouldReturn(_ txtField: UITextField) -> Bool {
        ec2D_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)
        //following dismisses keyboard for any textField on page
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // load beam values before exiting Controller
        ec2D_Beam.update(width: widthTextfield, depth: depthTextfield, comp: compressTextfield)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
