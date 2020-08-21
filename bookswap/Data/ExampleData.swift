//
//  ExampleData.swift
//  bookswap
//
//  Created by Tom Elvidge on 13/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import Foundation

class ExampleData {
    
    var books: Dictionary<String, Book> = [
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
                imageUrlString: "https://books.google.co.uk/books/content?id=OHclhBVv-X4C&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE70RrVfXXH7QYI5FvdO4BzrOLNu9RSu0Z9mTxvEUImicW6bguAWWTF9swwZiFpIIrWV-ia-cjvX_gRD0SBp44-M_zWw_t8ufl9IvFWIIDfEbiyW0N86oHLpNdbi_dohptsMGP0iU"
            ),
        "tnotw":
            Book.init(
                id: "tnotw",
                title: "The Name Of The Wind",
                authors: ["Patrick Rothfuss"],
                publisher: "Hachette UK",
                description: """
                    'This is a magnificent book' Anne McCaffrey
                    'I was reminded of Ursula K. Le Guin, George R. R. Martin, and J. R. R. Tolkein, but never felt that Rothfuss was imitating anyone' THE TIMES
                    'I have stolen princesses back from sleeping barrow kings. I burned down the town of Trebon. I have spent the night with Felurian and left with both my sanity and my life. I was expelled from the University at a younger age than most people are allowed in. I tread paths by moonlight that others fear to speak of during day. I have talked to Gods, loved women, and written songs that make the minstrels weep. My name is Kvothe. You may have heard of me' So begins the tale of Kvothe - currently known as Kote, the unassuming innkeepter - from his childhood in a troupe of traveling players, through his years spent as a near-feral orphan in a crime-riddled city, to his daringly brazen yet successful bid to enter a difficult and dangerous school of magic. In these pages you will come to know Kvothe the notorious magician, the accomplished thief, the masterful musician, the dragon-slayer, the legend-hunter, the lover, the thief and the infamous assassin.
                """,
                imageUrlString: "https://books.google.com/books/content?id=BcG2dVRXKukC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
            ),
        "twmf":
            Book.init(
                id: "twmf",
                title: "The Wise Man's Fear",
                authors: ["Patrick Rothfuss"],
                publisher: "Penguin",
                description: """
                    Discover #1 New York Times-bestselling Patrick Rothfuss’ epic fantasy series, The Kingkiller Chronicle. “I just love the world of Patrick Rothfuss.” —Lin-Manuel Miranda • “He’s bloody good, this Rothfuss guy.” —George R. R. Martin • “Rothfuss has real talent.” —Terry Brooks DAY TWO: THE WISE MAN’S FEAR “There are three things all wise men fear: the sea in storm, a night with no moon, and the anger of a gentle man.” My name is Kvothe. You may have heard of me. So begins a tale told from his own point of view—a story unequaled in fantasy literature. Now in The Wise Man’s Fear, Day Two of The Kingkiller Chronicle, Kvothe takes his first steps on the path of the hero and learns how difficult life can be when a man becomes a legend in his own time. Praise for The Kingkiller Chronicle: “The best epic fantasy I read last year.... He’s bloody good, this Rothfuss guy.” —George R. R. Martin, New York Times-bestselling author of A Song of Ice and Fire “Rothfuss has real talent, and his tale of Kvothe is deep and intricate and wondrous.” —Terry Brooks, New York Times-bestselling author of Shannara \"It is a rare and great pleasure to find a fantasist writing...with true music in the words.\" —Ursula K. Le Guin, award-winning author of Earthsea \"The characters are real and the magic is true.” —Robin Hobb, New York Times-bestselling author of Assassin’s Apprentice \"Masterful.... There is a beauty to Pat's writing that defies description.\" —Brandon Sanderson, New York Times-bestselling author of Mistborn
                """,
                imageUrlString: "https://books.google.com/books/content?id=dLo_GyEykjQC&printsec=frontcover&img=1&zoom=1&source=gbs_api"
            ),
        "tsrost":
            Book.init(
                id: "tsrost",
                title: "The Slow Regard Of Silent Things",
                authors: ["Patrick Rothfuss"],
                publisher: "Gollancz",
                description: """
                    The University, a renowned bastion of knowledge, attracts the brightest minds to unravel the mysteries of enlightened sciences like artificing and alchemy. Yet deep below its bustling halls lies a complex and cavernous maze of abandoned rooms and ancient passageways - and in the heart of it all lives Auri. Formerly a student at the University, now Auri spends her days tending the world around her. She has learned that some mysteries are best left settled and safe. No longer fooled by the sharp rationality so treasured by the University, Auri sees beyond the surface of things, into subtle dangers and hidden names. At once joyous and haunting, THE SLOW REGARD OF SILENT THINGS is a rich, atmospheric and lyrical tale, featuring one of the most beloved characters from Rothfuss' acclaimed fantasy series.
                """,
                imageUrlString: "https://books.google.com/books/content?id=5291oAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
            ),
        "agot":
            Book.init(
                id: "agot",
                title: "A Game Of Thrones",
                authors: ["George R. R. Martin"],
                publisher: "Voyager",
                description: """
                    Now available in a specially priced edition--the first volume in an epic series by a master of contemporary fantasy, filled with mystery, intrigue, romance, and adventure. Reissue.
                """,
                imageUrlString: "https://books.google.com/books/content?id=72aHpwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
            ),
        "aa":
            Book.init(
                id: "aa",
                title: "Assassin's Apprentice",
                authors: ["Robin Hobb"],
                publisher: "HarperCollins UK",
                description: """
                    ‘Fantasy as it ought to be written’ George R.R. Martin
                """,
                imageUrlString: "https://books.google.com/books/content?id=95X0eL8VZvgC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
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
                imageUrlString: "https://books.google.co.uk/books/content?id=-T0cz9BZ_DcC&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73cLjoC7cGzi1kY95iLn3UqHA0a84w01F9rBzSgZ1_Abq-EhzgMJRC5pHDkNBzHf2bS335xpAyNblGJAQjIaov3mLGXOQyDLhYunY3saJ1IM_XmS1Ji1Sy6S8DdYe8eHTAHBuL1"
            ),
        "ra":
            Book.init(
                id: "ra",
                title: "Royal Assassin",
                authors: ["Robin Hobb"],
                publisher: "HarperCollins UK",
                description: """
                    ‘Fantasy as it ought to be written’ George R.R. Martin The second volume in Robin Hobb’s internationally bestselling Farseer Trilogy.
                """,
                imageUrlString: "https://books.google.com/books/content?id=Gd8IGxmHxucC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
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
                imageUrlString: "https://books.google.co.uk/books/content?id=t_ZYYXZq4RgC&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE71JvwxFbjo2mpjOtztxz0q6wCs3g6OCPn1OkjfTbVNjmWtgN8qaM17nFyTGhPlFzIqv440vABsKBDf4flz37Kr8V47bS5cUPr8VXipB2Ucd9LUgPlAxPuQVYHQlJaZAKv9i1oEp"
            )
    ]
    
    var users: Dictionary<String, User> = [
        "tom":
            User.init(
                username: "tom",
                displayName: "Tom Elvidge",
                about: "I'm looking for new fantasy books. Some of my favourite fantasy authors are Brandson Sanderson, Patrick Rothfuss and Robin Hobb.",
                likes: [],
                library: []
            ),
        "steve":
            User.init(
                username: "steve",
                displayName: "Steve Bloggs",
                about: "I'm looking for anything by Brandon Sanderson.",
                likes: [],
                library: []
            )
    ]
    
    var subsections: Dictionary<String, Subsection> = [
        "matchRightNow":
            Subsection.init(
                id: "matchRightNow",
                title: "Match Right Now",
                subtitle: "Readers with these books are interested in your library.",
                books: []
            ),
        "recentlyAdded":
            Subsection.init(
                id: "recentlyAdded",
                title: "Recently Added",
                subtitle: "These books have been added by other readers recently.",
                books: []
            )
    ]
    
    // Initialise subsections, users and Session as they depend on books.
    init() {
        // Add books to subsections.
        subsections["matchRightNow"]!.books.append(contentsOf: [books["aa"]!, books["aq"]!, books["ra"]!])
        subsections["recentlyAdded"]!.books.append(contentsOf: [books["tsrost"]!, books["twok"]!, books["tfe"]!, books["agot"]!])
        
        // Add books to tom's library and likes.
        users["tom"]!.likes.append(contentsOf: [books["twmf"]!, books["tsrost"]!])
        users["tom"]!.library.append(contentsOf: [books["twok"]!, books["tfe"]!, books["tnotw"]!, books["agot"]!])
        
        // Add books to steve's library and likes.
        users["steve"]!.likes.append(contentsOf: [books["tfe"]!, books["twok"]!])
        users["steve"]!.library.append(contentsOf: [books["aa"]!, books["aq"]!, books["ra"]!])
    }
    
    // Make ExampleData a singleton for ease of use.
    private static var exampleData = ExampleData()
    
    // Make ExampleData a singleton for ease of use.
    static func getExampleData() -> ExampleData {
        return exampleData
    }
    
    func getSubsections() -> [String] {
        return Array(subsections.keys)
    }
    
    func getSubsection(id: String) -> Subsection? {
        if let subsection = subsections[id] {
            // A Subsection with id exists, return it.
            return subsection
        } else {
            // No Subsection with id, print error, return nil.
            print("Error: No Subsection with id.")
            return nil
        }
    }
    
    func getBrowseSubsections() -> [Subsection] {
        var subsections: [Subsection] = []
        for id in ["matchRightNow", "recentlyAdded"] {
            if let subsection = getSubsection(id: id) {
                subsections.append(subsection)
            }
        }
        return subsections
    }
    
    func getUsers() -> [String] {
        return Array(users.keys)
    }
    
    func getUser(username: String) -> User? {
        if let user = users[username] {
            // A User with id exists, return it.
            return user
        } else {
            // No User with id, print error, return nil
            print("Error: No User with username.")
            return nil
        }
    }
    
    func getBooks() -> [String] {
        return Array(books.keys)
    }
    
    func getBook(id: String) -> Book? {
        if let book = books[id] {
            // A Book with id exists, return it.
            return book
        } else {
            // No Book with id, print error, return nil.
            print("Error: No Book with id.")
            return nil
        }
    }
    
}
