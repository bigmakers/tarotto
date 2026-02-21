import Foundation

enum PentaclesInterpretationsEN {
    static let all: [TarotCard: CardMeanings] = [
        // MARK: - Ace of Pentacles
        .pentaclesAce: CardMeanings(
            upright: CardInterpretation(
                keywords: ["New beginnings", "Prosperity", "Abundance", "Opportunity"],
                generalMeaning: "A new opportunity for material wealth and stability is arriving. This card signals the start of financial security, a new venture, or a concrete path toward real-world success.",
                feelingsContext: "This person senses fresh potential in you. They feel that being with you could lead to a stable and prosperous future, and they are genuinely excited about starting or deepening the relationship. There is a grounded optimism in their heart when they think of you.",
                advice: "Seize the opportunity in front of you and take a solid, grounded first step forward."
            ),
            reversed: CardInterpretation(
                keywords: ["Missed opportunity", "Poor planning", "Financial insecurity", "Unrealistic expectations"],
                generalMeaning: "You may be missing a valuable chance, or your plans are not coming together as expected. Pay attention to financial instability and avoid overestimating outcomes.",
                feelingsContext: "This person feels uncertain about the future with you. They want to move things forward but sense the timing is off, or practical concerns are weighing heavily on their mind. The desire is there, but real-world doubts are holding them back.",
                advice: "Avoid rushing and take the time to build a more realistic and solid plan."
            )
        ),

        // MARK: - Two of Pentacles
        .pentacles2: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Balance", "Adaptability", "Flexibility", "Juggling priorities"],
                generalMeaning: "You are skillfully managing multiple responsibilities at once. Flexibility and adaptability are needed, but you have the resourcefulness to handle it well.",
                feelingsContext: "This person is trying to balance their feelings for you with other demands in their life. They do have genuine affection for you, but work, obligations, or other circumstances are competing for their attention and emotional energy.",
                advice: "Prioritize what truly matters and maintain balance with a lighthearted, flexible approach."
            ),
            reversed: CardInterpretation(
                keywords: ["Overwhelm", "Imbalance", "Indecision", "Scattered energy"],
                generalMeaning: "You are taking on too much and losing your sense of balance. It may be time to let go of something to regain stability.",
                feelingsContext: "This person is emotionally overwhelmed and unable to give your relationship the attention it deserves. It is not that they dislike you; they are simply stretched too thin and struggling to sort out their own feelings amid the chaos.",
                advice: "Stop overextending yourself and focus your energy on what is most important."
            )
        ),

        // MARK: - Three of Pentacles
        .pentacles3: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Teamwork", "Skill", "Growth", "Collaboration", "Effort"],
                generalMeaning: "Your hard work is being recognized, and collaboration with others is producing meaningful results. This is a time of skill development and tangible progress.",
                feelingsContext: "This person sees you as a trustworthy partner they can build something real with. They admire your abilities and your willingness to put in effort, and they feel a deep respect for what you bring to the table.",
                advice: "Value collaboration with those around you and keep honing your skills steadily."
            ),
            reversed: CardInterpretation(
                keywords: ["Lack of teamwork", "Mediocrity", "Misalignment", "Neglect"],
                generalMeaning: "Your efforts may be misdirected, or cooperation with others is breaking down. It might be time to return to the basics and reassess your approach.",
                feelingsContext: "This person senses a disconnect between you and them. They feel that your values or goals are not quite aligned, or they are frustrated by a perceived lack of effort being put into the relationship.",
                advice: "Let go of the need to do everything alone and humbly accept input from others."
            )
        ),

        // MARK: - Four of Pentacles
        .pentacles4: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Stability", "Security", "Possessiveness", "Conservation"],
                generalMeaning: "You have achieved financial stability and are holding on to what you have built. However, being too protective may cause you to miss new opportunities.",
                feelingsContext: "This person does not want to let go of you. They feel a strong desire to preserve the stable bond you share. However, their fear of change may make it difficult for them to express their feelings openly or allow the relationship to evolve naturally.",
                advice: "Cherish stability but avoid clinging too tightly; leave room for growth."
            ),
            reversed: CardInterpretation(
                keywords: ["Greed", "Instability", "Letting go", "Stinginess"],
                generalMeaning: "You may be clinging too tightly to material things or, conversely, being careless with your resources. It is time to reexamine your relationship with security and control.",
                feelingsContext: "This person feels insecure about the relationship and is either trying to control it or starting to give up. Trust has been shaken, and they are afraid to open their heart fully to you.",
                advice: "Release your attachment to control and embrace a more flexible attitude."
            )
        ),

        // MARK: - Five of Pentacles
        .pentacles5: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Hardship", "Isolation", "Worry", "Loss", "Adversity"],
                generalMeaning: "This is a period of financial difficulty or emotional isolation. Remember that help is available if you are willing to reach out and ask for it.",
                feelingsContext: "This person feels vulnerable and anxious about you. They worry that things between you will not work out, and they may believe they are not good enough for you. This insecurity is causing them to pull away, even though they wish they could be closer.",
                advice: "Do not suffer alone; have the courage to reach out to someone you trust."
            ),
            reversed: CardInterpretation(
                keywords: ["Recovery", "Hope", "End of hardship", "Resilience"],
                generalMeaning: "The worst of the difficulty is passing, and circumstances are slowly beginning to improve. Take things one step at a time on the road to recovery.",
                feelingsContext: "This person's earlier anxieties about you are starting to fade. They have not fully opened up yet, but a quiet desire to reconnect and give things another chance is beginning to take root in their heart.",
                advice: "The hardest part is behind you, so move forward with renewed optimism."
            )
        ),

        // MARK: - Six of Pentacles
        .pentacles6: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Generosity", "Sharing", "Fairness", "Support"],
                generalMeaning: "Giving and receiving are in healthy balance. Mutual support and generosity are creating a cycle of abundance in your life.",
                feelingsContext: "This person wants to give wholeheartedly to you. They feel a strong urge to help and support you, and their kindness toward you comes from a place of genuine, selfless affection with no strings attached.",
                advice: "Be grateful to those around you and practice generosity without hesitation."
            ),
            reversed: CardInterpretation(
                keywords: ["Inequality", "Strings attached", "Dependency", "Exploitation"],
                generalMeaning: "The balance between giving and receiving has been disrupted. Watch out for one-sided dynamics or unfair situations in your relationships.",
                feelingsContext: "This person feels an imbalance in the relationship with you. They may believe they are giving far more than they receive, or they may be aware of leaning on you too heavily. They long for equality but are struggling to express it.",
                advice: "Reassess the give-and-take in your relationships and strive for genuine fairness."
            )
        ),

        // MARK: - Seven of Pentacles
        .pentacles7: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Patience", "Evaluation", "Long-term vision", "Reflection"],
                generalMeaning: "It is time to step back and evaluate the fruits of your labor. Take a long-term perspective and avoid making hasty decisions about the future.",
                feelingsContext: "This person is carefully reflecting on their relationship with you. They are looking back on everything you have shared and thoughtfully weighing whether to continue investing in this connection. They have not lost interest; it is precisely because they take you seriously that they need time to think.",
                advice: "Trust the work you have already put in and wait patiently for results."
            ),
            reversed: CardInterpretation(
                keywords: ["Impatience", "Frustration", "Doubt", "Wasted effort"],
                generalMeaning: "You feel that your efforts have not produced the results you expected, leading to frustration and doubt. A change of direction may be worth considering.",
                feelingsContext: "This person feels stuck when it comes to you. They are growing impatient and wondering whether waiting any longer will lead anywhere. There is an internal debate about whether to keep trying or walk away.",
                advice: "Step back, objectively assess the situation, and be open to changing course if needed."
            )
        ),

        // MARK: - Eight of Pentacles
        .pentacles8: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Diligence", "Mastery", "Focus", "Dedication", "Craftsmanship"],
                generalMeaning: "Steady effort and continuous learning are paying off. By approaching each task with care and dedication, your skills and results will grow consistently.",
                feelingsContext: "This person wants to nurture the relationship with you through patient, steady effort. They may not be flashy or dramatic, but their feelings are sincere. They are willing to work hard to build trust and a solid bond with you over time.",
                advice: "Keep putting in consistent effort and learn something valuable from every experience."
            ),
            reversed: CardInterpretation(
                keywords: ["Laziness", "Perfectionism", "Boredom", "Lack of focus"],
                generalMeaning: "You have lost direction in your efforts, and motivation is declining. You may be paralyzed by perfectionism or simply losing interest.",
                feelingsContext: "This person is starting to feel a sense of routine or boredom in the relationship. Their feelings for you still exist, but they find it hard to put energy into improving things, or they are unsure what steps to take next.",
                advice: "Instead of chasing perfection, start by giving careful attention to what is right in front of you."
            )
        ),

        // MARK: - Nine of Pentacles
        .pentacles9: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Self-sufficiency", "Luxury", "Refinement", "Achievement", "Independence"],
                generalMeaning: "You have built prosperity and stability through your own efforts. Both materially and emotionally, you are in a place of fulfillment and elegant self-reliance.",
                feelingsContext: "This person respects you as someone who is independent and captivatingly self-assured. They are drawn to your refined presence and the way you carry yourself, and they see you as an equal partner they would be honored to stand beside.",
                advice: "Take pride in what you have built and enjoy life with grace."
            ),
            reversed: CardInterpretation(
                keywords: ["Dependence", "Superficiality", "Loneliness", "Self-doubt"],
                generalMeaning: "Outward appearances of success may be masking an inner emptiness. You may be relying too much on others or chasing status for its own sake.",
                feelingsContext: "This person finds you somewhat intimidating or unapproachable. You seem so complete on your own that they wonder whether there is room for them in your life. Part of them wishes you would show more vulnerability so they could feel needed.",
                advice: "Look beyond material comforts and tend to the fulfillment of your inner self."
            )
        ),

        // MARK: - Ten of Pentacles
        .pentacles10: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Legacy", "Family", "Lasting success", "Tradition", "Wealth"],
                generalMeaning: "Long-term stability, family bonds, and enduring prosperity are highlighted. This card represents success built on a solid foundation that can be passed down through generations.",
                feelingsContext: "This person deeply desires a lasting future with you. They envision building a family or a lifelong partnership together and feel a profound sense of love and security when they think about growing old with you.",
                advice: "Nurture bonds with family and loved ones, and invest in long-term happiness."
            ),
            reversed: CardInterpretation(
                keywords: ["Family conflict", "Financial disputes", "Instability", "Breaking tradition"],
                generalMeaning: "Family tensions or issues with long-term plans need your attention. Material wealth alone cannot provide the fulfillment you seek.",
                feelingsContext: "This person is troubled by external pressures surrounding your relationship. They may face opposition from family or feel weighed down by circumstances beyond their control. Their feelings for you are genuine, but practical and familial obstacles are causing them real distress.",
                advice: "Do not fixate on material wealth; rediscover the true value of your closest relationships."
            )
        ),

        // MARK: - Page of Pentacles
        .pentaclesPage: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Studiousness", "New learning", "Ambition", "Earnestness", "Potential"],
                generalMeaning: "A wonderful time to begin learning something new or exploring a fresh opportunity. A sincere and studious approach now will lead to great rewards in the future.",
                feelingsContext: "This person has a pure and earnest affection for you. They may be a bit awkward in expressing it, but they genuinely want to know you better and grow alongside you. Their interest is sincere, curious, and full of innocent potential.",
                advice: "Follow your curiosity and approach new endeavors with genuine dedication."
            ),
            reversed: CardInterpretation(
                keywords: ["Lack of planning", "Laziness", "Unrealistic goals", "Immaturity"],
                generalMeaning: "Your plans may be poorly formed, or you are chasing ideals without grounding them in reality. It is time to come down to earth and take concrete action.",
                feelingsContext: "This person is unsure how to express or act on their feelings for you. They are interested, but they feel it may be too soon, or they simply do not know what to do next. There is an endearing immaturity to their hesitation.",
                advice: "Move beyond daydreaming and take one small but concrete step forward."
            )
        ),

        // MARK: - Knight of Pentacles
        .pentaclesKnight: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Reliability", "Responsibility", "Persistence", "Steady progress"],
                generalMeaning: "Slow and steady wins the race. This card represents dependable, methodical progress fueled by a strong sense of duty and unwavering persistence.",
                feelingsContext: "This person holds unwavering, steadfast feelings for you. They may not be the most expressive or romantic, but their love shows through consistent actions and kept promises. They are someone you can truly count on, so give them time to show it.",
                advice: "Stay the course with patience and keep moving toward your goal one step at a time."
            ),
            reversed: CardInterpretation(
                keywords: ["Stubbornness", "Stagnation", "Boredom", "Inflexibility"],
                generalMeaning: "Your reliability has turned into rigidity, causing stagnation. Embrace flexibility and be open to change when circumstances demand it.",
                feelingsContext: "This person is feeling restless about the lack of change in your relationship. While the stability is comforting, there is a growing sense of monotony. They may quietly wish for a spark of excitement or some sign of evolution.",
                advice: "Loosen your grip on routine and welcome new approaches with an open mind."
            )
        ),

        // MARK: - Queen of Pentacles
        .pentaclesQueen: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Nurturing", "Abundance", "Practicality", "Warmth", "Comfort"],
                generalMeaning: "A time of warm generosity combined with practical wisdom. You are able to create a nurturing environment for others while also maintaining real-world prosperity.",
                feelingsContext: "This person feels deeply comforted and at peace around you. Being with you allows them to let their guard down and be their authentic self. They cherish you as a warm, dependable presence and hold deep, tender feelings of love for you.",
                advice: "Use your natural warmth and practical skills to create a supportive environment for those you love."
            ),
            reversed: CardInterpretation(
                keywords: ["Smothering", "Self-neglect", "Materialism", "Insecurity"],
                generalMeaning: "You may be giving too much of yourself to others at your own expense, or placing too much value on material comforts. Remember to take care of yourself first.",
                feelingsContext: "This person may feel guilty about relying on your kindness too heavily, or they may be starting to feel smothered by your attentiveness. They appreciate you, but they may need a little more space and independence within the relationship.",
                advice: "Before taking care of everyone else, make your own well-being the top priority."
            )
        ),

        // MARK: - King of Pentacles
        .pentaclesKing: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Success", "Stability", "Leadership", "Generosity", "Provider"],
                generalMeaning: "You have reached a place of material success and solid stability. Backed by experience and proven results, you enjoy well-earned confidence and the trust of those around you.",
                feelingsContext: "This person feels a powerful desire to protect and provide for you. They want to be your rock, both financially and emotionally, and they take deep satisfaction in being someone you can depend on. They are serious about building an unshakable future together.",
                advice: "Lead with the confidence of your achievements and the warmth of a generous heart."
            ),
            reversed: CardInterpretation(
                keywords: ["Greed", "Controlling", "Materialism", "Stubbornness"],
                generalMeaning: "An excessive attachment to success or a tendency to wield power over others is present. Remember that material wealth alone cannot bring true satisfaction.",
                feelingsContext: "This person wants to be in charge of the relationship. Their feelings for you are real, but those feelings manifest as controlling behavior or possessiveness. They crave dominance rather than true partnership, and their need to have things their way is overshadowing genuine connection.",
                advice: "Set aside the pursuit of money and status, and never lose sight of humility and human warmth."
            )
        )
    ]
}
