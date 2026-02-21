import Foundation

enum MajorArcanaInterpretationsEN {
    static let all: [TarotCard: CardMeanings] = [
        // MARK: - 0. The Fool
        .theFool: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Freedom", "Adventure", "Innocence", "New beginnings"],
                generalMeaning: "This is a time to fearlessly take a new step forward. Open your heart to unknown possibilities and trust your intuition as you move ahead.",
                feelingsContext: "This person feels a pure, excited sense of wonder about you. They are not overthinking things and simply enjoy being around you. They find you refreshingly attractive and are filled with anticipation about where things might go.",
                advice: "Don't overthink it -- just be yourself and enjoy the new developments as they unfold."
            ),
            reversed: CardInterpretation(
                keywords: ["Recklessness", "Carelessness", "Indecision", "Impulsiveness"],
                generalMeaning: "Be careful of unplanned actions and hasty judgments. In the pursuit of freedom, make sure you are not overlooking something truly important.",
                feelingsContext: "This person has unstable feelings about your connection. While there is interest, they may not yet be ready to commit seriously. Behind their unpredictable behavior lies a hidden fear of commitment.",
                advice: "Be patient, respect their pace, and focus on building a grounded relationship."
            )
        ),

        // MARK: - I. The Magician
        .theMagician: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Creativity", "Willpower", "Talent", "Confidence", "Manifestation"],
                generalMeaning: "You have the power to manifest what you desire. Make the most of your talents and skills, and take bold, decisive action.",
                feelingsContext: "This person feels a strong attraction to your charm and potential. They are drawn to your talent and confidence, and feel elevated when they are with you. They see you as someone truly special.",
                advice: "Trust in your abilities and take the leap to express your feelings."
            ),
            reversed: CardInterpretation(
                keywords: ["Manipulation", "Deception", "Immaturity", "Wasted effort"],
                generalMeaning: "You may be misusing your talents or abilities. Rather than putting on a facade, it is time to take an honest look at your true self.",
                feelingsContext: "This person may harbor doubts or distrust toward you. They sense contradictions in your words and actions, and are unsettled by not being able to see your true intentions. Surface-level charm alone is not enough to win their heart.",
                advice: "Have the courage to show your authentic self and build trust through sincerity."
            )
        ),

        // MARK: - II. The High Priestess
        .theHighPriestess: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Intuition", "Mystery", "Inner voice", "Stillness", "Wisdom"],
                generalMeaning: "It is time to listen to your intuition and inner voice. You have the ability to perceive hidden truths beyond what appears on the surface.",
                feelingsContext: "This person is captivated by your mysterious, deep allure. They want to know everything about you, yet feel a sense of reverence that keeps them at a respectful distance. They are quietly and deeply thinking of you, though their feelings are not easily expressed.",
                advice: "Do not rush for answers -- trust your intuition and wait patiently."
            ),
            reversed: CardInterpretation(
                keywords: ["Secrets", "Confusion", "Ignoring intuition", "Superficiality"],
                generalMeaning: "You may be ignoring your intuition or overlooking important information. Be honest with the true feelings deep within your heart.",
                feelingsContext: "This person is hiding their feelings toward you, or may not even understand their own emotions. They could be holding onto a secret they cannot share. Because they have closed off their heart, their true feelings are difficult to reach.",
                advice: "Try to sense the truth behind their silence, and start by being honest with your own feelings."
            )
        ),

        // MARK: - III. The Empress
        .theEmpress: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Abundance", "Nurturing", "Love", "Beauty", "Prosperity"],
                generalMeaning: "This is a time filled with love and abundance. Your natural warmth and ability to embrace those around you will attract wonderful outcomes.",
                feelingsContext: "This person feels deep affection and a sense of security with you. Your kindness and warmth genuinely comfort them, and being near you fills them with a warm, peaceful feeling. A desire to cherish and protect you is blossoming within them.",
                advice: "Express your love generously and welcome the other person with open arms."
            ),
            reversed: CardInterpretation(
                keywords: ["Dependency", "Overprotectiveness", "Insecurity", "Stagnation"],
                generalMeaning: "Your care and affection may have gone too far, or conversely, you may not be taking good enough care of yourself. Reassess the balance between giving and receiving.",
                feelingsContext: "This person may be feeling smothered or stifled in the relationship. Whether from demanding too much affection or giving too much of yourself, the balance has been disrupted. They may be longing for more personal space.",
                advice: "Before pouring love into someone else, prioritize filling your own cup first."
            )
        ),

        // MARK: - IV. The Emperor
        .theEmperor: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Authority", "Stability", "Responsibility", "Leadership", "Structure"],
                generalMeaning: "It is time to build a solid foundation and establish order. By taking responsibility and approaching things methodically, you will achieve stable results.",
                feelingsContext: "This person feels a sense of reliability and stability with you. They are drawn to your steadfast demeanor and decisiveness, and feel secure in your presence. They may be seriously considering you as a life partner.",
                advice: "Show your dependable side while remaining flexible enough to listen to their perspective."
            ),
            reversed: CardInterpretation(
                keywords: ["Domination", "Stubbornness", "Tyranny", "Intimidation"],
                generalMeaning: "You may be becoming too controlling or losing your flexibility. Let go of rigid attachment to power or position and listen to what others have to say.",
                feelingsContext: "This person may feel intimidated or pressured by you. Your strength can sometimes come across as domineering, making them feel unable to voice their own opinions. They desire a relationship built on equality.",
                advice: "Let go of the need to control and strive to meet the other person as an equal."
            )
        ),

        // MARK: - V. The Hierophant
        .theHierophant: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Tradition", "Faith", "Guidance", "Morality", "Commitment"],
                generalMeaning: "Honoring tradition and established values will open the way forward. Listen to the counsel of those you trust and walk the right path.",
                feelingsContext: "This person views your relationship with sincerity and earnestness. They hold deep trust and respect for you and desire a long-term connection. They may even be considering marriage or a serious committed relationship.",
                advice: "Deepen the relationship with sincerity and heartfelt devotion through a genuine approach."
            ),
            reversed: CardInterpretation(
                keywords: ["Dogma", "Restriction", "Rebellion", "Rigidity"],
                generalMeaning: "You are too caught up in outdated values or formalities. Find the courage to examine your own beliefs and choose what truly matters.",
                feelingsContext: "This person feels suffocated by formal expectations or pressures within the relationship. They may want a free-spirited connection between just the two of you, rather than one dictated by social appearances. They have a strong desire not to be bound by existing rules.",
                advice: "Let go of social expectations and fixed ideas, and focus on what truly matters to both of you."
            )
        ),

        // MARK: - VI. The Lovers
        .theLovers: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Love", "Harmony", "Choice", "Union", "Partnership"],
                generalMeaning: "This is a time blessed with deep bonds and affection. An important choice is before you, and it is essential to follow your heart when making your decision.",
                feelingsContext: "This person has strong romantic feelings for you. They sense you may be their destined partner and long to connect with you deeply on both an emotional and physical level. They treasure the relationship above all else and are seriously envisioning a future together.",
                advice: "Open your heart, embrace the love before you, and nurture the bond between you."
            ),
            reversed: CardInterpretation(
                keywords: ["Disharmony", "Hesitation", "Temptation", "Conflicting values"],
                generalMeaning: "Disharmony or indecision has crept into the relationship. You need to confront differences in values and think deeply about what kind of relationship you truly want.",
                feelingsContext: "This person is experiencing doubt and inner conflict about your relationship. There may be someone else on their mind, or they may be troubled by differences in values. While feelings exist, they are hesitant to fully commit.",
                advice: "Do not blame them for their indecision -- instead, clarify for yourself what kind of relationship you truly desire."
            )
        ),

        // MARK: - VII. The Chariot
        .theChariot: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Victory", "Determination", "Willpower", "Triumph", "Drive"],
                generalMeaning: "It is time to push forward with strong resolve. You have the strength to overcome obstacles, and by charging toward your goal, victory will be yours.",
                feelingsContext: "This person has a fierce determination to win your heart. Driven by their feelings for you, they want to pursue you actively. Even if obstacles arise, they are filled with the passion to overcome anything to be by your side.",
                advice: "Move forward with confidence and do not be afraid to stand firm in your feelings."
            ),
            reversed: CardInterpretation(
                keywords: ["Recklessness", "Frustration", "Loss of direction", "Forcefulness"],
                generalMeaning: "Charging ahead on momentum alone will lead to spinning your wheels. Stop, take a breath, and calmly assess the right direction to take.",
                feelingsContext: "This person has feelings for you but is anxious and unsure of how to proceed. They are torn between the urge to pursue you aggressively and the fear of rejection. They may be struggling to keep their emotions in check.",
                advice: "Impatience and forcefulness will backfire -- step back, calm down, and rethink your approach."
            )
        ),

        // MARK: - VIII. Strength
        .strength: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Inner strength", "Patience", "Courage", "Compassion", "Resilience"],
                generalMeaning: "True strength lies within gentleness. By facing challenges with patience and compassion, you will discover your authentic power.",
                feelingsContext: "This person is deeply attracted to your inner strength and kindness. They are moved by your calm yet unwavering nature, and their feelings are a blend of admiration and affection. Being with you makes them feel they can become stronger too.",
                advice: "Let gentleness and patience be your strengths, and build trust with the other person without rushing."
            ),
            reversed: CardInterpretation(
                keywords: ["Self-doubt", "Insecurity", "Anxiety", "Emotional overwhelm"],
                generalMeaning: "You are unable to believe in your own strength and are being consumed by anxiety. Do not give in to fear -- it is time to reclaim your inner power.",
                feelingsContext: "This person lacks confidence in their feelings for you and is wrestling with anxiety. They care for you but are afraid of being hurt, and cannot show their vulnerability. Their emotional instability may occasionally lead to unpredictable behavior.",
                advice: "Acknowledging your own vulnerability is the first step toward true strength."
            )
        ),

        // MARK: - IX. The Hermit
        .theHermit: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Introspection", "Solitude", "Soul-searching", "Wisdom", "Guidance"],
                generalMeaning: "Cherish your time alone and look deeply inward. Through quiet reflection, you will find important insights and answers.",
                feelingsContext: "This person is quietly thinking of you, but they are currently in a period of inner reflection. Their feelings for you are genuine, but they are not yet ready to show them. They are taking time alone to understand what they truly feel.",
                advice: "Give both yourself and the other person time to think, and wait quietly for clarity."
            ),
            reversed: CardInterpretation(
                keywords: ["Isolation", "Withdrawal", "Stubbornness", "Alienation"],
                generalMeaning: "Your solitude has gone too far, pushing away the connections you need. It is time to open your heart and reconnect with others.",
                feelingsContext: "This person has closed their heart to you or is keeping their distance. Past experiences have made it difficult for them to trust, and they are putting up walls against your affection. Deep down they feel lonely, but they refuse to admit it.",
                advice: "Do not force closeness -- instead, be a safe and reassuring presence they can open up to."
            )
        ),

        // MARK: - X. Wheel of Fortune
        .wheelOfFortune: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Turning point", "Destiny", "Opportunity", "Change", "Cycles"],
                generalMeaning: "The wheels of fate are turning, and a major turning point has arrived. Go with the flow and seize the opportunity before it passes.",
                feelingsContext: "This person feels that meeting you was destined. The timing is falling into place, and they sense the relationship is about to take a significant turn. They want to cherish this special connection with you.",
                advice: "Trust in the flow of destiny and have the courage to seize the opportunity that has come your way."
            ),
            reversed: CardInterpretation(
                keywords: ["Misfortune", "Stagnation", "Setbacks", "Unexpected changes"],
                generalMeaning: "The flow of fortune has stalled, or unexpected changes have left you bewildered. Remember that setbacks are temporary and prepare for the next opportunity.",
                feelingsContext: "This person feels that the timing is off with you. Even though feelings exist, circumstances may not allow things to progress, and they feel toyed with by fate. This is a period of stagnation, but it will not last forever.",
                advice: "Timing is always shifting -- endure for now and wait for the next window of opportunity."
            )
        ),

        // MARK: - XI. Justice
        .justice: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Fairness", "Truth", "Balance", "Accountability", "Clarity"],
                generalMeaning: "Fair and truthful judgment is called for. If you act with honesty, just outcomes will follow.",
                feelingsContext: "This person holds fair and sincere feelings toward you. They are evaluating the relationship honestly and want to face it with genuine intent. They desire to build a connection founded on truth rather than games or deception.",
                advice: "Stay true to your integrity and approach the other person with honest feelings."
            ),
            reversed: CardInterpretation(
                keywords: ["Injustice", "Bias", "Dishonesty", "Avoidance of responsibility"],
                generalMeaning: "Unfair circumstances or dishonest behavior are creating problems. Reflect on your actions and work to restore balance.",
                feelingsContext: "This person may feel that the relationship is unbalanced. There may be a sense that one person is giving far more than the other, or that sincerity is lacking. They are beginning to question the foundation of trust between you.",
                advice: "Reexamine the balance of the relationship and place honesty and mutual sincerity above all else."
            )
        ),

        // MARK: - XII. The Hanged Man
        .theHangedMan: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Sacrifice", "Patience", "New perspective", "Letting go", "Surrender"],
                generalMeaning: "Now is a time to wait rather than act. By shifting your perspective, you will gain new insights and find meaning even in seemingly unfavorable situations.",
                feelingsContext: "This person is prepared to endure or sacrifice something for your sake. Although they cannot act on their feelings just yet, their affection for you is quietly deepening. They understand that waiting is itself an expression of love right now.",
                advice: "Do not force things -- wait patiently for the situation to shift on its own."
            ),
            reversed: CardInterpretation(
                keywords: ["Pointless sacrifice", "Clinging", "Stagnation", "Needless suffering"],
                generalMeaning: "Are you continuing to make sacrifices or endure pain that serves no purpose? Recognize that you are tormenting yourself by clinging to what should be released.",
                feelingsContext: "This person is feeling exhausted by the relationship or suffering from unrequited devotion. They are reaching their limit with waiting and are beginning to question whether things should stay as they are. They are starting to doubt whether one-sided sacrifice is worth it.",
                advice: "Stop making meaningless self-sacrifices and look at the relationship from a fresh perspective."
            )
        ),

        // MARK: - XIII. Death
        .death: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Endings and beginnings", "Transformation", "Rebirth", "Transition"],
                generalMeaning: "One chapter is closing and a new one is about to begin. By letting go of the old, true transformation and rebirth become possible.",
                feelingsContext: "This person senses a profound shift in their relationship with you. The old dynamic is ending, and something new is being born in its place. They have a deep wish to let go of who they used to be and build a fresh connection with you.",
                advice: "Accept endings without fear, and a door to a deeper relationship will open."
            ),
            reversed: CardInterpretation(
                keywords: ["Resistance to change", "Clinging", "Stagnation", "Lingering attachments"],
                generalMeaning: "You are resisting necessary change and clinging to the past. Recognize what needs to be released and find the courage to embrace transformation.",
                feelingsContext: "This person is clinging to past memories or old dynamics and cannot move forward. They strongly resist changing the relationship with you and refuse to accept growth or transformation. By holding onto what has already ended, they are losing sight of new possibilities.",
                advice: "Letting go of attachments to the past is the first step toward a new future."
            )
        ),

        // MARK: - XIV. Temperance
        .temperance: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Harmony", "Balance", "Patience", "Healing", "Moderation"],
                generalMeaning: "This is a time to value balance and harmony. By avoiding extremes and moving forward with patience and calm, you will achieve the best possible outcome.",
                feelingsContext: "This person feels a gentle, steady affection for you. Rather than fiery passion, they treasure the deep bond of a heart-to-heart connection. Being with you brings balance and healing to their spirit.",
                advice: "Take it slowly without rushing, and nurture a well-balanced relationship."
            ),
            reversed: CardInterpretation(
                keywords: ["Imbalance", "Excess", "Impatience", "Discord"],
                generalMeaning: "The balance in your life or relationship has been disrupted. Rein in extreme behavior and impatience, and put effort into restoring harmony.",
                feelingsContext: "This person senses an imbalance in the relationship with you. The emotional temperature gap is too wide, or the timing is persistently off, causing them stress. They are prone to impulsive, extreme actions born of frustration.",
                advice: "To restore balance, pause, step back, and calmly take stock of the situation."
            )
        ),

        // MARK: - XV. The Devil
        .theDevil: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Temptation", "Bondage", "Obsession", "Desire", "Attachment"],
                generalMeaning: "You are trapped by desire and obsession, binding yourself in chains of your own making. To find true freedom, you must become aware of what is holding you captive.",
                feelingsContext: "This person feels an intense obsession and desire toward you. They are caught in a gravitational pull they cannot resist with reason alone, feeling they cannot live without you. However, this is less a healthy love and more an overwhelming, consuming desire.",
                advice: "Learn to distinguish between passion and obsession, and aim for a relationship that respects each other's freedom."
            ),
            reversed: CardInterpretation(
                keywords: ["Liberation", "Breaking free", "Reclaiming freedom", "Awakening"],
                generalMeaning: "There are signs of liberation from bondage and dependency. You are beginning to see what was truly holding you captive, and the strength to break free is rising within you.",
                feelingsContext: "This person is gradually freeing themselves from their previous obsessive or unhealthy feelings toward you. They are recognizing old patterns of dependency and beginning to want a healthier way of relating to you. They are reconsidering what true love really means.",
                advice: "Break free from unhealthy relationship patterns and build a connection rooted in equality and freedom."
            )
        ),

        // MARK: - XVI. The Tower
        .theTower: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Upheaval", "Shock", "Sudden change", "Destruction and renewal", "Revelation"],
                generalMeaning: "Sudden, shocking events are unfolding, but this destruction is necessary. What was built on falsehood is crumbling, and the truth is being laid bare.",
                feelingsContext: "This person has been profoundly shaken by you. Their previous beliefs and assumptions have been overturned at the core, and their emotions are in turmoil. Though the experience is shocking, this upheaval serves as a catalyst for awakening to their true feelings.",
                advice: "Do not fear sudden change -- prepare yourself to accept the truth that emerges from the rubble."
            ),
            reversed: CardInterpretation(
                keywords: ["Avoidance", "Fear of change", "Delaying the inevitable", "Internal collapse"],
                generalMeaning: "You are postponing necessary change out of fear. Understand that the longer you avoid it, the greater the eventual impact will be.",
                feelingsContext: "This person is turning a blind eye to the problems in your relationship. Deep down they know change is necessary, but they cling to the status quo out of fear of collapse. Despite nearing a breaking point, they refuse to acknowledge it.",
                advice: "Face the inevitable change head-on and take the first step toward rebuilding."
            )
        ),

        // MARK: - XVII. The Star
        .theStar: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Hope", "Healing", "Inspiration", "Faith", "Renewal"],
                generalMeaning: "After hardship, a ray of hope is breaking through. Trust in the universe and believe in your path, and healing and renewal will follow.",
                feelingsContext: "This person feels a pure and beautiful sense of hope because of you. You are like a light in the darkness for them, and being with you makes them feel hopeful about the future. They are dreaming of an ideal relationship and quietly nurturing deep affection.",
                advice: "Carry hope in your heart -- simply being true to yourself is the most beautiful approach."
            ),
            reversed: CardInterpretation(
                keywords: ["Despair", "Loss of faith", "Disillusionment", "Loneliness"],
                generalMeaning: "You have lost sight of hope and are feeling disappointed and alone. But the starlight has not gone out -- it is merely hidden behind clouds. Reclaim your ability to believe.",
                feelingsContext: "This person has lost the ability to hold expectations for the relationship with you. They are disillusioned by the gap between their ideals and reality and are on the verge of losing hope. The bright vision of the future they once held is fading, replaced by anxiety and loneliness.",
                advice: "When hope seems lost, finding even the smallest light and continuing to believe is what matters most."
            )
        ),

        // MARK: - XVIII. The Moon
        .theMoon: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Illusion", "Anxiety", "Subconscious", "Intuition", "Secrets"],
                generalMeaning: "This is a time when things are unclear and difficult to see. Do not be swayed by fears or illusions -- move forward carefully, guided by your intuition.",
                feelingsContext: "This person harbors complex and ambiguous feelings toward you. There is affection, but they are confused and unable to pinpoint exactly what they feel. Deep in their subconscious they are drawn to you, but anxiety and fear are veiling those feelings.",
                advice: "Do not be misled by uncertainty -- trust your intuition and wait for the truth to reveal itself."
            ),
            reversed: CardInterpretation(
                keywords: ["Clarity emerging", "Overcoming fear", "Truth revealed", "Escaping confusion"],
                generalMeaning: "Truths that were previously hidden are beginning to come to light. You are being freed from fear and anxiety, and the fog is starting to lift.",
                feelingsContext: "This person is gradually emerging from their previous confusion and doubt. Their feelings toward you are becoming clearer, and misunderstandings and anxieties are starting to dissolve. Hidden emotions are beginning to surface.",
                advice: "Now that the fog is clearing, summon the resolve to face the truth squarely."
            )
        ),

        // MARK: - XIX. The Sun
        .theSun: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Joy", "Success", "Vitality", "Happiness", "Radiance"],
                generalMeaning: "The brightest and most joyful period is upon you. Everything is moving smoothly, and your days are filled with happiness and energy.",
                feelingsContext: "This person feels overflowing joy and happiness because of you. Being with you fills their heart with genuine brightness, and they honestly feel they adore you. Your very presence shines like the sun in their heart, and they are directing pure, unconcealed love toward you.",
                advice: "Embrace this happy time fully and approach the other person with open, honest feelings."
            ),
            reversed: CardInterpretation(
                keywords: ["Self-doubt", "Temporary setback", "Delays", "Suppressed joy"],
                generalMeaning: "Your natural brightness and confidence are temporarily dimmed. But the sun has not disappeared -- the power to shine again already lives within you.",
                feelingsContext: "This person has feelings for you but is unable to express them openly. A lack of confidence or past wounds are getting in the way, causing them to hide how they truly feel. They enjoy being with you, yet resist admitting it to themselves.",
                advice: "Regain your confidence and let your natural warmth shine through in your interactions."
            )
        ),

        // MARK: - XX. Judgement
        .judgement: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Rebirth", "Awakening", "Reckoning", "Forgiveness", "Calling"],
                generalMeaning: "You stand at a crucial turning point in life. By reflecting on the past and seeking forgiveness, the time has come to awaken to a new stage.",
                feelingsContext: "This person is facing a momentous decision about their relationship with you. Through past experiences, their feelings for you are becoming unmistakably clear. They carry a strong resolve and desire for another chance -- to start over with you.",
                advice: "Forgive the past and make the decision to begin the relationship anew."
            ),
            reversed: CardInterpretation(
                keywords: ["Regret", "Self-criticism", "Indecisiveness", "Clinging to the past"],
                generalMeaning: "Regret over the past and self-doubt are holding you back from moving forward. Forgive yourself and stop putting off the decisions that need to be made.",
                feelingsContext: "This person is carrying regret and uncertainty about the relationship with you. They wish they could undo past mistakes, yet waver between that desire and the inability to speak up. The fear that they may not be forgiven is paralyzing their ability to decide.",
                advice: "Let go of past regrets and be honest about your feelings in this very moment."
            )
        ),

        // MARK: - XXI. The World
        .theWorld: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Completion", "Fulfillment", "Wholeness", "Achievement", "Perfect harmony"],
                generalMeaning: "A great cycle is reaching its completion. Everything is in harmony, and this is a magnificent time of fulfillment and accomplishment.",
                feelingsContext: "This person feels a sense of perfect happiness with you. They are convinced that you are the one they have been searching for, and they feel deep fulfillment and a sense of completeness in the relationship. They have no doubts about a future with you -- everything feels as though it has fallen into place.",
                advice: "Savor this sense of completion while beginning to prepare for the next chapter ahead."
            ),
            reversed: CardInterpretation(
                keywords: ["Incompletion", "Unfulfillment", "Delays", "Almost there"],
                generalMeaning: "You are stalled just one step short of completion. Something feels missing, but do not give up -- take that final step forward.",
                feelingsContext: "This person feels that something is still missing in the relationship with you. Their feelings are strong, yet they cannot shake a lingering sense of incompleteness. They feel the frustration of being so close to wholeness yet unable to find that final missing piece.",
                advice: "Do not rush -- calmly identify what is missing and take that last step forward."
            )
        )
    ]
}
