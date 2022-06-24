
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
// งั้นเรามาลองสร้างพิพิธภัณฑ์การบินกันเถอะ
struct FlyingMuseum {
    
    func flyingDemo(flyingObject : Bird){
        flyingObject.fly()
    }
}

let museum = FlyingMuseum()
// อันนี้ก็ปกติแหละเนอะเพราะว่าอินทรีมันเป็นนกผลลัพธ์ที่ได้ก็ไม่ได้แปลกอะไร แล้วถ้าเป็นอีกแบบล่ะ
museum.flyingDemo(flyingObject: myEagle)

// เครื่องบินมันก็บินได้อะเนาะ ก็นกเหมือนกันแหละ
class Airplane : Bird {
    
}

let myPlane = Airplane()
// เอาล่ะทีนี้ปัญหาก็มาหาและ อั่มเครื่องบินนา แต่มันดันมีข้อความว่า the bird มันไม่ควรจะเป็นงั้นสิ
museum.flyingDemo(flyingObject: myPlane)

// ทีนี้ทำไงได้ล่ะ จริง ๆ เราก็สามารถที่จะ override มันได้แหละเนาะ มาดูกัล
class Airplane2 : Bird {
    override func fly() {
        print("The airplane its wings and lifts off into the sky.")
    }
}

let myPlane2 = Airplane2()
// อ่าาาา หลังจากตรงนี้มันก็เป็นเครื่องบินอย่างที่มันควรจะเป็นซะที
museum.flyingDemo(flyingObject: myPlane2)

// แต่เดี๋ยวนะ เครื่องบินมันวางไข่ได้ด้วยหรอฟร้ะ !!!
myPlane2.layEgg()

// นี่แหละปัญหาของมัน แล้วจะทำยังไงดีล่ะ หรือบางที method fly มันไม่ควรที่จะสืบทอดได้กันนะ !!!
// นี่แหละครับคุณผู้ชม protocols ถึงถือกำเนิดขึ้นมาเพื่อจัดการกับปัญหานี้

protocol CanFly {
//    คือมันไม่ต้องมี {} อะนะเพราะว่า protocols มันเป็นแค่แม่แบบเฉย ๆ ไม่ได้มีไว้ให้เขียนฟังก์ชัน
    func fly()
}

//ทีนี้เราก็จะเอา protocols ไปใช้แหละ
// จะเห็นว่า method fly จะถูกเอาออกจากคลาสนกน้อย2 เพราะว่าไม่ใช่นกทุกตัวจะบินได้
class Bird2 {
    var isFemale = true
    
    func layEgg(){
        if isFemale {
            print("The bird makes a new bird in a shell.")
        }
    }
}

// จากนั้นก็ลองเอาน้องไปใช้กับอินทรีอหังการ 2
// อันนี้คือเราบอกว่า อินทรีน้อยมันเป็นนก แล้วมันก็สามารถที่จะบินได้ด้วย
class Eagle2 : Bird2 , CanFly {
    
    func fly(){
        print("The eagle its wings and lifts off into the sky.")
    }
    
    func soar(){
        print("The eagle glides in the air using air currents.")
    }
}

// ลองมาดูที่แพนกวิ้นต่อ
// จะเห็นว่าเราไม่ต้องใส่ CanFly ลงไปเพราะแพนกวิ้นที่ไหนมันบินได้ฟร้ะ
class Pengiun2:Bird2{
    
}

// ลองเอาไปใช้กับเครื่องบินที่เป็น struct ดู
// จะเห็นว่า protocol สามารถใช้กับ struct ได้ด้วยแหละ
struct AirPlane : CanFly {
    func fly() {
        print("The airplane its wings and lifts off into the sky.")
    }
}

/*
 ประโยชน์ของ protocols คืออะไร
 แล้วเรานึกภาพว่าตอนแรกที่เครื่องบินมันก็บินได้เหมือนนก แล้วเราก็ไปสืบทอดคุณสมบัติของนกมาให้เครื่องบิน แต่ทีนี้เครื่องบินมันดันวางไข่ได้นี่แหละ
 ในขณะที่การใช้ protocols เข้ามาช่วยแก้ปัญหานี้คือนกก็ยังบินได้เหมือนเดิม แต่เครื่องบินที่บินได้ ก็ไม่จำเป็นอะไรที่ต้องสืบทอดความสามารถของนกมาแล้ว ดังนั้นมันเลยทำให้เครื่องบินสามารถเป็นเครื่องบินได้อย่างที่มันควรจะเป็น
 นอกจากนี้เราก็ยังเห็นว่า แพนกวิ้นมันสืบทอดคุณสมบัติมาจากนกน้อย แต่มันบินไม่ได้ protocol ก็เข้ามาช่วยแก้ปัญหานี้ได้ด้วย
 */
