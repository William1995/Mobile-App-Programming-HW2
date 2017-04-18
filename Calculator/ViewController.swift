
import UIKit

class ViewController: UIViewController {
    
    var inputNumber:Double = 0;
    var previousNumber:Double = 0;
    var checkNum = false;
    var op = 0;
    
    @IBOutlet weak var resultNumber: UILabel!

    @IBAction func numberBtnClicked(_ sender: UIButton) {
        if sender.tag <= 10{    //number
            if checkNum == true{
                resultNumber.text = String(sender.tag-1);
                inputNumber = Double(resultNumber.text!)!;
                checkNum = false;
            }
            
            else {
                if resultNumber.text == "0"||resultNumber.text == "-0"{
                    resultNumber.text?.remove(at: (resultNumber.text?.endIndex)!);
                    resultNumber.text = resultNumber.text! + String(sender.tag-1);
                }else{
                    resultNumber.text = resultNumber.text! + String(sender.tag-1);

                }
            }
        }
        else{
            if sender.tag == 11{    //dot
                if checkNum == true{
                    
                    if !resultNumber.text!.characters.contains("."){
                        resultNumber.text = resultNumber.text! + ".";
                    }
                }
                else{
                    if !resultNumber.text!.characters.contains("."){
                        resultNumber.text = resultNumber.text! + ".";
                    }
                
                }
            }
            else if sender.tag == 12{    //+-
                if checkNum == true{
                    if resultNumber.text!.hasPrefix("-"){
                        resultNumber.text?.remove(at: (resultNumber.text?.startIndex)!);
                    }else{
                        resultNumber.text = "-0";
                    }
                
                }
                else{
                    if resultNumber.text!.hasPrefix("-"){
                        resultNumber.text?.remove(at: (resultNumber.text?.startIndex)!);
                    }else{
                        resultNumber.text = "-" + resultNumber.text!;
                    }
                
                }
            }
            else if sender.tag == 13{    //%
                if !(resultNumber.text?.isEmpty)!{
                    resultNumber.text = String(Double(resultNumber.text!)! * 0.01);
                    inputNumber = Double(resultNumber.text!)!;
                }

            
            }
            else if sender.tag == 14 {    //π
                resultNumber.text = String(Double.pi);
                inputNumber = Double(resultNumber.text!)!;

            }
        
        
        }
    }
    
    @IBAction func methodBtnClicked(_ sender: UIButton) {
        if resultNumber.text != "" && sender.tag != 15 && sender.tag != 20 && sender.tag != 23 && sender.tag != 24 {
            if op != 0{
                if op == 16 {
                    previousNumber = previousNumber - inputNumber;
                    
                }
                else if op == 17 {
                    previousNumber = previousNumber + inputNumber;
                }

                else if op == 18{
                    previousNumber = previousNumber * inputNumber;
                    
                }
                else if op == 19{
                    previousNumber = previousNumber / inputNumber;
                    
                }
                
                else if op == 21 {
                    previousNumber = pow(previousNumber,inputNumber);
                }
                else if op == 22 {
                    previousNumber = pow(previousNumber, (1/inputNumber));
                }
                op = sender.tag;
                checkNum = true;

            }
            else{
                previousNumber = Double(resultNumber.text!)!;
                if sender.tag == 16 {
                    resultNumber.text = "-";
                    
                }
                else if sender.tag == 17 {
                    resultNumber.text = "+";
                }
                else if sender.tag == 18{
                    resultNumber.text = "×";
                    
                }
                else if sender.tag == 19{
                    resultNumber.text = "÷";

                }
                else if sender.tag == 21{
                    resultNumber.text = "^";
                }
                else if sender.tag == 22{
                    resultNumber.text = "√";
                }
                op = sender.tag;
                checkNum = true;
            }
        }
        else if sender.tag == 15{//=
            if op == 16 {
                resultNumber.text = String(previousNumber - inputNumber);
                
            }
            else if op == 17 {
                resultNumber.text = String(previousNumber + inputNumber);
            }
            else if op == 18{
                resultNumber.text = String(previousNumber * inputNumber);
                
            }
            else if op == 19{
                resultNumber.text = String(previousNumber / inputNumber);
                
            }
            
            else if op == 21 {
                resultNumber.text = String(pow(previousNumber,inputNumber));
            }
            else if op == 22 {
                resultNumber.text = String(pow(previousNumber, (1/inputNumber)));
            }

        }
        else if sender.tag == 20{
            resultNumber.text = "";
            previousNumber = 0;
            inputNumber = 0;
            op = 0;
        }
        else if sender.tag == 23{
            resultNumber.text = String(log10(Double(resultNumber.text!)!));
            
        }
        else if sender.tag == 24{
            resultNumber.text = String(exp(Double(resultNumber.text!)!));
            
        }
    }
    

}

