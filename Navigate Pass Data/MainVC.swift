//
//  MainVC.swift
//  Navigate Pass Data
//
//  Created by steve on 12/11/16.
//  Copyright © 2016 sb. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var widthTextfield: UITextField!
    @IBOutlet weak var depthTextfield: UITextField!
    @IBOutlet weak var compTextfield: UITextField!
    @IBOutlet weak var segmentedControllerOutlet: UISegmentedControl!

    var beam = CustomBeamClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("New Main VC")
        widthTextfield.delegate = self
        depthTextfield.delegate = self
        compTextfield.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Return to Main VC")
        widthTextfield.text = String(beam.width)
        depthTextfield.text = String(beam.depth)
        compTextfield.text = String(beam.compressive_Strength)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadBeam() {
        if let width = Int(widthTextfield.text!){
            beam.width = width
        }
        if let depth = Int(depthTextfield.text!){
            beam.depth = depth
        }
        if let comp = Int(compTextfield.text!){
            beam.compressive_Strength = comp
        }
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loadBeam()
        //following dismisses keyboard for any textField on page
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.loadBeam()
        super.touchesBegan(touches, with: event)
    }

    @IBAction func segmentSelected(_ sender: Any) {
        // segues to appropriate destination and unselects segment
        switch segmentedControllerOutlet.selectedSegmentIndex
        {
        case 0:
            segmentedControllerOutlet.selectedSegmentIndex = UISegmentedControlNoSegment
            performSegue(withIdentifier: "ECD", sender: self)
        case 1:
            segmentedControllerOutlet.selectedSegmentIndex = UISegmentedControlNoSegment
            performSegue(withIdentifier: "ECC", sender: self)
        case 2:
            segmentedControllerOutlet.selectedSegmentIndex = UISegmentedControlNoSegment
            performSegue(withIdentifier: "FIBD", sender: self)
        case 3:
            segmentedControllerOutlet.selectedSegmentIndex = UISegmentedControlNoSegment
            performSegue(withIdentifier: "FIBC", sender: self)
        case 4:
            segmentedControllerOutlet.selectedSegmentIndex = UISegmentedControlNoSegment
            // instanciate manualVC here
            let    manualVC = storyboard!.instantiateViewController(withIdentifier: "MyManual") as! ManualVC
            self.loadBeam() // gets last minute changes
            manualVC.manual_Beam = beam  // pass data
            print("going to MANUAL")
            self.present(manualVC, animated: true, completion: nil)
        default:
            break; 
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.loadBeam() // load beam values before going to next Controller
        switch segue.identifier{
            // destination controller already instantiated
            // passes beam to appropriate controller object depending on destination
        case "ECD"? :
            let ecd = (segue.destination as? EC2_D_VC)!
            ecd.ec2D_Beam = beam
            print("going to ECD")
        case "ECC"?:
            let ecc = (segue.destination as? EC2_C_VC)!
            ecc.ec2C_Beam = beam
            print("going to ECC")
        case "FIBD"?:
            let fibd = (segue.destination as? FIB_D_VC)!
            fibd.fibD_Beam = beam
            print("going to FIBD")
        case "FIBC"?:
            let fibc = (segue.destination as? FIB_C_VC)!
            fibc.fibC_Beam = beam
            print("going to FIBC")
        default:
            break
        }
    }

    // handler FROM other view controllers
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        //  check where you are unwinding from and pass the beam data
        if let ecd = segue.source as? EC2_D_VC {
            beam = ecd.ec2D_Beam  // passes data back before EC2_D_VC destroyed
            print("unwind from ECD")
        }else if let ecd = segue.source as? EC2_C_VC {
            beam = ecd.ec2C_Beam  // passes data back before EC2_C_VC destroyed
            print("unwind from ECC")
        }else if let ecd = segue.source as? FIB_D_VC {
            beam = ecd.fibD_Beam  // passes data back before FIB_D_VC destroyed
            print("unwind from FIBD")
        }else if let ecd = segue.source as? FIB_C_VC {
            beam = ecd.fibC_Beam  // passes data back before FIB_C_VC destroyed
            print("unwind from FIBC")
        }else if let ecd = segue.source as? ManualVC {
            beam = ecd.manual_Beam  // passes data back before ManualVC destroyed
            print("unwind from Manual")
        }

    }

}

