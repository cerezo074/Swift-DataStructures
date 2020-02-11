//: [Previous](@previous)

import Foundation

extension String {
    
    var isPalindromic: Bool {
        var leftOffset = 0
        var rightOffset = -1
        let loopLimit = (count / 2) + 1
        
        for _ in 0 ..< loopLimit {
            let leftIndex = index(startIndex, offsetBy: leftOffset)
            let leftCharacter = self[leftIndex]
            let rightIndex = index(endIndex, offsetBy: rightOffset)
            let rightCharacter = self[rightIndex]
            
            if leftCharacter != rightCharacter {
                return false
            }
            
            leftOffset += 1
            rightOffset -= 1
        }
        
        return true
    }
    
    typealias Palindromics = (longest: String, results: [String])
    
    var longestPalindromic: Palindromics? {
        var longestWord: String = ""
        var palindromicsArray: [String] = []
        
        for outterPosition in 0 ..< count {
            let rightRange = (outterPosition + 1) ..< count
            
            for innerPosition in rightRange.reversed() {
                guard let substring = self.substring(from: outterPosition, to: innerPosition) else {
                    continue
                }
                
                if substring.isPalindromic {
                    palindromicsArray.append(substring)
                    
                    if longestWord.count < substring.count {
                        longestWord = substring
                    }
                }
            }
        }
        
        guard !palindromicsArray.isEmpty,
            !longestWord.isEmpty else {
            return nil
        }
        
        return Palindromics(longestWord, palindromicsArray)
    }

    func substring(from leftPosition: Int, to rightPosition: Int) -> String? {
        guard rightPosition <= count - 1,
            rightPosition > leftPosition,
            leftPosition >= 0 else {
            return nil
        }

        let leftIndex = index(startIndex, offsetBy: leftPosition)
        let rightOffset = (count - rightPosition) * -1
        let rightIndex = index(endIndex, offsetBy: rightOffset)

        guard leftIndex < rightIndex else {
            return nil
        }

        return String(self[leftIndex...rightIndex])
    }
    
}

print("hackerrekcahbahh".longestPalindromic?.longest)


//print("maozczjnseadaayfnulsmwudpusxhuckguvdifabzritrbplxnpipxptkqpxccihguncxifgmnnvsuilhvpwoqhtxzxvtoviuzqlaxiikwzaqhxpgyhvxcwpsbtpzhaoeyutbwfjqeicfqwonpczpikhyjuxqnnyuauvmlwybpaqtzrndgmxhsifcuruiiyvtmpgwfpcwjctzvvllobwvibqkuybnbwuclclfjvxrjmrhenllywzrvzeporsyvzfndsyxeaonkcwrozzvaozasjkaergembyukrxljmphejokijefgihydoxnminxapqkedjcydwyxutiupmlwzbbsntnyyuypfcpxxjvswjorctsolaprfezftapdscmzbqgnyodbvfqioehggsgbkuvcakwyxmdfddwohvcjqepyayahdfvgjajtaxaqiuxjqwgmgkfoyrgkgjcbtxcqcsauxtaqwxbuobspamviknjulmkejhcviizbyhwznhdljjiwnubxmsrppsajadvytuuaifqnmtyuyxyjpliwsziqhmcdokqccwenerualpqkpbncpsthhpayykdbgpefnmjbvblengnalyqszlijwowdfcceqmhvmlrkdpgjzeoulfgqeinldfziypuecfljnztjbzxikeyibntmrbzzvxaqoahgyldlsmrvikojesciggpozklaqtomtuytewjamhztwafyiybglxcgrcijgagubdacboqnmkyqpjdgyuaksxqctxohpgkmaxavoawkqcqocaqbteozpmlbncgujplvniphywzmcxjhdkmqulprdxgfqnvougyharwxqjgoybvqwjutqtveldeptpruvfsfdtgklzmpjftbefgbaauizhuqfbvyztjaygqffpzxucvnofmunpazszvyfeuhkflqnofznbvoerajjiynpptahrkzlcegsmjcqldegjuslfonlsbrszqzjebrxmmxrbejzqzsrbslnoflsujgedlqcjmsgeclzkrhaptppnyijjareovbnzfonqlfkhuefyvzszapnumfonvcuxzpffqgyajtzyvbfquhziuaabgfebtfjpmzlkgtdfsfvurptpedlevtqtujwqvbyogjqxwrahyguovnqfgxdrpluqmkdhjxcmzwyhpinvlpjugcnblmpzoetbqacoqcqkwaovaxamkgphoxtcqxskauygdjpqykmnqobcadbugagjicrgcxlgbyiyfawtzhmajwetyutmotqalkzopggicsejokivrmsldlyghaoqaxvzzbrmtnbiyekixzbjtznjlfceupyizfdlnieqgfluoezjgpdkrlmvhmqeccfdwowjilzsqylangnelbvbjmnfepgbdkyyaphhtspcnbpkqplaurenewccqkodcmhqizswislpjyxyuytmnqfiauutyvdajaspprsmxbunwijjldhnzwhybziivchjekmlujnkivmapsboubxwqatxuascqcxtbcjgkgryofkgmgwqjxuiqaxatjajgvfdhayaylpeqjcvhowddfdmxywkacvukbgggheoiqfvbdoyngqbzmcsdpatfzefpalostcrojwsvjxxpcfpyuyyntnsbbzwlmpuituxywdycjdekqpaxnimnxodyhigfejikojehpmjlxrkuybmegreakjsazoavzzorwcknoaexysdnfzvysropezvcrzwyllnehrmjxvjflclcuwbnbyukqbivwbollvvztcjwcpfwgpmtvyiiurucfishxmgdnrztqapbywlmvuauynnqxujyhkipzcpnowqfcieqjfwbtuyeoahzptbspwcxvhygpxhqazwkiixalqzuivotvxzxthqowpvhliusvnnmgfixcnughiccxpqktpxpipnlpbrtirzbafidvugkcuhxsupduwmslunfyaadaesnjzczoam".longestPalindromic?.longest)

//Expected Result: ahrkzlcegsmjcqldegjuslfonlsbrszqzjebrxmmxrbejzqzsrbslnoflsujgedlqcjmsgeclzkrha
