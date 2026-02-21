import Foundation

// MARK: - Cups (Water Element): Emotions, Love, Relationships, Intuition, Feelings, Compassion
enum CupsInterpretationsEN {
    static let all: [TarotCard: CardMeanings] = [

        // MARK: - Ace of Cups
        .cupsAce: CardMeanings(
            upright: CardInterpretation(
                keywords: ["New love", "Emotional awakening", "Intuition", "Overflowing feelings"],
                generalMeaning: "The Ace of Cups heralds a new beginning in the emotional realm. A fresh wave of love, compassion, or creative inspiration is pouring into your life, bringing deep joy and spiritual fulfillment.",
                feelingsContext: "This person feels a pure and fresh affection blossoming toward you, much like the thrill of a first love. Your presence lights up their heart and fills them with a gentle warmth they have not felt in a long time. These feelings are still newly born, but they are sincere and full of promise.",
                advice: "Open your heart and welcome these new emotions with trust and gratitude."
            ),
            reversed: CardInterpretation(
                keywords: ["Emotional blockage", "Emptiness", "Repressed feelings", "Love withheld"],
                generalMeaning: "The reversed Ace of Cups suggests emotional suppression or a feeling of inner emptiness. There may be resistance to giving or receiving love, often rooted in past wounds or fear of vulnerability.",
                feelingsContext: "This person has feelings for you, but they are struggling to express them honestly. Past hurts and insecurities have built a wall around their heart, making it difficult for them to open up. They feel a frustrating tension between wanting to reach out and being afraid to let you in.",
                advice: "Listen to your inner voice and gently work through whatever is blocking the natural flow of your emotions."
            )
        ),

        // MARK: - Two of Cups
        .cups2: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Mutual attraction", "Partnership", "Harmony", "Soul connection"],
                generalMeaning: "The Two of Cups represents a deep bond built on mutual understanding and balanced affection. It speaks of a partnership where trust, respect, and genuine love flow equally between two people.",
                feelingsContext: "This person feels a profound and special connection with you. They see you as an equal partner whom they trust from the heart, and they feel completely at ease in your presence. There is a sense that your feelings are in harmony, creating a beautifully balanced emotional exchange.",
                advice: "Nurture this connection by honoring the mutual respect and open communication that sustains it."
            ),
            reversed: CardInterpretation(
                keywords: ["Imbalance", "Miscommunication", "Distrust", "One-sided affection"],
                generalMeaning: "The reversed Two of Cups points to disharmony or imbalance in a relationship. A lack of communication or eroded trust may be creating emotional distance between two people.",
                feelingsContext: "This person senses a growing distance between you and them. They feel that your feelings are out of sync, and there is a nagging frustration that things are not quite clicking. Deep down they want to be closer to you, but an undercurrent of doubt or miscommunication is making them uneasy.",
                advice: "Identify the root of the disconnect and commit to honest, heartfelt dialogue."
            )
        ),

        // MARK: - Three of Cups
        .cups3: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Celebration", "Friendship", "Shared joy", "Gratitude"],
                generalMeaning: "The Three of Cups is a card of celebration and communal happiness. Relationships are flourishing, and there is a sense of heartfelt gratitude for the people who bring warmth and laughter into your life.",
                feelingsContext: "This person feels genuinely happy and uplifted when they are with you. Your presence adds color and joy to their everyday life, and they are deeply grateful for the bond you share. There may be warm feelings developing beyond simple friendship, blossoming into something more affectionate.",
                advice: "Celebrate the bonds you share with others and let your gratitude flow freely."
            ),
            reversed: CardInterpretation(
                keywords: ["Isolation", "Superficiality", "Overindulgence", "Disappointment"],
                generalMeaning: "The reversed Three of Cups warns of shallow connections or excessive pleasure-seeking. Genuine emotional depth may be missing, leaving a sense of hollowness beneath the surface fun.",
                feelingsContext: "This person enjoys spending time with you, but their engagement remains largely on the surface. They are reluctant to go deeper or reveal their true feelings, preferring to keep things light and casual. There is a hesitance to be emotionally vulnerable with you.",
                advice: "Look beyond fleeting pleasures and invest in relationships that offer genuine depth and authenticity."
            )
        ),

        // MARK: - Four of Cups
        .cups4: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Apathy", "Discontent", "Contemplation", "Missed opportunity"],
                generalMeaning: "The Four of Cups speaks of emotional stagnation and dissatisfaction. You may be so focused on what seems lacking that you fail to notice the love and opportunities already being offered to you.",
                feelingsContext: "This person's interest in you has cooled or plateaued. It is not that you lack appeal; rather, they are caught in a state of inner restlessness and dissatisfaction. They are torn between craving something new and sitting with their current discontent, unable to fully appreciate what is right in front of them.",
                advice: "Shift your gaze from what is missing and recognize the blessings already within your reach."
            ),
            reversed: CardInterpretation(
                keywords: ["Renewed interest", "Motivation", "Awareness", "Seizing the moment"],
                generalMeaning: "The reversed Four of Cups signals a welcome awakening from apathy. Stagnant feelings are beginning to stir, and there is a fresh motivation to engage with life and love again.",
                feelingsContext: "This person is starting to realize just how much you mean to them. Qualities and kindnesses of yours that they previously overlooked are now coming into clear focus, sparking a desire to be more actively involved in your life. Their heart is beginning to move again.",
                advice: "Embrace this renewed motivation and channel it into meaningful action before the moment passes."
            )
        ),

        // MARK: - Five of Cups
        .cups5: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Loss", "Regret", "Grief", "Dwelling on the past"],
                generalMeaning: "The Five of Cups reflects sorrow over what has been lost or what never came to be. While grief is natural, this card reminds you that not everything is gone -- there are still cups standing that deserve your attention.",
                feelingsContext: "This person carries sadness and regret concerning your relationship. Something that was lost or a chance that slipped away weighs heavily on their heart, creating complicated emotions around you. They have not given up entirely, however; a quiet hope still lingers beneath the grief.",
                advice: "Allow yourself to grieve, but do not forget to turn around and see the love and possibilities that remain."
            ),
            reversed: CardInterpretation(
                keywords: ["Acceptance", "Recovery", "Moving forward", "Forgiveness"],
                generalMeaning: "The reversed Five of Cups signals a gradual recovery from past sorrow. You are beginning to accept what happened, release old pain, and open yourself to new beginnings.",
                feelingsContext: "This person is slowly healing from past hurts related to you. They are learning to let go of old regrets and resentments and are starting to view your connection with fresh eyes. The process is not yet complete, but their heart is mending and softening.",
                advice: "Have the courage to release the past and step forward into a new chapter with an open heart."
            )
        ),

        // MARK: - Six of Cups
        .cups6: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Nostalgia", "Happy memories", "Innocence", "Reunion"],
                generalMeaning: "The Six of Cups evokes fond memories and the sweetness of times gone by. It often signals a reconnection with someone from the past or a return to the simple, pure emotions of earlier days.",
                feelingsContext: "This person treasures the happy memories they share with you and holds them close to their heart. They feel a pure, warm affection toward you, often reminiscing about the good times you have spent together. There is a longing to return to that innocent, open-hearted way of relating to you.",
                advice: "Let your cherished memories inspire you, but stay fully present in the here and now."
            ),
            reversed: CardInterpretation(
                keywords: ["Clinging to the past", "Growth", "Facing reality", "Moving on"],
                generalMeaning: "The reversed Six of Cups suggests an unhealthy attachment to the past or, conversely, a turning point where you finally decide to move forward. Romanticizing what was may be preventing you from embracing what could be.",
                feelingsContext: "This person may be clinging too tightly to an old image of you or your past together, making it hard for them to see who you truly are now. Alternatively, they could be in the process of releasing those old attachments and working toward building a new, more grounded connection with you.",
                advice: "Honor the past for what it taught you, then redirect your energy toward the present and the future."
            )
        ),

        // MARK: - Seven of Cups
        .cups7: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Illusion", "Fantasy", "Temptation", "Wishful thinking"],
                generalMeaning: "The Seven of Cups presents a dazzling array of choices and daydreams, but not all of them are real. It is a call to distinguish between genuine opportunities and seductive illusions before committing your heart.",
                feelingsContext: "This person has built up many fantasies and idealized images around you. However, their feelings may not be entirely grounded in reality; they are partly in love with the version of you that exists in their imagination. Their attention may also be scattered, with other interests competing for their emotional focus.",
                advice: "Cut through the fog of fantasy and identify what truly matters to you with clear-eyed discernment."
            ),
            reversed: CardInterpretation(
                keywords: ["Clarity", "Decision-making", "Focus", "Determined will"],
                generalMeaning: "The reversed Seven of Cups marks the end of confusion and indecision. The illusions are fading, and you are ready to make a grounded choice about what -- and whom -- you truly want.",
                feelingsContext: "This person's feelings toward you are finally crystallizing. The haze of indecision and daydreaming is lifting, and they are beginning to face their emotions for you with honesty and realism. They are in the process of deciding what they truly want, and their focus is sharpening around you.",
                advice: "Trust the clarity that is emerging and commit to a choice that aligns with your authentic desires."
            )
        ),

        // MARK: - Eight of Cups
        .cups8: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Walking away", "Letting go", "Seeking deeper meaning", "Disillusionment"],
                generalMeaning: "The Eight of Cups depicts a courageous departure from an emotionally unfulfilling situation. Though the decision is painful, there is a deep inner knowing that something more meaningful awaits beyond the horizon.",
                feelingsContext: "This person is pulling away from you emotionally. They have encountered a sense of disappointment or limitation in the connection and feel the need to create distance. It is not that they dislike you; rather, they sense a need to walk their own path for the sake of personal growth and healing.",
                advice: "Have the courage to leave behind what no longer serves your soul, even if it hurts."
            ),
            reversed: CardInterpretation(
                keywords: ["Hesitation", "Lingering attachment", "Fear of change", "Reconsidering"],
                generalMeaning: "The reversed Eight of Cups reveals a struggle between the urge to move on and the pull of unfinished emotional business. Fear of the unknown or lingering attachment is keeping you rooted in place.",
                feelingsContext: "This person tried to distance themselves from you but finds they cannot fully let go. Lingering feelings and unresolved emotions keep drawing them back. They are caught in an internal tug-of-war, reconsidering whether leaving is truly what they want, because their attachment to you runs deeper than they expected.",
                advice: "Before you walk away, take an honest look at whether you are leaving for the right reasons or running from something that deserves another chance."
            )
        ),

        // MARK: - Nine of Cups
        .cups9: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Wish fulfillment", "Contentment", "Happiness", "Emotional satisfaction"],
                generalMeaning: "Known as the 'wish card,' the Nine of Cups radiates deep contentment and emotional fulfillment. Your heartfelt desires are coming true, and there is a profound sense of gratitude and joy.",
                feelingsContext: "This person feels a deep and abiding happiness because of you. They genuinely believe you are the one they have been wishing for, and being with you fills them with immense satisfaction. There is a sense of a dream realized, as though everything they hoped for in a connection has come together in you.",
                advice: "Savor this moment of fulfillment and let your heart overflow with gratitude for the blessings you have received."
            ),
            reversed: CardInterpretation(
                keywords: ["Dissatisfaction", "Greed", "Materialism", "Inner emptiness"],
                generalMeaning: "The reversed Nine of Cups suggests that despite outward appearances, something feels hollow inside. True contentment remains elusive, and there may be an unhealthy pursuit of more without appreciating what is already present.",
                feelingsContext: "This person feels a lingering dissatisfaction within your relationship, though it may have little to do with you personally. An insatiable inner restlessness prevents them from feeling fully content, always leaving them wanting more. They are wrestling with their own inability to simply be happy with what they have.",
                advice: "Seek fulfillment within yourself rather than from external sources, and practice gratitude for what you already possess."
            )
        ),

        // MARK: - Ten of Cups
        .cups10: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Domestic bliss", "Lasting love", "Harmony", "Emotional fulfillment"],
                generalMeaning: "The Ten of Cups is the ultimate card of emotional completion and family happiness. It represents lasting love, harmonious relationships, and the deep peace that comes from being surrounded by people you cherish.",
                feelingsContext: "This person envisions a long-term future with you and holds you at the center of their happiness. They feel a profound love and a genuine desire to build a life together -- a home, a family, a shared story. Being near you gives them a sense of security and wholeness that they find nowhere else.",
                advice: "Treasure the love and harmony in your life, and invest in the relationships that bring you lasting joy."
            ),
            reversed: CardInterpretation(
                keywords: ["Domestic discord", "Broken dreams", "Misaligned values", "Disillusionment"],
                generalMeaning: "The reversed Ten of Cups reveals cracks in what was thought to be an ideal situation. Differing values, unmet expectations, or family tensions may be undermining the harmony you once enjoyed.",
                feelingsContext: "This person is feeling anxious about the future of your relationship. The gap between the ideal partnership they once imagined and the current reality is becoming difficult to ignore. Differences in values or lifestyle are weighing on them, and although love is still present, they are uncertain about whether the path ahead is truly the right one.",
                advice: "Release rigid ideals, face your relationship honestly, and rebuild through patient, open dialogue."
            )
        ),

        // MARK: - Page of Cups
        .cupsPage: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Sensitivity", "Romantic spark", "Emotional message", "Creativity", "Young love"],
                generalMeaning: "The Page of Cups embodies tender sensitivity and the first stirrings of emotional discovery. It often signals the arrival of a heartfelt message, a creative inspiration, or a sweet and unexpected romantic development.",
                feelingsContext: "This person feels a shy, youthful excitement toward you. They are experiencing a fluttering, almost innocent kind of attraction and find themselves brightened or flustered by even your smallest gestures. They want to express how they feel but are too bashful to take the first step -- there is an endearing sweetness to their affection.",
                advice: "Stay open to the gentle messages your heart is sending and trust your emotional intuition."
            ),
            reversed: CardInterpretation(
                keywords: ["Emotional immaturity", "Insecurity", "Oversensitivity", "Unrealistic expectations"],
                generalMeaning: "The reversed Page of Cups points to emotional immaturity or fragility. There may be a tendency to retreat into fantasy to avoid dealing with real feelings, or an oversensitivity that makes stable connections difficult.",
                feelingsContext: "This person has feelings for you but they are unstable and easily shaken. They lack emotional resilience and may overreact to small things or read too deeply into casual remarks. There is a risk of them becoming overly dependent on you for their sense of security, making it hard to maintain a healthy dynamic.",
                advice: "Work on building emotional resilience and self-reliance before seeking validation from others."
            )
        ),

        // MARK: - Knight of Cups
        .cupsKnight: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Romantic pursuit", "Charm", "Proposal", "Idealistic lover"],
                generalMeaning: "The Knight of Cups is the quintessential romantic, riding toward love with passion and grace. This card often heralds a declaration of feelings, an enchanting encounter, or the arrival of someone who embodies poetic devotion.",
                feelingsContext: "This person is deeply romantic in their feelings toward you and longs to sweep you off your feet. They see you as their ideal and are actively thinking about how to convey the depth of their affection. A heartfelt confession or a passionate gesture may be on the horizon -- in their eyes, you are the one they have been searching for.",
                advice: "Honor your passion while keeping at least one foot on solid ground; the best love is both heartfelt and realistic."
            ),
            reversed: CardInterpretation(
                keywords: ["Moodiness", "Escapism", "Fickleness", "Jealousy"],
                generalMeaning: "The reversed Knight of Cups warns of emotional volatility and unreliable affections. The romantic ideal may have soured into moodiness, escapism, or a tendency to chase feelings without follow-through.",
                feelingsContext: "This person's feelings for you are inconsistent and unpredictable. They can be intensely devoted one moment and distracted the next, making it difficult to know where you stand. Beneath the surface, they crave love, but bouts of jealousy, possessiveness, or emotional withdrawal create an unstable emotional landscape.",
                advice: "Strive for emotional consistency and honesty rather than chasing the highs and lows of romantic drama."
            )
        ),

        // MARK: - Queen of Cups
        .cupsQueen: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Deep compassion", "Empathy", "Intuitive love", "Nurturing", "Unconditional care"],
                generalMeaning: "The Queen of Cups embodies profound empathy, emotional depth, and intuitive wisdom. She is deeply connected to her own feelings and radiates a warm, unconditional love that makes others feel seen and held.",
                feelingsContext: "This person pours a deep, nurturing love over you. They understand your emotions almost intuitively and wish to embrace every part of who you are -- your joys, your sorrows, everything. Your happiness is their happiness, and your pain moves them to offer comfort. What they feel for you approaches an unconditional, almost maternal tenderness.",
                advice: "Trust your intuition and lead with compassion, but remember to care for your own emotional needs as well."
            ),
            reversed: CardInterpretation(
                keywords: ["Emotional instability", "Codependency", "Self-neglect", "Blurred boundaries"],
                generalMeaning: "The reversed Queen of Cups warns that empathy has tipped into emotional overwhelm. Boundaries between self and other have become blurred, leading to codependency, self-sacrifice, or being swept away by uncontrolled feelings.",
                feelingsContext: "This person loves you so intensely that it has become destabilizing for them. They are prone to sacrificing their own well-being for your sake and may become overly involved in your emotional world. Their love, though genuine, carries a weight that can feel suffocating, and they are at risk of losing themselves entirely in the relationship.",
                advice: "Establish healthy emotional boundaries and prioritize your own well-being alongside your care for others."
            )
        ),

        // MARK: - King of Cups
        .cupsKing: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Emotional maturity", "Generosity", "Calm wisdom", "Balanced love"],
                generalMeaning: "The King of Cups represents the mastery of emotions -- the ability to feel deeply while remaining calm and composed. He leads with both heart and head, offering steady, wise, and generous love.",
                feelingsContext: "This person holds a mature and unwavering love for you. They are not swept away by emotional storms; instead, they care for you with a quiet, steady warmth. They want to understand, support, and guide you, and they are thinking about your relationship with a long-term perspective. Their affection is both deeply felt and reliably grounded.",
                advice: "Maintain the balance between feeling and reason, and offer your wisdom and compassion generously to those around you."
            ),
            reversed: CardInterpretation(
                keywords: ["Emotional manipulation", "Coldness", "Controlling behavior", "Suppressed feelings"],
                generalMeaning: "The reversed King of Cups suggests that emotions are being over-controlled or weaponized. There may be a facade of calm concealing deep turmoil, or an attempt to manipulate others through emotional withdrawal or calculated behavior.",
                feelingsContext: "This person is deliberately guarding their feelings toward you. Behind a cool or distant exterior, there may be deeper emotions they refuse to reveal. However, there is also a risk that they are using emotional distance or calculated behavior to control the dynamic between you. Caution is warranted -- their need for control may overshadow genuine intimacy.",
                advice: "Find the courage to show your true self rather than hiding behind emotional armor or using feelings as a tool for control."
            )
        )
    ]
}
