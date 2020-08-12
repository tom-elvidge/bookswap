//
//  BookViewModel.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import Foundation

struct Book {
    var id: String
    var title: String
    var authors: [String]
    var publisher: String
    var description: String
    var imageUrlString: String?
    var liked: Bool
    var inLibrary: Bool
}

class BookViewModel: ObservableObject {
    
    // books variable since there is no database or api yet.
    private var books: Dictionary<String, Book> = [
        "twok":
            Book.init(
                id: "twok",
                title: "The Way Of Kings",
                authors: ["Brandon Sanderson"],
                publisher: "Tom Doherty Associates",
                description: """
                    Roshar is a world of stone and storms. Uncanny tempests of incredible power sweep across the rocky terrain so frequently that they have shaped ecology and civilization alike. Animals hide in shells, trees pull in branches, and grass retracts into the soilless ground. Cities are built only where the topography offers shelter.

                    It has been centuries since the fall of the ten consecrated orders known as the Knights Radiant, but their Shardblades and Shardplate remain: mystical swords and suits of armor that transform ordinary men into near-invincible warriors. Men trade kingdoms for Shardblades. Wars were fought for them, and won by them.

                    One such war rages on a ruined landscape called the Shattered Plains. There, Kaladin, who traded his medical apprenticeship for a spear to protect his little brother, has been reduced to slavery. In a war that makes no sense, where ten armies fight separately against a single foe, he struggles to save his men and to fathom the leaders who consider them expendable.

                    Brightlord Dalinar Kholin commands one of those other armies. Like his brother, the late king, he is fascinated by an ancient text called The Way of Kings. Troubled by over-powering visions of ancient times and the Knights Radiant, he has begun to doubt his own sanity.

                    Across the ocean, an untried young woman named Shallan seeks to train under an eminent scholar and notorious heretic, Dalinar's niece, Jasnah. Though she genuinely loves learning, Shallan's motives are less than pure. As she plans a daring theft, her research for Jasnah hints at secrets of the Knights Radiant and the true cause of the war.

                    The result of over ten years of planning, writing, and world-building, The Way of Kings is but the opening movement of the Stormlight Archive, a bold masterpiece in the making.
                """,
                imageUrlString: "https://books.google.co.uk/books/content?id=OHclhBVv-X4C&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70RrVfXXH7QYI5FvdO4BzrOLNu9RSu0Z9mTxvEUImicW6bguAWWTF9swwZiFpIIrWV-ia-cjvX_gRD0SBp44-M_zWw_t8ufl9IvFWIIDfEbiyW0N86oHLpNdbi_dohptsMGP0iU",
                liked: false,
                inLibrary: false
            ),
        "aq":
            Book.init(
                id: "aq",
                title: "Assassin's Quest",
                authors: ["Robin Hobb"],
                publisher: "Random House Publishing Group",
                description: """
                From an extraordinary new voice in fantasy comes the stunning conclusion to the Farseer trilogy, as FitzChivalry confronts his destiny as the catalyst who holds the fate of the kingdom of the Six Duchies...and the world itself.

                King Shrewd is dead at the hands of his son Regal. As is Fitz--or so his enemies and friends believe. But with the help of his allies and his beast magic, he emerges from the grave, deeply scarred in body and soul. The kingdom also teeters toward ruin: Regal has plundered and abandoned the capital, while the rightful heir, Prince Verity, is lost to his mad quest--perhaps to death. Only Verity's return--or the heir his princess carries--can save the Six Duchies.

                But Fitz will not wait. Driven by loss and bitter memories, he undertakes a quest: to kill Regal. The journey casts him into deep waters, as he discovers wild currents of magic within him--currents that will either drown him or make him something more than he was....
                """,
                imageUrlString: "https://books.google.co.uk/books/content?id=-T0cz9BZ_DcC&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73cLjoC7cGzi1kY95iLn3UqHA0a84w01F9rBzSgZ1_Abq-EhzgMJRC5pHDkNBzHf2bS335xpAyNblGJAQjIaov3mLGXOQyDLhYunY3saJ1IM_XmS1Ji1Sy6S8DdYe8eHTAHBuL1",
                liked: true,
                inLibrary: false
            ),
        "tfe":
            Book.init(
                id: "tfe",
                title: "The Final Empire",
                authors: ["Brandon Sanderson"],
                publisher: "Tom Doherty Associates",
                description: """
                    For a thousand years the ash fell and no flowers bloomed. For a thousand years the Skaa slaved in misery and lived in fear. For a thousand years the Lord Ruler, the "Sliver of Infinity," reigned with absolute power and ultimate terror, divinely invincible. Then, when hope was so long lost that not even its memory remained, a terribly scarred, heart-broken half-Skaa rediscovered it in the depths of the Lord Ruler's most hellish prison. Kelsier "snapped" and found in himself the powers of a Mistborn. A brilliant thief and natural leader, he turned his talents to the ultimate caper, with the Lord Ruler himself as the mark.

                    Kelsier recruited the underworld's elite, the smartest and most trustworthy allomancers, each of whom shares one of his many powers, and all of whom relish a high-stakes challenge. Only then does he reveal his ultimate dream, not just the greatest heist in history, but the downfall of the divine despot.

                    But even with the best criminal crew ever assembled, Kel's plan looks more like the ultimate long shot, until luck brings a ragged girl named Vin into his life. Like him, she's a half-Skaa orphan, but she's lived a much harsher life. Vin has learned to expect betrayal from everyone she meets, and gotten it. She will have to learn to trust, if Kel is to help her master powers of which she never dreamed.
                """,
                imageUrlString: "https://books.google.co.uk/books/content?id=t_ZYYXZq4RgC&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE71JvwxFbjo2mpjOtztxz0q6wCs3g6OCPn1OkjfTbVNjmWtgN8qaM17nFyTGhPlFzIqv440vABsKBDf4flz37Kr8V47bS5cUPr8VXipB2Ucd9LUgPlAxPuQVYHQlJaZAKv9i1oEp",
                liked: false,
                inLibrary: true
            ),
        "sd":
            Book.init(id: "sd", title: "Shoe Dog", authors: ["Phil Knight"], publisher: "Simon & Schuster UK", description: "A memoir by the creator of Nike.", liked: false, inLibrary: true)
    ]

    @Published var book: Book?
    
    init(bookId: String) {
        // Attempt to get the Book with the passed bookId.
        if let book = books[bookId] {
            // A Book with bookId exists, set Book.
            self.book = book
        } else {
            // No Book with bookId.
            print("Error: No Book with bookId.")
        }
    }
    
    func toggleLike() {
        if let book = self.book {
            // Update database and published variable.
            self.book!.liked = !book.liked
        } else {
            // Error
            print("Error: No Book.")
        }
    }
    
    func toggleInLibrary() {
        if let book = self.book {
            // Update database and published variable.
            self.book!.inLibrary = !book.inLibrary
        } else {
            // Error
            print("Error: No Book.")
        }
    }
    
}
