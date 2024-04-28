//
//  NamedSFX.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI
import AudioToolbox

extension SystemSoundID {
   static func returnedNamedSFXArray() -> [NamedSFX] {
        let nameArray:[String] = ["new-mail.caf", "mail-sent.caf", "Voicemail.caf", "ReceivedMessage.caf", "SentMessage.caf", "alarm.caf", "low_power.caf", "sms-received1.caf", "sms-received2.caf", "sms-received3.caf", "sms-received4.caf", "MSReceived_Vibrate", "sms-received1.caf", "sms-received5.caf", "sms-received6.caf", "Voicemail.caf", "tweet_sent.caf", "Anticipate.caf", "Bloom.caf", "Calypso.caf", "Choo_Choo.caf", "Descent.caf", "Fanfare.caf", "Ladder.caf", "Minuet.caf", "News_Flash.caf", "Noir.caf", "Sherwood_Forest.caf", "Spell.caf", "Suspense.caf", "Telegraph.caf", "Tiptoes.caf", "Typewriters.caf", "Update.caf", "ussd.caf", "SIMToolkitCallDropped.caf", "SIMToolkitGeneralBeep.caf", "SIMToolkitNegativeACK.caf", "SIMToolkitPositiveACK.caf", "SIMToolkitSMS.caf", "Tink.caf", "ct-busy.caf", "ct-congestion.caf", "ct-path-ack.caf", "ct-error.caf", "ct-call-waiting.caf", "ct-keytone2.caf", "lock.caf", "unlock.caf", "FailedUnlock", "Tink.caf", "Tock.caf", "Tock.caf", "beep-beep.caf", "RingerChanged.caf", "photoShutter.caf", "shake.caf", "jbl_begin.caf", "jbl_confirm.caf", "jbl_cancel.caf", "begin_record.caf", "end_record.caf", "jbl_ambiguous.caf", "jbl_no_match.caf", "begin_video_record.caf", "end_video_record.caf", "vc~invitation-accepted.caf", "vc~ringing.caf", "vc~ended.caf", "ct-call-waiting.caf", "vc~ringing.caf", "dtmf-0.caf", "dtmf-1.caf", "dtmf-2.caf", "dtmf-3.caf", "dtmf-4.caf", "dtmf-5.caf", "dtmf-6.caf", "dtmf-7.caf", "dtmf-8.caf", "dtmf-9.caf", "dtmf-star.caf", "dtmf-pound.caf", "long_low_short_high.caf", "short_double_high.caf", "short_low_high.caf", "short_double_low.caf", "short_double_low.caf", "middle_9_short_double_low.caf", "Voicemail.caf", "ReceivedMessage.caf", "new-mail.caf", "mail-sent.caf", "alarm.caf", "lock.caf", "Tock.caf", "sms-received1.caf", "sms-received2.caf", "sms-received3.caf", "sms-received4.caf", "SMSReceived_Vibrate", "sms-received1.caf", "sms-received5.caf", "sms-received6.caf", "Voicemail.caf", "Anticipate.caf", "Bloom.caf", "Calypso.caf", "Choo_Choo.caf", "Descent.caf", "Fanfare.caf", "Ladder.caf", "Minuet.caf", "News_Flash.caf", "Noir.caf", "Sherwood_Forest.caf", "Spell.caf", "Suspense.caf", "Telegraph.caf", "Tiptoes.caf", "Typewriters.caf", "Update.caf", "RingerVibeChanged", "SilentVibeChanged", "Vibrate"]
        let soundArray = [1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1050, 1051, 1052, 1053, 1054, 1055, 1057, 1070, 1071, 1072, 1073, 1074, 1075, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1150, 1151, 1152, 1153, 1154, 1200, 1201, 1202, 1203, 1204, 1205, 1206, 1207, 1208, 1209, 1210, 1211, 1254, 1255, 1256, 1257, 1258, 1259, 1300, 1301, 1302, 1303, 1304, 1305, 1306, 1307, 1308, 1309, 1310, 1311, 1312, 1313, 1314, 1315, 1320, 1321, 1322, 1323, 1324, 1325, 1326, 1327, 1328, 1329, 1330, 1331, 1332, 1333, 1334, 1335, 1336, 1350, 1351, 4095]
        
        var returnArray: [NamedSFX] = []
        for i in 0...soundArray.count - 1 {
            let sfxToAdd = NamedSFX(soundID: UInt32(soundArray[i]), name: nameArray[i])
            returnArray.append(sfxToAdd)
        }
        return returnArray
    }
    
    static func returnRandomSFX() -> NamedSFX {
        let sFX = returnedNamedSFXArray()
        guard let rtnSFX = sFX.randomElement() else { return NamedSFX(soundID: UInt32(4095), name: "Vibrate") }
        return rtnSFX
    }
    
    static func returnSFX(at index: Int) -> NamedSFX {
        var firstArray = returnedNamedSFXArray()
        let secondArray = returnedNamedSFXArray()
        for sfx in secondArray {
            firstArray.append(sfx)
        }
        if index <= firstArray.count {
            return firstArray[index]
        } else {
            return NamedSFX(soundID: 4095, name: "Vibrate")
        }
        
        
        
        
    }
}

struct NamedSFX {
    let soundID: SystemSoundID
    let name: String
}

func playSystemSound(soundID: SystemSoundID) {
    AudioServicesPlaySystemSound(soundID)
    
}

extension View {
    func playSound(isPressed: Bool, sound: NamedSFX) -> some View  {
        if isPressed {
            playSystemSound(soundID: sound.soundID)
        }
        return self
    }
}
