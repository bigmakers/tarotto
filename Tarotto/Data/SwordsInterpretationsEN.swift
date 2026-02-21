import Foundation

// MARK: - Swords Suit - Air Element
// Represents intellect, communication, conflict, truth, and mental clarity

enum SwordsInterpretationsEN {
    static let all: [TarotCard: CardMeanings] = [

        // MARK: - Ace of Swords
        .swordsAce: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Truth", "Clarity", "Breakthrough", "Intellectual awakening"],
                generalMeaning: "A new intellectual awakening or discovery of truth is at hand. Your mental clarity is heightened, allowing you to see through to the essence of matters.",
                feelingsContext: "This person is developing a sharp, clear awareness of you. Your presence has begun to take a definite shape in their mind, sparking intellectual stimulation and fresh insight. There is no ambiguity — a genuine interest in you is crystallizing.",
                advice: "Do not fear the truth; take a bold new step forward with clear intention."
            ),
            reversed: CardInterpretation(
                keywords: ["Confusion", "Misunderstanding", "Mental stagnation", "Lack of clarity"],
                generalMeaning: "Your thinking is muddled and it is difficult to see the true nature of things. You may be caught up in misinformation or biased reasoning.",
                feelingsContext: "This person's thoughts about you are scattered and unresolved. Feelings for you do exist, but their mind is in disarray and they cannot sort through them. Misunderstandings and assumptions are blocking them from reaching their honest emotions.",
                advice: "Avoid rushing to conclusions and give yourself time to organize your thoughts."
            )
        ),

        // MARK: - Two of Swords
        .swords2: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Indecision", "Stalemate", "Balance", "Difficult choice"],
                generalMeaning: "You are caught between two options, unable to decide. Either the information you need is lacking, or you are not yet emotionally ready to make a choice.",
                feelingsContext: "This person's feelings toward you are wavering. They are torn between their affection for you and another option or lingering anxiety. They are suppressing their emotions, trying to weigh things rationally, but cannot reach a conclusion.",
                advice: "Do not force a decision; quietly discern what your heart truly desires."
            ),
            reversed: CardInterpretation(
                keywords: ["Avoidance", "Information overload", "Emotional suppression", "Indecisiveness"],
                generalMeaning: "Procrastinating on a decision has allowed the situation to worsen. Trying to think your way through while ignoring emotions is backfiring.",
                feelingsContext: "This person has been overthinking you to the point of complete paralysis. They know what they feel intellectually but cannot act on it, turning away from their own emotions. They are afraid to acknowledge how they truly feel about you.",
                advice: "Stop overanalyzing and find the courage to be honest with your intuition and feelings."
            )
        ),

        // MARK: - Three of Swords
        .swords3: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Heartbreak", "Sorrow", "Separation", "Betrayal", "Grief"],
                generalMeaning: "A period of deep emotional pain and sadness. This card points to suffering from betrayal or separation, yet this pain is also a necessary part of growth.",
                feelingsContext: "This person is experiencing deep heartache in connection with you. They have been hurt by something you said or did, or they are suffering over a rift that has formed between you. They are immersed in sorrow, but that pain exists precisely because their feelings for you run deep.",
                advice: "Do not suppress your grief; accepting the pain will open the path to healing."
            ),
            reversed: CardInterpretation(
                keywords: ["Recovery", "Forgiveness", "Overcoming pain", "Healing"],
                generalMeaning: "You are gradually recovering from past wounds. The sadness is lifting, and the strength to move forward is returning.",
                feelingsContext: "This person is beginning to heal from the pain that existed between you. They are not fully mended yet, but a willingness to forgive you or to repair the relationship is emerging. They are getting ready to release past hurts.",
                advice: "Let go of old wounds and move into a new chapter with a spirit of forgiveness."
            )
        ),

        // MARK: - Four of Swords
        .swords4: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Rest", "Recovery", "Contemplation", "Retreat", "Recharging"],
                generalMeaning: "A period of rest is needed to recover from mental exhaustion. You are called to pause, step back from conflict, and restore your mind and body.",
                feelingsContext: "This person has put their feelings for you on hold and is taking a mental break. It is not that they lack feelings — they have simply thought about you so much that they are drained and need time to settle their heart. They are quietly recharging their energy.",
                advice: "Now is not the time to push forward; focus on resting your mind and body."
            ),
            reversed: CardInterpretation(
                keywords: ["Restlessness", "Burnout", "Premature action", "Insufficient rest"],
                generalMeaning: "The period of rest is ending and the time to resume activity is approaching. However, if recovery is incomplete, impatience can easily arise.",
                feelingsContext: "This person is beginning to think about you again. After a period of silence, they are becoming ready to face their feelings for you. However, their emotional processing may not be fully complete, and they could be trying to act before they are truly ready.",
                advice: "Do not rush into action before you have fully recovered; wait until you are truly prepared."
            )
        ),

        // MARK: - Five of Swords
        .swords5: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Conflict", "Defeat", "Self-interest", "Hostility", "Humiliation"],
                generalMeaning: "A situation of conflict where there are clear winners and losers. Even an apparent victory may come at the cost of something important.",
                feelingsContext: "This person is feeling conflict and tension in their connection with you. Pride is getting in the way of vulnerability, and they may act aggressively toward you. Deep down they feel regret, but stubbornness and a refusal to admit defeat take precedence.",
                advice: "Let go of the need to win or lose, and do not lose sight of what truly matters."
            ),
            reversed: CardInterpretation(
                keywords: ["Reconciliation", "Regret", "Lessons learned", "End of conflict"],
                generalMeaning: "The conflict is moving toward resolution, and lessons are being drawn from past disputes. Feelings of regret may open a door to reconciliation.",
                feelingsContext: "This person is beginning to regret the distance or quarrel between you. A desire to set aside their pride and reach out is growing, but they feel ashamed of their past behavior and are unsure how to approach you.",
                advice: "Take past conflicts as lessons and work toward repairing the relationship with humility."
            )
        ),

        // MARK: - Six of Swords
        .swords6: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Transition", "Moving on", "Recovery", "Gradual progress"],
                generalMeaning: "You are leaving a difficult situation behind and transitioning to a calmer environment. The painful past is receding as you move toward a more peaceful future.",
                feelingsContext: "This person is stepping away from past issues in your relationship and trying to sort out their heart. They still carry feelings for you as they move toward a better state. Slowly but surely, a positive shift is beginning.",
                advice: "Release attachment to the past and move gently toward a new environment and relationship."
            ),
            reversed: CardInterpretation(
                keywords: ["Stagnation", "Clinging to the past", "Unresolved issues", "Inability to move on"],
                generalMeaning: "You want to move forward but remain shackled by past problems. You may be unable to leave when you should, or you are postponing necessary resolution.",
                feelingsContext: "This person is trapped by past events involving you and cannot move forward. They want to change how they feel, but memories and unresolved emotions keep circling in their mind. They are stuck in a loop of the same thoughts.",
                advice: "Face unresolved issues head-on and make an effort to release lingering emotions."
            )
        ),

        // MARK: - Seven of Swords
        .swords7: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Deception", "Strategy", "Secrecy", "Cunning", "Evasion"],
                generalMeaning: "A time of using wit and strategy rather than a direct approach. You may need to act without revealing everything, but be careful not to cross into dishonesty.",
                feelingsContext: "This person is hiding their true feelings from you. They do have feelings for you, but they fear exposing everything and are keeping their real emotions under wraps. They are strategically controlling their feelings so that you will not catch on.",
                advice: "Using your wits is valuable, but be careful not to rely too heavily on dishonest tactics."
            ),
            reversed: CardInterpretation(
                keywords: ["Coming clean", "Exposure", "Guilty conscience", "Honesty"],
                generalMeaning: "What has been hidden is about to come to light. Secrets may be exposed, or you may find the resolve to confess the truth yourself.",
                feelingsContext: "This person is feeling a growing urge to reveal the feelings they have been concealing from you. They can no longer bear the weight of pretense and want to be honest. Although they still fear baring their heart, their conscience is winning out.",
                advice: "Choosing honesty over continued secrecy will ultimately bring a better outcome."
            )
        ),

        // MARK: - Eight of Swords
        .swords8: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Restriction", "Trapped", "Self-imposed limits", "Powerlessness", "Overthinking"],
                generalMeaning: "You feel paralyzed by your own fears and limiting beliefs. In reality, escape is possible, but you are mentally imprisoned.",
                feelingsContext: "This person feels trapped by their feelings for you, unable to move. They have been thinking about you so much that they have fallen into a cycle of negative thoughts. A belief that things could never work out is preventing them from getting closer to you.",
                advice: "Recognize that what binds you is not external circumstances but your own limiting beliefs."
            ),
            reversed: CardInterpretation(
                keywords: ["Liberation", "Freedom", "New perspective", "Breaking free"],
                generalMeaning: "You are breaking free from mental restrictions. A new perspective is helping you shed the beliefs that once held you captive.",
                feelingsContext: "This person is freeing themselves from the negative assumptions they held about you. They are overcoming the fears and anxieties that once bound them and are beginning to see your relationship with fresh eyes. Their heart is lightening, and they are moving closer to being able to face you openly.",
                advice: "Now that you have broken free from mental chains, turn your attention to new possibilities and take action."
            )
        ),

        // MARK: - Nine of Swords
        .swords9: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Anxiety", "Nightmares", "Despair", "Excessive worry", "Self-blame"],
                generalMeaning: "You are consumed by deep anxiety and fear. Worry keeps you awake at night, though much of what you dread may be worse in your imagination than in reality.",
                feelingsContext: "This person is deeply troubled by thoughts of you, losing sleep over their anxiety. Worst-case scenarios about your relationship flood their mind, and they blame themselves relentlessly. Their feelings for you are so strong that the fear of losing you has been magnified to an overwhelming degree.",
                advice: "Most of your anxiety is created by your imagination; try to see reality with calm, clear eyes."
            ),
            reversed: CardInterpretation(
                keywords: ["Recovery", "Hope", "Overcoming anxiety", "Light at the end"],
                generalMeaning: "The long period of anxiety is lifting and a glimmer of hope is appearing. The worst is over, and recovery is underway.",
                feelingsContext: "This person is gradually recovering from the excessive worry and anxiety they have felt about you. They are emerging from the grip of worst-case thinking and are beginning to consider your relationship in a more positive light. A sense of emotional breathing room is returning.",
                advice: "The dark period is passing; move forward with hope."
            )
        ),

        // MARK: - Ten of Swords
        .swords10: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Rock bottom", "Endings", "Betrayal", "Collapse", "New dawn"],
                generalMeaning: "You have reached the most painful point, but things cannot get any worse. A complete ending is also the harbinger of a new beginning.",
                feelingsContext: "This person has hit an emotional rock bottom in connection with you. They feel deeply betrayed or devastated, experiencing a level of pain that seems like it cannot go any further. Yet this very bottoming out may serve as the turning point for change.",
                advice: "This is the hardest moment, but it is also the lowest point — from here, the only way is up."
            ),
            reversed: CardInterpretation(
                keywords: ["Survival", "Recovery", "Resilience", "Worst is over"],
                generalMeaning: "You have survived the worst and signs of recovery are emerging. Full healing will take time, but the most painful chapter is behind you.",
                feelingsContext: "This person is beginning to recover from the deep pain they experienced in connection with you. Scars remain, but they have moved past the worst. Rather than despair, they are starting to sense possibility when they think about a future with you.",
                advice: "Trust in the strength that only comes from having endured the lowest depths, and rise again."
            )
        ),

        // MARK: - Page of Swords
        .swordsPage: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Curiosity", "Intellectual exploration", "Observation", "Directness", "New ideas"],
                generalMeaning: "Intellectual curiosity is heightened, and you are awakening to new perspectives and ideas. You possess sharp, candid powers of observation and a strong drive to seek the truth.",
                feelingsContext: "This person has a strong curiosity and intellectual interest in you. They are eager to learn more about you and understand you better. Their emotions are not yet deep, but they find your words and way of thinking refreshingly stimulating and are actively observing and analyzing you.",
                advice: "Cherish the desire to learn, and deepen your understanding by asking questions candidly."
            ),
            reversed: CardInterpretation(
                keywords: ["Gossip", "Sarcasm", "Immature criticism", "Cutting words"],
                generalMeaning: "There is a tendency to wield knowledge as a weapon, wounding others with sarcasm and criticism. Be mindful that the sharpness of your words can cut both ways.",
                feelingsContext: "This person is viewing you with a critical eye. They are dissecting your flaws and using sharp or sarcastic remarks to keep you at a distance. In truth they are interested, but intellectual pride and an inability to be vulnerable are standing in the way.",
                advice: "Words are a double-edged sword; choose constructive expression over criticism."
            )
        ),

        // MARK: - Knight of Swords
        .swordsKnight: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Swift action", "Determination", "Ambition", "Intellect", "Directness"],
                generalMeaning: "You are charging toward your goal with swift judgment and decisive action. You combine intellect and courage to cut through obstacles.",
                feelingsContext: "This person has a single-minded, determined intent directed at you. Once their mind is made up, they act immediately, and there is no hesitation in how they feel about you. However, their intensity can be so strong that they may rush forward without fully checking how you feel.",
                advice: "Your ability to act quickly is admirable, but do not forget to consider those around you."
            ),
            reversed: CardInterpretation(
                keywords: ["Impulsiveness", "Aggression", "Recklessness", "Short-tempered", "Scattered energy"],
                generalMeaning: "Thoughts are spiraling out of control, leading to impulsive and aggressive behavior. You may lose your composure and hurt others with your words or actions.",
                feelingsContext: "This person has volatile, unstable emotions toward you. They cannot control their feelings and swing between acting aggressively toward you and suddenly closing the distance — their behavior is erratic. Calm, rational judgment has broken down.",
                advice: "Pause before reacting emotionally and regain your composure before taking action."
            )
        ),

        // MARK: - Queen of Swords
        .swordsQueen: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Intelligence", "Independence", "Composure", "Insight", "Fairness"],
                generalMeaning: "Your calm, intellectual judgment is at its sharpest. You have the ability to assess situations from an objective, impartial standpoint without being swept away by emotion.",
                feelingsContext: "This person holds a deep understanding and intellectual respect for you. They do not readily show their emotions, but behind their calm exterior lies a steady affection. They see through to your true nature and strive to be a genuine, substantive ally rather than a superficial one.",
                advice: "Maintain the balance between intellect and emotion, and never lose warmth beneath your composure."
            ),
            reversed: CardInterpretation(
                keywords: ["Coldness", "Emotional repression", "Isolation", "Harshness"],
                generalMeaning: "Composure has turned into coldness, and emotions have been completely severed. You are armoring yourself with intellect and pushing others away.",
                feelingsContext: "This person has closed their heart to you and is suppressing their feelings entirely. They are truly hurting inside but are putting on a facade of calm detachment. They refuse to show any vulnerability and use harsh words to maintain distance from you.",
                advice: "Do not seal away your emotions behind intellect; sometimes courage means showing your vulnerability."
            )
        ),

        // MARK: - King of Swords
        .swordsKing: CardMeanings(
            upright: CardInterpretation(
                keywords: ["Authority", "Intellectual leadership", "Fairness", "Logic", "Clarity"],
                generalMeaning: "You are guiding those around you with logical thinking and fair judgment. You hold a clear vision and unwavering conviction, resolving matters through the power of intellect.",
                feelingsContext: "This person holds rational, steady feelings toward you. They are not tossed about by emotion; they watch over your relationship with calm deliberation and firm intention. They may be a person of few words, but there is a deep love in the way they seek to understand and guide you.",
                advice: "Uphold logic and fairness while fulfilling your responsibility as a leader."
            ),
            reversed: CardInterpretation(
                keywords: ["Domineering", "Detachment", "Tyranny", "Intellectual arrogance", "Ruthlessness"],
                generalMeaning: "Intellect has warped into a desire for dominance and control. You are becoming cold and authoritarian, imposing your views and disregarding others' emotions.",
                feelingsContext: "This person harbors controlling feelings toward you. They are convinced of their own rightness and tend to dismiss your feelings and opinions. They fixate on maintaining intellectual superiority and are obsessed with holding the upper hand in your relationship.",
                advice: "Release the need for intellectual dominance and open your ears to the feelings and perspectives of others."
            )
        )
    ]
}
