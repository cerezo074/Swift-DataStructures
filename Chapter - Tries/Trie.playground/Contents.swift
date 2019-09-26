// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

//example(of: "Insert and Containts") {
//    let trie = Trie<String>()
//    trie.insert("cute")
//
//    if trie.contains("cute") {
//        print("cute is in the trie")
//    }
//}
//
//example(of: "Remove") {
//  let trie = Trie<String>()
//  trie.insert("cut")
//  trie.insert("cute")
//  print("\n*** Before removing ***")
//  assert(trie.contains("cut"))
//  print("\"cut\" is in the trie")
//  assert(trie.contains("cute"))
//  print("\"cute\" is in the trie")
//  print("\n*** After removing cut ***")
//  trie.remove("cut")
//  assert(!trie.contains("cut"))
//  assert(trie.contains("cute"))
//  print("\"cute\" is still in the trie")
//}

//example(of: "Prefix matching") {
//    let trie = Trie<String>()
//    trie.insert("car")
//    trie.insert("card")
//    trie.insert("care")
//    trie.insert("cared")
//    trie.insert("cars")
//    trie.insert("carbs")
//    trie.insert("carapace")
//    trie.insert("cargo")
//
//    print("\nCollections starting with \"car\"")
//    let prefixedWithCar = trie.collections(startWith: "car")
//    print(prefixedWithCar)
//
//    print("\nCollections starting with \"care\"")
//    let prefixedWithCare = trie.collections(startWith: "care")
//    print(prefixedWithCare)
//}

example(of: "Challenge") {
    let trie = Trie<String>()
    print(trie.isEmpty)
    trie.insert("car")
    print(trie.isEmpty)
    trie.insert("card")
    trie.insert("care")
    trie.insert("cared")
    trie.insert("cars")
    trie.insert("carbs")
    trie.insert("carapace")
    trie.insert("cargo")

    print(trie.collections)
    print(trie.count)
    trie.remove("car")
    print(trie.collections)
    print(trie.count)
}
