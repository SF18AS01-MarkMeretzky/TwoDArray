//
//  ViewController.swift
//  TwoDArray
//
//  Created by Instructor on 1/15/19.
//  Copyright © 2019 Instructor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //a is a big array that will contain 4 smaller arrays.
    //These 4 smaller arrays will be the 4 rows.
    var a: [[Int]] = [[Int]](); //born empty
    
    let nrows: Int = 4;
    let ncols: Int = 2;
    
    var row: Int = 0;
    var col: Int = 0;

    @IBOutlet weak var textField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        //insert an empty array of Ints into the big array.
        //This empty array of Ints will become the first row.
        a.append([Int]());
        textField.placeholder = "Please type row \(row + 1), col \(col + 1):";
    }

    @IBAction func returnKeyPressed(_ sender: UITextField) {
        if let text: String = sender.text {
            if let number: Int = Int(text) {
                a[row].append(number);
                col += 1;
                if col == ncols {
                    col = 0;
                    row += 1;
                    a.append([Int]());  //Start another row.
                    if row == nrows {
                        //All done!
                        sender.resignFirstResponder();
                        sender.isEnabled = false;
                        for row in a {
                            for i in row {
                                print("\(i) ", terminator: "");
                            }
                            print();
                        }
                        textField.text = nil;
                        textField.placeholder = nil;
                        return;
                    } 
                }
                textField.text = nil; //allow the placeholder to appear.
                textField.placeholder = "Please type row \(row + 1), col \(col + 1):";
            }
        }
    }
}

