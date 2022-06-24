
/*
 Protocol คืออิหยังหว่า ?
 protocol คือแม่แบบของ method และ properties ต่าง ๆ หรือสิ่งต่าง ๆ ที่เราต้องการนั่นแหละ
 */


/* ตัวอย่าง */

// สร้าง class นกน้อยขึ้นมาอันนึงมี method และ properties ข้างในแบบนั้น
class Bird {
    
    var isFemale = true
    
    func layEgg(){
        if isFemale {
            print("The bird makes a new bird in a shell.")
        }
    }
    
    func fly(){
        print("The bird its wings and lifts off into the sky.")
    }
}

// จากจะสร้างคลาสนกอินทรีมาอันนึง โดยที่มันสืบทอดความสามารถมาจากคลาสนกน้อย
class Eagle:Bird {
    
    func soar(){
        print("The eagle glides in the air using air currents.")
    }
    
}

// มันก็ไม่มีปัญหาอะไรนี่เนอะ แล้วมันจะมีปัญหาอะไรตรงไหนหว่า งั้นเรามาลองสร้างคลาสแพนกวิ้นกัน
class Pengiun:Bird{
    func swim(){
        print("The pengiun paddles through the water.")
    }
}

let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()

// ทีนี้มาลองดูกัน คือแพนกวิ้นมันก็อยู่ในตระกูลนกอะน้า
let myPengiun = Pengiun()
myPengiun.layEgg()
myPengiun.swim()

// แต่ไหงแพนกวิ้นมันบินได้ฟร้ะ ถึงมันจะเป็นตระกูลนก แต่แพนกวิ้นที่ไหนเค้าบินได้กัน
myPengiun.fly()

// นี่แหละปัญหาของมันคือเราต้องการที่จะสืบทอดคุณสมบัติมาจากนกน้อย แต่เราไม่ได้ต้องการที่จะเอานกน้อยบินได้มาด้วย แพนกวิ้นมันไม่ควรจะบินได้สิว๊ะ

