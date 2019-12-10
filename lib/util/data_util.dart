import 'package:Wordy/ui/home.dart';

class DataUtil {
  static List<Word> getPrepositionList() {
    var prepositionList = new List<Word>();

    prepositionList.add(new Word.Construct(1001,'to', 'expressing motion in the direction of (a particular location)', 'walking down to the shops'));
    prepositionList.add(new Word.Construct(1002,'for', 'with the object or purpose of', 'to work for wages'));
    prepositionList.add(new Word.Construct(1003,'out', 'moving or appearing to move away from a particular place, especially one that is enclosed or hidden', 'he walked out into the street'));
    prepositionList.add(new Word.Construct(1004,'with', 'accompanied by (another person or thing)', 'a nice steak with a bottle of red wine'));
    prepositionList.add(new Word.Construct(1005,'from', 'indicating the point in space at which a journey, motion, or action starts', 'she began to walk away from him'));
    prepositionList.add(new Word.Construct(1006,'over', 'extending directly upwards from', 'I saw flames over Berlin'));
    prepositionList.add(new Word.Construct(1007,'after', 'in the time following (an event or another period of time)', 'shortly after their marriage they moved to Colorado'));
    prepositionList.add(new Word.Construct(1008,'above', 'in extended space over and not touching', 'a display of fireworks above the town'));
    prepositionList.add(new Word.Construct(1009,'below', 'at a lower level or layer than', 'just below the pocket was a stain'));
    prepositionList.add(new Word.Construct(10010,'under', 'extending or directly below.', 'vast stores of gas under the North Sea'));
    prepositionList.add(new Word.Construct(10011,'about', 'on the subject of; concerning', 'I was thinking about you'));

    return prepositionList;
  }

  static List<Word> getPositiveWords() {
    var positiveWords = new List<Word>();

    positiveWords.add(new Word.Construct(2002,'cool', 'free from excitement, anxiety, or excessive emotion', 'he prided himself on keeping a cool head'));
    positiveWords.add(new Word.Construct(2006,'wise', 'having or showing the ability to make good judgments, based on a deep understanding and experience of life', 'I think you made a wise choice'));
    positiveWords.add(new Word.Construct(2009,'kind', 'generous, helpful, and thinking about other people\'s feelings', 'It is very kind of you to help us'));
    positiveWords.add(new Word.Construct(2003,'loving', 'feeling or showing love or great care', 'he is a very loving child'));
    positiveWords.add(new Word.Construct(2004,'loyal', 'giving or showing firm and constant support or allegiance to a person or institution', 'She is very loyal to her friends'));
    positiveWords.add(new Word.Construct(2005,'polite', 'behaving in a way that is socially correct and shows understanding of and care for other people\'s feelings', 'He was too polite to point out my mistake.'));
    positiveWords.add(new Word.Construct(2007,'witty', 'using words in a clever and funny way', 'He was witty and very charming'));
    positiveWords.add(new Word.Construct(2008,'giving', 'the act of providing money for something, especially to a charity or other good cause', 'Charitable giving can usually be offset against tax'));
    positiveWords.add(new Word.Construct(20010,'smart', 'having a clean, tidy, and stylish appearance', 'I need a smart jacket for my interview'));
    positiveWords.add(new Word.Construct(20011,'divine', 'extremely good, pleasant, or enjoyable', 'Their new house is quite divine'));
    positiveWords.add(new Word.Construct(2001,'bright', 'giving out or reflecting much light; shining', 'the sun was dazzlingly bright'));

    return positiveWords;
  }

  static List<Word> getNegativeWords() {
    var positiveWords = new List<Word>();

    positiveWords.add(new Word.Construct(3009, 'shy', 'nervous and uncomfortable with other people', 'He was too shy to ask her to dance with him'));
    positiveWords.add(new Word.Construct(3001, 'hate', 'feel intense dislike for', 'the boys hate each other'));
    positiveWords.add(new Word.Construct(3002, 'sick', 'affected by physical or mental illness', 'the company organized a sick fund for its workers'));
    positiveWords.add(new Word.Construct(3003, 'pain', 'highly unpleasant physical sensation caused by illness or injury', 'she is in great pain'));
    positiveWords.add(new Word.Construct(3004, 'lazy', 'unwilling to work or use energy', 'he was too lazy to cook'));
    positiveWords.add(new Word.Construct(3005, 'liar', 'a person who tells lies', 'the man was a notorious liar'));
    positiveWords.add(new Word.Construct(3007, 'rude', 'not polite; offensive or embarrassing', 'It is rude not to say "Thank you" when you are given something'));
    positiveWords.add(new Word.Construct(3008, 'cruel', 'extremely unkind and unpleasant and causing pain to people', 'Don\'t tease him about his weight - it\'s cruel'));
    positiveWords.add(new Word.Construct(30010, 'silly', 'showing little thought or judgment', 'a silly mistake'));
    positiveWords.add(new Word.Construct(30011, 'bossy', 'A bossy person is always telling people what to do.', 'She\'s strong without being bossy.'));
    positiveWords.add(new Word.Construct(3006, 'greedy', 'wanting a lot more food, money, etc; more than you need', 'He is greedy for power/success.'));
    return positiveWords;
  }

  static List<Word> getEmotionalWords() {
    var positiveWords = new List<Word>();

    positiveWords.add(new Word.Construct(4005, 'sad', 'unhappy or sorry', 'She gave a sad smile'));
    positiveWords.add(new Word.Construct(40011, 'mad', 'mentally ill, or unable to behave in a reasonable way', 'I think I must be going mad'));
    positiveWords.add(new Word.Construct(4002, 'glad', 'pleased and happy', 'I\'m glad to know the parcel arrived safely'));
    positiveWords.add(new Word.Construct(4004, 'hurt', 'to feel pain in a part of your body', 'Emma hurt her back when she fell off her horse'));
    positiveWords.add(new Word.Construct(4003, 'brave', 'showing no fear of dangerous or difficult things', 'a brave soldier'));
    positiveWords.add(new Word.Construct(4009, 'dull', 'not interesting or exciting in any way', 'He is pleasant enough, but deadly dull'));
    positiveWords.add(new Word.Construct(4006, 'happy', 'feeling, showing, or causing pleasure or satisfaction', 'She looks so happy'));
    positiveWords.add(new Word.Construct(4007, 'angry', 'feeling or showing strong annoyance, displeasure, or hostility', 'I got really angry with her'));
    positiveWords.add(new Word.Construct(4008, 'tired', 'in need of rest or sleep', 'My legs are tired'));
    positiveWords.add(new Word.Construct(40010, 'livid', 'extremely angry', 'He was livid when he found out'));
    positiveWords.add(new Word.Construct(4001, 'upset', 'to make someone worried, unhappy, or angry', 'I didn\'t mean to upset her - it was just a bit of fun.'));

    return positiveWords;
  }

  static List<Word> getInspirationalWords() {
    var positiveWords = new List<Word>();

    positiveWords.add(new Word.Construct(5004, 'goal', 'an aim or desired result', 'he achieved his goal of becoming King of England'));
    positiveWords.add(new Word.Construct(5005, 'life', 'the period between the birth and death of a living thing', 'his father decided to start a new life in California'));
    positiveWords.add(new Word.Construct(5006, 'plan', 'a detailed proposal for doing or achieving something', 'I have no plan to retire'));
    positiveWords.add(new Word.Construct(5007, 'skill', 'the ability to do something well; expertise', 'difficult work, taking great skill'));
    positiveWords.add(new Word.Construct(5008, 'self', 'of or by yourself or itself', 'an article with a picture of my good self'));
    positiveWords.add(new Word.Construct(5009, 'wise', 'having or showing experience, knowledge', 'she seems kind and wise'));
    positiveWords.add(new Word.Construct(50010, 'lead', 'be in charge or command of', 'I\'ve asked Gemma to lead the discussion'));
    positiveWords.add(new Word.Construct(50011, 'hope', 'to want something to happen or to be true', 'I hope (that) she\'ll win'));
    positiveWords.add(new Word.Construct(5001, 'action', 'process of doing something', 'This problem calls for prompt action from the government'));
    positiveWords.add(new Word.Construct(5002, 'active', 'busy with a particular activity', 'You have to try to keep active as you grow older'));
    positiveWords.add(new Word.Construct(5003, 'build', 'to make something by putting bricks or other materials together', 'We want to build a better future for our children'));

    return positiveWords;
  }

  static List<Word> getSalesWords() {
    var positiveWords = new List<Word>();

    positiveWords.add(new Word.Construct(6001, 'now', 'at the present time or moment', 'limited item, buy now !'));
    positiveWords.add(new Word.Construct(6002, 'free', 'given or available without charge', 'Buy 1 Get 1 for free'));
    positiveWords.add(new Word.Construct(6003, 'new', 'now for the first time; not existing before', 'looking for new business'));
    positiveWords.add(new Word.Construct(6004, 'truth', 'the quality or state of being truethe quality or state of being true', 'tell me the truth'));
    positiveWords.add(new Word.Construct(6005, 'only', 'and no one or nothing more besides; solely ', 'rebellion will only bring more unhappiness'));
    positiveWords.add(new Word.Construct(6006, 'fast', 'moving or capable of moving at high speed', 'a fast and powerful car'));
    positiveWords.add(new Word.Construct(6007, 'easy', 'achieved without great effort; presenting few difficulties', 'an easy way of retrieving information'));
    positiveWords.add(new Word.Construct(6008, 'save', 'keep and store up (something, especially money) for future use', 'she had never been able to save much from her salary'));
    positiveWords.add(new Word.Construct(6009, 'win', 'be successful or victorious in (a contest or conflict)', 'We will win this game'));
    positiveWords.add(new Word.Construct(60010, 'bonus', 'a sum of money added to a person\'s wages as a reward for good performance', 'I got 10k dollar bonus from office'));
    positiveWords.add(new Word.Construct(60011, 'never', 'at no time in the past or future; not ever', 'they had never been camping in their lives'));

    return positiveWords;
  }


  static List<Word> getBusinessWords() {
    var positiveWords = new List<Word>();

    positiveWords.add(new Word.Construct(7001, 'job', 'a paid position of regular employment', 'the scheme could create 200 jobs'));
    positiveWords.add(new Word.Construct(7002, 'term', 'a word or phrase used to describe a thing or to express a concept', 'the musical term ‘leitmotiv’'));
    positiveWords.add(new Word.Construct(7003, 'load', 'a heavy or bulky thing ', 'he began to load the gun'));
    positiveWords.add(new Word.Construct(7004, 'fee', 'an amount of money paid for a particular piece of work', 'an admission fee'));
    positiveWords.add(new Word.Construct(7005, 'pay', 'to give money to someone for something you want to buy', 'How much did you pay for the tickets?'));
    positiveWords.add(new Word.Construct(7006, 'plan', 'a set of decisions about how to do something in the future', 'a company\'s business plan'));
    positiveWords.add(new Word.Construct(7007, 'skill', 'an ability to do an activity or job well', 'I have no skill at/in sewing.'));
    positiveWords.add(new Word.Construct(7008, 'client', 'a customer or someone who receives services', 'I offer great services to my client'));
    positiveWords.add(new Word.Construct(7009, 'salary', 'a fixed amount of money agreed every year as pay for an employee', 'an annual salary of £40,000'));
    positiveWords.add(new Word.Construct(70010, 'staff', 'the group of people who work for an organization', 'Has the news been communicated to the staff yet?'));
    positiveWords.add(new Word.Construct(70011, 'asset', 'a useful or valuable quality, skill, or person', 'He\'ll be a great asset to the team'));

    return positiveWords;
  }

  static List<Word> getComplimentWords() {
    var positiveWords = new List<Word>();

    positiveWords.add(new Word.Construct(8001, '', '', ''));
    positiveWords.add(new Word.Construct(8002, '', '', ''));
    positiveWords.add(new Word.Construct(8003, '', '', ''));
    positiveWords.add(new Word.Construct(8004, '', '', ''));
    positiveWords.add(new Word.Construct(8005, '', '', ''));
    positiveWords.add(new Word.Construct(8006, '', '', ''));
    positiveWords.add(new Word.Construct(8007, '', '', ''));
    positiveWords.add(new Word.Construct(8008, '', '', ''));
    positiveWords.add(new Word.Construct(8009, '', '', ''));
    positiveWords.add(new Word.Construct(80010, '', '', ''));
    positiveWords.add(new Word.Construct(80011, '', '', ''));

    return positiveWords;
  }

}

class Categories{
  static var preposition =  'Preposition';
  static var positive = 'Positive';
  static var negative = 'Negative';
  static var emotional = 'Emotional';
  static var inspirational = 'Inspirational';
  static var sales = 'Sales';
  static var business = 'Business';
  static var compliments = 'Compliments';
}