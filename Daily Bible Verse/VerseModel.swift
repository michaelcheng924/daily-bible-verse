//
//  verses.swift
//  Daily Bible Verse
//
//  Created by Michael Cheng on 1/1/24.
//

import Foundation

struct Verse: Identifiable {
    let id = UUID()
    var verse: String
    var esvTranslation: String
    var kjvTranslation: String
    var devotional: String
    
    static var sampleVerse = Verse(verse: "Sample Verse", esvTranslation: "For the wages of sin is death, but the free gift of God is eternal life in Christ Jesus our Lord.", kjvTranslation: "Sample KJV", devotional: "Sample devotional")
    
    static var verses = [
        Verse(
                verse: "Genesis 1:1",
                esvTranslation: "In the beginning, God created the heavens and the earth.",
                kjvTranslation: "In the beginning God created the heaven and the earth.",
                devotional: "This first verse of the Bible establishes that God is the all-powerful Creator of everything, the only eternal being that exists outside of time and space. Recognizing God's role as Creator helps us live with proper humility, awe, and thankfulness towards Him."
            ),
            Verse(
                verse: "John 3:16",
                esvTranslation: "For God so loved the world, that he gave his only Son, that whoever believes in him should not perish but have eternal life.",
                kjvTranslation: "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.",
                devotional: "This popular verse summarizes the gospel - that God deeply loves us and sent His Son Jesus to die on our behalf, so that if we believe in Him we can have a relationship with God and eternal life with Him."
            ),
            Verse(
                verse: "Romans 6:23",
                esvTranslation: "For the wages of sin is death, but the free gift of God is eternal life in Christ Jesus our Lord.",
                kjvTranslation: "For the wages of sin is death; but the gift of God is eternal life through Jesus Christ our Lord.",
                devotional: "This verse contrasts the consequences of sin (death) and the gift of salvation (eternal life). It reminds us that on our own we only deserve death, but by God's grace through Christ, we can receive the free gift of eternal life instead."
            ),
            Verse(
                verse: "Philippians 4:13",
                esvTranslation: "I can do all things through him who strengthens me.",
                kjvTranslation: "I can do all things through Christ which strengtheneth me.",
                devotional: "Christ gives believers strength to endure any hardship or trial that comes our way. Through faith in Him, we gain access to a supernatural power that helps us push past our human limitations."
            ),
            Verse(
                verse: "John 14:6",
                esvTranslation: "Jesus said to him, “I am the way, and the truth, and the life. No one comes to the Father except through me.",
                kjvTranslation: "Jesus saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.",
                devotional: "Jesus proclaimed Himself as the only way to a relationship with God - He is the path to truth and life. This shows Christ's claim to be the long-awaited Messiah, the unique bridge between God and humanity through His sacrifice on the cross."
            )
    ]
}
