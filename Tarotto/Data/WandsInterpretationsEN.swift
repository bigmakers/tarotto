import Foundation

enum WandsInterpretationsEN {
    static let all: [TarotCard: CardMeanings] = [
        // MARK: - Ace of Wands
        .wandsAce: CardMeanings(
            upright: CardInterpretation(
                keywords: ["New beginnings", "Passion", "Creativity", "Inspiration"],
                generalMeaning: "A surge of new passion and inspiration is igniting within you. Creative energy is abundant, signaling the perfect time to embark on something new.",
                feelingsContext: "They feel a strong spark of interest and fresh attraction toward you. Your presence excites them and fills them with anticipation that something wonderful is about to begin. A flame of passion for you has been kindled in their heart.",
                advice: "Trust the inspiration rising within you and take a courageous first step forward."
            ),
            reversed: CardInterpretation(
                keywords: ["Low motivation", "Delays", "Frustration", "Lack of direction"],
                generalMeaning: "Your passion and motivation have dipped. Even though you want to take action, you find it difficult to get moving.",
                feelingsContext: "They are interested in you but have not yet found the resolve to act on it. The feelings are there, but issues of timing or confidence are holding them back from making a move. Their emotions toward you have not yet taken a clear shape.",
                advice: "Rather than rushing, take time to reconnect with your inner fire and clarify what you truly want."
            )
        ),

        // MARK: - Two of Wands
        .wands2: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Planning", "Future vision", "Decision", "Exploration"],
                generalMeaning: "This is a time for making plans for the future. You are surveying the possibilities ahead with a broad perspective, considering your next move.",
                feelingsContext: "They have begun thinking seriously about a future with you. They are imagining what possibilities your relationship could hold and envisioning the road ahead together. They are actively exploring what a deeper connection with you might look like.",
                advice: "Look beyond the immediate and craft a long-term vision, then act on it with intention."
            ),
            reversed: CardInterpretation(
                keywords: ["Poor planning", "Fear", "Indecision", "Narrow perspective"],
                generalMeaning: "Anxiety about the future is making it hard to commit to a decision. Your plans are stalling, and you feel stuck before your options.",
                feelingsContext: "They feel uneasy about where things are heading with you. While they are drawn to you, they are confused about where the relationship is going and feel uncertain. Fear of the unknown is making them overly cautious.",
                advice: "Do not wait for the perfect plan -- start with one small step and build momentum from there."
            )
        ),

        // MARK: - Three of Wands
        .wands3: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Expansion", "Progress", "Foresight", "Growth", "Opportunity"],
                generalMeaning: "The fruits of your efforts are becoming visible, and further development is on the horizon. Broadening your perspective will invite new opportunities.",
                feelingsContext: "They hold great expectations and hope for your relationship. They feel confident that a bright future is unfolding between you and want to deepen the connection further. Being with you makes them feel that their whole world is expanding.",
                advice: "Have faith in your efforts so far and continue reaching toward even bigger goals."
            ),
            reversed: CardInterpretation(
                keywords: ["Stagnation", "Overestimation", "Missed chances", "Turning inward"],
                generalMeaning: "The results you expected are slow to materialize, creating a sense of stagnation. It may be time to revisit and adjust your plans.",
                feelingsContext: "They feel frustrated that the relationship is not progressing the way they had hoped. The lack of deepening connection is causing them anxiety and impatience. They are struggling to express their true feelings to you.",
                advice: "Pause and reassess your approach, then devise a more realistic strategy."
            )
        ),

        // MARK: - Four of Wands
        .wands4: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Celebration", "Harmony", "Stability", "Joy", "Homecoming"],
                generalMeaning: "This is a time filled with joy, celebration, and stability. Your efforts have paid off, and you can savor a sense of accomplishment in a harmonious environment.",
                feelingsContext: "They feel deep joy and a sense of security when they are with you. Your relationship is a comfortable and stable haven for them, and they genuinely cherish every moment spent together. To them, you feel like home.",
                advice: "Appreciate the happiness and stability you have now, and nurture your bonds with those who matter."
            ),
            reversed: CardInterpretation(
                keywords: ["Instability", "Displacement", "Discord", "Unpreparedness"],
                generalMeaning: "You are struggling to find stability and feeling unsettled. A sense of not belonging or lacking a secure foundation may be weighing on you.",
                feelingsContext: "They feel somewhat restless in your relationship. Even when they are with you, they cannot fully relax, sensing that the foundation between you is not yet solid. They want to take more time to build a deeper trust with you.",
                advice: "Focus first on restoring your own inner sense of stability and groundedness."
            )
        ),

        // MARK: - Five of Wands
        .wands5: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Competition", "Conflict", "Struggle", "Rivalry"],
                generalMeaning: "This is a period prone to competition and clashes. However, this friction can also become an opportunity for growth and for defining where you stand.",
                feelingsContext: "They have complex, mixed feelings about you. While there is attraction, they also feel a sense of rivalry or a need to prove themselves. Your presence is stimulating to them, stirring up their emotions in ways both exciting and unsettling.",
                advice: "Do not shy away from conflict -- assert your views while also respecting the other person's position."
            ),
            reversed: CardInterpretation(
                keywords: ["Avoidance", "Compromise", "Inner conflict", "Exhaustion"],
                generalMeaning: "You are suppressing yourself more than necessary to avoid confrontation. Internal struggles may be draining your energy.",
                feelingsContext: "They want to resolve the tension and unease that exists between you. They are trying to accommodate you to avoid conflict, but hiding their true feelings is creating inner turmoil. They feel frustrated with themselves for not being able to be honest.",
                advice: "Instead of sacrificing yourself to avoid disagreement, strive for constructive and open dialogue."
            )
        ),

        // MARK: - Six of Wands
        .wands6: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Victory", "Success", "Recognition", "Confidence", "Admiration"],
                generalMeaning: "Your efforts are being rewarded with success and recognition from those around you. You can move forward with confidence and pride.",
                feelingsContext: "They feel proud of you and look at you with deep respect and admiration. They highly value your charm and abilities, and they want the world to know how proud they are to be with you. To them, you are someone truly worth celebrating.",
                advice: "Take pride in your achievements, but stay humble as you continue moving forward."
            ),
            reversed: CardInterpretation(
                keywords: ["Self-doubt", "Setback", "Lack of recognition", "Vanity"],
                generalMeaning: "You are not receiving the recognition or results you expected, and your confidence is shaken. You may be too concerned about how others perceive you.",
                feelingsContext: "They feel insecure and lack confidence around you. They experience a sense of inferiority and worry that they are not good enough for you. Their desire to impress you is backfiring, leaving them feeling inadequate.",
                advice: "Stop measuring yourself by others' opinions and recognize your own worth from within."
            )
        ),

        // MARK: - Seven of Wands
        .wands7: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Defensiveness", "Conviction", "Standing firm", "Perseverance"],
                generalMeaning: "Even in the face of challenges and opposition, you are called to stand by your convictions. Refusing to give up will open the way forward.",
                feelingsContext: "They are determined to protect their feelings for you. Even if there are obstacles or opposition from others, they do not want to let go of what they feel. They have the resolve to fight for the relationship they have with you.",
                advice: "Hold your ground against outside pressure and stand firm in your beliefs and values."
            ),
            reversed: CardInterpretation(
                keywords: ["Giving in", "Fatigue", "Self-doubt", "Surrender"],
                generalMeaning: "You are growing weary of constantly fighting and your resolve is fading. It is time to discern what truly deserves your energy and protection.",
                feelingsContext: "They are growing tired of holding on to their feelings for you. The difficulties in the relationship are overwhelming them, and they are losing confidence in whether they can keep caring this deeply. Their emotional defenses are starting to crumble.",
                advice: "Recognize that sometimes there is courage in stepping back rather than fighting endlessly."
            )
        ),

        // MARK: - Eight of Wands
        .wands8: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Speed", "Rapid progress", "Action", "Momentum", "Messages"],
                generalMeaning: "Things are about to accelerate rapidly. What had been stagnant will suddenly surge forward, bringing swift and exciting changes.",
                feelingsContext: "Their feelings for you are intensifying at a rapid pace. Their desire to reach out, to confess, and to take action is growing stronger by the moment. Your presence in their heart is expanding dramatically and quickly.",
                advice: "When the opportunity arrives, act without hesitation and ride the wave of momentum."
            ),
            reversed: CardInterpretation(
                keywords: ["Delays", "Impatience", "Bad timing", "Stalling"],
                generalMeaning: "Things are not moving at the pace you expected, and you feel the frustration of delays and poor timing. Rushing could make matters worse.",
                feelingsContext: "They want to express their feelings to you, but the timing keeps slipping away, leaving them anxious. They want to move things forward with you, yet obstacles and missed connections keep getting in the way. The feelings are there, but their actions cannot keep up.",
                advice: "Rather than acting impulsively, cultivate the patience to wait for the right moment."
            )
        ),

        // MARK: - Nine of Wands
        .wands9: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Resilience", "Vigilance", "Endurance", "Final challenge"],
                generalMeaning: "You have weathered many storms and now face a final test. Your hard-won experience gives you the strength to persevere -- the finish line is close.",
                feelingsContext: "They have been through a great deal in connection with you, yet they have not let go of their feelings. Though they fear being hurt again, they cannot bring themselves to give up on you. Beneath their guardedness, they still want to believe in you and in what you share.",
                advice: "Even when you are exhausted, remember that one more push of perseverance can lead to a great reward."
            ),
            reversed: CardInterpretation(
                keywords: ["Burnout", "Paranoia", "Reaching limits", "Stubbornness"],
                generalMeaning: "The long battle has drained you completely, both mentally and physically. Excessive guardedness may be isolating you further.",
                feelingsContext: "They are emotionally exhausted from the relationship with you. Past hurts have caused them to shut down, and they cannot be open with you. They are torn between wanting to trust you and never wanting to be hurt again.",
                advice: "Acknowledge your limits, stop pushing, and give yourself permission to rest and recover."
            )
        ),

        // MARK: - Ten of Wands
        .wands10: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Burden", "Responsibility", "Overload", "Obligation"],
                generalMeaning: "You are carrying too many responsibilities and nearing your breaking point. This card warns against trying to shoulder everything alone.",
                feelingsContext: "They are beginning to feel weighed down by their feelings for you and the relationship. Because they care so deeply, they feel an overwhelming sense of responsibility and pressure. Between you and everything else in their life, they are stretched too thin to breathe.",
                advice: "You do not have to carry everything alone -- reach out and ask for help from those you trust."
            ),
            reversed: CardInterpretation(
                keywords: ["Release", "Lightening the load", "Delegation", "Burnout"],
                generalMeaning: "You are beginning to set down some of the weight you have been carrying. Either you are wisely letting go of unnecessary burdens, or you risk total burnout.",
                feelingsContext: "They are gradually trying to release the heaviness of their feelings for you. The burden has reached its limit, and they are starting to sort through their emotions. Their feelings have not disappeared -- they simply want to find a lighter, more sustainable way to be in the relationship.",
                advice: "Let go of what no longer serves you and focus your energy only on what truly matters."
            )
        ),

        // MARK: - Page of Wands
        .wandsPage: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Adventure", "Curiosity", "New venture", "Enthusiasm", "Youthfulness"],
                generalMeaning: "You are brimming with curiosity and a spirit of adventure. With youthful enthusiasm, you are ready to dive into uncharted territory.",
                feelingsContext: "They feel a pure, innocent curiosity and excitement about you. They are eager to learn more about who you are and to share new experiences with you. While their feelings may not yet be fully mature as romantic love, their interest in you is genuine and heartfelt.",
                advice: "Cherish your curiosity and do not be afraid to leap into new adventures."
            ),
            reversed: CardInterpretation(
                keywords: ["Immaturity", "Fickleness", "Recklessness", "Impulsiveness"],
                generalMeaning: "While the enthusiasm is there, a lack of follow-through and planning means things tend to fizzle out. Impulsive decisions should be watched carefully.",
                feelingsContext: "They are interested in you, but their feelings are unstable. They might be infatuated one day and distracted by something else the next. While the curiosity is real, they have not yet developed the maturity or commitment to take things seriously with you.",
                advice: "Instead of chasing every impulse, commit to one thing and see it through to the end."
            )
        ),

        // MARK: - Knight of Wands
        .wandsKnight: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Passionate action", "Adventure", "Boldness", "High energy"],
                generalMeaning: "You are driven by passion to act boldly and decisively. Enormous energy propels you toward your goals with unstoppable force.",
                feelingsContext: "They feel a fiery, burning passion for you. They are consumed by the desire to be close to you, driven by an intense and impulsive longing. Their eagerness to pursue you is at its peak, and they are ready to take action.",
                advice: "Channel your passion into bold action, but remain mindful of the people around you."
            ),
            reversed: CardInterpretation(
                keywords: ["Recklessness", "Impatience", "Half-hearted efforts", "Directionless"],
                generalMeaning: "Your passion is running unchecked, leading to rash or careless actions. Without a clear direction, your energy scatters and efforts remain incomplete.",
                feelingsContext: "They do not know how to express their feelings for you and keep stumbling. They swing between impulsive advances and sudden retreats, unable to find a steady approach. The passion is very real, but they cannot seem to control or channel it properly.",
                advice: "Resist the urge to act on impulse -- pause, take a breath, and set a clear course."
            )
        ),

        // MARK: - Queen of Wands
        .wandsQueen: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Confidence", "Charisma", "Warmth", "Independence", "Magnetism"],
                generalMeaning: "You radiate confidence and warmth, lighting up every room you enter. Your self-assured charm and independence draw people to you naturally.",
                feelingsContext: "They are powerfully drawn to your confident and radiant energy. Your warmth and inner strength give them a sense of comfort, and being around you lifts their spirits. You are like the sun to them -- they hold both deep respect and genuine affection for you.",
                advice: "Let your authentic charm shine boldly and embrace others with your natural warmth."
            ),
            reversed: CardInterpretation(
                keywords: ["Self-centeredness", "Jealousy", "Wavering confidence", "Controlling"],
                generalMeaning: "Your confidence is either faltering or has tipped into arrogance, creating friction in your relationships. It is time to look inward and reconnect with your true self.",
                feelingsContext: "They feel a mix of jealousy and competitiveness toward you. They recognize your magnetism but perceive it as a threat, which prevents them from expressing their affection honestly. They feel swept up by you and are struggling to manage their own emotions.",
                advice: "Stop comparing yourself to others and rediscover the value of your authentic self."
            )
        ),

        // MARK: - King of Wands
        .wandsKing: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Leadership", "Vision", "Decisiveness", "Charisma"],
                generalMeaning: "You possess strong leadership and a clear, compelling vision. Bold decisiveness and passionate drive empower you to guide and inspire those around you.",
                feelingsContext: "They see you as a strong and dependable presence. They place deep trust and respect in your leadership and decisiveness, and they feel drawn to follow your lead. Your passionate nature has captured their heart, and they hold genuinely serious feelings for you.",
                advice: "Hold on to your grand vision and lead with both passion and decisiveness."
            ),
            reversed: CardInterpretation(
                keywords: ["Tyrannical", "Arrogance", "Impulsiveness", "Overbearing"],
                generalMeaning: "Your leadership has become domineering, shutting out the voices of others. Passion has turned into stubbornness, and you are clinging too tightly to being right.",
                feelingsContext: "They feel intimidated or overpowered by you. While part of them is attracted to your strength, they worry that their own opinions and feelings will not be valued. They are concerned about whether they can truly be themselves in a relationship with you.",
                advice: "Rather than imposing your passion on others, practice humility and listen to those around you."
            )
        )
    ]
}
