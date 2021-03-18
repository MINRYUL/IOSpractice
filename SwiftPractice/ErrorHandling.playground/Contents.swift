import UIKit

//스위프트에서 에러를 처리하는데 두가지 단계가 있음.
//첫번째는 iOS 앱의 메소드 내에서 원하는 결과가 나오지 않을 경우.
//두번째는 메소드가 던진 에러를 잡아서 처리하는 것.
//에러 타입은 Error 프로토콜을 따르는 모든 값이 될 수 있다.

//에러타입 선언하기
//네트워크 연결이 없거나, 네트워크 속도가 너무 느리거나, 전송하는 파일을 찾지 못한다거나 하는 에러는 다음과 같다.
//Error 프로토콜을 따르는 열거형으로 표현 가능.
enum FileTrasferErrorExample: Error {
    case noConnection
    case lowBandwithd
    case fileNotFound
}

//guard 구문을 이용한 에러 쓰로잉
//에러를 던지는데는 throws 키워드를 사용.
//결과를 반환하는 메소드 함수의 경우, throws 키워드는 반환 타입 앞에 위치하게 된다.
func transferFile() throws -> Bool {
    //...
    return false
}

//에러를 던지는 로직은 throws 구문의 throw 와 guard 구문을 이용한다.
var connection = true
var connectionSpeed = 30.00
var fileFound = false

enum FileTransferError: Error {
    case noConnection
    case lowBandwithd
    case fileNotFound
}

func fileTransfer() throws {
    guard connection else {
        throw FileTransferError.noConnection
    }
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwithd
    }
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
}
//guard 구문의 조건문이 false인 경우에는 else 절에 해당하는 에러 쓰로잉이 발생한다.

//에러를 던지는 함수 호출하기.
//메소드 또는 함수에 에러를 던지는 로직이 포함돼 있다면, 함수를 호출할때 일반적인 방법으로 호출할 수 없다.
//이런 함수는 호출할 때 try 구문을 앞에 분여야 한다.
//try fileTransfer()

//에러 핸들링 함수는 do-catch 구문과 함께 사용된다.
func checkSendingFile() -> String {
    do{
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return "NO NETWORK CONNECTION"
    } catch FileTransferError.lowBandwithd {
        return "FILE TRANSFER SPEED IS TOW LOW"
    } catch FileTransferError.fileNotFound {
        return "FILE NOT FOUND"
    } catch {
        return "UNKNOWN ERROR"
    }
    return "TRANSFER SUCCESS"
}
//파일 전송을 체크하는 함수. do 내에서 fileTransfer() 함수가 에러를 던질경우, catch 구문이 각 에러에 해당되는 문자열을 반환하게 돼 있다. 아무런 에러가 없을 경우 전송 성공 문자열 반환.
//마지막 catch는 'catch all' 구문으로, 패턴매칭이 이뤄지지 않은 모든 에러에대해 "UNKNOWN ERROR"를 반환. do-catch 구문은 가능한 모든 에러에 대해 처리할 수 있도록 구성돼야 하기에, 이런 로직이 필요.

//defer 구문의 사용
//checkSendingFile() 함수는 에러 발생시 해당되는 문자열을 반환하고 제어권을 반환, 하지만 제어권을 반환하기 전에 추가적인 작업을 하는 것이 효율적일 때가 있다.
//파일 전송의 경우 제어권을 반환하기 전에 임시 파일들을 지워야 하는 경우가 있다. 이런 작업은 defer 구문을 이용. defer 구문은 함수가 결과를 반환하기 직전에 실행되어야 하는 코드를 지정할 수 있게 해줌.
func checkSendingFile2() -> String {
    defer {
        //removeTemporalFiles()
        //closeConnection()
    }
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection {
        return "NO NETWORK CONNECTION"
    } catch FileTransferError.lowBandwithd {
        return "FILE TRANSFER SPEED IS TOW LOW"
    } catch FileTransferError.fileNotFound {
        return "FILE NOT FOUND"
    } catch {
        return "UNKNOWN ERROR"
    }
    return "TRANSFER SUCCESS"
}
//이제 checkSendingFile2() 함수는 제어권을 반환하기 전에 removeTemporalFile() 함수와 closeConnection 함수가 항상 호촐된다.
