// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "Insert and Containts") {
    let trie = Trie<String>()
    trie.insert("cute")

    if trie.contains("cute") {
        print("cute is in the trie")
    }
}

example(of: "remove") {
  let trie = Trie<String>()
  trie.insert("cut")
  trie.insert("cute")
  print("\n*** Before removing ***")
  assert(trie.contains("cut"))
  print("\"cut\" is in the trie")
  assert(trie.contains("cute"))
  print("\"cute\" is in the trie")
  print("\n*** After removing cut ***")
  trie.remove("cut")
  assert(!trie.contains("cut"))
  assert(trie.contains("cute"))
  print("\"cute\" is still in the trie")
}
