//
//  ViewController.swift
//  TwoDArray
//
//  Created by Instructor on 1/15/19.
//  Copyright © 2019 Instructor. All rights reserved.
//  Let the user input the 8 numbers in an array of arrays.  Think of this array
//  as a two-dimensoinal array of 4 rows and 2 columns.
//

import UIKit;

class ViewController: UIViewController {
    
    //We know the number of rowns and columns in advance.
    let nrows: Int = 4;
    let ncols: Int = 2;
    
    //We are currently up to this element.
    var row: Int = 0;
    var col: Int = 0;
    
    //a is a big array, born empty, that will contain four smaller arrays.
    //These four smaller arrays will be the four rows.
    var a: [[Int]] = [[Int]]();

    @IBOutlet weak var textField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        //Insert an empty array of Ints into the big array.
        //This empty array of Ints will become the first row.
        a.append([Int]());
        textField.placeholder = "Please type row \(row + 1), col \(col + 1):";
    }

    @IBAction func returnKeyPressed(_ sender: UITextField) {
        if let text: String = sender.text {
            if let number: Int = Int(text) {
                a[row].append(number); //Arrive here if the user actually typed a number.
                
                //Move to the next position in the two-dimensional array.
                col += 1;
                if col == ncols {
                    col = 0;
                    row += 1;
                    if row == nrows {
                        allDone();
                        return;
                    }
                    a.append([Int]()); //Start another row.
                }

                textField.text = nil;  //Allow the placeholder to appear.
                textField.placeholder = "Please type row \(row + 1), col \(col + 1):";
            }
        }
    }
    
    //Arrive here when the user has finished inputting all the numbers.
    
    func allDone() {
        textField.resignFirstResponder();
        textField.isEnabled = false;
        textField.text = nil;
        textField.placeholder = nil;

        for row in a {
            for i in row {
                print("\(i) ", terminator: "");
            }
            print();   //Move down to the next line.
        }
    }
}
